extends ConditionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
    if actor.is_no_floor or actor.obstructed_path:
        return SUCCESS
    
    return FAILURE
