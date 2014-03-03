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
    APP.Incidents.init(personId);
    APP.Persons.AmounttoView.init();
});
