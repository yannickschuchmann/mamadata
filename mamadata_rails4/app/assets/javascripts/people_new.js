$('#person_beneficiary_status').on('change', function (e) {
    var optionSelected = $("option:selected", this);
    var valueSelected = this.value;
    if (valueSelected === "Yes") {
		$("#if_beneficiary").append(
			'<div class="field">'+
				'<div class="span3"><label for="school_name">School Name</label></div>'+
				'<div class="span9"><input id="beneficiary_school_name" name="person[school_name]" type="text"></div>'+
			'</div>'+
			'<div class="field">'+
				'<div class="span3"><label for="beneficiary_school_type">School Type</label></div>'+
				'<div class="span9"><select id="beneficiary_school_type" name="person[school_type]">'+
							'<option value="1">Government</option>'+
							'<option value="2">Government Aided</option>'+
							'<option value="3">Private</option>'+
				'</select></div>'+
			'</div>'+
			'<div class="field">'+
				'<div class="span3"><label for="beneficiary_narrative_text">Narrative text</label></div>'+
				'<div class="span9"><input id="beneficiary_narrative_text" name="person[narrative_text]" type="text"></div>'+
			'</div>'
		);
    }else{
		$("#if_beneficiary").html("");
    }
});

$("#submitPerson").click(function(event){
	//prevent default submit
	event.preventDefault();
	//change the value to let the user know that he done something
	this.value = "Creating...";
	// disable the button so the user can't send twice
	$("#submitPerson").prop("disabled",true);
	person = {};
	var new_person = document.getElementById("new_person");
	person.name = $(new_person).find("#person_name")[0].value;
	person.fname = $(new_person).find("#person_fathers_name")[0].value;
	person.gender = $(new_person).find("#person_gender")[0].value;

	//if beneficiary is yes parse it too
	if ($('#person_beneficiary_status').find(":selected").text() === "Yes") {
		beneficiary = {};
		beneficiary.school_name = $(new_person).find("#beneficiary_school_name")[0].value;
	}
	console.log(person, beneficiary);
	var dataToSend = {};
	dataToSend.person = {};
});