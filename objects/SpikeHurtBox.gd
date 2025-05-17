extends Area2D

export var force = 600.0


func _physics_process(_delta):
  
    var contact_list = get_overlapping_bodies()
    
    if contact_list: 
        
        for body in contact_list:
            if body.name in ['ChargingEnemy','ExplosiveEnemy','Dino']:
                var direction_push = global_position - body.global_position
                if direction_push.x < 0.0: #right
                    body.apply_central_impulse(Vector2(force, -force/2))
                else:
                    body.apply_central_impulse(Vector2(-force, -force/2))
                    
                
                body.hurt()
      
 


