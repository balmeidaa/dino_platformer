extends  ActionLeaf

func  tick(actor: Node, _blackboard: Blackboard) -> int:
   actor.walk()
   return SUCCESS
