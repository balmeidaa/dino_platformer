extends RayCast2D

#no olvidar modificar el cast y posicion en animationPlayer
var parent 

func _ready():
    parent = get_parent()

func _physics_process(_delta):
    parent.obstructed_path = is_colliding()

 
