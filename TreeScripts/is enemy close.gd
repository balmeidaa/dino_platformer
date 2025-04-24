extends ConditionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
   
    var detected_player = false
    var detection_list = actor.get_node("ExplosionArea").get_overlapping_bodies()
    
    for item in detection_list:
        if item.name == "Dino":
            detected_player = true
            break
  
    if detected_player:
        return SUCCESS
   
    return FAILURE
