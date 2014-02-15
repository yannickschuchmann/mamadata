APP.Modules.FormValidator = {
    $el: $('form'),
    events: {
        'keyup input': 'validate'
    },
    init: function() {
        setEvents();
    },
    setEvents: function() {
        this.events.forEach(function(event) {

        });
        // $('input', this.$el).on('focus', )
    }
};

APP.Modules.FormValidator.init();