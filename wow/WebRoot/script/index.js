require.config({
	paths: {
		'jquery': 'jquery-1.8.0'
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
		console.log(iNow);
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
//ajax获取后台数据
	function menu(){
		$.ajax({
			url : '#',
			type : 'get',
			data : {
				cashOutGuid : cashoutguid
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
			},
			error : function(data) {
				//弹出提示 获取数据失败
			}
		});
	}
	
});