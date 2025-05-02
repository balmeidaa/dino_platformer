extends RayCast2D
 
var parent 

func _ready():
    parent = get_parent()

func _physics_process(_delta):
    parent.player_detected = is_colliding()

 
