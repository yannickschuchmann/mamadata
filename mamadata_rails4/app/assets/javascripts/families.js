peopleNumber = 1;
$("#addpeople").click(function(){
	$("#people").append('<div class="person">'+
						'<h1>Person'+peopleNumber+'</h1>'+
						'<div class="field">'+
							'<div class="span3"><label for="name">Name</label></div>'+
							'<div class="span9"><input id="name" name="person[name]" type="text"></div>'+
						'</div>'+
						'<div class="field">'+
							'<div class="span3"><label for="person_Father\'s Name">Father\'s name</label></div>'+
							'<div class="span9"><input id="fathers_name" name="person[fathers_name]" type="text"></div>'+
						'</div>'+
						'<div class="field">'+
						'<div class="span3"><label for="Role in context of Sharana">Role in the Household</label></div>'+
						'<div class="span9"><select id="role_id" name="person[role_id]"><option value="1">Head of the Household</option>'+
									'<option value="2">Wife</option>'+
									'<option value="3">Child</option>'+
									'<option value="4">Father</option>'+
									'<option value="5">Mother</option>'+
									'<option value="6">Brother</option>'+
									'<option value="7">Sister</option>'+
							'</select></div>'+
						'</div></div>'
	);
	peopleNumber = peopleNumber + 1;
});
$("#submitFamily").click(function(){
	var dataToSend = {};
	var persons = document.getElementsByClassName("person");
	dataToSend.person = {};
	[].forEach.call(persons, function(person,index) {
		var tmp = {};
		tmp.name = $(person).find("#name")[0].value;
		tmp.fname = $(person).find("#fathers_name")[0].value;
		tmp.role_id = $(person).find("#role_id")[0].value;
		if (tmp.role_id === "1") {
			dataToSend.familyname = tmp.fname;
		};
		dataToSend.person[index] = tmp;
	});
	console.log(dataToSend);
	// var data = JSON.stringify(dataToSend)
	$.ajax({
		url: "http://"+window.location.host+"/families/create",   // I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
		type: "PUT",
		dataType: 'json',
		async: 'false',
		data: dataToSend,
		success: function(returned_value){
			window.location.replace("/families")
			// window.location.replace("/families/show/"+returned_value.id)
			// console.log(returned_value);
		},
		error: function(returned_value){
			console.log("error: " + returned_value);
		}
	});
});