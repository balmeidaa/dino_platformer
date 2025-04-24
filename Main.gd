extends Node2D



func _ready():
    $Debugger.add_property($ExplosiveEnemy, "is_no_floor", "")
    $Debugger.add_property($ExplosiveEnemy, "walk_left", "")
    $Debugger.add_property($ExplosiveEnemy/AnimationPlayer, "current_animation", "")
