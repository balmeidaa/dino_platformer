extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var move_speed  = 22
export var jump_speed = 500

# Called when the node enters the scene tree for the first time.
onready var anim_player = $AnimationPlayer


func _process(_delta):
    var speed = Vector2.ZERO
    
    if linear_velocity.x == 0.0 and linear_velocity.y == 0.0:
        anim_player.play('idle')
    
    if Input.is_action_just_pressed("ui_up") and linear_velocity.y == 0.0:
            speed.y = - jump_speed
            anim_player.play('jump')
    if Input.is_action_pressed("ui_left"):
            speed.x = - move_speed
            anim_player.play("move_left")
    if Input.is_action_pressed("ui_right"):
            speed.x = move_speed
            anim_player.play("move_right")
            
            
    #extra gravity
    if linear_velocity.y > move_speed/2:
        speed.y += move_speed
        
    apply_central_impulse(speed)
    
   
    


  
