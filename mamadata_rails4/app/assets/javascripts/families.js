$("#addpeople").click(function(){
    $.ajax({
        url: "/families/addpeople.js",
        type: "GET",
        success: function(result){ console.log("fine!"); },
        error: function(){ alert('Error occured'); }
    });
});