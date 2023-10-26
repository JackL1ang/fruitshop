$(function (){
    $('#userInfo').click(function (){
        $('#userInfo').attr('class','nav-link active');
        $('#modify-password').attr('class','nav-link');
        $('#orderInfo').attr('class','nav-link');
        $('.content-box').load('modifyuser.jsp');

    })
})
$(function (){
    $('#modify-password').click(function (){
        $('#modify-password').attr('class','nav-link active');
        $('#userInfo').attr('class','nav-link');
        $('#orderInfo').attr('class','nav-link');
        $('.content-box').load('modifypassword.jsp');

    })
})




$(function (){
    $('.userCenter_btn').click(function (){
        const name = $('#name-register').val();
        const phone = $('#phone-register').val();
        const address = $('#address-register').val();
        $.post('modifyUserInfoServlet',{name:name,phone:phone,address:address},function (result){
            if(result==1){
                $('#error_register').css({"display":"block","opacity":"1","background":"#c9f3d0","color":"#199e31"});
                $('#error_register').animate({opacity:0},2000);
                $('#error_register').html("修 改 成 功");
                window.setTimeout(function (){
                    window.location.reload();
                },2000)
            }else {

            }

        })
    })
})



