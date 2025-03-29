extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var move_speed  = 22
export var jump_speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _process(delta):
    var speed = Vector2.ZERO
    if Input.is_action_just_pressed("ui_up"):
            speed.y = - jump_speed
    if Input.is_action_pressed("ui_left"):
            speed.x = - move_speed
    if Input.is_action_pressed("ui_right"):
            speed.x = move_speed
    
    apply_central_impulse(speed)
