$(function () {
    var textfield = $("input[name=user]");
    $('button[type="submit"]').click(function (e) {
        e.preventDefault();
        //little validation just to check username
        if (textfield.val() != "") {
            var uname = $('#uname').val();
            var passwd = $('#passwd').val();
            $.post('application/login/data_login.php', {uname: uname, passwd: passwd}, function (data) {
                
                //$("body").scrollTo("#output");
                $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
                $("#output").removeClass('alert-danger');
                $("input").css({
                    "height": "0",
                    "padding": "0",
                    "margin": "0",
                    "opacity": "0"
                });
                //change button text 
                $('button[type="submit"]').html("continue")
                        .removeClass("btn-info")
                        .addClass("btn-default").click(function () {
                    $("input").css({
                        "height": "auto",
                        "padding": "10px",
                        "opacity": "1"
                    }).on("click", function(){
                        document.location.href = index.php;
                    });
                });

                //show avatar
                $(".avatar").css({
                    "background-image": ""
                });
                console.log(data)
            });
            
        } else {
            //remove success mesage replaced with error message
            $("#output").removeClass(' alert alert-success');
            $("#output").addClass("alert alert-danger animated fadeInUp").html("sorry enter a username ");
        }
        //console.log(textfield.val());
    });
});