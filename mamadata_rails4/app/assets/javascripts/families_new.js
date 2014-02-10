peopleNumber = 1;
addPeople();
$("#addpeople").click(function(){
	addPeople();
});
function addPeople (){
	/*jshint multistr: true */
	$("#people").append('<div class="person"> \
						<h1 class="h1person'+peopleNumber+'">Person'+peopleNumber+'</h1>\
						<div class="field">\
							<div class="span3"><label for="name">Name</label></div>\
							<div class="span9"><input id="name" name="person'+peopleNumber+'" class="person'+peopleNumber+'" type="text"></div>\
						</div>\
						<div class="field">\
							<div class="span3"><label for="person_Father\'s Name">Father\'s name</label></div>\
							<div class="span9"><input id="fathers_name" class="personsfathername'+peopleNumber+'" name="person[fathers_name]" type="text"></div>\
						</div>\
						<div class="field">\
						<div class="span3"><label for="Role in context of Sharana">Role in the Household</label></div>\
						<div class="span9"><select id="role_id" name="person[role_id]"><option value="1">Head of the Household</option>\
									<option value="2">Wife</option>\
									<option value="3">Child</option>\
									<option value="4">Father</option>\
									<option value="5">Mother</option>\
									<option value="6">Brother</option>\
									<option value="7">Sister</option>\
							</select></div>\
						</div>\
						</div>'
	);
	
		var $h1 = $(".h1person"+peopleNumber);
	var $person = $('.person'+peopleNumber);
	var $fathers_name = $(".personsfathername"+peopleNumber);
	var $familyList = $("#familyList");
	$familyList.append('<li class="ListPerson'+peopleNumber+'">Person'+peopleNumber+'</li>');
	var $familyListPerson = $(".ListPerson"+peopleNumber);

	$person.keyup(function() {
		if ($fathers_name.val() === undefined) {
			$fathers_name.text('');
		}
		$h1.html($person.val() +" "+ $fathers_name.val());
		$familyListPerson.html($person.val() +" "+ $fathers_name.val());
	});

	$fathers_name.keyup(function() {
		$h1.html($person.val()+" "+ $fathers_name.val());
		$familyListPerson.html($person.val() +" "+ $fathers_name.val());
	});

	peopleNumber = peopleNumber + 1;
	return true;
}
var searchResult;
$("#search").click(function(event){
	var name = $("#sName").val();
	var fname = $("#sFname").val();
	var city = $("#sCity").val();
	var zipcode = $("#sZipcode").val();
	dataToSend = {"name": name, "fname": fname,"city": city, "zipcode": zipcode };

	$.ajax({
		url: "http://"+window.location.host+"/people/search",   // I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
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
				str += "<td>" + returned_value[i].name +"</td>";
				str += "<td>" + returned_value[i].fathers_name +"</td>";
				str += "<td>" + returned_value[i].city +"</td>";
				str += "<td>" + returned_value[i].pin_code +"</td>";
				str += "<td><div class='button' id='addfromsearch' onclick='addFromSearch("+i+")'>Add</div></td>";
				str += '</tr>';
			}
			$("#searchResult").html(str);
		},
		error: function(returned_value){
			alert("Something went Wrong during the sending of the data please retry later");
		}
	});
});

function addFromSearch(pid) {
	var person = searchResult[pid];
	console.log(searchResult[pid]);
	/*jshint multistr: true */
	$("#people").append('<div class="person"> \
					<h1 class="h1person'+peopleNumber+'">'+person.name +' '+ person.fathers_name +'</h1>\
					<div class="field">\
						<div class="span3"><label for="name">Name</label></div>\
						<div class="span9"><input id="name" name="person'+peopleNumber+'" class="person'+peopleNumber+'" type="text"  value="'+person.name +'"></div>\
					</div>\
					<div class="field">\
						<div class="span3"><label for="person_Father\'s Name">Father\'s name</label></div>\
						<div class="span9"><input id="fathers_name" class="personsfathername'+peopleNumber+'" name="person[fathers_name]" type="text" value="'+ person.fathers_name +'"></div>\
					</div>\
					<div class="field">\
					<div class="span3"><label for="Role in context of Sharana">Role in the Household</label></div>\
					<div class="span9"><select id="role_id" name="person[role_id]"><option value="1">Head of the Household</option>\
								<option value="2">Wife</option>\
								<option value="3">Child</option>\
								<option value="4">Father</option>\
								<option value="5">Mother</option>\
								<option value="6">Brother</option>\
								<option value="7">Sister</option>\
						</select></div>\
					</div>\
					</div>');

	console.log($(".h1person"+peopleNumber).parent().find("#role_id")[0][searchResult[pid].role_id])
	//.attr('selected','selected');

	var $h1 = $(".h1person"+peopleNumber);
	var $person = $('.person'+peopleNumber);
	var $fathers_name = $(".personsfathername"+peopleNumber);
	var $familyList = $("#familyList");
	$familyList.append('<li class="ListPerson'+peopleNumber+'">'+person.name +' '+ person.fathers_name +'</li>');
	var $familyListPerson = $(".ListPerson"+peopleNumber);

	$person.keyup(function() {
		if ($fathers_name.val() === undefined) {
			$fathers_name.text('');
		}
		$h1.html($person.val() +" "+ $fathers_name.val());
		$familyListPerson.html($person.val() +" "+ $fathers_name.val());
	});

	$fathers_name.keyup(function() {
		$h1.html($person.val()+" "+ $fathers_name.val());
		$familyListPerson.html($person.val() +" "+ $fathers_name.val());
	});

	peopleNumber = peopleNumber + 1;
}
$("#submitFamily").click(function(event){
	event.preventDefault();
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