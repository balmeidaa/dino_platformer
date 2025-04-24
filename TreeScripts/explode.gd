extends  ActionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
   
    actor.explode()
    return SUCCESS
