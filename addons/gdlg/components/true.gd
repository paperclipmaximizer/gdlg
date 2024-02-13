# Class: true
# Author: Liam Avella-Pisera liam.avellapisera@gmail.com
class_name TRUE extends Term
## A predefined term used to represent facts as rules. i.e. functor(argument1,
## argument2) for example gets translated to functor(argument1, argument2) :- TRUE
## @
## @
## @experimental
	# TODO should take no arguments?
func _init(functor="TRUE", arguments=[]):
		if not arguments:
			arguments = []
		super()._init(functor, arguments)

func substitute_variable_bindings(variable_bindings):
		# Simply return our truth term since there is nothing to bind
		return self

func query(database):
		await self
