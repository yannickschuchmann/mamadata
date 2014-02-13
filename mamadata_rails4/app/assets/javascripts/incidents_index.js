/* update incidents via ajax function */
var updateIncidentList = function() {
  $.ajax({
        url: "/benefit_incidents/list/all",
        type: "GET",
        data: {status: $('#incident_status option:selected').val(), list_date: $('#benefit_incident_created_at').val()}
    });
    $('#calculated_amount').val('');
    $('#calculated_amount').hide();
};


/* update incidents when status of select box changes */
$('#incident_status').change(function(){
  updateIncidentList();
});


/* update checked incidents with status true via ajax */
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


/* send array of ids to calculate amount on via ajax */
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
  });
});


/* update incidents when dateFilter applied */
// $('#benefit_incident_created_at').change(function(){
//     updateIncidentList();
// });


/* initialize datepicker */
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


/* checkox shows datepicker */
$('#filter_date').on('click', function(){
  updateIncidentList();
});