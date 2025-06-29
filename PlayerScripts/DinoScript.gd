extends RigidBody2D
 

export var move_speed  = 22
export var jump_speed = 500
export var recover_time = 1.0

# Called when the node enters the scene tree for the first time.
onready var anim_player = $AnimationPlayer

var is_touching_floor = false
var prev_position
var current_position 
var is_moving = false
var is_jump_pad = false

#### debug vars
var mx_spd = 0.0
var twn_time = 0.0
####
func _process(_delta):
    current_position = global_position.ceil()
    
    var speed = Vector2.ZERO
    var collision_list = get_colliding_bodies()
    collision_detection(collision_list)
    mx_spd = linear_velocity
#    print(mx_spd)

 
    if abs(linear_velocity.x) == 0.0 and abs(linear_velocity.y) == 0.0:
        #this is to avoid to play the idle animation immediatly
         if anim_player.is_playing() and not (anim_player.current_animation in ['hurt','headbutt'] ):
            anim_player.play('idle')
 
    if Input.is_action_just_pressed("ui_up") and is_touching_floor:
            speed.y = - jump_speed
            anim_player.play('jump')   

            
    if Input.is_action_pressed("ui_left"):
            speed.x = - move_speed
            anim_player.play("move_left")
                
    if Input.is_action_pressed("ui_right"):
            speed.x = move_speed
            anim_player.play("move_right")
    
    if Input.is_action_pressed("ui_down"):
            anim_player.play("headbutt")
            
    #extra gravity
    if linear_velocity.y > move_speed/2:
        speed.y += move_speed
    
 
    apply_central_impulse(speed)
    
    if prev_position == current_position:
        is_moving = false
    else:
        is_moving = true
    
    prev_position = current_position

    if linear_velocity.y > jump_speed:
        mode = RigidBody2D.MODE_RIGID

    if mode == RigidBody2D.MODE_RIGID and is_touching_floor and not is_moving:
        mode = RigidBody2D.MODE_CHARACTER
        $Tween.interpolate_property(self, "rotation_degrees",rotation_degrees, 0.0, recover_time,  Tween.TRANS_ELASTIC, Tween.EASE_OUT)
        $Tween.start()
 
    
    if collision_list and linear_velocity.length() > jump_speed and not is_jump_pad:  
        hurt()

    
func collision_detection(collision_list):
    if not collision_list:
        is_touching_floor = false
        is_jump_pad = false
        return
        
    for item in collision_list:

        if item.name == 'Floor':
            is_touching_floor = true
        elif item.name == 'JumpBase':
            is_jump_pad = true
            
    

func hurt():
    anim_player.play("hurt")
  

