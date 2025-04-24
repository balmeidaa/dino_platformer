extends  ActionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
   actor.move()
   return SUCCESS
