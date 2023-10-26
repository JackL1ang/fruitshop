$(function (){
    $('.show-login').click(function (){
        $('.login-box').css({"display":"block"});
        $('.signup').css({"display":"none"})
    })
})

$(function (){
    $('.close-btn').click(function (){
        $('.login-box').css({"display":"none"});
        $('.signup').css({"display":"block"})
    })
})

$(function (){
    $('.login-in').click(function (){
        $('.login-box').css({"display":"block"});
        $('.signup').css({"display":"none"})
    })
})

//异步查询用户名是否重复
$(function (){
    $('#username-register').blur(function (){
        const username = $('#username-register').val();
        console.log(username)
        console.log(username.length)
        if (username.length<3){

            console.log("if---->"+username)
            $('#error_register').css({"display":"block","opacity":"1"});
            $('#error_register').animate({opacity:0},2000);
            $('#error_register').html("用户名不能小于3位");
        }else {
            console.log("else--->"+username)
            $.ajax({
                url:"/fruitshop/isUsernameExistServlet",
                data:{username:username},
                async:true,
                type:"POST",
                dataType:"json",
                success:function (result){

                    if(result){
                        console.log(result);
                    }else {
                        console.log(result);
                        $('#error_register').css({"display":"block","opacity":"2"});
                        $('#error_register').animate({opacity:0},2000);
                        $('#error_register').html("用户名已存在，请换一个");
                    }
                }
            })
        }



    })
})

$(function (){
    $('#password-register').blur(function (){
        const password = $('#password-register').val();
        if(password.length<3){
            $('#error_register').css({"display":"block","opacity":"1"});
            $('#error_register').animate({opacity:0},2000);
            $('#error_register').html("密码不能小于3位");
        }
    })
})

$(function (){
    $('.register_btn').click(function (){
        let username = $('#username-register').val();
        let Email = $('#Email-register').val();
        let password = $('#password-register').val();
        let name = $('#name-register').val();
        let phone = $('#phone-register').val();
        let address = $('#address-register').val();
        if (username.length<3){
            $('#error_register').css({"display":"block","opacity":"1"});
            $('#error_register').animate({opacity:0},2000);
            $('#error_register').html("用户名不能小于3位");
        }else if(password<3){
            $('#error_register').css({"display":"block","opacity":"1"});
            $('#error_register').animate({opacity:0},2000);
            $('#error_register').html("密码不能小于3位");
        }else {
            $.post('isUsernameExistServlet',{username:username},function (result){
                if(result){
                    $.post('registerServlet',{username:username,email:Email,password:password,name:name,phone:phone,address:address},function (data){
                        console.log(data);
                        if(data==1){
                            $('#error_register').css({"display":"block","opacity":"1","background":"#c9f3d0","color":"#199e31"});
                            $('#error_register').animate({opacity:0},2000);
                            $('#error_register').html("注 册 成 功");
                            window.setTimeout(function (){
                                window.location.href="/fruitshop/index.jsp";
                            },2000)
                        }else{
                            console.log(data)
                            $('#error_register').css({"display":"block","opacity":"2"});
                            $('#error_register').animate({opacity:0},2000);
                            $('#error_register').html("请稍后再试");
                        }
                    })
                }else{
                    $('#error_register').css({"display":"block","opacity":"2"});
                    $('#error_register').animate({opacity:0},2000);
                    $('#error_register').html("用户名已存在，请换一个");
                }
            })
        }

    })
})