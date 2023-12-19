extends GutTest

func test_variable_binding():
	var term1 = Term.new("parent", ["alice"])
	var term2 = Term.new("parent", ["bob"])
	var result = term1.match_variable_bindings(term2)
	assert_not_null(result)
	# Add more assertions as per your logic

func test_no_match_due_to_different_functors():
	var term1 = Term.new("parent", ["alice"])
	var term2 = Term.new("child", ["alice"])
	var result = term1.match_variable_bindings(term2)
	assert_null(result)
