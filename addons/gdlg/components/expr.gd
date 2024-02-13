## Expression is a 
class_name Expr extends Object

@export var string: String
@export var index: int
var terms
@export var predicate: String = ""

func _init(fact):
	_parse_expr(fact)

func _parse_expr(fact):
	fact = fact.replace(" ", "")
	var f = fact
	var splitting = r"is|\*|\+|\-|\/|>=|<=|>|<|and|or|in|not"
	print(fact)
	if !fact.contains("("): 
		fact = "(" + fact + ")"
	var pred_ind = fact.find("(")
	predicate = fact.left(pred_ind)
	print(predicate)
	fact = fact.substr(pred_ind)
	#var to_remove = str.maketrans("", "", "() ")
	#terms = terms.translate(to_remove)
	var to_remove := ['(', ')', ' ']
	
	for char in to_remove:
		fact = fact.replace(char, "")
#	if predicate == "": 
#		terms = terms.split(splitting)
#	else: 
	terms = fact.split(",")
	print(terms)
	string = f
	index = 0
	print(terms)

## return string value of the expr in case we need it elsewhere with different type
func _to_string():
	return string
func _repr() :
	return string
func _lt(other):
	return terms[index] < other.terms[other.index]
