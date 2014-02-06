// Off-Canvas function
$(function () {
	$sideWidth = $('#side').outerWidth();
	$('#content').css("margin-left", ($sideWidth + 10)+"px");
});

var $canvas_toggle 	= $('#canvas-toggle'),
	$off_canvas		= $('#off-side'),
	$side 			= $('#side'),
	$wrapper		= $('#wrapper');

$canvas_toggle.click( function() {
	if ($off_canvas.hasClass("is_active")) {
		$off_canvas.removeClass("is_active");
		$off_canvas.css("left", "-150px");
		$wrapper.css("left", "0px")
		$side.css("left", "0px");
	}else {
		$off_canvas.addClass("is_active");
		$off_canvas.css("left", "0px");
		$wrapper.css("left", "160px")
		$side.css("left", "150px");
	}
});