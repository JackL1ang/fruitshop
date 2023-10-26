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



$(function (){
  $('.modify-order-btn').click(function (){
    var type = $('#order-type').val();
    var id =$('.btn-order-modify').attr("id");
    console.log(id)

    $.ajax({
      url:"/fruitshop/AdminModifyTypeServlet",
      type:"post",
      data:({type:type,id:id}),
      success:function (result){
        if(result=='1'){
          alert("成功修改订单状态");
          window.location.reload();
        }
      }

    })



  })
})