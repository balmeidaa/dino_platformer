extends Position2D


var mine_factory = preload("res://Enemies/ExplosiveEnemy.tscn")
var current_mine = null


func _ready():
    create_new()
    

func _on_AliveCheckTimer_timeout():
    var its_alive = is_instance_valid(current_mine)
    
    if its_alive:
        return
    
    create_new()


func create_new():
    current_mine = mine_factory.instance()
    current_mine.global_position = self.global_position
    self.add_child(current_mine)
