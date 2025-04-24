extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

var t = false
#code explosion vfx/sfx etc
func explode():
    if t:
        return
        
    t = true
    $AnimationPlayer.play("explode")
    print('bum')
