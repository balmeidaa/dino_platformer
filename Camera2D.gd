extends Camera2D

export var max_paralax_len = 220.0
onready var timer = $Timer

func _physics_process(_delta):
    if global_position.y > max_paralax_len and timer.is_stopped():
        timer.start()
    
    if global_position.y > max_paralax_len:
        global_position.y = max_paralax_len
        

func _on_Timer_timeout():
    SignalBus.game_over()
