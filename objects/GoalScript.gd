extends Node2D

func _on_Area2D_body_entered(_body):
    SignalBus.player_wins()

