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
    $('#good-add-btn').click(function (){
        console.log('123')
        $.post('GoodMaxIdServlet',function (i){
            console.log(i)
            $('#add-mini-good-id').val(i)
        })
    })
})

$(function (){
    $('.good-add-confirm-btn').click(function (){
        var pic  = $('#add-mini-goodpricture')[0].files[0]
        var goodid = $('#add-mini-good-id').val()
        var goodname = $('#add-mini-goodnames').val()
        var price = $('#add-mini-good-price').val()
        var amount = $('#add-mini-amount').val()
        var type = $('.add-good').val()
        console.log(type)

        console.log(goodid)
        console.log(goodname)
        var fd = new FormData();
        fd.append('uploadFile',pic);
        fd.append('goodid',goodid);
        fd.append('goodname',goodname);
        fd.append('price',price);
        fd.append('amount',amount);
        fd.append('type',type)
        console.log(fd)
        $.ajax({
            url: "/fruitshop/AdminGoodAddServlet",
            type: "post",
            data: fd,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result){
                if(result==1){
                    alert("成功添加")
                }else {
                    alert("添加失败 请查看一下后台")
                }

            }
        })



    })
})

$(function (){
    $('.good-btn-modify').click(function (e){
        var id = e.target.id;
        console.log(id)
        $.ajax({
            url:"/fruitshop/GoodSelectByIdServlet",
            type: "get",
            data: {id,id},
            dataType:"json",
            success:function (result){
                $('#modify-mini-id').val(result.id);
                $('#modify-mini-image').attr("src",result.image);
                $('#modify-mini-price').val(result.price);
                $('#modify-mini-stock').val(result.stock);
                $('.modify-good').val(result.type);
                $('#modify-mini-goodsname').val(result.goodname);
            }
        })
    })
})

$(function () {
    $('.good-modify-btn').click(function () {
        var pic = $('#modify-mini-images')[0].files[0]
        var goodid = $('#modify-mini-id').val()
        var goodname = $('#modify-mini-goodsname').val()
        var price = $('#modify-mini-price').val()
        var amount = $('#modify-mini-stock').val()
        var type = $('.modify-good').val()
        var images= $('#modify-mini-image').attr('src')
        console.log(type)
        console.log(images)
        console.log(goodid)
        console.log(goodname)
        var fd = new FormData();
        fd.append('uploadFile', pic);
        fd.append('goodid', goodid);
        fd.append('goodname', goodname);
        fd.append('price', price);
        fd.append('amount', amount);
        fd.append('type', type)
        fd.append('images', images)
        console.log(fd)
        $.ajax({
            url: "/fruitshop/AdminModifyGoodServlet",
            type: "post",
            data: fd,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result == '1') {
                    alert("成功修改")
                    window.location.reload();
                } else {
                    alert("添加失败 请查看一下后台")
                }

            }
        })
    })
})

