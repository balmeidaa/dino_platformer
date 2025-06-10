extends Position2D


var dino_factory = preload("res://Dino.tscn")
var player = null

func new_dino():
    player = dino_factory.instance()

