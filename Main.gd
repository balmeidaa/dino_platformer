extends Node2D



func _ready():
    SignalBus.connect("player_wins", self, "player_win")
    SignalBus.connect("game_over", self, "game_over")
    $Debugger.add_property($Dino, "mx_spd", "")
 
    
func player_wins():
    pass

func game_over():
    pass
 
 
