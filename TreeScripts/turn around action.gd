extends  ActionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
   actor.turn_around()
   return SUCCESS
