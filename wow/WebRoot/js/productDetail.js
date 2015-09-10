require.config({
	paths: {
		'jquery': 'jquery-1.8.0'
	}
});
require(['jquery', 'nav', 'common', 'jqueryExtend'], function($, nav) {
	//调用nav的返回值
	nav();
	//照片查看器

	$('.bigImg').mouseover(function(){
		$('#zhezhao').show();
		$('#outsideBigImg').show();
		var _this = this;
		var l = $(_this).offset().left;
		var t = $(_this).offset().top;

		//求出小图与大图的宽高比率
		var ratioX = $('#outsideBigImg img').width()/$(this).width();
		var ratioY = $('#outsideBigImg img').height()/ $(this).height();
		$(document).mousemove(function(ev){
			if($(ev.target).attr('class') == $('#outsideBigImg img').attr('class')){
				$('#outsideBigImg').hide();
			}
			var left = ev.pageX - l - $('#zhezhao').width()/2;
			var top = ev.pageY - t - $('#zhezhao').height()/2;
			if(left<0){
				left = 0;
			}else if(left >= ($(_this).width() - $('#zhezhao').width())){
				left = $(_this).width() - $('#zhezhao').width();
			}
			if(top<0){
				top = 0;
			}else if(top >= ($(_this).height() - $('#zhezhao').height())){
				top = $(_this).height() - $('#zhezhao').height();
			}
			$('#zhezhao').css({
				left:left,
				top:top
			});
			//右面的大图变化
			$('#outsideBigImg img').css({
				left:-ratioX*$('#zhezhao').position().left,
				top:-ratioY*$('#zhezhao').position().top,
			});	
		});
		$(document).mouseout(function(){
			$(document).off();
			$('#zhezhao').hide();
			$('#outsideBigImg').hide();
		});
	});

	//鼠标放在小图上面进行大图切换
	$('ul.smallImgs li img').hoverDelay({
			hoverDuring: 100,
            outDuring: 100,
            hoverEvent: function(that){
            	var src = $(that).get(0).src;
            	$('.smallImgs li').removeClass('addImgs');
            	$(that).parent().addClass('addImgs');
            	$('.hoverImg').attr('src', src);
            	$('#outsideBigImg img').attr('src',src);
            }
	});
	//商品简介和累计评价切换
	$('.tabBar li').on('click', function(){
		var index = $(this).index();
		$('.tabBar li').removeClass('addTabBar');
		$(this).addClass('addTabBar');
		$('.tabBarContent>div').hide();
		$('.tabBarContent>div').eq(index).show();
	});
	//图片延迟加载
	var fn = function(){
	    $(".descriptionTabBarCont img").each(function() {//遍历所有图片
	        var othis = $(this),//当前图片对象
	            top = othis.offset().top - $(window).scrollTop();//计算图片top - 滚动条top
	        if (top > $(window).height()) {//如果该图片不可见
	            return;//不管
	        } else {

	        	var img = new Image();
	        	$(img).attr('src', othis.attr('data-src'));
	    		//可见的时候把占位值替换 并删除占位属性
	        	setTimeout(function(){	
	        		othis.css('background', 'none');
	        		othis.attr('src', othis.attr('data-src')).removeAttr('data-src');
	        	}, 1000);
	            
	        }
	    });
	}
	$(window).scroll(function(){
		fn();
	}).resize(function(){
		fn();
	});
	fn();

	//评论分页
	//单击查看累计评价执行一次ajax请求
	//定义一个flag标识符，当第一次单击累计评价之后，关闭ajax请求
	var flag = true;
	$('.evaluationTabBar').on('click', function(){
		if(flag){
			flag = false;
			$.ajax({
				url : 'itemDetails/userComment.action',
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var json = data.data;
					var pageNum = Math.ceil(json.length/8);
					console.log(json);
					$.page({
						id : 'contPage',
						nowPage:1,
						allPage:pageNum,
						callBack : function(now, all){
							var str = '';
							var num = now*8 < json.length ? 8 : json.length - (now - 1)*8;
							$('.tableOption tbody').html(' ');
							for(var i=0; i<num; i++){
								str += '<tr>'
										 +'<td>'+ json[(now - 1)*8 + i].information +'</td>'
										 +'<td>'
										 +'<span class="star" data-num='+ json[(now - 1)*8 + i].score +'>'
										 +'<span></span>'
										 +'<span></span>'
										 +'<span></span>'
										 +'<span></span>'
										 +'<span></span>'
										 +'</span>'
										 +'</td>'
										 +'<td>'
										 +'<a href="javascript:;">'+ json[(now - 1)*8 + i].username +'</a><br />'
										 +'<a href="javascript:;">'+new Date(parseInt(json[(now - 1)*8 + i].time)).toLocaleString().replace(/:d{1,2}$/,' ')   +'</a>'
										 +'</td>'
										 +'</tr>';
							}
							$('.tableOption tbody').append(str);
							changeStar();
							now++;
						}
					});
				},
				error : function(data) {
					//弹出提示 获取数据失败
					console.log('获取数据失败');
				}
			});
		}
	});
	
	

	//商品评价五角心数量转换
	function changeStar(){
		$('.tableOption tbody tr').each(function(){
			var num = $(this).find('.star').attr('data-num');
			$(this).find('.star span').each(function(index) {
				if( (index+1) <= num ){
					$(this).css('background-position', '0 -20px');
				}
			});
		});
	}
	var stock = parseInt($('.stock').html());
	//商品数量变换
	//数量+
	$('.plus').on('click', function () {
		var num = parseInt($('.cartsNumber input').val());
		if(num >= stock){
			return;
		}else{
			$('.cartsNumber input').attr('value', ++num);
		}
	});
	//数量-
	$('.decrease').on('click', function () {
		var num = parseInt($('.cartsNumber input').val());
		console.log(1);
		if(num <= 0){
			return;
		}else{
			$('.cartsNumber input').attr('value', --num);
		}
	});
	//直接修改数量input，失去焦点时进行检查数量时检查是否超过库存
	$('.cartsNumber input').on('blur', function() {
		var num = $(this).val();
		if(num >= stock){
			$(this).attr('value', stock);
		}else{
			return;
		}
	});


});