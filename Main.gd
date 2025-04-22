extends Node2D



func _ready():
    $Debugger.add_property($Dino, "mode", "")
    $Debugger.add_property($Dino, "is_moving", "")
    $Debugger.add_property($Dino, "is_touching_floor", "")
