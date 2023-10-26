//判断用户输入的账号密码 进行转发
$(function (){
    $('#login_btn').click(function (){
        if($('#account').val().length<3){
            $('#error_box').css({"display":"block","opacity":"1"});
            $('#error_box').animate({opacity:0},2000);
            $('#error_box').html("用户名不能小于3位");
        }
        else if ($('#password').val().length<3){
            $('#error_box').css({"display":"block","opacity":"2"});
            $('#error_box').animate({opacity:0},2000);
            $('#error_box').html("密码不能小于3位");
        }else {
            let username = $('#account').val();
            let password = $('#password').val();

            $.post('loginServlet',{username:username,password:password},function (data){
                console.log(data)
                if (data==1){
                    $('#error_box').css({"display":"block","opacity":"2"});
                    $('#error_box').animate({opacity:0},2000);
                    $('#error_box').html("密码或账号错误，请检查");
                }else {
                    window.location = "/fruitshop/index.jsp"


                }
            });
        }



    })
})
//注册按钮
$(function (){
    $('#btn-register').click(function (){
        location.href='register.jsp';
    })
})
//控制登录按键
$(function (){
    $('.show-login').click(function (){
        $('.login-box').css({"display":"block"});
    })
})
//关闭按钮
$(function (){
    $('.close-btn').click(function (){
        $('.login-box').css({"display":"none"});
    })
})

//搜索按钮
// $('#search').on('keypress',function (e){
//     const keycode =e.keyCode;
//     const likename = $(this).val();
//     console.log(likename)
//
//     if(keycode=='13'){
//         $.get('searchGoodsServlet',{likename,likename},function (){
//
//         })
//     }
//
// })

//购物车图标控制
$('.icofont-shopping-cart').click(function (){
    $("body").css("overflow","hidden");
    $(".cart-part").addClass("active");
    $(".cart-close").on("click",(function(){
        $("body").css("overflow","inherit");
        $(".cart-part").removeClass("active");
    })
    )
})

//删除购物车商品
$('.cart-delete').click(function (){
    const id = $(this).get(0).id
    $.post('DeleteCartServlet',{id:id},function (result){
        window.location.reload()
    })
})



$('.btn-go').click(function (){
    let text = $('.order-textarea').val()
    //获取复选框的值
    let payinfo = $('input[type=radio][name=paytype]:checked').val()

    $.post('OrderAddListServlet',{text:text,payinfo:payinfo},function (result){

            if(result=="1"){
                alert("下单成功")
                window.location = "/fruitshop/index.jsp"

            }else {
                alert("下单失败，请重新再试")
            }
    })
})

