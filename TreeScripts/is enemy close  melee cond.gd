extends ConditionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
    
    if actor.is_attacking:
        return RUNNING
   
    if actor.player_detected:
        return SUCCESS
   
    return FAILURE
