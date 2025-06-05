extends Node


signal game_over
signal player_wins

func player_wins():
    emit_signal("player_wins")

func game_over():
    emit_signal("game_over")


func hide_all(ui_node):
    var children_nodes = ui_node.get_children()
    for node in children_nodes:
        node.hide()
        
func show_all(ui_node):
    var children_nodes = ui_node.get_children()
    for node in children_nodes:
        node.show()

func toggle_element(parent_ui, node):
    pass
    
