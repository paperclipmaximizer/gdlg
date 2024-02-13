extends GutTest

func test_expr_binding():
	var e1 = Expr.new("food_flavor(Food, sweet)")
	#var term2 = Term.new("parent", ["bob"])
	#var result = term1.match_variable_bindings(term2)
	#print(result)
	var check_terms: PackedStringArray = ["Food", "sweet"]
	assert_eq(e1.predicate, "food_flavor")
	assert_eq(e1.terms, check_terms)
	print("prediate")
	print(e1.predicate)
	print("terms")
	print(e1.terms)
func test_no_match_due_to_different_functors():
	#var term1 = Term.new("parent", ["alice"])
	#var term2 = Term.new("child", ["alice"])
	#var result = term1.match_variable_bindings(term2)
	#print(result)
	pass

