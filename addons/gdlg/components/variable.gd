class_name Variable extends Object

var name

func _init(_name) -> void:
	name = _name

func match_variable_bindings(other_term):
##	""" If the passed in term doesn't represent the same variable, we bind our
## current variable to the outer term and return the mapped binding. """
	var bindings = {}
	if self != other_term:
		bindings[self] = other_term
	return bindings
