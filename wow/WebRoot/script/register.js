require.config({
    paths: {
        'jquery': 'jquery-1.8.0'
    }
});
require(['jquery'], function($) {
    $(function(){
    	//定义标识符，判断提交之前表单是否都正确
    	var allsFlagUser = false,
    		allsFlagPass = false,
    		allsFlagConfirmPass = false,
    		allsFlagMail = false,
    		allsFlagPhone = false,
    		allsFlagVerificationCode = false;
    	//用户名检验
    	var loadingFlag_1 = true;
    	$('#user').on('focus', function(){
    		if(loadingFlag_1){
	    		$(this).css({
	    			borderColor:"#7ABD54"
	    		});
	    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
	    				borderColor:'#7ABD54',
	    				backgroundColor:'#F0FAEA',
	    				color:'#2b2b2b'
	    			}).removeClass('beforeRed').show().find('p').html('4-20位字符，支持汉字、字母、数字及"-"、"_"组合');
	    		$(this).next('span.successIcon').hide();    			
    		}
    	});
    	$('#user').on('blur', function(){
    		var value = $(this).val();
    		var pattern = /^[a-zA-Z0-9\u4E00-\u9FA5_-]{4,20}$/;
    		var numPattern = /^[0-9\s]{2,8}$/;
    		var _this = $(this);
    		if(value.length < 4 || value.length > 20){
    			$(_this).css('borderColor','#f00');
    			$(_this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('用户长度只能在4到20位字符之间');
    			allsFlagUser = false;
    		}else if(numPattern.test(value)){
    			$(_this).css('borderColor','#f00');
    			$(_this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('用户名不能是纯数字');
    			allsFlagUser = false;	
    		}else if(!pattern.test(value)){
    			$(_this).css('borderColor','#f00');
    			$(_this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('用户名只能由中文、英文、数字及"-"、"_"组成');
    			allsFlagUser = false;
    		}else{
    			loadingFlag_1 = false;
    			$(_this).css('borderColor','#ccc');
    			$(_this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').hide().find('p').html('4-20位字符，支持汉字、字母、数字及"-"、"_"组合');
    			//$(_this).next('span.successIcon').show();
    			//用户名正确后ajax提交检验是否可用
  				$('#user').nextAll('.loading').css('display','block');
     			$.ajax({
    				type:'GET',
    				url:'/wow/user/checkUser.action',
    				data:{"username":value},
    				success:function(data){
    					console.log("尼玛的啊的俄的的俄的1===========");
     					$('#user').nextAll('.loading').css('display','none');
     					if(data == 1){
							loadingFlag_1 = true;
							$(_this).css('borderColor','#ccc');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#7ABD54',
			    				backgroundColor:'#F0FAEA',
			    				color:'#2b2b2b'
			    			}).removeClass('beforeRed').hide().find('p').html('请输入正确邮箱');
			    			$(_this).nextAll('span.successIcon').show();
			    			$('#user').nextAll('.loading').css('display','none');
			    			allsFlagUser = true;
			    			checkIsSubmit();	
			    			console.log("用户名可用");
     					}else{
			    			$(_this).css('borderColor','#f00');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#f00',
			    				backgroundColor:'#FFEBEB',
			    				color:'#f00'
			    			}).addClass('beforeRed').show().find('p').html('用户名已经存在');
			    			allsFlagUser = false;
			    			console.log("用户名不可用");
     					}
    				},
    				error:function(){
    					console.log("提交出错");
    				}
    			});
    		}
    	});
		
		//密码验证
    	$('#pass').on('focus', function(){
    		$(this).css({
    			borderColor:"#7ABD54"
    		});
    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').show().find('p').html('6到20位字符，建议由字母，数字和符号两种以上的组合');
    		$(this).next('span.successIcon').hide();
    	});
		var passValue='', secondPass='';
		$('#pass').keyup(function(){
			passValue = $(this).val();
			if(passValue.length >=6){
				//验证密码强度
				$('.formInfo>div:nth-of-type(2)>p').css('display','block');
				if(/^[\S]{6,20}$/.test(passValue) && /[a-zA-Z]{1,20}/.test(passValue) && /[0-9]{1,20}/.test(passValue) && /[^a-zA-Z0-9\s]{1,20}/.test(passValue) ){
					$('.pwdstrength').css({
						backgroundPosition:'0 -26px'
					});	
				}else if(/^[\S]{6,20}$/.test(passValue) && ((/[a-zA-Z]{1,20}/.test(passValue) && /[0-9]{1,20}/.test(passValue)) ||  (/[0-9]{1,20}/.test(passValue) && /[^a-zA-Z0-9]{1,20}/.test(passValue)) || (/[a-zA-Z]{1,20}/.test(passValue) && /[^a-zA-Z0-9]{1,20}/.test(passValue)) )){
					$('.pwdstrength').css({
						backgroundPosition:'0 -13px'
					});	
				}else if(/^[\d]{6,20}$/.test(passValue) || /^[a-zA-Z]{6,20}$/.test(passValue) || /^[^a-zA-Z0-9]{6,20}$/.test(passValue)){
					$('.pwdstrength').css({
						backgroundPosition:'0 0'
					});
				}	
			}else{
				$('.formInfo>div:nth-of-type(2)>p').css('display','none');
				$(this).nextAll('span.successIcon').hide();
			}

		});
		$('#pass').on('blur', function(){
			var value = $(this).val();
			var pattern = /^[\S]{6,20}$/;
			//当第二次再次修改第一次输入的密码的时候
			if(secondPass.length > 0){
				if(secondPass != passValue){
					$('#confirmPass').css('borderColor','#f00');
	    			$('#confirmPass').nextAll('.additionalInfo').css({
	    				borderColor:'#f00',
	    				backgroundColor:'#FFEBEB',
	    				color:'#f00'
	    			}).addClass('beforeRed').show().find('p').html('两次输入密码不一致');
	    			$('#confirmPass').next('span.successIcon').hide();
	    			allsFlagConfirmPass = false;
				}else{
					$('#confirmPass').css('borderColor','#ccc');
	    			$('#confirmPass').nextAll('.additionalInfo').css({
	    				borderColor:'#7ABD54',
	    				backgroundColor:'#F0FAEA',
	    				color:'#2b2b2b'
	    			}).removeClass('beforeRed').hide().find('p').html('请再次输入密码');
	    			$('#confirmPass').next('span.successIcon').show();
	    			allsFlagConfirmPass = true;
	    			checkIsSubmit();
				}
			}

			if(value.length < 6 || value.length >20){
				$(this).css('borderColor','#f00');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('密码长度只能在6到20位之间');
    			allsFlagPass = false;
			}else if(/\s+/.test(value)){
				$(this).css('borderColor','#f00');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('密码不能有空格');
    			allsFlagPass = false;
			}else if(pattern.test(value)){
				$(this).css('borderColor','#ccc');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').hide().find('p').html('6到20位字符，建议由字母，数字和符号两种以上的组合');
    			$(this).nextAll('span.successIcon').show();
    			allsFlagPass = true;
    			checkIsSubmit();
			}
		});
		//二次密码验证是否相等
    	$('#confirmPass').on('focus', function(){
    		$(this).css({
    			borderColor:"#7ABD54"
    		});
    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').show().find('p').html('请再次输入密码');
    		$(this).next('span.successIcon').hide();
    	});
		$('#confirmPass').blur(function(){
			secondPass = $(this).val();
				if(secondPass.length > 0 && passValue.length > 0 && secondPass == passValue){
					$(this).css('borderColor','#ccc');
	    			$(this).nextAll('.additionalInfo').css({
	    				borderColor:'#7ABD54',
	    				backgroundColor:'#F0FAEA',
	    				color:'#2b2b2b'
	    			}).removeClass('beforeRed').hide().find('p').html('请再次输入密码');
	    			$(this).next('span.successIcon').show();
	    			allsFlagConfirmPass = true;
	    			checkIsSubmit();
				}else{
					$(this).css('borderColor','#f00');
	    			$(this).nextAll('.additionalInfo').css({
	    				borderColor:'#f00',
	    				backgroundColor:'#FFEBEB',
	    				color:'#f00'
	    			}).addClass('beforeRed').show().find('p').html('两次输入密码不一致');	
	    			allsFlagConfirmPass = false;
				}				

		});

		//验证手机号码是否正确
    	$('#phone').on('focus', function(){
    		$(this).css({
    			borderColor:"#7ABD54"
    		});
    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').show().find('p').html('请输入正确手机号');
    		$(this).next('span.successIcon').hide();
    	});
    	$('#phone').blur(function(){
    		var phoneVal = $(this).val();
    		var pattern =  /(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[6,7,8]\d{8}$|(^18\d{9}$)/g;
    		if(pattern.test(phoneVal)){
				$(this).css('borderColor','#ccc');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').hide().find('p').html('请输入手机号');
    			allsFlagPhone = true;
    			$(this).nextAll('span.successIcon').show();
    			checkIsSubmit();
    		}else{
				$(this).css('borderColor','#f00');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('请输入正确的手机号');
    			allsFlagPhone = false;
    		}
    	});
    	//邮箱验证
    	$('#mail').on('focus', function(){
    		$(this).css({
    			borderColor:"#7ABD54"
    		});
    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').show().find('p').html('请输入正确邮箱');
    		$(this).next('span.successIcon').hide();
    	});

    	$('#mail').blur(function(){
    
    		var email = $(this).val();
    		var pattern =   /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			var _this = this;
    		if(pattern.test(email)){
				$(this).css('borderColor','#ccc');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').hide().find('p').html('请输入邮箱');
    			$(this).nextAll('span.successIcon').show();
    			allsFlagMail = true;
    			checkIsSubmit();
    			//邮箱前端验证成功之后发给后台验证
     			$.ajax({
    				type:'GET',
    				url:'/wow/user/checkUser.action',
    				data:{"email":email},
    				success:function(data){
    					console.log("尼玛的啊的俄的的俄的1===========");
     					$('#user').nextAll('.loading').css('display','none');
     					if(data == 1){
							$(_this).css('borderColor','#ccc');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#7ABD54',
			    				backgroundColor:'#F0FAEA',
			    				color:'#2b2b2b'
			    			}).removeClass('beforeRed').hide().find('p').html('请输入正确邮箱');
			    			$(_this).nextAll('span.successIcon').show();
			    			$('#user').nextAll('.loading').css('display','none');
			    			allsFlagUser = true;
			    			checkIsSubmit();	
			    			console.log("用户名可用");
     					}else{
			    			$(_this).css('borderColor','#f00');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#f00',
			    				backgroundColor:'#FFEBEB',
			    				color:'#f00'
			    			}).addClass('beforeRed').show().find('p').html('邮箱已经存在');
			    			allsFlagUser = false;
			    			console.log("用户名不可用");
     					}
    				},
    				error:function(){
    					console.log("提交出错");
    				}
    			});
    		}else{
				$(this).css('borderColor','#f00');
    			$(this).nextAll('.additionalInfo').css({
    				borderColor:'#f00',
    				backgroundColor:'#FFEBEB',
    				color:'#f00'
    			}).addClass('beforeRed').show().find('p').html('请输入正确的邮箱1111');
    			allsFlagMail = false;
    		}
    	});
		//验证码验证
		var loadingFlag_2 = true;
    	$('#verificationCode').on('focus', function(){
    		if(loadingFlag_2){
	    		$(this).css({
	    			borderColor:"#7ABD54"
	    		});
	    		var additionalInfo = $(this).nextAll('.additionalInfo').css({
	    				borderColor:'#7ABD54',
	    				backgroundColor:'#F0FAEA',
	    				color:'#2b2b2b'
	    			}).removeClass('beforeRed').show().find('p').html('请输入验证码');
	    		$(this).nextAll('span.successIcon').hide();  
	    		$('#verification_code').css('display','none');		
    		}
    	});
		$('#verificationCode').blur(function(){
			var verificationCode = $(this).val();
			if(/^[\u4E00-\u9FA5]{4,4}$/.test(verificationCode)){

				var _this = this;
				loadingFlag_2 = false;
				$('#verificationCode').nextAll('.loading').css('display','block');
				$(_this).css('borderColor','#ccc');
    			$(_this).nextAll('.additionalInfo').css({
    				borderColor:'#7ABD54',
    				backgroundColor:'#F0FAEA',
    				color:'#2b2b2b'
    			}).removeClass('beforeRed').hide().find('p').html('请输入正确手机号');
    			
     			$.ajax({
    				type:'GET',
    				url:'/wow/user/checkCode.action',
    				data:{},
    				success:function(data){
    					console.log(data);
     					$('#user').nextAll('.loading').css('display','none');
     					if(data == verificationCode){
							$(_this).css('borderColor','#ccc');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#7ABD54',
			    				backgroundColor:'#F0FAEA',
			    				color:'#2b2b2b'
			    			}).removeClass('beforeRed').hide().find('p').html('请输入验证码');
			    			$(_this).nextAll('span.successIcon').show();
			    			$('#user').nextAll('.loading').css('display','none');
	    					loadingFlag_2 = true;
	    					allsFlagVerificationCode = true;
	    					checkIsSubmit();	
			    			console.log("用户名可用");
     					}else{
			    			$(_this).css('borderColor','#f00');
			    			$(_this).nextAll('.additionalInfo').css({
			    				borderColor:'#f00',
			    				backgroundColor:'#FFEBEB',
			    				color:'#f00'
			    			}).addClass('beforeRed').show().find('p').html('验证码错误');
			    			allsFlagUser = false;
			    			console.log("用户名不可用");
     					}
    				},
    				error:function(){
    					console.log("提交出错");
    				}
    			});			

			}else{
				if(loadingFlag_2){
					$('#verification_code').css('display','none');
					$(this).nextAll('span.successIcon').hide();
					$(this).css('borderColor','#f00');
	    			$(this).nextAll('.additionalInfo').css({
	    				borderColor:'#f00',
	    				backgroundColor:'#FFEBEB',
	    				color:'#f00'
	    			}).addClass('beforeRed').show().find('p').html('验证码输入格式有误，请输入4个汉字');
	    			allsFlagVerificationCode = false;					
				}
	
			}
		});
		//单击验证码换验证码图片
		$('#changeImg').on('click', function(){
			$(this).attr('src','/wow/user/getCheckCode.action?'+new Date().getTime());
		});
		//单击复选框按钮check
		$('#check').on('click', function(){
			checkIsSubmit();
		});

		//提交按钮检查是否可提交
		function checkIsSubmit(){
			var isChecked = $('#check').prop('checked');
			if(allsFlagUser && allsFlagUser && allsFlagConfirmPass && allsFlagMail && allsFlagPhone && allsFlagVerificationCode && isChecked){
				$('#btn').prop('disabled', false).css({
					 backgroundImage:'-webkit-linear-gradient(to bottom, #648F00, green)',
					 backgroundImage:'-moz-linear-gradient(to bottom, #648F00, green)',
					 backgroundImage:'-ms-linear-gradient(to bottom, #648F00, green)', 
					 backgroundImage:'linear-gradient(to bottom, #648F00, green)',
					 cursor:'pointer'
				});
				console.log($('#btn').prop('disabled'));
			}
		}

    });
});
