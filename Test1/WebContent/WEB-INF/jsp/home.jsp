<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %> 
<script type="text/javascript" src="js/jquery.scrollto.js"></script>
<%-- <c:import url="${sessionScope.header}" /> --%>

<script>$(".tmHome").addClass("sel");</script>
<!-- 公共脚本与样式 结束 -->
<style>
.Tindustry {
    background: gray;
    color: #fff;
}
.t_center {
    margin-top: 20px;
}
.carousel5 img{
    height: 170px;
}
.t-zhuq{
	font-size: 16px;
	/* width:250px; */
    padding: 8px;
    line-height: 20px;
    text-align: center;
    background: #F39800;
    color: white;
}
.carousel5 li {
    margin-right: 5px;
}

#hero-slider {
	text-align:left;
	width:1200px;
	height:320px;
	margin:0 auto;
}
#hero-slider .mask {
	float:left;
	width:1100px;
	height:300px;
/* 	margin:15px 0 0 10px; */
	overflow:hidden;
	position:relative;
}
#hero-slider .panelX {
	width:1100px;
	height:300px;
	text-align:left;
}
#hero-slider ul {
	margin:0;
    width: 90px;
    margin-left: 10px;
 	padding:90px 0 0 0;
	list-style:none;
	float:left;
}
#hero-slider ul li {
	margin:20px 0;
}
#hero-slider ul a {
    outline: none;
    text-decoration: none;
    display: block;
    font-size: 18px;
    line-height: 22px;
    height: 22px;
    text-align: center;
}
#hero-slider ul a:link {color: #000} 
#hero-slider ul a:visited {color: #000} 
#hero-slider ul a:hover {color: #000} 
#hero-slider ul a:active {color: #000} 
#hero-slider ul a {
	border-left: 5px solid white;
}
#hero-slider ul a.active {
	border-left: 5px solid #ed8438;
	color: #ed8438;
}
.Tchoose {
    position: absolute;
    font-size: 14px;
    top: 15px;
    right: 15px;
    height: 22px;
    width: 70px;
    text-align: center;
    line-height: 22px;
    color: white;
    background: #ed8438;
}
.t-Img{
	width:210px;
	height:165px;
	margin-top:15px;
	margin-bottom:10px;
}
.t_yun{
	overflow: hidden;
	margin-top:5px;
}
.t_yun li a img{
	width:195px;
	margin-right:5px;
	float:left;
}
.t_yun2 li a img{
	width:235px;
	height:180px;
	margin-right:5px;
	float:left;
}
.t_yun1 li a img{
	width: 220px;
    height: 100px;
    margin: 0 15px;
}
</style>
<span class="slider">
        <div class="flexslider carousel">
            <ul class="slides">
                <c:forEach var="carousel" items="${carousels}">

                    <c:choose>
                        <c:when test="${carousel.itemurl != null and carousel.itemurl !=''}">
                            <li><a href="${carousel.itemurl}" target="_blank"><img src="${carousel.img}"/></a></li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a>
                                    <img src="${carousel.img}"/>
                                </a>
                            </li>
                        </c:otherwise>

                    </c:choose>
                </c:forEach>
            </ul>
        </div>
</span>
<script>
    (function() {

        // store the slider in a local variable
        var $window = $(window),
                flexslider;

        // tiny helper function to add breakpoints
        function getGridSize() {
            return (window.innerWidth < 1000) ? 2 :
                    (window.innerWidth < 1300) ? 3 : 4;
        }
        $(window).load(function(){
            $('.carousel').flexslider({
//                 animation: "slide",
				slideshow:false,
                start: function(slider){

                }
            });

        });
        $(window).load(function(){
            $(".carousel5").flexslider({
        		animation: "slide",
        		slideshow:false,
                animationLoop: false,
                controlNav: false,
                itemWidth: 210,
                itemMargin: 5,
        		minItems: 2,
                maxItems: 4
               // pausePlay: true
        	});
        });
        

        $window.load(function() {
            $('.carousel1').flexslider({
                animation: "slide",
                animationSpeed: 400,
                animationLoop: false,
                itemWidth: 340,
                itemMargin: 0,
                minItems: 3, // use function to pull in initial value
                maxItems: 3, // use function to pull in initial value
                start: function(slider){
                    $('body').removeClass('loading');
                    flexslider = slider;
                }
            });
        });

        // check grid size on resize event
        $window.resize(function() {
            var gridSize = getGridSize();

        });
    }());


</script>
<div class="container">
  <div class="section">
        <div class="title"><div class="t_center"><span>双创专区</span></div></div>
        <div style='margin-top:25px;' class="mapPic">
		<span class="slider">
        <div  class="flexslider  carousel5 ">
            <ul class="slides">
                <li>
                <a href="./zoneGZ.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2Fguizhou.png" /><p class='t-zhuq'>贵州众创</p></a>
                
                </li>

                <li>
                 <a href="./zoneJX.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2Fjiangxi.jpg" /><p class='t-zhuq'>江西众创</p></a>
                </li>
                <li>
                   <a href="./zoneJM.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fpartner%2F211119824360565841.jpg" /><p class='t-zhuq'>江门众创</p></a>
                </li>  
                <li>
                   <a href="./zoneRobot.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/468922282683635497.png" /><p class='t-zhuq'>机器人专区</p></a>
                </li>
                <li>
                   <a href="./zoneZGC.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/zgc.jpg" /><p class='t-zhuq'>中关村双创专区</p></a>
                </li>
			    <li>
                   <a href="./zone3d.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2F3d.jpg" /><p class='t-zhuq'>3D打印专区</p></a>
                </li>
                 <li>
                   <a href="./zoneWRJ.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2Fwurenji.png" /><p class='t-zhuq'>无人机专区</p></a>
                </li> 
<!--                  <li> -->
<!--                    <a href="./zoneTJ.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2Ftj0.jpg" /><p class='t-zhuq'>天津临港经济区</p></a> -->
<!--                 </li> -->
            </ul>
        </div>
      </span>
        </div>
    </div>
  
    <div  class="section">
		<div class="title">
            <div class="t_center t_ie"><span>项目中心</span></div>
            <a href="showAllProjects.do?page=1" target="_blank">查看更多...</a>
        </div>       
        <div id="hero-slider">
			<ul>
				<li><a href="#" rel="#panel-1" class="active" >产品池</a></li>
				<li><a href="#" rel="#panel-2" >种子池</a></li>
				<li><a href="#" rel="#panel-3" >创意池</a></li>
			</ul>
			<div class="mask">
				<div class="slider-body">
				<div class="panelX" id="panel-1">
					      <a href="showDetail.do?projectId=08181444581330020" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="http://file0.casicloud.com/image/project/08181441108700013?e=1481701720&token=UVFsqUbvfPmloYwhmZDNiNCtgljg-nNabRiyL7ub:hTzygyEh4Yne4ZN7Gqpr3U-obpM=" /></span></br>
							<span class="pros2 mb10 mt10">影创科技 · 北京市</span>
							<div class="pros3" >改变世界就从改变视野开始</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											虚拟现实
										</div>
							<div class="Tchoose">产品池</div>
							</span>
			                </a>
			                  <a href="showDetail.do?projectId=0628113808720116" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="http://file0.casicloud.com/image/jm/北京升哲科技有限公司.png?e=1481701963&token=UVFsqUbvfPmloYwhmZDNiNCtgljg-nNabRiyL7ub:7hMQgf23EcAEZCxaNPbHgNYzVQQ=" /></span></br>
							<span class="pros2 mb10 mt10">北京升哲科技有限公司· 北京市</span>
							<div class="pros3" >我们围绕商家、消费者的需求，高度融合移动互联网。</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											智慧生活
										</div>
							<div class="Tchoose">产品池</div>
							</span>
			                </a>
			                  <a href="showDetail.do?projectId=06031510394950125" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="http://file0.casicloud.com/image/project/北京大工科技有限公司.png" /></span></br>
							<span class="pros2 mb10 mt10">北京大工科技有限公司 · 北京市</span>
							<div class="pros3" >大工科技无人机产品分为系留无人机系统和行业多旋翼无人机两大系列</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											无人机
										</div>
							<div class="Tchoose">产品池</div>
							</span>
			                </a>
			                  <a href="showDetail.do?projectId=05310909154760010" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="http://file0.casicloud.com/image/project/05310904222890007" /></span></br>
							<span class="pros2 mb10 mt10">航天常兴股份有限公司 · 北京市</span>
							<div class="pros3" >为新老建筑物提供：电气火灾监控、智能疏散等智能防火、灭火的集成设计及设备      （解决任何建筑物、古建筑物的电气火灾、智能疏散问题）</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											智能家居
										</div>
							<div class="Tchoose">产品池</div>
							</span>
			                </a>
					</div>
					<div class="panelX" id="panel-2">
						<c:forEach var="project"  items="${projectsZz}">
			                <a href="showDetail.do?projectId=${project.cguid}" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="${project.projectlogoApp}" /></span></br>
							
							<span class="pros2 mb10 mt10">${project.projectname} · ${project.user.userlocation}</span>
						 
							<div class="pros3" >${project.brief}</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											<script>
												var str="${project.industryInfo}";
												var strs= new Array(); 
												strs=str.split(" ");
												$(".Tindustry:last").html(strs[0]);
											</script>
										</div>
							<div class="Tchoose">${project.phase}</div>
							</span>
			                </a>
			            </c:forEach> 
					</div>
					<div class="panelX" id="panel-3">
						<c:forEach var="project"  items="${projectsCy}">
			                <a href="showDetail.do?projectId=${project.cguid}" target="_blank">
			                <span class="pros">
							<span class="pros1"><img class="t-Img" src="${project.projectlogoApp}" /></span></br>
							
							<span class="pros2 mb10 mt10">${project.projectname} · ${project.user.userlocation}</span>
						 
							<div class="pros3" >${project.brief}</div>
										<div  style="margin:10px auto;" class="Tindustry" >
											<script>
												var str="${project.industryInfo}";
												var strs= new Array(); 
												strs=str.split(" ");
												$(".Tindustry:last").html(strs[0]);
											</script>
										</div>
							<div class="Tchoose">${project.phase}</div>
							</span>
			                </a>
			            </c:forEach> 
					</div>
				</div>
			</div> <!-- .mask -->
		</div> <!-- #hero-slider -->

    </div>

      <div class="section">
        <div class="title"><div class="t_center"><span>线下空间</span></div></div>
        <div style="margin-top:12px;" class="mapPic">
		<span class="slider">
        <div class="flexslider carousel1">
            <ul class="slides">
                <li>
                <a href="./spaceDetail.do" target="_blank"><span><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2FbeijingPic.png" /></span></a>
                </li>

                <li>
                 <a href="./nanchang.do" target="_blank"><span><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2FjiangxiPic.png" /></span></a>
                </li>
                <li>
                     <a href="./guiyang.do" target="_blank"><span><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2FguiyangPic.jpg" /></span></a>

                </li>
			    <li>
                   <a href="./hunanspace.do" target="_blank"> <span><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2FhunanPic.png" /></span></a>

                </li>
                   <li>
                   <a href="./nanjingspace.do" target="_blank"> <span><img src="http://7xnier.com1.z0.glb.clouddn.com/image%2Fhome%2Fnanjing.png" /></span></a>

                </li>
            </ul>
        </div>
      </span>
        </div>
        <div class="content1">
            <div style="width: 700px;margin: auto;font-size:24px;line-height:30px">
                云网线下空间为用户提供了一流的办公场地租赁和创业孵化服务，有会议室、免费WIFI、咖啡和3D打印，快来选择你所在的城市吧!
            </div>
        </div>
    </div>
    <div class="section">
        <div class="title"><div class="t_center"><span>云大赛</span></div></div>
        <div style="overflow: hidden;width: 1200px;" class="mapPic">
            <ul class="t_yun t_yun2">
                <li style="float:left;">
                 	<a href="http://www.casicloud.com/app/" target="_blank"><img src="./img/APP.jpg" /></a>
                </li>
                <li style="float:left;">
                 	<a href="http://www.casicloud.com/salesmatch/" target="_blank"><img src="https://oby0yx23h.qnssl.com/image/jpg/GJ.png" /></a>
                </li>
                <li style="float:left;">
                 	<a href="http://youth.casicloud.com/youthInno/common/home.do" target="_blank"><img src="https://oby0yx23h.qnssl.com/image/jpg/592958607003513532.jpg" /</a>
                </li>
                <li style="float:left;">
                  	<a href="http://campus.casicloud.com/campusInno/common/home.do" target="_blank"><img src="http://7xnier.com1.z0.glb.clouddn.com/game_dx.png" /></a>
                </li>
                <li style="float:left;">
                 	<a href=" http://sinotrans-csc.casicloud.com/" target="_blank"><img src="https://oby0yx23h.qnssl.com/image/jpg/CH0.png" /></a>
                </li>
            </ul>
        </div>
    </div>
<!--     <div class="section"> -->
<!--         <div class="title"> -->
<!--             <div class="t_center t_ie"> <span>航天网校</span></div> <a href="" target="_blank">查看更多...</a> -->
<!--         </div> -->
<!--         <div class="school1"> -->
<%--             <c:forEach var="video"  items="${videos}" begin="0" end="2" step="1"> --%>
<%--                 <a href="showVideoDetail.do?videoId=${video.cguid}" target="_blank"> --%>
<%--                     <span class="schoolw">	<span class="school2"><img src="${video.img}" style="width:136px;height:136px"/></span> --%>
<%--                     <span class="school3 mt40"><span style="font-size:16px;"><span style="font-size:15px">${video.teachertitle}</span></br>${video.videoteacher}</span></br><span style="font-size:14px"> <${video.videotitle}> </span></span></span> --%>
<!--                 </a> -->
<%--             </c:forEach> --%>
<!--         </div> -->
<!--     </div> -->

    <div class="section">
        <div class="title">
            <div class="t_center t_ie"><span>云导师</span></div>
            <a href="selectAdvisorList.do" target="_blank">查看更多...</a>
        </div>

        <div class="advisor">
            <c:forEach var="advisor"  items="${advisors}">
                <a href="advisorDetail.do?cguid=${advisor.cguid}" target="_blank">
				<span  class="advisor1">
					<span  class="advisor2"><img src="${advisor.imageQiniu}" style="width:120px;height:120px;border-radius:50%; "/></span>
					<span  class="advisor3"><div class="space30" style="height: 18px;"></div><span style="font-size:18px">${advisor.username}</span><div class="space"></div><span style="font-size: 14px;line-height: 18px;">${advisor.introduceless}</span></span>
				</span>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="section">
        <div class="title"><div class="t_center"><span>孵化服务</span></div><a href="cloudChoose.do" target="_blank">查看更多...</a></div>
        <div style="overflow: hidden;margin-left:0px;width: 1200px;" class="mapPic">
            <ul class="t_yun">
                 <li style="float:left;">
                 	<a href="http://core.casicloud.com/cosimcloud/index.ht" target="_blank"><img src="https://oby0yx23h.qnssl.com/702863648933622172.jpg" /</a>
                </li>
                <li style="float:left;">
                  	<a href="http://core.casicloud.com/industryMall/hall/industryIndex.ht"  target="_blank"><img src="https://oby0yx23h.qnssl.com/187050547431101125.jpg" /></a>
                </li>
                <li style="float:left;">
                 	<a href="showAllVideos.do?page=1" target="_blank"><img src="./img/HTWX0.png" /</a>
                </li>
                <li style="float:left;">
                  	<a href="cloudChoose.do#0"  target="_blank"><img src="./img/YZY0.png" /></a>
                </li>
                <li style="float:left;">
                 	<a href="cloudChoose.do#1"  target="_blank"><img src="./img/ZHYY0.png" /></a>
                </li>
                <li style="float:left;">
                 	<a href="cloudChoose.do#2" target="_blank"><img src="./img/RLZY0.png" /></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="section">
        <div class="title"><div class="t_center"><span>成果转化</span></div></div>
        <div style="overflow: hidden;" class="mapPic">
            <ul class="t_yun1 t_yun">
                <li style="float:left;">
                 	<a href="http://www.scjmrh.org/" target="_blank"><img src="./img/fuseIndex_logo.png"</a>
                </li>
                <li style="float:left;">
                  	<a href="http://www.ctex.cn/article/about/gywm/"  target="_blank"><img src="./img/jyw.jpg" /></a>
                </li>
                <li style="float:left;">
                 	<a href="http://core.casicloud.com/pool/std/standardType/index.ht" target="_blank"><img src="./img/BZC.png"</a>
                </li>
                <li style="float:left;">
                  	<a href="http://patent.casicloud.com/main/index.html"  target="_blank"><img src="./img/ZLC.png" /></a>
                </li>
            </ul>
        </div>
    </div>
<!--     <div class="section" style="margin-top: 50px;" > -->
<!--         <div class="title"><div class="t_center"><span>IT资源库</span></div></div> -->
<!--         <a href="http://www.casicloud.com/cosimcloud/resource_software.ht" target="_blank"> -->
<!--             <div style="height:150px;padding-top: 28px;"> -->
<!--             <div style="float:left;margin-left:200px;"><img src="./img/yuwanglogo.png" style="margin-top:20px"></div><div style="height:150px;float:right;width:400px;margin-right:170px;padding-top:30px;font-size:16px;line-height:20px">IT资源库:基于创新的软硬件平台,为您提供易用,稳定,的云服务平台服务。满足公司信息化建设对软硬件资源的需求，消除多业务间数据共享的壁垒，为公司集约化经营和管理提供支撑。</div> -->
<!--         </div> -->
<!--         </a> -->
<!--     </div> -->
<!--     <div class="section t_ie2" style="margin-top: 50px;"> -->
<!--         <div class="title"><div class="t_center"><span>企业运营服务</span></div></div> -->
<!--         <a href="http://www.gongsibao.com/" target="_blank"><div style="height:150px;"> -->
<!--             <div style="float:left;margin-left:200px;"><img src="./img/gongsibao.png"></div><div style="height:150px;float:right;width:400px;margin-right:170px;padding-top:30px;font-size:16px;line-height:20px">企业运营服务：通过近200项的标准化服务产品，帮助企业解决注册、财会、知识产权、投融资等创业中的“刚需”难题，引领企业服务的标准化和产品化,并通过不断创新,帮助中国新一代的创业者实现创业梦想，推动中国中小企业成长壮大。</div> -->
<!--         </div> -->
<!--         </a> -->
<!--     </div> -->
    
<!--     <div class="section" style="margin-top: 50px;"> -->
<!--         <div class="title"><div class="t_center"><span>推荐招聘渠道</span></div></div> -->
<!--         <div class="school1 "> -->
<!--         	<div class=" school7"> -->
<!-- 	        	<div  class="school4"></div> -->
<!-- 	        	<a href="http://www.bosszhipin.com/home/" target="_blank"> -->
<!-- 	        		<span class="school11"><img class="Timg1"  alt="" src="./img/zhaopin1.png"></span> -->
<!-- 	        	</a>         -->
<!-- 	            <div  class="school4"></div> -->
<!-- 	            <div class="school6"> -->
<!-- 	            	<span class="school5"></span> -->
<!-- 	            	<a href="http://www.100offer.com/company" target="_blank"> -->
<!-- 	        		<span class="school5"><img class="Timg" alt="" src="./img/zhaopin2.png"></span> -->
<!-- 	        	</a> 	             -->
<!-- 	            </div>	        	 -->
<!-- 	        	<div  class="school4"></div> -->
<!-- 	        	<a href="http://www.liepin.com/" target="_blank"> -->
<!-- 	        		<span class="school11"><img  class="Timg1" alt="" src="./img/zhaopin3.png"></span> -->
<!-- 	        	</a>     -->
<!--         	</div> -->
<!--         	<div class="school8"> -->
<!--         		<div  class="school10"></div> -->
<!-- 	        	<a href="http://www.bosszhipin.com/home/" target="_blank"> -->
<!-- 	        		<span class="school9">Boss招聘, 简单直接手机端聊天招聘</span> -->
<!-- 	        	</a>         -->
<!-- 	            <div  class="school10"></div> -->
<!-- 	            <div > -->
<!-- 	            	<a href="http://www.100offer.com/company" target="_blank"> -->
<!-- 	        		<span class="school9">100Offer, 专注互联网高端人才招聘</span> -->
<!-- 	        	</a> 	             -->
<!-- 	            </div>	        	 -->
<!-- 	        	<div  class="school10"></div> -->
<!-- 	        	<a href="http://www.liepin.com/" target="_blank"> -->
<!-- 	        		<span class="school9">猎聘网, 知名中高端人才招聘网站</span> -->
<!-- 	        	</a>           	 -->
<!--         	</div>         -->
<!--         </div> -->
        
<!--     </div> -->
    
     <div class="section t_ie1" style="margin-top: 10px;margin-bottom: 40px;">
        <div class="title"><div class="t_center t_ie"><span>云基金</span></div>
        <a href="fund.do" target="_blank">查看更多...</a></div>
        <div class="school1 ">
		    <span>
		 		<a href="http://www.tsinghuacapital.cn" target="_blank"><img style="width: 250px;margin-left:20px;" src="../image/partner/smqh.png"></a> 
		 		<a href="http://www.innoangel.com/" target="_blank"><img style="width: 150px;margin-left: 50px;" src="../image/partner/inn.png"></a> 
		 		<a href="http://www.z-innoway.com/" target="_blank"><img style="margin-left:40px;" src="../image/partner/inno.jpg"></a> 
		 		<a href="http://www.thejiangmen.com/" target="_blank"><img style="margin-left: 20px;width: 230px;" src="../image/partner/black.png"></a> 
		 	</span>       	
        </div>       
    </div>
    
</div>
</body>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
// 	$(".pros").eq(0).css("margin-left","70px");
		
	$(document).ready(function () {
		
		$("#hero-slider ul a").each(function(){
			$(this).click(function(){
				var t = $(this);
				t.parent().parent().find('a').removeClass('active');
				t.addClass("active");
				
				//scroll it to the right position
				$('.mask').scrollTo($(this).attr('rel'), 300);
				
				//disable click event
			    return false;		
				
			});
		});

	});	
</script>
</html>
