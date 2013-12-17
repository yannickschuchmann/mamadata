$('#person_beneficiary_status').on('change', function (e) {
    var optionSelected = $("option:selected", this);
    var valueSelected = this.value;
    if (valueSelected === "Yes") {
		console.log("yes");
		$("#if_beneficiary").append(
			'<div class="field">'+
				'<div class="span3"><label for="school_name">School Name</label></div>'+
				'<div class="span9"><input id="school_name" name="person[school_name]" type="text"></div>'+
			'</div>'+
			'<div class="field">'+
				'<div class="span3"><label for="Role in context of Sharana">Role in the Household</label></div>'+
				'<div class="span9"><select id="role_id" name="person[role_id]">'+
							'<option value="1">Government</option>'+
							'<option value="2">Government aided</option>'+
							'<option value="3">Private</option>'+
				'</select></div>'+
			'</div>'+
			'<div class="field">'+
				'<div class="span3"><label for="narrative_text">Narrative text</label></div>'+
				'<div class="span9"><input id="narrative_text" name="person[narrative_text]" type="text"></div>'+
			'</div>'
		);
    };
});