@tool
# Class: database
# Author: Liam Avella-Pisera liam.avellapisera@gmail.com
class_name Database extends Object
## The Database class has the role of holding a list of declared rules
##
## The script has the role of querying the dataset for items matching goals, it can  aswell as merge variable bindings
##
## @Database
## @Knowledgebase
## @experimental
var rules

func _init(_rules: Array):
	rules = _rules


func query(goal) -> Array:
	var results = []
	for rule in rules:
		var matching_head_var_bindings = rule.head.match_variable_bindings(goal)
		if matching_head_var_bindings != null:
			var matched_head_item = rule.head.substitute_variable_bindings(matching_head_var_bindings)
			var matched_tail_item = rule.tail.substitute_variable_bindings(matching_head_var_bindings)

			for matching_item in matched_tail_item.query(self):
				var matching_tail_var_bindings = matched_tail_item.match_variable_bindings(matching_item)
				if matching_tail_var_bindings != null:
					var result = matched_head_item.substitute_variable_bindings(matching_tail_var_bindings)
					results.append(result)
					return results
		else:
			return []
	return results
	
static func merge_bindings(first_bindings_map: Dictionary, second_bindings_map: Dictionary):
	if first_bindings_map == null or second_bindings_map == null:
		return null

	var merged_bindings = []
	for variable in first_bindings_map.keys():
		merged_bindings[variable] = first_bindings_map[variable]
		
	for variable in second_bindings_map.keys():
		if merged_bindings.has(variable):
			var existing_variable_binding = merged_bindings[variable]
			var shared_bindings = existing_variable_binding.match_variable_bindings(second_bindings_map[variable])
			if shared_bindings != null:
				for var_key in shared_bindings.keys():
					merged_bindings[var_key] = shared_bindings[var_key]
			else:
				return null
		else:
			merged_bindings[variable] = func (): second_bindings_map[variable]
	return merged_bindings

func to_string() -> String:
	var rule_string = ""
	for rule in rules:
		rule_string + str(rule) + ".\n"
	return rule_string
