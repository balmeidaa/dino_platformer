extends Node2D

onready var menu = $CanvasLayer/UI/Menu
onready var credits =  $CanvasLayer/UI/Credits 
onready var label_win =  $CanvasLayer/UI/Menu/Labels/PlayerWin
onready var label_lose =  $CanvasLayer/UI/Menu/Labels/GameOver

onready var debugger = $CanvasLayer/Debugger



func _ready():
    menu.hide()
    SignalBus.connect("player_wins", self, "player_wins")
    SignalBus.connect("game_over", self, "game_over")
#    debugger.add_property($Dino, "mx_spd", "")
    if SignalBus.first_game:
        get_tree().paused = true
        menu.show()
    
 
    
func player_wins():
    label_win.show()
    menu.show()
 
   

func game_over():
    label_lose.show()
    menu.show()
    get_tree().paused = true



func _on_Play_pressed():
    SignalBus.first_game = false
    get_tree().paused = false
    menu.hide()
    get_tree().reload_current_scene()
    label_win.hide()
    label_lose.hide()
    
 

func _on_Credits_pressed():
    SignalBus.first_game = !SignalBus.first_game
    SignalBus.hide_all(menu)
    SignalBus.show_all(credits)



func _on_back_pressed():
    SignalBus.hide_all(credits)
    SignalBus.show_all(menu)
    label_win.hide()
    label_lose.hide()
