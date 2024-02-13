@tool
class_name Term extends Object
## Syntax:
## a term has a functor (a relation) and
## a list (of arbitrary length) of arguments
## the Functor is a String
## An argument is of type String
## A single argument must be placed in an array 
## var term = Term.new("parent", ["bob","alice", "\'Mr. Wallace\'"])
## TODO: Expand the functionality to be type agnostic (ie Nodes, Node3D etc should also be able to be parsed
var functor: String
var arguments: Array
var None = []

### Return an array of matching variable bindings
#func match_variable_bindings(term: Term):
#	if term is Variable:
#		return term.match_variable_bindings(self)
#	if term is Term:
#		if self.functor != term.functor or self.arguments.size()!= term.arguments.size():
#			return {}
#	var zipped_argument_list: Array
#	for i in range(0, self.arguments.size()):
#		zipped_argument_list.append([self.arguments[i],term.arguments[i]])
#	print(zipped_argument_list)
#	var matched_argument_var_bindings = []
#	for i in range(term.arguments.size()):
#		matched_argument_var_bindings.append(match_variable_bindings(term.arguments[i]))
#	var matched_dictionary: Dictionary
#	for bindings in matched_argument_var_bindings:
#		matched_dictionary = Database.merge_bindings(matched_dictionary, bindings)
#	print(matched_dictionary)
#	return {}
#	#match the variable bindings in a dictionary for processing in Database
##	for arguments in zipped_argument_list:
#		matched_argument_var_bindings = [ arguments[0].match_variable_bindings(arguments[1]) ]
#	return matched_argument_var_bindings.reduce(Database.merge_bindings)
#var functor: String
#var arguments: Array
#
#func _init(_functor: String, _arguments: Array = []):
#	functor = _functor
#	arguments = _arguments

func _init(_functor, _arguments: Array = []):
	functor = _functor
	arguments = _arguments
func match_variable_bindings(other_term):
	##"""Return a map of matching variable bindings"""
	# If the passed in term is a variable, we bind the variable to our current
	# term and return the result.
	if other_term is Variable:
		return None # stub
		#return other_term.match_variable_bindings(self)
	# If we have a term, we check if the terms are identical and if so,
	# we extract the combined variable bindings.
	if other_term is Term:
		# Verify that the functor and argument lengths match.
		if self.functor != other_term.functor or self.arguments.size() != other_term.arguments.size():
			return None
		# Zip the current term and the other term arguments and combine the
		# results into one list. Zip creates a new list filled with tuples
		# containing the matching elements from the 2 argument lists. i.e. zip ([
		# 1, 2, 3],[4, 5, 6]) returns [[1, 4], [2, 5], [3, 6]]
		var zipped_argument_list = []
		zipped_argument_list = zip(self.arguments, other_term.arguments)
		# Get the matched variable bindings list for the matching arguments in
		# our 2 terms and merge them.
		var matched_argument_var_bindings = []
		for argument in zipped_argument_list: 
			if typeof(argument[0]) != 0 and typeof(argument[0]) == typeof(argument[1]):
				matched_argument_var_bindings.append(argument[0])
				matched_argument_var_bindings.append(argument[1])
		# Merge the combined argument variable bindings and return the result.
		# The reduce function applies a rolling computation to sequential pairs
		# of values in a list. i.e. reduce((lambda x, y: x + y), [1, 2, 3,
		# 4]) returns 10
		# listof pairs -> Dictionary
		var merged_binding_map: Dictionary
		for i in matched_argument_var_bindings:
			var dict_a : Dictionary
			var dict_b : Dictionary
			dict_a[""] = i[0]
			dict_b[""] = i[1]
			print(Database.merge_bindings(dict_a, dict_b))
			return Database.merge_bindings(dict_a,dict_b)
## 	"""Take the variable bindings map and return a term with all occurrences of
## the term variables replaced with the corresponding variable values from our
## variable bindings map."""
func substitute_variable_bindings(variable_bindings):
	var _args = None
	for argument in self.arguments:
		_args.append(argument.substitute_variable_bindings(variable_bindings))
	var term = Term.new(functor, _args)

func query(database):
	##	"""Query the database for terms matching this one"""
	await database.query(self)

func to_string() -> String:
	if arguments.size() == 0:
		return str(functor)
	else:
		var str_args
		for arg in arguments:
			str_args + ", " + str(arg) 
		return (str(functor) + " ( " + str_args + " )")

func _repr():
	return to_string()

func zip(args_a, args_b) -> Array:
	var args_result: Array = []
	for i in range(0,args_a.size()):
		var v = [args_a[i],args_b[i]]
		args_result.append(v)
	return args_result
