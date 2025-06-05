extends Node2D

onready var menu = $CanvasLayer/UI/Menu
onready var credits =  $CanvasLayer/UI/Credits 
onready var label_win =  $CanvasLayer/UI/Menu/Labels/PlayerWin
onready var label_lose =  $CanvasLayer/UI/Menu/Labels/GameOver


func _ready():
    SignalBus.connect("player_wins", self, "player_wins")
    SignalBus.connect("game_over", self, "game_over")

 
    
func player_wins():
    label_win.show()
    menu.get_node("Labels").show()
    menu.get_node("Buttons").show()
   

func game_over():
    label_lose.show()
    menu.get_node("Labels").show()
    menu.get_node("Buttons").show()


func _on_Play_pressed():
    get_tree().reload_current_scene()
    SignalBus.hide_all(menu)


func _on_Credits_pressed():
    SignalBus.hide_all(menu)
    SignalBus.show_all(credits)



func _on_back_pressed():
    SignalBus.hide_all(credits)
    SignalBus.show_all(menu)
    label_win.hide()
    label_lose.hide()
