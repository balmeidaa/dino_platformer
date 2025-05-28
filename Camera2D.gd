extends Camera2D


var obj_of_interest = null


export var default_zoom := 0.35
export var zoom_range := Vector2(0.15, 0.15)
export var min_speed:= 500.0
export var zoom_time := 2.0
var target_zoom = Vector2.ZERO
var def_vector = Vector2(default_zoom, default_zoom)

func _ready():
    obj_of_interest = get_parent()
    
    if not obj_of_interest.name in ['Dino']:
        obj_of_interest = null
    
    target_zoom = Vector2(default_zoom, default_zoom) + zoom_range
        
func _physics_process(_delta):
    return
    # no object to follow or tween anim still running
    if not obj_of_interest or zoom.x > (default_zoom + zoom_range.x) :
        return
    
    var current_speed = obj_of_interest.linear_velocity.length()
    
    if current_speed > min_speed: # zoom out
       
        zoom = zoom.linear_interpolate(target_zoom, _delta * zoom_time)
     
    elif current_speed < min_speed:
        zoom = zoom.linear_interpolate(def_vector, _delta * zoom_time)

 
