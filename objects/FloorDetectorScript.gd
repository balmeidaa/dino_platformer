extends RayCast2D
#no olvidar modificar posicion en animationPlayer
var parent 

func _ready():
    parent = get_parent()

func _physics_process(_delta):
    parent.is_no_floor = not is_colliding()

 
