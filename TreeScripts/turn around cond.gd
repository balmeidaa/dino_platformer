extends ConditionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
        # no floor nor obstacle means char is falling
    if actor.is_no_floor and not actor.obstructed_path:
        actor.walk()
        return FAILURE
        
    if actor.is_no_floor or actor.obstructed_path:
        return SUCCESS
    
    return FAILURE
