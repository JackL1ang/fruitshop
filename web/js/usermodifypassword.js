$(function (){
    $('#before-password').blur(function (){
        console.log(123)
        const bf_password = $('#before-password').val()
        console.log(bf_password);
        $.post('Change_pwd',{password:bf_password},function (result){
            if (result == 2){
                console.log(result)
                $('#error_modifypassword').css({"display":"block","opacity":"2"});
                $('#error_modifypassword').animate({opacity:0},2000);
                $('#error_modifypassword').html("原密码不正确，你再想想！");

            }

        })
    })
})

$(function (){
    $('.modify-password').click(function (){
        const bf_password = $('#before-password').val()
        const new_password = $('#new-password').val()
        const confirm_password = $('#confirm-password').val()
        $.post('Change_pwd',{password:bf_password},function (result){
            if (result == 2){
                console.log(result)
                $('#error_modifypassword').css({"display":"block","opacity":"2"});
                $('#error_modifypassword').animate({opacity:0},2000);
                $('#error_modifypassword').html("原密码不正确，你再想想！");

            }else if (new_password!=confirm_password){
                $('#error_modifypassword').css({"display":"block","opacity":"2"});
                $('#error_modifypassword').animate({opacity:0},2000);
                $('#error_modifypassword').html("新密码和确认密码不一致哦！");
            }else {
                $.post('UserModifyPasswordServlet',{new_password:new_password},function (result){
                        if(result=='1'){
                            $('#error_modifypassword').css({"display":"block","opacity":"1","background":"#c9f3d0","color":"#199e31"});
                            $('#error_modifypassword').animate({opacity:0},2000);
                            $('#error_modifypassword').html("修 改 成 功");
                            window.location.reload()
                        }else {
                            $('#error_modifypassword').css({"display":"block","opacity":"2"});
                            $('#error_modifypassword').animate({opacity:0},2000);
                            $('#error_modifypassword').html("系统暂时有问题，请稍后再试！");
                        }
                })
            }

        })
    })
})