$('#person_beneficiary_status').on('change', function (e) {
    var optionSelected = $("option:selected", this);
    var valueSelected = this.value;
    if (valueSelected === "Yes") {
		$("#if_beneficiary").append(
			'<div class="row">'+
				'<div class="large-12 column"><input id="beneficiary_school_name" placeholder="School Name" type="text"></div>'+
			'</div>'+
			'<div class="row">'+
				'<div class="large-2 column">'+
					'<label  class="inline" for="beneficiary_school_type">School Type</label>'+
				'</div>'+
				'<div class="large-10 column">'+
					'<select id="beneficiary_school_type"  name="person[school_type]">'+
						'<option value="1">Government</option>'+
						'<option value="2">Government Aided</option>'+
						'<option value="3">Private</option>'+
					'</select>'+
				'</div>'+
			'</div>'+
			'<div class="row">'+
				'<div class="large-12 column">'+
					'<input id="beneficiary_narrative_text" name="person[narrative_text]" placeholder="Narrative Text" type="text">'+
				'</div>'+
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
	// $("#submitPerson").prop("disabled",true);
	var dataToSend = {};
	person = {};
	var new_person = document.getElementById("new_person");
	person.name = $(new_person).find("#person_name")[0].value;
	person.fname = $(new_person).find("#person_fathers_name")[0].value;
	person.gender = $(new_person).find("#person_gender")[0].value;

	//if beneficiary is yes parse it too
	if ($('#person_beneficiary_status').find(":selected").text() === "Yes") {
		dataToSend.beneficiary = {};
		dataToSend.beneficiary.school_name = $(new_person).find("#beneficiary_school_name")[0].value;
	}
	dataToSend.person = person;
	$.ajax({
		url: "http://"+window.location.host+"/people/create",   // I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
		type: "PUT",
		dataType: 'json',
		async: 'false',
		data: dataToSend,
		success: function(returned_value){
			window.location.replace("/people");
		},
		error: function(returned_value){
			alert("Something went Wrong during the sending of the data please retry later");
		}
	});
});
