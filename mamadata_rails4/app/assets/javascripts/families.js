ready = function() {
    console.log("families")
	$("#new_person").hide();
	$("#head").click(function(){
		("#new_person").slideToggle();
	});

	$("#addpeople").click(function(){
        jQuery.ajax({
                url: "/families/addpeople.js",
                type: "GET",
                success: function(result){
                    jQuery("#image_center").html("<%= escape_javascript(render(:partial => 'pages/top_link')) %>");
                },
                error: function(){
                    alert('Error occured');
                }
            });
	});
};

$(document).ready(ready);
// $(document).on('page:load', ready);