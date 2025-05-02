extends Node2D



func _ready():
    $Debugger.add_property($ChargingEnemy, "player_detected", "")
    $Debugger.add_property($ChargingEnemy, "is_no_floor", "")
    $Debugger.add_property($ChargingEnemy, "obstructed_path", "")
 
 
