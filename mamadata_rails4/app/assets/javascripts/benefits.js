var checkedInput = $("input:checked").val();


if(checkedInput == "calculated") {
	$("#calculated_amount").show();
} else if (checkedInput == "fixed") {
	$("#fixed_amount").show();
}


$("#benefit_category_fixed").click(function() {
		clearOtherFields();
		$("#fixed_amount").show();
		$("#calculated_amount").hide();

});

$("#benefit_category_calculated").click(function() {
		clearOtherFields();
		$("#fixed_amount").hide();
		$("#calculated_amount").show();

});

$("#benefit_category_none").click(function() {
		clearOtherFields();
		$("#fixed_amount").hide();
		$("#calculated_amount").hide();

});

var clearOtherFields = function() {
	$('#benefit_optional_amount').val('');
	$('#benefit_fixed_amount').val('');
	$('#benefit_max_people').val('');
}