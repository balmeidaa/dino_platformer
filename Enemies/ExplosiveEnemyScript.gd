extends RigidBody2D

 
var is_no_floor = false
var obstructed_path = false

var walk_left = true 
export var walk_speed = 25.0

 
var is_exploding = false
#code explosion vfx/sfx etc
func explode():

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

