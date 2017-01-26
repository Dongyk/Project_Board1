// jQuery to apply actions to the link
    $(document).ready(function(){
        $("#login-link").click(function(){
            $("#login-panel").slideToggle(200);
        });
    });
 
    //jQuery to apply actions to the ESC key
    $(document).keydown(function(e) {
        if (e.keyCode == 27) {
            $("#login-panel").hide(0);
        }
    });