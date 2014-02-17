/* checkbox und check/uncheck all */
$(function () {
    $("#chkall").click(function () {
        $(".chk").prop('checked', $(this).prop('checked'));
    });

    APP.Incidents.init();
});

  $(".tablesorter").tablesorter({
  headers: { 
            // assign the secound column (we start counting zero) 
            0: { 
                // disable it by setting the property sorter to false 
                sorter: false 
           },
           8: {
            sorter: false
           }
          }});
