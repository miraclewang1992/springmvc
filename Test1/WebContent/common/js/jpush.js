$(document).ready(function() {
  var cfg = {
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8'
 };

 
 
function listClysByLocation(data){
	 var markup='<tr>\
					<td>${clyName}</td>\
					<td>\
		 			<input value="${clyName}" type="hidden" name="jpushScope[${clyId}]"  /><input value="true" type="radio" name="clyId${clyId}" id="yes01"  /> <label style="cursor: pointer;" for="yes01">是</label>\
	  &nbsp;&nbsp;&nbsp;<input value="false" type="radio" name="clyId${clyId}" id="no01"  checked/> <label style="cursor: pointer;" for="no01"  >否</label>\
					</td>\
					<td>  <a href="#" onclick="joinCly(\'${clyId}\')">选择</a></td>\
				</tr>\
	 		  ';
 	
 	$.template( "memTemplate", markup );
 	$(".list_location").html("");
 	$.tmpl( "memTemplate",data.clys).appendTo( ".list_location");
 }
 
 function listClysByLocationJson(){
	    var userId = $("input[name='userId']").val();
		var obj ={};
		obj.userId = userId;
	    var province = $("#s_province").val();
		var city = $("#s_city").val();
		var country = $("#s_county").val();
		if(province == '省份' ||province == null){
			 obj.clyProvince='';
		}else{
			obj.clyProvince=province;
		}
		if(city == '地级市' || city ==null){
			obj.clyCity='';
		}else{
			obj.clyCity=city;
		}
		if(country == '市、县级市' && province !="台湾省" || country == null){
			 obj.clyRestrict='';
		}else{
			obj.clyRestrict=country;
		}
		if(obj.clyCity=='' && obj.clyRestrict !=null){
			obj.clyCity = obj.clyRestrict;
			obj.clyRestrict ='';
		}
		cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			listClysByLocation(data.model);
		};
		cfg.url = '../cly/listClysByLocation.json';
		$.ajax(cfg);
	}

  
 
 /*listClysByLocationJson();*/
 
 $("#setCly").click(function(){
	
	 listClysByLocationJson();
 });
 

});

function joinCly(clyId){
	 
	 var obj = {};
	 obj.clyId = clyId ;
	 cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			setCly(data.model);
		};
		cfg.url = '../cly/selectClyById.json';
	 $.ajax(cfg); 
}


function setCly(data){
     var hasNext = $("input[name='clyId"+data.cly.clyId+"']:checked").val();
     data.cly.hasNext =eval( hasNext);
	 var markup='  <tr id="${clyId}">\
		 <td>${clyName}</td>\
		 <td>\
		    <input  type="hidden" name="cly[${clyId}].clyId" value="${clyId}"/>\
		    <input  type="hidden" name="cly[${clyId}].clyLevel" value="${clyLevel}"/>\
			<input value="true" type="radio" name="cly[${clyId}].hasNext" id="yes${clyId}" {{if hasNext == true}} checked {{/if}}  /> <label style="cursor: pointer;" for="yes${clyId}">是</label>\
		 	&nbsp;&nbsp;&nbsp;<input type="radio" value="false" name="cly[${clyId}].hasNext" id="no${clyId}" {{if hasNext != true}} checked {{/if}}/> <label style="cursor: pointer;" for="no${clyId}">否</label>\
		 </td>\
		 <td><a href="#" onclick="deleteCly(\'${clyId}\')">删除</a></td>\
		 </tr>\
		 ';
/*	 var markup='<tr>\
					<td>${clyName}</td>\
					<td>\
						<input value="true" type="radio" name="clyId${clyId}" id="yes01"  {{if userClyIsCharger !=null && userClyIsCharger == true}} checked {{/if}} /> <label style="cursor: pointer;" for="yes01">是</label>\
	  &nbsp;&nbsp;&nbsp;<input value="false" type="radio" name="clyId${clyId}" id="no01" {{if  userClyIsCharger == null || userClyIsCharger != true }} checked {{/if}} /> <label style="cursor: pointer;" for="no01" >否</label>\
					</td>\
					<td>  <a href="#" onclick="joinCly(\'${clyId}\')">选择</a></td>\
				</tr>\
	 		  ';*/
	
	$.template( "memTemplate", markup );
	$("#"+data.cly.clyId).remove();
	$.tmpl( "memTemplate",data.cly).appendTo( ".list_cly");
}

 
function deleteCly(clyId){
	 $("#"+clyId).remove();
}













