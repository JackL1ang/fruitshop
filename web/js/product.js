$('.product-add').click(function (e){
    const id = $(this).get(0).id
    $.ajax({
        url:"/fruitshop/GoodCart",
        data:{id,id},
        dataType:"json",
        type:"post",
        success:function (result){
            console.log(result);
            if(result){
                alert("添加成功")
                window.location.reload();
            }else {
                alert("请先登录或先注册，谢谢！")
            }
        }

    })

})
