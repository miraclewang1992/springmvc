$(document).ready(function() {
  var cfg = {
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8'
 };
 
  $("#submit").click(function(){
		var obj=$('#form').toObject({mode: 'first'});
		 
		cfg.data = JSON.stringify(obj); 
		 
		cfg.success = function ret(data){
		 
			if(data.model.status >= 1){
				window.location.href="home.do"
			}else{
				 alert("注册失败");
			}
		};
		cfg.url = 'user/register.json';
		$.ajax(cfg);
		
	});
 
  $("#confirm").click(function(){
	  var phone = $(".phone").val(); 
		var obj={};
		obj.phone =phone;
		
		cfg.data = JSON.stringify(obj); 
		 
		cfg.success = function ret(data){
		 
			if(data.model.status >= 1){
				alert("发送验证码成功");
			}else{
				 alert("发送验证码失败");
			}
		};
		cfg.url = 'sms/getSms.json';
		$.ajax(cfg);
		
	});

 
});












