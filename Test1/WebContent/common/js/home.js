$(document).ready(function() {
  var cfg = {
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8'
 };

//新闻列表页面进行渲染
 function listAdvisor(data){
 	var markup='<a href="advisorDetail.do?cguid=${cguid}" target="_blank">\
 					<span  class="advisor1">\
 					<span  class="advisor2"><img src="${imageQiniu}" style="width:120px;height:120px;border-radius:50%; "/></span>\
 					<span  class="advisor3"><div class="space30" style="height: 18px;"></div>\
 					<span style="font-size:18px">${username}</span><div class="space"></div>\
 					<span style="font-size: 14px;line-height: 18px;">${introduceless}</span></span>\
 					</span>\
 				</a>\
	 		  ';
 	$.template( "memTemplate", markup );
 	$(".advisor").html("");
 	$.tmpl( "memTemplate",data).appendTo( ".advisor");
 }
 
 function listAdvisorJson(pageNum){
	    //secrect_key由众创空间提供
	    cfg.data=JSON.stringify({'secrect_key':'provided by inno'});
		cfg.success = function ret(data) {
			var obj= data.result;
			listAdvisor(obj);
		};
		cfg.url = 'http://inno.casicloud.com/innoCasicloud/test/advisor.json';
		$.ajax(cfg);
	}

 listAdvisorJson(1);
 

});












