<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	#cnzz_stat_icon_1258979162 img{
		display:none;
	}
 	.mgt{
 		width: 100%;
	    height: 50px;
	    background: #50B9CE;
 	}
 	.mgtt{
		width: 1200px;
	    height: 50px;
	    margin: auto;
	    color: white;
 	}
 	.bottom {
	    background:#39464F;
	}
	.mgtt ul{
		width: 333px;
	    margin: auto;
	    line-height: 50px;
	    height: 50px;
	}
	.mgtt li{
		float:left;
		padding: 0 10px;
	}
	.mgb{
 		width: 100%;
	    height: 250px;
	    background:#39464F;
 	}
 	.mgbb{
		width: 1200px;
	    height: 200px;
	    margin: auto;
	    color: white;
 	}
 	.mgbb ul{
		width: 100%;
	    line-height: 45px;
	    padding-top:20px;
	    height: 180px;
	}
	.mgbb li{
		float:left;
		width:100%;
		text-align: center;
		padding: 0 10px;
	}
 </style>

<c:if test="${sessionScope.header=='header.jsp' }">
<div class="bottom ">
<!-- <span class="settled" style="background-color:#fff "> -->

<!-- 	<strong>合作伙伴</strong> -->
<!-- 	<span> -->
<!-- 		<a href="http://www.tsinghuacapital.cn" target="_blank"><img src="../image/partner/20150805112602930.png"></a> -->
<!-- 		<a href="http://www.taiyoufund.com/" target="_blank"><img src="../image/partner/20150805112620063.png"></a> -->
<!-- 		<a href="http://www.angelplus.cn/index.html" target="_blank"><img src="../image/partner/20150805112636183.png"></a> -->
<!-- 		<a href="http://itjuzi.com/investfirm/181" target="_blank"><img src="../image/partner/20150805112725909.png"></a> -->
<!-- 		<a href="http://www.cymfxy.com/" target="_blank"><img src="../image/partner/20150805112918563.png"></a> -->
<!-- 	</span> -->
<!-- 	</span> -->
	<dl style="padding: 10px 0px;" >
		<dt style="color:#FFF">
			<img src="img/logo1.png"> 引领中国智造的创业平台<br>
			语言 ：
			 <a href="language.do?language=zh_cn">中文</a>
			-<a href="language.do?language=en">English</a>
			-<a href="german.do">Deutsch</a><br>
			<a href="http://www.casic.com.cn/" target="_blank">航天科工</a> | <a href="http://www.casicloud.com/" target="_blank">航天云网</a> | <a target="_blank" href="about.do">关于我们</a> | <br>
			联系电话：400-857-6688
		</dt>
		<dd style="color:#FFF;float: right;">
			Copyright © 2016,All rights Reserved<br>
			京ICP备05067351号-3<br>
			北京市海淀区阜成路8号院主办公楼5层
		</dd>
	</dl>
</div>
</c:if>

<c:if test="${sessionScope.header=='global.jsp' }">
<div style="background:url(img/bottom_bac.png) center no-repeat " class="bottom  mt40">
	<dl style="height:140px">
		<dt style="color:#FFF">
			<spring:message code="language.CE"/>  :  <a href="language.do?language=zh_cn">中文</a>
			-<a href="language.do?language=en">English</a>
			-<a href="german.do">Deutsch</a>
			 <br>
			 
			<!-- <spring:message code="Tel"/>  :  400-857-6688<br> -->
			<spring:message code="address.footer"/>  :  <spring:message code="address"/><br>
			Copyright © 2016,All rights Reserved
		</dt>
		 
		<dt style="color:#FFF;margin-left:70px;text-align:center;margin-top:0px">
		 <img src="img/weixin.png" style="width:100px;height:100px">
		</dt>
	</dl>
</div>

</c:if>


<c:if test="${sessionScope.header=='casi.jsp' }">
 <div class="bottom  mt40">
	<div class="mgt">
		<div class="mgtt" style="width:100%">
			<ul style="width:370px;">
				<li><a href="http://cacp.casicloud.com/gyhtr/" target="_blank">关于航天日</a></li>
				<li>|</li>
				<li><a href="http://cacp.casicloud.com/gyypt/"  target="_blank">关于云平台</a></li>
				<li>|</li>
				<li style="cursor: pointer;"><a href="javascript:addFavorite2()">收藏本站</a></li>
			</ul>
		</div>
	</div>
	<div class="mgb" style="height:170px">
		<div class="mgbb" style="width:100%;height:150px">
			<ul style="width:100%;height:150px">
				<li>Copyright © 2015,All rights Reserved &nbsp&nbsp&nbsp&nbsp&nbsp京ICP备05067351号-2 &nbsp&nbsp&nbsp&nbsp京公安网1101082014254</li>
				<li>地址: 北京市海淀区阜成路甲8号&nbsp&nbsp&nbsp&nbsp  邮编 : 100048&nbsp&nbsp&nbsp&nbsp   </li>
				<li>承办单位 : 航天云网科技发展有限责任公司</li>
			</ul>
		</div>
	</div>
</div>
</c:if>

<c:if test="${sessionScope.header=='headerhn.jsp'}">
<div class="bottom  ">
<!-- <span style="background-color:#fff "> -->

<!-- 	<strong>合作伙伴</strong> -->
<!-- 	<span> -->
<!-- 		<a href="http://www.tsinghuacapital.cn" target="_blank"><img src="../image/partner/20150805112602930.png"></a> -->
<!-- 		<a href="http://www.taiyoufund.com/" target="_blank"><img src="../image/partner/20150805112620063.png"></a> -->
<!-- 		<a href="http://www.angelplus.cn/index.html" target="_blank"><img src="../image/partner/20150805112636183.png"></a> -->
<!-- 		<a href="http://itjuzi.com/investfirm/181" target="_blank"><img src="../image/partner/20150805112725909.png"></a> -->
<!-- 		<a href="http://www.cymfxy.com/" target="_blank"><img src="../image/partner/20150805112918563.png"></a> -->
<!-- 	</span> -->
<!-- 	</span> -->
	<dl style="height:100px">
		<dt style="color:#FFF">
			<img src="img/logohn2.png"> <br>
			<a href="http://www.casic.com.cn/" target="_blank">航天科工</a> | <a href="http://www.casicloud.com/" target="_blank">航天云网</a> | <br>
			 
		</dt>
		<dd style="color:#FFF;float: right;">
			湖南省长沙市麓谷高新区文轩路27号麓谷钰园B8栋<br>
			Copyright?2016,All rights Reserved
		</dd>
	</dl>
</div>
</c:if>

<c:if test="${sessionScope.header=='nanjing.jsp'}">
<div class="bottom  ">
<!-- <span style="background-color:#fff "> -->

<!-- 	<strong>合作伙伴</strong> -->
<!-- 	<span> -->
<!-- 		<a href="http://www.tsinghuacapital.cn" target="_blank"><img src="../image/partner/20150805112602930.png"></a> -->
<!-- 		<a href="http://www.taiyoufund.com/" target="_blank"><img src="../image/partner/20150805112620063.png"></a> -->
<!-- 		<a href="http://www.angelplus.cn/index.html" target="_blank"><img src="../image/partner/20150805112636183.png"></a> -->
<!-- 		<a href="http://itjuzi.com/investfirm/181" target="_blank"><img src="../image/partner/20150805112725909.png"></a> -->
<!-- 		<a href="http://www.cymfxy.com/" target="_blank"><img src="../image/partner/20150805112918563.png"></a> -->
<!-- 	</span> -->
<!-- 	</span> -->
	<dl>
		<dt style="color:#FFF">
			<img src="img/logoNj2.png"> <br>
			<a href="http://www.casic.com.cn/" target="_blank">航天科工</a> | <a href="http://www.casicloud.com/" target="_blank">航天云网</a> | <br>
			 
		</dt>
		<dd style="color:#FFF;float: right;">
			江苏省南京市秦淮区应天大街388号1865大工坊北楼<br>
			Copyright?2016,All rights Reserved
		</dd>
	</dl>
</div>
</c:if>

<c:if test="${sessionScope.header=='headergz.jsp' }">
<div class="bottom  ">
<!-- <span style="background-color:#fff "> -->
<!-- 	<strong>合作伙伴</strong> -->
<!-- 	<span> -->
<!-- 		<a href="http://www.tsinghuacapital.cn" target="_blank"><img src="../image/partner/20150805112602930.png"></a> -->
<!-- 		<a href="http://www.taiyoufund.com/" target="_blank"><img src="../image/partner/20150805112620063.png"></a> -->
<!-- 		<a href="http://www.angelplus.cn/index.html" target="_blank"><img src="../image/partner/20150805112636183.png"></a> -->
<!-- 		<a href="http://itjuzi.com/investfirm/181" target="_blank"><img src="../image/partner/20150805112725909.png"></a> -->
<!-- 		<a href="http://www.cymfxy.com/" target="_blank"><img src="../image/partner/20150805112918563.png"></a> -->
<!-- 	</span> -->
<!-- 	</span> -->
	<dl>
		<dt style="color:#FFF">
			<img src="img/logo2.jpg"><br>
			<a href="http://www.casic.com.cn/" target="_blank">航天科工</a> | <a href="http://www.casicloud.com/" target="_blank">航天云网</a><br>
			 
			联系电话：0851-86892418
		</dt>
		<dd style="color:#FFF;margin-left:70px;float:left">
			Copyright ? 贵州航天云网 2016, All Rights Reserved<br>
		 
			贵阳市中华北路187号经信委大楼<br>
			官方微信
		</dd>
		<dt style="color:#FFF;margin-left:90px">
		 <img src="img/weixin.png" style="width:100px;height:100px">
		</dt>
	</dl>
</div>
</c:if>

<script type="text/javascript">
		function addFavorite2() {
		    var url = window.location;
		    var title = document.title;
		    var ua = navigator.userAgent.toLowerCase();
		    if (ua.indexOf("360se") > -1) {
		        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
		    }
		    else if (ua.indexOf("msie 8") > -1) {
		        window.external.AddToFavoritesBar(url, title); //IE8
		    }
		    else if (document.all) {
			  try{
			   window.external.addFavorite(url, title);
			  }catch(e){
			   alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
			  }
		    }
		    else if (window.sidebar) {
		        window.sidebar.addPanel(title, url, "");
		    }
		    else {
		 		 alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
		    }
		}
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan style ='display:none' id='cnzz_stat_icon_1258979162'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1258979162%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
<div style="display:none;">
<script src="https://s95.cnzz.com/z_stat.php?id=1260923910&web_id=1260923910" language="JavaScript"></script>
</div>
<script type="text/javascript" src="http://stat.htres.cn/log.js?sid=1"></script>