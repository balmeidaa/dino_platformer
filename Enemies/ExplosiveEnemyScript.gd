extends RigidBody2D

 
var is_no_floor = false
var obstructed_path = false

var walk_left = true 
export var walk_speed = 25.0
export var explosion_force = 20.0
 
var is_exploding = false
export var explosion_seq_complete = false

func _ready():
     explosion_seq_complete = false

func _physics_process(_delta):

    if explosion_seq_complete:
        var bodies = $ExplosionArea.get_overlapping_bodies()
        
        for body in bodies:
            
            if body is RigidBody2D:
                var contact_point = Vector2.ZERO
                contact_point = body.global_position - self.global_position
                contact_point.normalized()
                if body.name == 'Dino':
                    body.hurt()
                body.apply_impulse(contact_point, (explosion_force * contact_point) )
        
    
    explosion_seq_complete = false
    

func explode_sequence():

    if is_exploding:
        return
        
    is_exploding = true
    $AnimationPlayer.play("explode")


func turn_around():
    walk_left = !walk_left
    
    if walk_left:
        $AnimationPlayer.play("walk_l")
    else:
        $AnimationPlayer.play("walk_r")

func walk():
    var current_speed = abs(linear_velocity.x)
    
    if current_speed > walk_speed:
        return
    
    if walk_left:
        apply_central_impulse(Vector2(-walk_speed, 0.0))

    else:
        apply_central_impulse(Vector2(walk_speed, 0.0))


 
    
        
