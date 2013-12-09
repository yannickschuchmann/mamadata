peopleNumber = 1;
$("#addpeople").click(function(){
    $("#people").append('<h1>Person'+peopleNumber+'</h1><div class="field">'+
                        '<div class="span3"><label for="name">Name</label></div>'+
                        '<div class="span9"><input id="name" name="person[name]" type="text"></div></div>'+
                        '<div class="field"><div class="span3"><label for="person_Father\'s Name">Father\'s name</label></div>'+
                        '<div class="span9"><input id="person_fathers_name" name="person[fathers_name]" type="text"></div></div>'
    );
    peopleNumber = peopleNumber + 1;
});