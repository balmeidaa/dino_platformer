extends ConditionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
    if actor.turn_around:
        return SUCCESS
    
    return FAILURE
