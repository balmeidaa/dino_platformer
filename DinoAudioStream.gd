extends AudioStreamPlayer2D


var run_sfx = "res://assets/sfx/running.wav"
var jump_sfx = ["res://assets/sfx/boing_1.wav", "res://assets/sfx/boing_2.wav"]

var rng = RandomNumberGenerator.new()

func _ready():
    rng.randomize()


# Add condition to avoid playing run sound when in the air

func play_run_sfx():
    reset_settings()
    stream = load(run_sfx)
    play()
    
func play_jump_sfx():
    pitch_scale = rng.randf_range(0.8, 1.0)
    var file_sfx = jump_sfx[ rng.randi_range(0,1)]
    stream = load(file_sfx)
    play()

func reset_settings():
    pitch_scale = 1.0
