$(document).ready(function() {
	 var cfg = {
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8'
	 };
	 
	  $("#submit2").click(function(){
			var obj=$('#form').toObject({mode: 'first'});
			 
			cfg.data = JSON.stringify(obj); 
			 
			cfg.success = function ret(data){
				if(data.model.status >= 1){
					if(data.model.isNUser){
						window.location.href="../user/pro/stepOne.do"
					}else{
						window.location.href="home.do"
					}
					
				}else{
					 alert(data.model.msg);
				}
			};
			cfg.url = 'user/login.json';
			$.ajax(cfg);
			
		});
	  
	  $("#submit1").click(function(){
			var obj=$('#form').toObject({mode: 'first'});
			 
			cfg.data = JSON.stringify(obj); 
			 
			cfg.success = function ret(data){
				if(data.model.status >= 1){
					window.location.href="home.do"
				}else{
					 alert(data.model.msg);
				}
			};
			cfg.url = 'user/login.json';
			$.ajax(cfg);
			
		});
});
