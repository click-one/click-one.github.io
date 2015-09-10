require.config( {
	paths : {
		'jquery' : 'jquery-1.8.0'
	}
});
require(['jquery', 'nav'], function($, nav) {
	//调用nav的返回值
	nav();
	//轮播图初始化
	$('#slider a img').eq(0).css({
		opacity: 1
	});
	$('.imgBtn li').eq(0).addClass('switch');
	var iPrev = 0;
	var iNow = 0;
	//手动轮播
	$('.imgBtn li').on('click', function() {
		clearInterval(timer);
		iNow = $(this).index();
		slider(autoSlider);
	});
	//自动轮播
	var timer = autoSlider();

	function slider(autoSlider) {
		if (iNow != iPrev) {
			
			$('.imgBtn li').eq(iNow).addClass('switch');
			$('.imgBtn li').eq(iPrev).removeClass('switch');
			$('#slider a img').eq(iNow).stop().animate({
				opacity: 1,
			}, 1000, function() {
				autoSlider ? (timer = autoSlider()) : '';
			});
			$('#slider a img').eq(iPrev).stop().animate({
				opacity: 0
			}, 500);
			iPrev = iNow;
		}

	}

	function autoSlider() {
		return setInterval(function() {
			if (iNow++ >= 4) {
				iNow = 0;
			}
			slider();
		}, 5000);
	}
	//今日半价鼠标放上出现隐藏

	$('.discountContentUl li').each(function(){
		var index = $(this).index();
		$(this).css('top', index*118);
	});
	$('.discountContentUl li').hover(function(){
		var isNowIndex = $(this).index();
		$('.discountContentUl li').each(function(){
			var index = $(this).index();
			if(index <= isNowIndex){
				$(this).stop().animate({
					top: index * 77.5
				}, 400)
			}else{
				$(this).stop().animate({
					top:200 + (index - 1)*77.5
				}, 400)
			}
		});
	}, function(){
		$('.discountContentUl li').each(function(){
			var index = $(this).index();
			$(this).stop().animate({
				top : index*118
			},400);
		});
	});
	console.log();
//ajax获取后台数据
	function menu(){
		$.ajax({
			url : 'item/gainIndex.action',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				getMenu(data);
			},
			error : function(data) {
				//弹出提示 获取数据失败
				console.log('获取数据失败');
			}
		});
	}
	menu();
	
 	//拼接字符串后添加到页面内
	function getMenu(obj){
		var str_1 = '';
		var str_2 = '';
		var str_4 = '';
		var str_5 = '';
		//今日半价
		$.each(obj.promoteItem.halfItems, function(index){
			var str_6 = '';
			str_6 += '<a href="itemDetails/itemDetails.action?id=' + obj.promoteItem.halfItems[index].item.id  + ' "><div class="discountInfo fl">'
					+'<p class="discountDescription">'+ obj.promoteItem.halfItems[index].item.name + '-' + obj.promoteItem.halfItems[index].item.detail +'</p>'
					+'<p class="discountNow"><span class="priceName">今日半价：￥</span><span class="discountPrice">'+ (obj.promoteItem.halfItems[index].item.discount * obj.promoteItem.halfItems[index].item.price) +'</span></p>'
					+'<p class="discountOld"><span class="priceName">原&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：￥</span><span class="discountPrice oldPrice">'+ obj.promoteItem.halfItems[index].item.price +'</span></p>'
					+'</div>'
					+'<div class="discountImg fl"><img src="'+ obj.promoteItem.halfItems[index].itemPic.url +'"></div></a>';
			$('.discountContentUl li').eq(index).append(str_6);
		})
		//每日推荐
		$.each(obj.promoteItem.dayRecommends, function(index){
			var str_7 = '';
			str_7 += '<a href="itemDetails/itemDetails.action?id=' + obj.promoteItem.dayRecommends[index].item.id  + ' "><div class="fl recommendContentListCont">'
					 + '<p>'+ obj.promoteItem.dayRecommends[index].item.name + '-' + obj.promoteItem.dayRecommends[index].item.detail +'</p>'
					 + '<p class="recommendPrice">￥<span>'+ obj.promoteItem.dayRecommends[index].item.price +'</span><span></span></p>	'					
					 + '</div>'
					 + '<div class="fl recommendContentListImg">'
					 + '<div><img src="'+  obj.promoteItem.dayRecommends[index].itemPic.url +'" ></div>'
					 + '</div></a>';
			$('.recommendContentList').eq(index).append(str_7);
		});
		//天天秒杀
		$.each(obj.promoteItem.lowPrice, function(index){
			var str_8 = '';
			str_8 += '<a href="itemDetails/itemDetails.action?id=' + obj.promoteItem.lowPrice[index].item.id  + ' "><div class="fl seckillContentListCont">'
				    + '<p>'+ obj.promoteItem.lowPrice[index].item.name + '-' + obj.promoteItem.lowPrice[index].item.detail +'</p>'
				    + '<p class="seckillPrice">￥<span>'+ obj.promoteItem.lowPrice[index].item.price +'</span><span></span></p>	'					
					+ '</div>'
					+ '<div class="fl seckillContentListImg">'
					+ '<div><img src="'+ obj.promoteItem.lowPrice[index].itemPic.url +'" ></div>'
					+ '</div></a>';
			$('.seckillContentList').eq(index).append(str_8);
		});
		
		
		
		$.each(obj.classifys, function(index, el) {
			str_1 += '<li class=\"product_'+(index+1)+'\"><div class=\"kinds\"><a href=\"#\"><i></i>' + obj.classifys[index].firstClassify.name + '</a></div><dl class=\"kindsDl\"><dt class=\"fl kindsDt\">推荐</dt><dd class=\"fl kindsDd\"><a href=\"#\">百香果</a><a href=\"#\">榴莲</a><a href=\"#\">柑橘类</a></dd></dl><div class=\"moreDetailLisrt\"><dl><dd></dd></dl></div></li>';

		});
		$('ul.detailsList').append(str_1);
		$('.moreDetailLisrt dl dd').each(function(index){
			var str_3 = '';
			$.each(obj.classifys[index].secondClassify, function(num, el) {
				str_3 +='<a href=\"\">'+ obj.classifys[index].secondClassify[num].name +'</a>';
			});
			$(this).append(str_3);
		});	
		//商品具体内容拼接插入页面
		$.each(obj.classifys, function(index, el) {
			str_4 += '<div class=\"choice\"><div class=\"choice_left fl choice_left_'+(index+1)+'\"><h2>'+
			obj.classifys[index].firstClassify.name +'</h2><div><a href="itemDetails/itemDetails.action?id=' + obj.classifys[index].recommendItem.item.id + ' "><img class="ad" src='+ obj.classifys[index].recommendItem.itemPic.url +'></a></div></div><div class=\"choice_right fl\"><ul class=\"clear\"></ul><div class=\"choice_right_cont\"></div></div></div>})';
		});

		$('#discount').after(str_4);
		$('.choice_right ul').each(function(index, el) {
			var str_5 = '';
			$.each(obj.classifys[index].secondClassify, function(num, el) {
				if(num<=9){
					str_5 +='<li class="fl"><a href=\"#\">'+ obj.classifys[index].secondClassify[num].name +'</a></li>';
				}else{
					return;
				}		
			});	
			$(this).append(str_5);
		});	
		$('.choice_right_cont').each(function(index, el) {
			var str_6 = '';
			$.each(obj.classifys[index].itemPictures, function(num, el) {
				if(num<=3){
					str_6 +='<div class="choice_right_cont_goods fl"><div class=""><a href="itemDetails/itemDetails.action?id=' + obj.classifys[index].itemPictures[num].item.id  + ' "><img data-src="'+ obj.classifys[index].itemPictures[num].itemPic.url +'"></a></div><h3 class="goodsTitle">'+ obj.classifys[index].itemPictures[num].item.detail +' </h3><p>￥<span class="nowPrice">'+ obj.classifys[index].itemPictures[num].item.price +'</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="oldPrice">'+ obj.classifys[index].itemPictures[num].item.discount +'</span>折</p></div>';
				}else{
					return;
				}		
			});	
			$(this).append(str_6);
		});
	}
	function fn(){
	    $(".choice_right img").each(function() {//遍历所有图片
	        var othis = $(this),//当前图片对象
	            top = othis.offset().top - $(window).scrollTop();//计算图片top - 滚动条top
	        if (top > $(window).height()) {//如果该图片不可见
	            return;//不管
	        } else {
	        	var img = new Image();
	        	$(img).attr('src', othis.attr('data-src'));
	    
	        	$(img).load(function(){
	    			othis.css('background-image','');
	    			othis.attr('src', othis.attr('data-src')).removeAttr('data-src');  		
	        	});
	        }
	    });
	}
	$(window).scroll(function(){
		fn();
	}).resize(function(){
		fn();
	});
	setTimeout(function(){
		fn();
	}, 200);
	fn();			
	
});