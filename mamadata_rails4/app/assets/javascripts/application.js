// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require modules/selectWithOtherField
//= require offcanvas
//= require responsive-tables
//= require jquery.tablesorter.min
//= require foundation
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.ui.all
$(function(){
	$("tr[data-link]").click(function() {
		window.location = $(this).data("link")
	})
});
//= require turbolinks
//= require jquery.tablesorter.min
$(function(){
	$(document).foundation();
});
$(document).ready(function(){
	$(".tablesorter").tablesorter();
});


/* Person Show */ 
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
	var toalAmountChecked = 0;
$("#incident_amount").each(function() {
		alert($('#incident_amount').text());
		$('#calculated_amount').html($('#incident_amount').text());
});

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