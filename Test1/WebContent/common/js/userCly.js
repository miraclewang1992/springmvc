$(document).ready(function() {
  var cfg = {
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8'
 };

//已经加入组织列表页面进行渲染
 function listClysHasJoined(data){
	 var markup='<tr>\
					<td>${clyName}</td>\
					<td>\
						<input onclick="updateUserCly(\'${userClyId}\',1,\'${clyId}\')" type="radio" name="check${userClyId}" id="yes01"  {{if userClyIsCharger == true}} checked {{/if}} /> <label style="cursor: pointer;" for="yes01">是</label>\
			&nbsp;&nbsp;&nbsp;<input onclick="updateUserCly(\'${userClyId}\',0,\'${clyId}\')" type="radio" name="check${userClyId}" id="no01" {{if userClyIsCharger != true}} checked {{/if}} /> <label style="cursor: pointer;" for="no01" >否</label>\
					</td>\
					<td><a href="#" onclick="deleteUserCly(\'${userClyId}\')">删除</a></td>\
				</tr>\
	 		  ';
 	
 	$.template( "memTemplate", markup );
 	$(".list_hasJoined").html("");
 	$.tmpl( "memTemplate",data.list).appendTo( ".list_hasJoined");
 }
 
 function listClysHasJoinedJson(){
	
		var userId = $("input[name='userId']").val();
		var obj ={};
		obj.userId = userId;
		cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			listClysHasJoined(data.model);
		};
		cfg.url = 'listClysHasJoined.json';
		$.ajax(cfg);
	}

  
 
 listClysHasJoinedJson();
 
//已经加入组织列表页面进行渲染
function listClysByLocation(data){
	 
	 var markup='<tr>\
					<td>${clyName}</td>\
					<td>\
						<input value="true" type="radio" name="clyId${clyId}" id="yes01"  {{if userClyIsCharger !=null && userClyIsCharger == true}} checked {{/if}} /> <label style="cursor: pointer;" for="yes01">是</label>\
	  &nbsp;&nbsp;&nbsp;<input value="false" type="radio" name="clyId${clyId}" id="no01" {{if  userClyIsCharger == null || userClyIsCharger != true }} checked {{/if}} /> <label style="cursor: pointer;" for="no01" >否</label>\
					</td>\
					<td> {{if userClyIsCharger != null}}已加入{{/if}} {{if userClyIsCharger == null}} <a href="#" onclick="joinCly(\'${clyId}\')">选择</a> {{/if}}</td>\
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
		cfg.url = 'listClysByLocation.json';
		$.ajax(cfg);
	}

  
 
 listClysByLocationJson();
 
 $("#setCly").click(function(){
	
	 listClysByLocationJson();
 });
 

});

function joinCly(clyId){
	 var obj = {};
	 obj.clyId = clyId;
	 obj.userId = $("input[name='userId']").val();
	 var id ="clyId"+clyId;
	 obj.userClyIsCharger = $("input[name='"+id+"']:checked").val();
	 cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			window.location.reload();
		};
		cfg.url = '../userCly/addUserCly.json';
	 $.ajax(cfg);
}


function deleteUserCly(userClyId){
 
	 var obj = {};
	 obj.userClyId = userClyId ;
	 cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			window.location.reload();
		};
		cfg.url = '../userCly/deleteUserCly.json';
	 $.ajax(cfg);
}

function updateUserCly(userClyId,userClyIsCharger,clyId){
	 
	 var obj = {};
	 obj.userClyId = userClyId ;
	 obj.clyId = clyId ;
	 obj.userClyIsCharger = userClyIsCharger ;
	 cfg.data = JSON.stringify(obj);
		cfg.success = function ret(data) {
			window.location.reload();
		};
		cfg.url = '../userCly/updateUserCly.json';
	 $.ajax(cfg);
}



 














