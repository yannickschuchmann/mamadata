// families = function() {
    console.log("families")
	$("#new_person").hide();
	$("#head").click(function(){
		("#new_person").slideToggle();
	});

	$("#addpeople").click(function(){
        console.log("clicked")
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
// };
// // this loads on ALL sites
// $(document).ready(families);
// // this only on /families*
// $(document).on('page:load', families());