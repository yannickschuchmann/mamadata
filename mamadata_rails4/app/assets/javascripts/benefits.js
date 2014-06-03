var checkedInput = $("#benefit_category").val();


if(checkedInput === "calculated") {
	$("#calculated_amount").show();
} else if (checkedInput === "fixed") {
	$("#fixed_amount").show();
}

$("#benefit_category").on('change', function() {
		clearOtherFields();
		$("#fixed_amount, #calculated_amount").hide();
		$($('#'+$('option:selected', this).text().toLowerCase().replace(' ', '_'))).show();
});

var clearOtherFields = function() {
	$('#benefit_optional_amount').val('');
	$('#benefit_fixed_amount').val('');
	$('#benefit_max_people').val('');
}