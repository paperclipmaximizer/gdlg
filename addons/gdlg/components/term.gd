class_name Term extends RefCounted
## Syntax:
## var term = Term.new("parent", ["bob","alice"])
var functor: String
var arguments: Array

func _init(_functor: String, _arguments: Array = []):
	functor = _functor
	arguments = _arguments
	if _arguments.is_empty():
		arguments = []
		arguments = _arguments

func match_variable_bindings(term: Term):
	if term is Variable:
		return term.match_variable_bindings(self)
	
	if term is Term:
		if self.functor != term.functor or self.arguments.size()!=term.arguments.size():
			return null
			
	var matched_variables = []
	for i in self.arguments:
		matched_variables.append(self.arguments[i].match_variable_bindings(term.arguments[i]))
	
	return reduce(Database.merge_bindings, [{}] + matched_arguments)
