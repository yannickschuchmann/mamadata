
var updateIncidentList = function() {
	  $.ajax({
    url: "/benefit_incidents/list/"+ personId,
    type: "GET",
    data: {status: $('#incident_status option:selected').val(), list_date: $('#benefit_incident_created_at').val()}
  })
	};

$('#incident_status').change(function(){
	updateIncidentList();
});

$('#setgrantedbtn').on('click', function(e){
	e.preventDefault();
$(".chk").each(function() {
	if($(this).is(':checked')){
	  $.ajax({
    url: "/benefit_incidents/" + $(this).val(),
    type: "PATCH",
    data: {benefit_incident: {status: true}},
    dataType: "json"
  })
	}
});
	updateIncidentList();
});




$('#calculatebtn').on('click', function(e){
	e.preventDefault();
	var ids = new Array();
$(".chk").each(function() {
	if($(this).is(':checked')){
		ids.push($(this).val());
	}
});
$("#calculated_amount").show();
$.ajax({
    url: "/benefit_incidents/test/calculated",
    type: "GET",
    data: {array: ids},
  })
});




$('#benefit_incident_created_at').change(function(){
updateIncidentList();

});




$('#benefit_incident_created_at').datepicker({
    dateFormat:'yy-mm-dd',
    duration: 'normal',
    changeMonth: true,
    changeYear: true,
    gotoCurrent: true,
    autoSize: true,
    showButtonPanel: true,
    inline: true

});

$('#filter_date').change( function(){
	if($(this).is(':checked')){
		$('#benefit_incident_created_at').show();
	} else {
		$('#benefit_incident_created_at').hide();
		$('#benefit_incident_created_at').val('');
		updateIncidentList();
	}
});