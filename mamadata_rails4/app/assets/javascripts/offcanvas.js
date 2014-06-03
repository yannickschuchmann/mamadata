// Off-Canvas function
if(!$('html').hasClass('is_static')) {
    $(function () {
        $sideWidth = $('#side').outerWidth();
        $('#content').css({
            "padding-left": ($sideWidth + 10)+"px",
            "opacity": 1
        });
    });

    var $canvas_toggle 	= $('#canvas-toggle'),
        $off_canvas		= $('#off-side'),
        $side 			= $('#side'),
    	$wrapper		= $('#wrapper');

    $canvas_toggle.click( function() {
        if ($off_canvas.hasClass("is_active")) {
            $off_canvas.removeClass("is_active");
            $wrapper.removeClass('is_active');
            $side.css("left", "0px");
        } else {
            $off_canvas.addClass("is_active");
            $wrapper.addClass('is_active');
            $side.css("left", "150px");
        }
    });
}
