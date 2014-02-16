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
//= require form-validator
//= require offcanvas
//= require responsive-tables
//= require jquery.tablesorter.min
//= require foundation
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.ui.all

var APP = {
    Persons: {},
    Incidents: {},
    Modules: {
        FormValidator: {}
    }
};


$(function(){
	$("tr[data-link]").click(function() {
		window.location = $(this).data("link")
	})
});
//= require turbolinks
//= require jquery.tablesorter.min

$(document).ready(function(){
    $(document).foundation();
    if(location.hash !== '') $('a[href="'+location.hash+'"]').trigger('click');

	$(".tablesorter").tablesorter();

});