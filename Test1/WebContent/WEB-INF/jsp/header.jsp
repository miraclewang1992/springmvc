<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/favicon.ico?version=1" type="image/x-icon" />
    <link type="text/css" rel="stylesheet" href="css/flexslider.css" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <title><spring:message code="title.CE"/></title>
    <!-- 公共脚本与样式 开始 -->
    <link type="text/css" rel="stylesheet" href="css/normal.css?v=1"/>
    <script src="js/jquery-1.10.1.min.js"></script>
    <script src="js/jquery.ui.widget.js"></script>
    <script src="js/jquery.iframe-transport.js"></script>
    <script src='js/qrcode.js'></script>
    <script src="js/jquery.fileupload.js"></script>   
    <script src="js/normal.js"></script>
    <script src="js/jquery.toObject.js"></script>
    <script src="js/login.js"></script>
    <script src="js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="js/form2js.js"></script>
    <script type="text/javascript" src="js/jquery.paginate.js"></script>
    <script src="js/new.js"></script>
</head>
<style>
a{color:black;}
a:hover{ text-decoration:none;}
.tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;}
.tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
.tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
.tcdPageCode span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
.search{
    border: 1px solid #ccc;
    padding: 10px 5px 10px 25px;
    border-radius: 5px;
    width: 180px;
    float:right;
    margin:0;
    margin-left: 10px;
    margin-top: 5px;
    position: relative;
    }
    .T_top{
        width: 100%;
	    height: 32px;
	    background: #f08619;
    }
</style>
<body>
<c:if test="${sessionScope.language=='ar'}">
<style>
html{direction:rtl;unicode-bidi:bidi-override;overflow-x: hidden;}
p,i,b,.Tindustry{margin-right:20px}
.Tright dt{margin-right:20px}
</style>
</c:if>
<!--只要有弹窗的页面都要有个这玩意 但不能有多个-->
<div class="cover" onClick='hidecover()'></div>
<script type="text/javascript">
    function hidecover() {
        $(".cover,.aw").hide();
        $(".financing_5").hide();
    }
</script>
<!--补充信息-->
<c:if test="${sessionScope.header=='header.jsp'}">
<!-- 公共顶部 开始 -->
<div class="top">
    <div class="box">
        <a class="logo" href="http://www.casicloud.com" target="_blank"><img src="img/logo.png"/></a>
		<span>
			<a class="tmHome" href="home.do">首页</a>
			<a class="tmSpace" href="space.do">线下空间</a>
			<a class="tmCase" href="showAllProjects.do?page=1">项目中心</a>
			<a class="tmNet" href="showAllVideos.do?page=1">航天网校</a>
			<a class="tmService" href="http://wd.casicloud.com/cloudTutor/common/home.do">云导师</a>
		  	<div class="search">
		  	<form action="${pageContext.request.contextPath}/common/findPage.do" method="post" id="searchPost1">
		  		<input name="pg" type="hidden" value="1">
				<input name="keyword" type="text" style="border:0 none;outline: 0;width:100%;" placeholder="搜索项目" id="dataInput"/>	
				<img style="position: absolute;left: 5px;top: 10px;" src="./img/search-2.png">
			</form>
			</div> 
			
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#">
		    <c:if test="${sessionScope.user.sysrole=='gly'}">平台管理</c:if>
		    <c:if test="${sessionScope.user.sysrole=='normal'}">个人管理</c:if>
		    <c:if test="${sessionScope.user.sysrole=='ds'}">个人管理</c:if>
		    <c:if test="${sessionScope.user.sysrole=='qy'}">企业管理</c:if>
		    </a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank">我的云网</a></dd>
		    <dd><a href="#">退出登录</a></dd>
	    </dl>
  		<font><a href="#" class="login">登录  >></a></font>
    </div>
</div>
<!-- 公共顶部 结束 -->
</c:if>

<c:if test="${sessionScope.header=='global.jsp'}">

<!-- 公共顶部 开始 -->
<div class="top">
	<div class="T_top"></div>
    <div style="height:60px;" class="box">
        <a style="margin-top:8px;" class="logo" href="http://intl.indics.com/" target="_blank"><img style="width: 250px;" src="img/<spring:message code='logoAE'/>"/></a>
		<span style="margin:5px 0px 0px 0px;">
			<a style="padding: 0px 40px;margin: 0 10px;" class="tmHome" href="<spring:message code="global"/>"><spring:message code="home"/></a>
			<a style="padding: 0px 40px;margin: 0 10px;" class="tmSpace" href="space.do"><spring:message code="incubator"/></a>
			<a style="padding: 0px 40px;margin: 0 10px;" class="tmCase" href="showAllProjects.do?page=1"><spring:message code="project"/></a>
			<!-- <div class=" search">
				<input type="text" style="border:0 none;outline: 0;width:100%;" placeholder="搜索项目" id="dataInput"/>	
				<img style="position: absolute;left: 5px;top: 10px;" src="./img/search-2.png">
			</div> -->
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#"><spring:message code="Profile"/></a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank"><spring:message code="My.CASICloud"/></a></dd>
		    <dd><a href="#"><spring:message code="Logout"/></a></dd>
	    </dl>
  		<font><%-- <a href="#" class="loginCE"><spring:message code="login"/> </a> --%></font>
    </div>
</div>
<!-- 公共顶部 结束 -->
</c:if>

<c:if test="${sessionScope.header=='casi.jsp'}">
<!-- 公共顶部 开始 -->
<div class="top">
    <div class="box">
        <a class="logo" href="http://cacp.casicloud.com/cxcky/" target="_blank"><img src="../common/img/casi.png"/ style="width:260px"></a>
		<span>
			<a class="tmHome" href="http://cacp.casicloud.com/cxcky/"  target="_blank">首页</a>
			<a class="tmSpace" href="space.do">线下空间</a>
			<a class="tmCase" href="casi.do">项目中心</a>			 
			<a class="tmService" href="advisor.do">创业咨询</a>
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#">个人中心</a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank">我的云网</a></dd>
		    <dd><a href="#" class="login">退出登录</a></dd>
	    </dl>
  		 
    </div>
</div>
<!-- 公共顶部 结束 -->
</c:if>

<c:if test="${sessionScope.header=='headerhn.jsp'}">
<!-- 公共顶部 开始 -->
<div class="top">
    <div class="box">
        <a class="logo" href="http://www.casicloud.com" target="_blank"><img src="img/logohn.png"/></a>
		<span>
			<a class="tmHome" href="hunan.do">首页</a>
			<a class="tmSpace" href="hunanspace.do">线下空间</a>
			<a class="tmCase" href="showAllProjects.do?page=1">项目中心</a>
			<a class="tmNet" href="showAllVideos.do?page=1">航天网校</a>
			<a class="tmService" href="advisor.do">创业咨询</a>
			<div class=" search">
				<input type="text" style="border:0 none;outline: 0;width:100%;" placeholder="搜索项目" id="dataInput"/>	
				<img style="position: absolute;left: 5px;top: 10px;" src="./img/search-2.png">
			</div>
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#">个人中心</a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank">我的云网</a></dd>
		    <dd><a href="#">退出登录</a></dd>
	    </dl>
  		<font><a href="#" class="login">登录  >></a></font>
    </div>
</div>
<!-- 公共顶部 结束 -->

</c:if>
<c:if test="${sessionScope.header=='nanjing.jsp'}">
<!-- 公共顶部 开始 -->
<div class="top">
    <div class="box">
        <a class="logo" href="http://www.casicloud.com" target="_blank"><img src="img/logoNj.png"/></a>
		<span>
			<a class="tmHome" href="nanjing.do">首页</a>
			<a class="tmSpace" href="nanjingspace.do">线下空间</a>
			<a class="tmCase" href="showAllProjects.do?page=1">项目中心</a>
			<a class="tmNet" href="showAllVideos.do?page=1">航天网校</a>
			<a class="tmService" href="advisor.do">创业咨询</a>
			<div class=" search">
				<input type="text" style="border:0 none;outline: 0;width:100%;" placeholder="搜索项目" id="dataInput"/>	
				<img style="position: absolute;left: 5px;top: 10px;" src="./img/search-2.png">
			</div>
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#">个人中心</a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank">我的云网</a></dd>
		    <dd><a href="#">退出登录</a></dd>
	    </dl>
  		<font><a href="#" class="login">登录  >></a></font>
    </div>
</div>
<!-- 公共顶部 结束 -->
</c:if>


<c:if test="${sessionScope.header=='headergz.jsp'}">
<!-- 公共顶部 开始 -->
<div class="top">
    <div class="box">
        <a class="logo" href="http://gz.casicloud.com/" target="_blank"><img src="img/logoGz.jpg"/></a>
		<span>
			<a class="tmHome" href="guizhou.do">首页</a>
			<a class="tmSpace" href="guiyang.do">线下空间</a>
			<a class="tmCase" href="showProsGuizhou.do?page=1">项目中心</a>
			<a class="tmNet" href="showAllVideos.do?page=1">航天网校</a>
			<a class="tmService" href="advisor.do">创业咨询</a>
			<a   href="http://gz.casicloud.com/" target="_blank">贵州工业云</a>
		</span>
        <dl style="display:none;">
		    <dt><a><img src="${sessionScope.user.userImgApp}"  id="uImage"/></a></dt>
		    <dd><a href="#">个人中心</a></dd>
		    <dd><a href="http://www.casicloud.com/cloud/console/home2.ht" target="_blank">我的云网</a></dd>
		    <dd><a href="#">退出登录</a></dd>
	    </dl>
  		<font><a href="#" class="login">登录  >></a></font>
    </div>
</div>
<!-- 公共顶部 结束 -->
<!-- 公共顶部 结束 -->
</c:if>
<!-- 注册Tab -->
 
<script type="text/javascript"> 
	var phone = '${sessionScope.user.userphone}', role= '${sessionScope.user.userrole}';
	 
		if('${sessionScope.user.userimage}'==''){
			$.ajax({  
	            url: 'http://uc.casicloud.com/aopCasServer/login?service=' +
	        		 'http://inno.casicloud.com/common/user/logincas.json?callback=?',  
	            type: "GET",  
	            dataType: "jsonp",
	               jsonpCallback: "showJsonData",
	               success: function(data) {
	            }
	        });
		}else{
			$(".top .box font").hide();
			$(".top .box dl").show();
		}
  
	function showJsonData(data) {
		debugger;
		if (data.status >= 1) {
        	
		} else {
			$("#uImage").attr('src','../' + data.user.userimage);
			$(".top .box font").hide();
			$(".top .box dl").show();
			phone = data.user.userphone;
			role = data.user.userrole;
			var name = data.user.username;
			if(name != null)
				$(".awRegister .tabCon:eq(0) input:eq(1)").val(name);
			if(phone != null)
            	$(".awRegister .tabCon:eq(0) input:eq(2)").val(phone);
		};  
	}
	
	 $(function(){
	         $('#dataInput').bind('keypress',function(event){
	        	 debugger;
	             if(event.keyCode == "13")    
	             {	
	                 var keyword=$("#dataInput").val();
	                 if(keyword==null||keyword==''||keyword.replace(/(^\s*)|(\s*$)/g, "")==''){
	                 	$("#dataInput").focus();
	               		return false;
	                 }
					/*  window.location.href="findPage.do?keyword="+keyword+"&pg=1"; */
	                 $("#searchPost1").submit();
	             }
	         });
	 });
	 if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0") 
	 { 
// 	 	 alert("IE 7.0"); 
		 $('.search').css('marginTop','-46px');
	 } 
</script>
 