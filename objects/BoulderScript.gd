extends RigidBody2D


export var max_speed = 20.0

func _ready():
    pass # Replace with function body.

func _process(_delta):
    var contact_list = get_colliding_bodies()
    if contact_list:
        for contact in contact_list:
            if contact is RigidBody2D and contact.has_method("hurt")  and linear_velocity.length() > max_speed:
                contact.hurt()
                break
