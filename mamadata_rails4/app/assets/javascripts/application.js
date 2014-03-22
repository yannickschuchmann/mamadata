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
	//= require modules/selectWithOtherField
	//= require form-validator
	//= require offcanvas
	//= require responsive-tables
	//= require jquery.tablesorter.min
	//= require jquery.ui.all
	//= require foundation
	// require turbolinks

	function uniqueArray(list) {
	  var result = [];
	  $.each(list, function(i, e) {
	    if ($.inArray(e, result) == -1) result.push(e);
	  });
	  return result;
	}
    var APP = {
		Persons: {},
		Incidents: {},
		Modules: {
			FormValidator: {}
		}
	};
	$(function(){
		$("tr[data-link] td").click(function(e) {
            var $this = $(this);
            if($this.find('a, input').length === 0) {
                window.location = $this.parent().data("link");
            }
		});

        /* initialize datepicker */
        $('input.datepicker').datepicker({
            dateFormat:'dd-mm-yy',
            duration: 'normal',
            changeMonth: true,
            changeYear: true,
            gotoCurrent: true,
            autoSize: true,
            showButtonPanel: true,
            inline: true
        });

		$(document).foundation();
		if(location.hash !== '') $('a[href="'+location.hash+'"]').trigger('click');

		$(".tablesorter").tablesorter();


        APP.LoadOverlay.init();
        APP.Persons.Reports.init();
	});

	/* update incidents via ajax function */
	APP.Incidents.updateIncidentList = function() {
		var $calcAmount = $('#calculated_amount');
		$.ajax({
			url: "/benefit_incidents/list/"+ APP.Incidents.personId,
			type: "GET",
			data: {status: $('#incident_status option:selected').val(), date_from: $('#benefit_incident_date_from').val(),
			date_to:$('#benefit_incident_date_to').val()}
		});
		$calcAmount.val('');
		$calcAmount.hide();
	};

	APP.Incidents.init = function(personId) {
		APP.Incidents.personId = personId || "all"
		/* update incidents when status of select box changes */
		$('#incident_status').change(function(){
			$('#benefit_incident_date_from').val('');
			$('#benefit_incident_date_to').val('');
			APP.Incidents.updateIncidentList();
		});

		$("#chkall").click(function () {
			$(".chk").prop('checked', $(this).prop('checked'));
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
				url: "/benefit_incidents/calculated",
				type: "GET",
				data: {array: ids}
			});
		});

			$('#reportbtn').on('click', function(e) {
			e.preventDefault();
			var ids = new Array();
			$(".chk").each(function() {
				var $this = $(this);
				if($this.is(':checked')){
				  ids.push($this.val());
			  }
		    });
        var data  =  {
      	ids: ids};
      	if (ids.length > 0) {
        var win=window.open("/benefit_incidents/report_xlsx" + '?'+ $.param(data), '_blank');
        win.focus();
      } else {
      	alert("Please Specify at least one Incident");
      }
		});

		/* checkox shows datepicker */
		$('#filter_date').on('click', function(){
			APP.Incidents.updateIncidentList();
		});
	};

    APP.LoadOverlay = {
        el: '.overlay',
        pb: '.progressbar',
        mt: '.progressbar .meter',
        exclude: '.no-overlay, [target=_blank], [data-confirm], dd > a, dd, [disabled="disabled"], a[href="#"], a[href=""], #canvas-toggle, #searchExistingPeopleForm',
        init: function() {
            var self = this;
            this.$el = $(this.el);
            this.$pb = $(this.pb);
            this.$mt = $(this.mt);
            $('a').not(this.exclude).on('click', function() {
                self.$el.show();
            });
            $('form').not(this.exclude).on('submit', function() {
                if(!$(this).find('input.error').length) {
                    self.$el.show();
                }
            });
            $(document).keyup(function(e) {
                if (e.keyCode == 27) { self.close(); }
            });
        },
        close: function() {
            this.$el.hide();
            this.progressbar(0);
            this.$pb.hide();
        },
        progressbar: function(percent) {
            this.$pb.show();
            this.$mt.width(percent+'%');
        }
    }


    APP.Persons.Reports = {
        $form: $('#peopleForm'),
        $btn: $('#reportBtn'),
        $checkAll: $('#chkall'),
        init: function() {
            var self = this;
            this.$btn.on('click', function(e) {
                e.preventDefault();
                var $this = $(this),
                    type = $this.closest('.reportBar').find('select').val();
                switch (type) {
                    case '/people/report/all.pdf':
                        var win=window.open(type, '_blank');
                        win.focus();
                        break;
                    case '/people/report/all.xlsx':
                        var win=window.open(type, '_blank');
                        win.focus();
                        break; 
                    case '/people/report_xlsx':
                    var data  =  {
                    	ids: self.$form.find('input:checkbox:checked').map(function(){
                    	return $(this).val();
                    }).get()};
                        var win=window.open(type + '?'+ $.param(data), '_blank');
                        win.focus();
                        break;                                                
                    default:
                        self.$form.submit();
                }
            });
            this.$checkAll.on('click', function(e) {
                self.$form.find('input:checkbox').prop('checked', $(this).prop('checked'))
            })
        }
    }

    APP.FormHandler = ({
        $el: $('form.ajax'),
        init: function() {
            var self = this;
            this.$el.on('submit', function(e) {
                if (self.$el.find('.error').length > 0) return
                e.preventDefault();
                APP.LoadOverlay.progressbar(0)
                $(this).ajaxSubmit({
                    xhr: function() {  // custom xhr
                        xhr = $.ajaxSettings.xhr();
                        if(xhr.upload){ // if upload property exists
                            xhr.upload.addEventListener('progress', self.progress, false); // progressbar
                        }
                        return xhr;
                    },
                    success: function(data) {
                        window.location.href = self.$el.attr('data-onsuccess') || "/";
                    },
                    error: function(error) {
                        APP.LoadOverlay.close();
                        alert("An error is occurred.\n" +
                            "Please do not upload files greater than 1mb.\n" +
                            "Try again!");
                    }
                });
            });
        },
        progress: function(e) {
            APP.LoadOverlay.progressbar(e.loaded / e.total * 100);
        }
    }).init();


