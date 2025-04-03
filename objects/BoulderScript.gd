extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(_delta):
    var contact_list = get_colliding_bodies()
#    if contact_list:
#        for contact in contact_list:
#            var name = contact.get_meta('name') # fix this for other non meta tags
#            if name == 'player' and linear_velocity.length() > 3.0:
#                contact.hurt()
#                break
