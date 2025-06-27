extends AudioStreamPlayer

export var jump_boing = "res://assets/sfx/hurt_2.wav"


var rng = RandomNumberGenerator.new()

func _ready():
    rng.randomize()
    stream = load(jump_boing)

func play_boing_sfx():
    pitch_scale = rng.randf_range(0.6, 0.9)
    play()
