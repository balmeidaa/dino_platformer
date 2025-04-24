extends RayCast2D

var parent 

func _ready():
    parent = get_parent()

func _process(delta):
    
    parent.turn_around = true if not is_colliding() else false
 
