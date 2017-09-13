window.onload=function(){
	$(".type-4 button").each(function(){			
		$(this).click(function(){
			var t = $(this);
			var dataTarget = t.attr("data-target");
			console.log("dataTarget="+dataTarget);
			if(dataTarget == 'grow' || dataTarget == 'new' || dataTarget == "e-commerce" || dataTarget == "application" || dataTarget == "venture"){
				$("#projectStartTime").val('');
				$("#start").hide();
				$("#regist").show();
				
			}else if(dataTarget == 'idea'){
				$("#projectComName").val('');
				$("#projectComRegisterTime").val('');
				$("#projectComAddress").val('');
				$("#regist").hide();
				$("#start").show();
			}
			
			$("#projectStage").val(dataTarget);
			t.addClass("active").siblings().removeClass("active");
			/*$(".type").eq(t.index()).show().siblings().hide();*/
		});
	});
}
