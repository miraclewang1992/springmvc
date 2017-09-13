 var cfg = {
			type : 'POST',
	dataType : 'json',
	contentType : 'application/json;charset=UTF-8'
 };

 
 
function listClysByParentId(data,num){
	var markup='<option value="${clyId}">${clyName}</option> ';
 	$.template( "memTemplate", markup );
 	if(num==2){
 		$("#cly2").html("");
 		$("#cly3").html("");
 		$("#cly4").html("");
 		$("#cly2").html('<option value="">---二级组织---</option>');
 		$("#cly3").html('<option value="">---三级组织---</option>');
 		$("#cly4").html('<option value="">---四级组织---</option>');
 	 	$.tmpl( "memTemplate",data.clys).appendTo( "#cly2");
 	}
 	if(num==3){
 		$("#cly3").html("");
 		$("#cly4").html("");
 		$("#cly3").html('<option value="">---三级组织---</option>');
 		$("#cly4").html('<option value="">---四级组织---</option>');
 	 	$.tmpl( "memTemplate",data.clys).appendTo( "#cly3");
 	}
 	if(num==4){
 		$("#cly4").html("");
 		$("#cly4").html('<option value="">---四级组织---</option>');
 	 	$.tmpl( "memTemplate",data.clys).appendTo( "#cly4");
 	}
 	
 }

function getNextLevelCly(tmp,num){
    var parentId=$(tmp).val();
    if(parentId != null && parentId != ''){
    	   $.post('../cly/listClyByPid.json',{'clyParent':parentId},function(data){
    	    	var list = eval('('+data+')') ;
    	    	listClysByParentId(list.model,num)
    	    })
    	    
    }else{
    	if(num==2){
     		$("#cly2").html("");
     		$("#cly3").html("");
     		$("#cly4").html("");
     		$("#cly2").html('<option value="">---二级组织---</option>');
     		$("#cly3").html('<option value="">---三级组织---</option>');
     		$("#cly4").html('<option value="">---四级组织---</option>');
     	  
     	}
     	if(num==3){
     		$("#cly3").html("");
     		$("#cly4").html("");
     		$("#cly3").html('<option value="">---三级组织---</option>');
     		$("#cly4").html('<option value="">---四级组织---</option>');
     	  
     	}
     	if(num==4){
     		$("#cly4").html("");
     		$("#cly4").html('<option value="">---四级组织---</option>');
     	}
    }
}
function setApply(data){
	 
	var markup='<tr>\
		<td>${createName }</td>\
		<td>${userPhone }</td>\
		<td>${ handleUserName}</td>\
		<td >{{if status ==0}}未处理{{/if}}{{if status ==1}}已处理{{/if}}</td>\
		<td >{{if status ==0}}<a href="#" onclick="updateApplyYes(\'${applyId}\')">通过</a> \
		<a href="#" onclick="updateApplyNo(\'${applyId}\')">忽略</a>{{/if}}&nbsp;&nbsp;&nbsp;{{if status ==1}}已通过{{/if}}</td></tr>';
 	$.template( "memTemplate", markup );
	$(".apply").html("");
 	$.tmpl( "memTemplate",data.list).appendTo( ".apply");
 	
}

function getLocalTime(nS) {     
    
	return new Date(parseInt(nS) * 1000).toLocaleString().substr(0,9);
	
}     
 
function updateApplyYes(applyId){
	$.post('updateApplyYes.json',{'applyId':applyId},function(data){
		getApply();
	})
}

function updateApplyNo(applyId){
	$.post('updateApplyNo.json',{'applyId':applyId},function(data){
		getApply();
	})
}
function getApply(){
	var id =''
	cly1 =$("#cly1").val();
	if(cly1!=null && cly1 !=''){
		
		 id =cly1;
	}
	cly2 =$("#cly2").val();
	var list2=$("#list2").val();
	if(cly2!=null && cly2 !=''){
		
		 id =cly2
	}else if(list2==1){
		alert("请选择二级组织！");
		return
	}
	
	cly3 =$("#cly3").val();
	if(cly3 !=null && cly3 !=''){
		
		 id = cly3
	}
	cly4 =$("#cly4").val();
	if(cly4!=null && cly4!=''){
		
		 id = cly4
	}
	if(id ==null || id ==''){
		
		alert("请选择组织！");
		return
	}
	
	$.post('../apply/listApply.json',{'clyId':id},function(data){
		
		var  applys = eval('('+data+')').model;
		if(applys.list.length>0){
			setApply(applys)
		}else{
			$(".apply").html("");
			alert("该组织暂无人员申请！")
		}
		
	})
	 
}


function checkPerson(token,id){
	 
	var userChecked =$("#"+'user_'+token).is(':checked')
	if(userChecked==false){
		$('#'+token).remove();
		return
	}
	
	var title= $("#"+'user_'+token).attr("title");
	var name= $("#"+'user_'+token).attr("name");
	$('#'+token).remove();
	$('.userchecked').append('<tr id='+token+'> <input type="hidden" value="'+id+'" name ="ids['+id+']">  <input type="hidden" value="'+title+'" name =jpushScope['+token +']> <input type="hidden" value="'+token+'" name ='+name+'> <td>'+title+'</td> <td><a href="#" onclick="removeUser(this)">删除</a></td> </tr>');
	
}

 














