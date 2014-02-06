


  $('#benefit_incident_program_id').empty();

  $.each(programsOfPerson, function( value) {   
   $('#benefit_incident_program_id')
   .append($("<option></option>")
     .attr("value",value)
     .text(allPrograms[value]));
 });

  var initialProgram = $('#benefit_incident_program_id').val();
  $.each(data[initialProgram], function(key, value) {   
   $('#benefit_incident_benefit_id')
   .append($("<option></option>")
     .attr("value",value.id)
     .text(value.name));
 });


  $('#benefit_incident_program_id').on('change', function(){
    $('#benefit_incident_benefit_id').empty();
    var benefitsOfSelectedProgram = data[this.value];



    $.each(benefitsOfSelectedProgram, function(key, value) {   
     $('#benefit_incident_benefit_id')
     .append($("<option></option>")
       .attr("value",value.id)
       .text(value.name));
   });

    

  });
  $('#benefit_incident_benefit_id').on('change', function(){
    for (var i=0;i<benefits_calculated.length;i++){
      if (benefits_calculated[i].id == $('#benefit_incident_benefit_id').val()) {
        $('#benefit_incident_amount').val("calculated");
        $('#benefit_incident_amount').attr("readonly", true)
      } else {
        $('#benefit_incident_amount').val(0);
        $('#benefit_incident_amount').attr("readonly", false)
      }

    }
    
  });
