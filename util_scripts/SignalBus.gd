extends Node


signal game_over
signal player_wins

func player_wins():
    emit_signal("player_wins")

func game_over():
    emit_signal("game_over")
