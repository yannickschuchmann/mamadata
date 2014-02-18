$("#searchExistingPeopleSubmit").click(function () {
	$('#searchExistingPeopleForm').css("display", "none");
	$('#search_results_List').css("display", "block");
});
$("#FormToggle").click(function () {
	$('#searchExistingPeopleForm').css("display", "block");
	$('#search_results_List').css("display", "none");
});


peopleNumber = 1;
var searchResult;
// Search People
$("#searchExistingPeopleForm").submit(function(e){
	e.preventDefault();
	var name 	= $("#sName").val();
	var fname 	= $("#sFname").val();
	var city 	= $("#sCity").val();
	var zipcode = $("#sZipcode").val();
	dataToSend 	=  {"name": name, "fname": fname,"city": city, "zipcode": zipcode };
	$.ajax({
		url: "http://"+window.location.host+"/people/search",	// I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
		type: "PUT",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
		dataType: 'json',
		async: 'false',
		data: dataToSend,
		success: function(returned_value){
			console.log(returned_value);
			searchResult = returned_value;
			str = "";
			for (var i = returned_value.length - 1; i >= 0; i--) {
				if (returned_value[i].pin_code === null) {
					returned_value[i].pin_code = "";
				}
				str += "<tr class='addfromsearchpeople"+i+"'>";
				str += "<td>" + returned_value[i].id +"</td>";
				str += "<td>" + returned_value[i].name +"</td>";
				str += "<td>" + returned_value[i].fathers_name +"</td>";
				str += "<td>" + returned_value[i].city +"</td>";
				str += "<td>" + returned_value[i].pin_code +"</td>";
				str += "<td><div class='button tiny' id='addfromsearch' onclick='addFromSearch("+i+")'>Add</div></td>";
				str += '</tr>';
			}
			$("#searchResult").html(str);
		},
		error: function(returned_value){
			alert("Something went Wrong during the sending of the data please retry later");
		}
	});
return false;
});

// FN die rechts pusht
function addFromSearch(pid) {
	var person = searchResult[pid];
	/*jshint multistr: true */
	$("#people").append(
			'<div class="person"> \
			<span class="removePerson">X</span>\
			<input type="hidden" id="personId" value="'+person.id+'"/>\
			<h5>'+ person.id +' '+  person.name +' '+ person.fathers_name +'</h5>\
			<div class="row">\
				<div class="small-12 medium-4 column"><label for="name">Name</label></div>\
				<div class="small-12 medium-8 column"><input id="name" disabled="disabled" name="person'+peopleNumber+'" class="person'+peopleNumber+'" type="text"  value="'+person.name +'"></div>\
				<div class="small-12 medium-4 column"><label for="person_Father\'s Name">Father\'s name</label></div>\
				<div class="small-12 medium-8 column"><input id="fathers_name" disabled="disabled" class="personsfathername'+peopleNumber+'" name="person[fathers_name]" type="text" value="'+ person.fathers_name +'"></div>\
				<div class="small-12 medium-4 column"><label for="Role in context of Sharana">Role in the Household</label></div>\
				<div class="small-12 medium-8 column">\
					<select id="role_id" name="person[role_id]">\
						<option value="1">Head of the Household</option>\
						<option value="2">Wife</option>\
						<option value="3">Child</option>\
						<option value="4">Father</option>\
						<option value="5">Mother</option>\
						<option value="6">Brother</option>\
						<option value="7">Sister</option>\
					</select>\
				</div>\
			</div>\
		</div>');

		$('.removePerson').click(function() {
		var $el = $(this).closest('.person'),
		pid = $el.find('input#personId').val();
		$(".ListPerson"+pid).remove();
		$el.remove();
	});
	peopleNumber = peopleNumber + 1;
}

$("#submitFamily").click(function(event){
	event.preventDefault();
	var dataToSend = {};
	var persons = document.getElementsByClassName("person");
	dataToSend.person = {};
	[].forEach.call(persons, function(person,index) {
		var tmp 	= {};
		tmp.id 		= $(person).find("#personId")[0].value;
		tmp.name 	= $(person).find("#name")[0].value;
		tmp.fname 	= $(person).find("#fathers_name")[0].value;
		tmp.role_id = $(person).find("#role_id")[0].value;
		if (tmp.role_id === "1") {
			dataToSend.familyname = tmp.fname;
		}
		dataToSend.person[index] = tmp;
	});

	$.ajax({
		url: "http://"+window.location.host+"/families/create",   // I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
		type: "PUT",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
		dataType: 'json',
		async: 'false',
		data: dataToSend,
		success: function(returned_value){
			window.location.replace("/families");
			// window.location.replace("/families/show/"+returned_value.id)
			// console.log(returned_value);
		},
		error: function(returned_value){
			alert("Something went Wrong during the sending of the data please retry later");
		}
	});
});