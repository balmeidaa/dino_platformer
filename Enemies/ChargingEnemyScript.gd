extends RigidBody2D


var is_no_floor = false
var obstructed_path = false
var player_detected = false

var walk_left = false 
export var walk_speed = 25.0
export var max_charge_speed = 600.0
export var push_force = 250.0
 
export var is_attacking = false
export var is_winding_up = false


func _ready():
    #to override the stupid animation player change of values when playing
    is_attacking = false
    is_winding_up = false

    

func _physics_process(_delta):
 
    if is_attacking:
        var bodies = $Hurtbox.get_overlapping_bodies()
        for body in bodies:
            if body == self:
                continue
            var direction_push = global_position - body.global_position
            if direction_push.x < 0.0: #right
                body.apply_central_impulse(Vector2(push_force, -push_force/2))
            else:
                body.apply_central_impulse(Vector2(-push_force, -push_force/2))
            if body.name in ['Dino', 'ChargingEnemy']:
                body.hurt()

func turn_around():
    walk_left = !walk_left
    
    if walk_left:
        $AnimationPlayer.play("walk_l")
    else:
        $AnimationPlayer.play("walk_r")

func walk():
    move_with_speed()
 
    
func attack():
    $AnimationPlayer.play("attack")
    
func hurt():
    $AnimationPlayer.play("hurt")


    
func move_with_speed():
    var speed = max_charge_speed if is_attacking else walk_speed
    var current_speed = abs(linear_velocity.x)
    
    if current_speed > speed:
        return
    
    if walk_left:
        apply_central_impulse(Vector2(-speed, 0.0))

    else:
        apply_central_impulse(Vector2(speed, 0.0))
