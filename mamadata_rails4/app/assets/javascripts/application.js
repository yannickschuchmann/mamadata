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
//= require responsive-tables
//= require jquery.tablesorter.min
//= require foundation
//= require jquery.turbolinks
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

// Off-Canvas function
$(function () {
		$sideWidth = $('#side').outerWidth();
		$('#content').css("margin-left", ($sideWidth + 10)+"px");
	});

var canvas_toggle 	= $('#canvas-toggle'),
	off_canvas 		= $('#off-side'),
	side 			= $('#side'),
	wrapper			= $('#wrapper');

canvas_toggle.click( function() {
	if (off_canvas.hasClass("is_active")) {
		off_canvas.removeClass("is_active");
		off_canvas.css("left", "-150px");
		wrapper.css("margin-left", "0px")
		side.css("left", "0px");
	}else {
		off_canvas.addClass("is_active");
		off_canvas.css("left", "0px");
		wrapper.css("margin-left", "160px")
		side.css("left", "150px");
	};
});
$(document).ready(function(){
	$(".tablesorter").tablesorter();
});