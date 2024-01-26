# Class: true
# Author: Liam Avella-Pisera liam.avellapisera@gmail.com
class_name TRUE extends Term
## The True class has the role of 
##
## The script has the role of , it can  aswell as 
##
## @
## @
## @experimental
func _init(functor, arguments):
	if arguments.is_empty() or arguments.is_null():
		arguments = []
	Term.new(functor, arguments)

func substitute_variable_bindings(variable_bindings):
	return self

func query(database):
	await self
	
