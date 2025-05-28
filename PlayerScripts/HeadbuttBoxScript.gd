extends Area2D

export var force = 800.0
export var active = false


func _physics_process(_delta):
  
    var contact_list = get_overlapping_bodies()
    if active and contact_list:
        for body in contact_list:

            var direction_push = global_position - body.global_position
            if direction_push.x < 0.0: #right
                body.apply_central_impulse(Vector2(force, -force/4))
            else:
                body.apply_central_impulse(Vector2(-force, -force/4))
            
            if body.name in ['ChargingEnemy']:
                body.hurt()
      
    active = false


