extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()

func _ready():
    rng.randomize()
    
func play_hurt_sfx():
    reset_settings()
    pitch_scale = rng.randf_range(0.7, 1.1)
    play()

func reset_settings():
    pitch_scale = 1.0
