  var currentlySelected;

  $('#benefit_incident_program_id').empty();

  // set values for programs select box
  $.each(programsOfPerson, function( value) {   
   $('#benefit_incident_program_id')
   .append($("<option></option>")
     .attr("value",value)
     .text(allPrograms[value]));
 });

  // set values for benefits select box, dependent on first program in list
  var initialProgram = $('#benefit_incident_program_id').val();
  $.each(data[initialProgram], function(key, value) {   
   $('#benefit_incident_benefit_id')
   .append($("<option></option>")
     .attr("value",value.id)
     .text(value.name));
 });


  // check for changes in programs select box
  $('#benefit_incident_program_id').on('change', function(){
    $('#benefit_incident_benefit_id').empty();
    var benefitsOfSelectedProgram = data[this.value];


    // set values for benefits select box, based on selected program
    $.each(benefitsOfSelectedProgram, function(key, value) {   
     $('#benefit_incident_benefit_id')
     .append($("<option></option>")
       .attr("value",value.id)
       .text(value.name));
     
   });
    setAmountBasedOnBenefit();
  });

  //set value based on selecten benefit
  $('#benefit_incident_benefit_id').on('change', function(){
    setAmountBasedOnBenefit();
    
  });

  var setAmountBasedOnBenefit = function () {
    
    if(hasCalculatedAmount()){
        $('#benefit_incident_amount').val(benefits_calculated[currentlySelected]/100) ;
        $('#benefit_incident_amount').attr("readonly", true)
        $('#amountlabel').html('Amount (Calculated)');
    } else if (hasFixedAmount()){
        $('#benefit_incident_amount').val(benefits_fixed[currentlySelected]/100);
        $('#benefit_incident_amount').attr("readonly", true)
        $('#amountlabel').html('Amount (Fixed)');
    } else {
        $('#benefit_incident_amount').val("0.00");
        $('#benefit_incident_amount').attr("readonly", false)
        $('#amountlabel').html('Amount');      
    }
  };

  var hasFixedAmount = function() {
    currentlySelected = $('#benefit_incident_benefit_id :selected').val();
    return allBenefits[currentlySelected] == 'fixed';
  };

  var hasCalculatedAmount = function() {
    currentlySelected = $('#benefit_incident_benefit_id :selected').val();
    return allBenefits[currentlySelected] == 'calculated';
  };

setAmountBasedOnBenefit();