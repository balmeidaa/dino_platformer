extends Area2D


export var jump_pad_push = 1000.0

func _on_SpringPlant_body_entered(body):
#    print(body.name)
    
    if not (body is RigidBody2D):
        return
    var direction_push = Vector2.ZERO
    direction_push = global_position - body.global_position
    direction_push = direction_push.normalized()
    #check for rotation
    #horizontal jumpad
    if floor(rotation_degrees) != 0.0 and ceil(rotation_degrees) != 180.0:
        direction_push.x =  -1.0 if direction_push.x >= 0.0 else 1.0 ## further testing
        direction_push.y = -1.0 * (direction_push.y + 0.1)
    
    else: #vertical jumppad
        direction_push.x =  (direction_push.x + 0.1)
        direction_push.y =  -1.0 if direction_push.y >= 0.0 else 1.0
  
    print(direction_push)
    body.apply_central_impulse(direction_push * jump_pad_push)
    $AnimationPlayer.play("active")
