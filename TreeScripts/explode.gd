extends  ActionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
   
    actor.explode_sequence()
    return SUCCESS
