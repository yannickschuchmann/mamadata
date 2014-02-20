$("#searchExistingPeopleSubmit").click(function () {
	$('#searchExistingPeopleForm').hide();
	$('#search_results_List').show();
    $('#FormToggle').show();
});
$("#FormToggle").click(function () {
	$('#searchExistingPeopleForm').show();
	$('#search_results_List').hide();
    $('#FormToggle').hide();
});

var peopleNumber = 1,
    searchResult;

// Search People
$("#searchExistingPeopleForm").submit(function(e){
	e.preventDefault();
	$.ajax({
		url: "http://"+window.location.host+"/people/search",	// I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
		type: "PUT",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
		dataType: 'json',
		async: 'false',
		data: $(this).serialize(),
		success: function(result){
			var str = "";
            searchResult = result;
			for (var i = result.length - 1; i >= 0; i--) {
                result[i].zip_code = result[i].zip_code || '';
				str += "<tr class='addfromsearchpeople"+i+"'>\
				    <td>" + result[i].name +"</td>\
				    <td>" + result[i].fathers_name +"</td>\
				    <td>" + result[i].city +"</td>\
				    <td>" + result[i].zip_code +"</td>\
				    <td><div class='button tiny less-pd' data-pid="+i+"><i class='icon-user'></i> <i class='icon-arrow-right'></i> <i class='icon-group'></i></div></td>\
                </tr>";
			}
			$("#searchResult")
                .html(str)
                .find('[data-pid]')
                    .click(function() {
                        var $this = $(this);
                        addFromSearch($this.attr('data-pid'));
                    });
		},
		error: function(result){
			alert("Something went Wrong during the sending of the data please retry later");
		}
	});
});

// FN die rechts pusht
function addFromSearch(pid) {
	var person = searchResult[pid],
        inside = false;
    serializePeople().forEach(function(cperson) {
        if(cperson.person_id == person.id) {
            inside = true;
        }
    });
    if(inside) return;

	$("#buttonHide").show();
	/*jshint multistr: true */
	$("#people").append(
			'<div class="person" data-pid="'+person.id+'"> \
			<input type="hidden" name="people['+peopleNumber+'][person_id]" value="'+person.id+'">\
			<a href="" class="button tiny alert removeLink"><i class="icon-trash"></i></a>\
			<div class="row">\
				<div class="small-12 medium-4 left" style="padding: 10px 20px;">Name</div>\
				<div class="small-12 medium-8 right" style="padding: 10px 20px;">'+person.name +'</div>\
				<div class="small-12 medium-4 left" style="padding: 10px 20px;">Father\'s name</div>\
				<div class="small-12 medium-8 right" style="padding: 10px 20px;">'+ person.fathers_name +'</div>\
					<div class="small-12 medium-4 left" style="padding: 10px 20px;">Role in the Household</div>\
					<div class="small-12 medium-8 right" style="padding: 10px 20px;">\
						<select id="role_id" name="people['+peopleNumber+'][role_id]">\
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
			</div>\
		</div>');
	peopleNumber = peopleNumber + 1;

    $('.removeLink').click(function(e) {
        e.preventDefault();
        var $this = $(this);
        if($this.attr('href') === '') $this.closest('.person').remove();
    });
}

function serializePeople() {
    var list = [];
    $('#people .person').each(function() {
       list.push({
          person_id:  $(this).attr('data-pid'),
          role: $(this).find('select').val()
       })
    });
    return list;
}

$("#submitFamily").click(function(event){
//	event.preventDefault();
//
//	$.ajax({
//		url: "http://"+window.location.host+"/families/create",   // I'm doing the proper routing later, since '/make_suggestion' routes to 'items/1/make_suggestion'
//		type: "PUT",
//		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
//		dataType: 'json',
//		async: 'false',
//		data: 'people='+JSON.stringify(serializePeople()),
//		success: function(result){
//			window.location.replace("/families");
//		},
//		error: function(returned_value){
//			alert("Something went Wrong during the sending of the data please retry later");
//		}
//	});
});