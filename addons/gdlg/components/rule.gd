# Class: rule
# Author: Liam Avella-Pisera liam.avellapisera@gmail.com
class_name Rule extends Object
## The Rule class has the role of 
##
## The script has the role of , it can  aswell as 
##
## @
## @
## @experimental
var tail
var head
func _init(_head, _tail):
	_head = head
	_tail = tail

func _str():
	return str(head) + " :- " + str(tail)
	
