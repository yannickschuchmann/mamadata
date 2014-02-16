/* update incidents via ajax function */
APP.Incidents.updateIncidentList = function() {
    var $calcAmount = $('#calculated_amount');
	$.ajax({
    url: "/benefit_incidents/list/"+ personId,
        type: "GET",
        data: {status: $('#incident_status option:selected').val(), list_date: $('#benefit_incident_created_at').val()}
    });
    $calcAmount.val('');
    $calcAmount .hide();
};

APP.Incidents.init = function() {

    /* update incidents when status of select box changes */
    $('#incident_status').change(function(){
        APP.Incidents.updateIncidentList();
    });


    /* update checked incidents with status true via ajax */
    $('#setgrantedbtn').on('click', function(e){
        e.preventDefault();
        $(".chk").each(function() {
            var $this = $(this);
            if($this.is(':checked')){
               $.ajax({
                    url: "/benefit_incidents/" + $this.val(),
                    type: "PATCH",
                    data: {benefit_incident: {status: true}},
                    dataType: "json"
                })
            }
        });
        APP.Incidents.updateIncidentList();
    });


    /* send array of ids to calculate amount on via ajax */
    $('#calculatebtn').on('click', function(e) {
        e.preventDefault();
        var ids = new Array();
        $(".chk").each(function() {
            var $this = $(this);
            if($this.is(':checked')){
              ids.push($this.val());
            }
        });
        $("#calculated_amount").show();
        $.ajax({
            url: "/benefit_incidents/test/calculated",
            type: "GET",
            data: {array: ids}
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
        APP.Incidents.updateIncidentList();
    });
};

APP.Persons.AmounttoView = {
    $el: $('#amount-to-date'),
    init: function() {
        this.$el.find('.button-group').click(function(e) {
            e.preventDefault();
            $(this).addClass('hidden').siblings().removeClass('hidden');
        });
    }
}

$(document).ready(function() {
    APP.Incidents.init();
    APP.Persons.AmounttoView.init();
});


