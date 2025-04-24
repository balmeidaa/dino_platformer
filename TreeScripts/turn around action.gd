extends  ActionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
   actor.turn_around()
   return SUCCESS
