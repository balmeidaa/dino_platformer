extends  ActionLeaf

func  tick(actor: Node, blackboard: Blackboard) -> int:
   actor.walk()
   return SUCCESS
