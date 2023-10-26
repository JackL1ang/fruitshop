$(function (){
    $('#userInfo').click(function (){
        $('#userInfo').attr('class','nav-link active');
        $('#modify-password').attr('class','nav-link');
        $('#allOrderInfo').attr('class','nav-link');
        $('#addGood').attr('class','nav-link')
        window.location.href = 'userCenterServlet';


    })
})
$(function (){
    $('#modify-password').click(function (){
        $('#modify-password').attr('class','nav-link active');
        $('#userInfo').attr('class','nav-link');
        $('#allOrderInfo').attr('class','nav-link');
        $('#addGood').attr('class','nav-link');
        $('.content-box').load('modifypassword.jsp');

    })
})
// $(function (){
//     $('#allOrderInfo').click(function (){
//         $('#allOrderInfo').attr('class','nav-link active');
//         $('#userInfo').attr('class','nav-link');
//         $('#modify-password').attr('class','nav-link');
//         $('#addGood').attr('class','nav-link');
//     })
// })
//
// $(function (){
//     $('#addGood').click(function (){
//         $('#addGood').attr('class','nav-link active');
//         $('#userInfo').attr('class','nav-link');
//         $('#modify-password').attr('class','nav-link');
//         $('#allOrderInfo').attr('class','nav-link');
//     })
// })
const exampleModal  = document.querySelector('#add-mini-user')
const addModal  = new bootstrap.Modal(exampleModal)

document.querySelector('.add-btn').addEventListener('click',()=>{
    const id = $('#add-mini-id').val();
    const username = $('#add-mini-username').val();
    const password = $('#add-mini-password').val();
    const email = $('#add-mini-email').val();
    const name = $('#add-mini-name').val();
    const phone = $('#add-mini-phone').val();
    const address =$('#add-mini-address').val();
    const isadmin = $('.check-mini').prop('checked')
    $.ajax({
        url:"/fruitshop/AdminUserAddServlet",
        data:{id:id,username:username,password:password,email:email,name:name,phone:phone,address,isadmin},
        type:"POST",
        dataType:"json",
        success:function (result) {
            if (result == 1) {
                $('#error_register').css({"display":"block","opacity":"1","background":"#c9f3d0","color":"#199e31"});
                $('#error_register').animate({opacity:0},2000);
                $('#error_register').html("修 改 成 功");
                window.setTimeout(function (){
                    addModal.hide()
                },2000)
            } else {
                console.log(data)
                $('#error_register').css({"display": "block", "opacity": "2"});
                $('#error_register').animate({opacity: 0}, 2000);
                $('#error_register').html("请稍后再试");
            }
        }
    })
})

$(function (){
    $('.btn-modify').click(function(e){
        const id =e.target.id
        $.ajax({
            url:"/fruitshop/SelectUserId",
            data: {id,id},
            dataType: "json",
            type: "get",
            async:true,
            success: function(result){
                console.log(result)
                $('#modify-mini-id').val(result.id);
                $('#modify-mini-address').val(result.address);
                $('#modify-mini-phone').val(result.phone);
                $('#modify-mini-username').val(result.username);
                $('#modify-mini-password').val(result.password);
                $('#modify-mini-name').val(result.name);
                $('#modify-mini-email').val(result.email)
                if(result.isadmin){
                    $('#modify-true').attr('checked',true)
                }else {
                    $('#modify-false').attr('checked',true)
                }


            }
        })

    })
})
$('.user-modify-btn').click(function (){
    const id = $('#modify-mini-id').val();
    const username = $('#modify-mini-username').val();
    const password = $('#modify-mini-password').val();
    const email = $('#modify-mini-email').val();
    const name = $('#modify-mini-name').val();
    const phone = $('#modify-mini-phone').val();
    const address =$('#modify-mini-address').val();
    const isadmin = $('.check-mini-modify').prop('checked')
    $.ajax({
        url:"/fruitshop/AdminModifyUserServlet",
        data:JSON.stringify({id:id,username:username,password:password,email:email,name:name,phone:phone,address:address,isadmin:isadmin}),
        type:"POST",
        dataType:"json",
        success:function (result){
            if(result=="1"){
                alert("修改成功")
                window.location = "/fruitshop/userCenterServlet"
            }else {
                alert("修改失败，请再试")
            }
        }
    })
})
