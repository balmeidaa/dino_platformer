extends AudioStreamPlayer

export var jump_boing = "res://assets/sfx/bong.wav"

func play_boing_sfx():
    stream = load(jump_boing)
    play()
