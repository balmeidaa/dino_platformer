extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var force = 1200.0
export var active = false

var body = null

func _ready():
    pass # Replace with function body.

func _physics_process(_delta):
    if active and body:
        var direction_push = global_position - body.global_position
        if direction_push.x < 0.0: #right
            body.apply_central_impulse(Vector2(force, -force/4))
        else:
            body.apply_central_impulse(Vector2(-force, -force/4))
      
    active = false


func _on_HeadbuttBox_body_entered(body):
    self.body = body
    

func _on_HeadbuttBox_body_exited(body):
    self.body = null
