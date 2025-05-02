extends RigidBody2D


var is_no_floor = false
var obstructed_path = false
var player_detected = false

var walk_left = false 
export var walk_speed = 25.0
export var max_walk_speed = 35.0
export var push_force = 20.0
 
var is_attacking = false

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

func attack():
    $AnimationPlayer.play("idle")
