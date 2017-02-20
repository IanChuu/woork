<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.zstrength.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.zstrength.CONSTANT"%>

<c:set var="domain_name" value="<%=request.getServerName()%>" />
<c:if test="${domain_name  eq 'admin.snailhouse.com.tw' }">
<c:redirect url="/admin/logout"/>
</c:if>
<html amp >
<head>
<title>窩牛網 您窩的大小事 我們真心關注</title>
<!-- facebook -->
<meta property="og:description" content="屋主快來免費刊登，自己賣賣看。" />
<meta property="og:title" content="窩牛網"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://snailhouse.com.tw/"/>
<meta property="og:image" content="https://home.snailhouse.com.tw/webresource/office/img/fb-dm4.jpg"/>
<meta property="og:site_name" content="窩牛網" />

<meta name="description" content="在窩牛網買賣房屋最划算！ 專業律師簽約+台新銀行信託，交易最安全屋主線上刊登限時免費中 · 720度環景線上看房 · 買屋0元服務費">
<meta name="utf-8">
<link rel="shortcut icon" href="img/favicon.png">
<link rel="amphtml" href="https://snailhouse.com.tw/">
<link rel="canonical" href="https://snailhouse.com.tw/" />
<script async src="https://cdn.ampproject.org/v0.js"></script>
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
<jsp:include page="common/rwdlibrary_index.jsp">
  <jsp:param name="page" value="home"/>
  <jsp:param name="livechat" value="on"/>
</jsp:include> 
<link rel="apple-touch-icon" href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/touch-icon-iphone.png" />
<link rel="apple-touch-icon" sizes="76x76" href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/touch-icon-ipad.png" />
<link rel="apple-touch-icon" sizes="120x120" href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/touch-icon-iphone-retina.png" />
<link rel="apple-touch-icon" sizes="152x152" href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/touch-icon-ipad-retina.png" />
<link href="https://home.snailhouse.com.tw/webresource/office/css/style-index.css" rel="stylesheet" type="text/css" media="screen">
<link href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/css/slider-custom-2017.css" rel="stylesheet" type="text/css" media="screen">
<script src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/js/jquery-1.11.1.min.js" type="text/javascript"></script>       
<script type="text/javascript">
function goUrl(url,keyword){
	alert('before url:'+url);
	if(keyword){
		//var encodedUrl = '&objType='+encodeURIComponent(keyword);
		var encodedUrl = '&objType='+encodeURI(keyword);
		url += encodedUrl;
	}
	alert('after url:'+url);
	$(location).prop('href',url+encodedUrl);
}
function callApplyObj() {
	document.getElementById('header_nonlogin').submit();
}

</script>
<%@ include file="common/fb_pixel_code.jsp" %> 
</head>
<body>
<!-- button type="button" onClick="$zopim(function() {$zopim.livechat.window.show();})">開啟線上客服</button> -->
<form id="header_nonlogin" action="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login" method="POST" >
	<input type="hidden" name="fromUrl" value="/member/sell/object/applySetup">
</form>
<%@ include file="common/rwdheader_index.jsp" %> 
        <!--2017新slider start-->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Carousel indicators -->
            <!-- <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                 <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            輪播控制點 -->   
            <!-- 大圖輪播 -->
            <div class="carousel-inner">
            <a href="#">
                <div class="item slide-01 active">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center slide-text">
                                <!--  <h1 class="animated slideInLeft delay-1">買屋0元仲介費</h1> -->
                                <div class="divide15"></div>
                                <!-- <p class="animated slideInLeft delay-2">聰明買，精明省</p>  -->
                                <div class="divide15"></div>
                                <!-- <p class="animated slideInLeft delay-3"><a href="#" class="btn btn-lg btn-theme-bg"> 了解更多</a></p> -->
                            </div>
                        </div>
                    </div>
                </div>
             </a><!--大圖輪播 1-->
                <!--
                <div class="item slide-02">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center slide-text">
                                <div class="divide15"></div>
                                <div class="divide15"></div>
                            </div>
                        </div>
                    </div>
                </div>大圖輪播 2-->
                <!--
                <div class="item slide-03">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center slide-text">
                                <p class="animated slideInLeft delay-1">We are truly </p>
                                <div class="divide15"></div>
                                <h1 class="animated slideInLeft delay-2">Creative</h1>
                                <div class="divide15"></div>
                                <p class="animated slideInLeft delay-3"><a href="#" class="btn btn-lg btn-theme-bg"> Hire us</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                -->
            </div><!--carousel inner-->
            <!-- Carousel nav 
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
            -->
        </div>
        <!--2017新slider end-->
        <!--  
        <div class="divide40"></div> 
        <section class="new-event03">
            <div class="container">
                <div class="col-sm-8 col-sm-offset-2">
                            <div class="center-heading">
                                <h2>年終會員限定</h2>
                                <span class="center-line"></span>
                            </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center no-padding">
                       <a href="${pageContext.request.contextPath}/activity/thekahan?utm_source=snailhouse&utm_medium=small_banner&utm_campaign=遇水則發" target="_blank">
                         <img src="https://home.snailhouse.com.tw/webresource/office/img/banner03-text-lg.png" class="img-responsive hidden-sm hidden-xs" />
                       </a>
                       <a href="${pageContext.request.contextPath}/activity/thekahan?utm_source=snailhouse&utm_medium=small_banner&utm_campaign=遇水則發" target="_blank">
                         <img src="https://home.snailhouse.com.tw/webresource/office/img/banner03-text-sm.png" class="img-responsive hidden-lg hidden-md " />
                       </a> 
                    </div>
                </div>
                
            </div>
        </section>
        -->
        <section class="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="center-heading">
                            <h2>成家甜蜜宅一起：出價GO</h2>
                            <span class="center-line"></span>
                        </div>
                    </div>                   
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="work-carousel" class="owl-carousel owl-spaced">
                            <c:forEach var="item" items="${highlightList}" varStatus="idx">
                            <div>
                                <div class="item-img-wrap ">
                                    <div class="cp-fixed-height" style="background-image: url('${item.coverUrl}')">${item.iconImgUrl}</div>
                                    <c:if test="${not empty item.iconImgUrl}"> 
                                    <img class="highlight-img" src="${item.iconImgUrl}">
                                    </c:if>
                                    <div class="item-img-overlay">
                                        <a href="${pageContext.request.contextPath}/object/${item.objectId}?s=I00">
                                            <span></span>
                                        </a>
                                    </div>
                                </div> 
                                <div class="work-desc">
                                    <h3><a href="${pageContext.request.contextPath}/object/${item.objectId}?s=I00">${item.slogon}</a></h3>
                                    <span class="cp-size"><fmt:formatNumber type="number"  maxIntegerDigits="3" value="${item.totalSquareFootage+ item.parking_square}" />坪</span><span class="cp-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}"/>萬</span>
                                </div>
                            </div>                          
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="divide30"></div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath}/object/list"  onclick="ga('send', 'event', 'hyperlink', 'onclick', 'n. n. 搜尋更多物件');" class="btn border-theme btn-lg wow animated fadeInUp"><i class="fa fa-bars"></i> 搜尋更多物件</a>
                    </div>
                </div>
            </div>
        </section>
       <!-- 
    	<section class="new-event03 ">
                <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/cbm" onclick="ga('send', 'event', 'cbm', 'onclick', '好康快送首頁banner點擊');">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner03.jpg" class="img-responsive hidden-sm hidden-xs" />
                </a>
                <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/cbm" onclick="ga('send', 'event', 'cbm', 'onclick', '好康快送首頁banner點擊');">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner03-sm.jpg" class="img-responsive hidden-lg hidden-md " />
                </a> 
        </section>  
        end-->
		<!-- 
		<div class="divide50"></div>   
        <section class="home-bg hidden-sm hidden-xs">
                 
        </section>
        <section class="home-bg-s hidden-lg hidden-md">
                  
        </section>
        -->
        <!-- 
        <div class="process-inline clearfix hidden-sm hidden-xs">
                <div class="container">
                        <div class="col-sm-8 col-sm-offset-2">
                            <div class="center-heading">
                                <h2>最新活動專區</h2>
                                <span class="center-line"></span>
                            </div>
                        </div>
                </div>
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=3" onclick="ga('send', 'event', 'hyperlink', 'onclick', '新北市超值嚴選物件');">
                    <div class="Process-col select-free">
                       
                    </div>
                    </a>
                </div>
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=3" onclick="ga('send', 'event', 'hyperlink', 'onclick', '新北市超值嚴選物件');">
                    <div class="Process-col select-signin">
                       
                    </div>
                    </a>
                </div>
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=3" onclick="ga('send', 'event', 'hyperlink', 'onclick', '新北市超值嚴選物件');">
                    <div class="Process-col select-news98">
                        
                    </div>
                    </a>
                </div>
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=3" onclick="ga('send', 'event', 'hyperlink', 'onclick', '新北市超值嚴選物件');">
                    <div class="Process-col select-twn">
                        
                    </div>
                    </a>
                </div>
        </div> 
        --> 
        <div class="process-inline clearfix">
                <div class="container">
                        <div class="col-sm-8 col-sm-offset-2">
                            <div class="center-heading">
                                <h2>精選主題牆</h2>
                                <span class="center-line"></span>
                            </div>
                        </div>
                </div>
                
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=3" onclick="ga('send', 'event', 'hyperlink', 'onclick', '新北市超值嚴選物件');">
                    <div class="Process-col select-3">
                        <i class="fa fa-search"></i>
                        <h4>新北市超值嚴選物件</h4>
                    </div>
                    </a>
                </div><!--col one forth for no space padding end-->
                <div class="col-one-fourth">
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=2" onclick="ga('send', 'event', 'hyperlink', 'onclick', '台北市總價1500萬內');">
                    <div class="Process-col select-2">
                        <i class="fa fa-search"></i>
                        <h4>台北市總價1500萬內</h4>
                    </div>
                    </a>
                </div><!--col one forth for no space padding end-->
                <div class="col-one-half">
                   <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=5" onclick="ga('send', 'event', 'hyperlink', 'onclick', '3房2廳成家專區');">
                    <div class="Process-col select-5">
                        <i class="fa fa-search"></i>
                        <h4>3房2廳成家專區</h4>
                    </div>
                    </a>
                </div><!--col one forth for no space padding end-->

                <div class="col-one-fourth">
                   <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=18" onclick="ga('send', 'event', 'hyperlink', 'onclick', '超低公設比 TOP 20');">
                    <div class="Process-col select-4">
                        <i class="fa fa-search"></i>
                        <h4>超低公設比 TOP 20</h4>
                    </div>
                   </a>
                </div><!--col one forth for no space padding end-->
                 <div class="col-one-half">
                	<a href="https://snailhouse.com.tw/home?maxCount=12&themeId=1" onclick="ga('send', 'event', 'hyperlink', 'onclick', '內湖精選 TOP20');">
                    <div class="Process-col select-1">
                        <i class="fa fa-search"></i>
                        <h4>內湖精選 TOP 20</h4>
                    </div>
                    </a>
                </div><!--col one forth for no space padding end-->
                
                <div class="col-one-fourth">
                     <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=6"  onclick="ga('send', 'event', 'hyperlink', 'onclick', '高性價比電梯專區');">
                    <div class="Process-col select-6">
                        <i class="fa fa-search"></i>
                        <h4>高性價比電梯專區</h4>
                    </div>
                    </a>
                </div><!--col one forth for no space padding end-->
               
               
            </div><!--Process inline end-->
        <div class="clearfix"></div>
        <section class="form-submit-number">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <div class="center-heading heading-position">
                                <h2>物件編號快搜</h2>
                                <span class="center-line"></span>
                                <form role="form top-form" action="${pageContext.request.contextPath}/object/list" method="get">
                                      <div class="form-group col-sm-9 no-padding">
                                          <input type="number" class="form-control form-style" id="keyword" name="keyword" placeholder="輸入物件編號">
                                      </div>
                                      <div class="col-sm-3 no-padding">
                                          <button type="submit" class="btn btn-default button-right button-send">搜尋</button>
                                      </div>
                                </form>
                            </div>
                        </div>                   
                    </div>
                </div> 
        </section>	 
        
        <!--  
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="center-heading">
                        <h2>買屋賣屋，找窩牛最輕鬆！</h2>
                        <span class="center-line"></span>
                        <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/about-snail.jpg" alt="" class="img-responsive wow animated fadeIn" data-wow-duration="700ms" data-wow-delay="100ms" style="display: block;margin: 20px auto">
                    </div>
                </div>                   
            </div>
            <div class="row">
                    <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath}/object/list" onclick="ga('send', 'event', 'hyperlink', 'onclick', '搜尋更多物件');" class="btn border-theme btn-lg wow animated fadeInUp"><i class="fa fa-search"></i> 搜尋更多物件</a>
                    </div>
            </div>
		</div>
	    -->
	  
	    <div class="process-inline steps-inline clearfix">
                <div class="none_mobile">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="center-heading">
                        <h2>買賣房屋就是這麼簡單</h2>
                        <span class="center-line"></span>
                        <h4 class="hidden-xs">輕鬆好上手</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 buy-house">
            <div class="center-heading">
                <h3>買屋三步驟</h3>
            </div>
            <div class="col-md-4">
                <div class="circle-icon center-block">
                	<div class="display-content">123456789123456789</div>
                    <h4>搜尋</h4>
                </div>
            </div>
            <div class="col-md-4">
                <div class="circle-icon center-block">
                	<div class="display-content">123456789123456789</div>
                    <h4>看屋</h4>
                </div>
            </div>
            <div class="col-md-4">               
                <div class="circle-icon center-block">
                	<div class="display-content"><img src="https://dummyimage.com/600x400/000/fff" alt=""></div>
                    <h4>出價</h4>
                </div>

            </div>
            <div class="col-md-12">
                <a class="buy-sale-button" href="#">開始找房</a>
            </div>
        </div>
        <div class="col-md-6 sale-house">
            <div class="center-heading">
                <h3>賣屋三步驟</h3>
            </div>
            <div class="col-md-4">        
                <div class="circle-icon center-block">
            		<div class="display-content">123456789123456789</div>
                    <h4>刊登</h4>
                </div>

            </div>
            <div class="col-md-4 ">
                <div class="circle-icon center-block">
                	<div class="display-content">123456789123456789</div>
                    <h4>議價</h4>
                </div>
            </div>
            <div class="col-md-4">
                <div class="circle-icon center-block">
            		<div class="display-content">123456789123456789
            		<img src="https://dummyimage.com/200x100/000/fff" alt=""></div>
                    <h4>簽約</h4>
                </div>
            </div>
            <div class="col-md-12">
                <a class="buy-sale-button" href="#">開始刊登</a>
            </div>
        </div>
    </div>
       </div>   
       
   
        <div class="divide70"></div>
        <div class="container">

            <div class="row">
                <div class="col-md-7 margin40">
                    <h3 class="heading heading-deal">成交專區</h3>
                    <a href="https://snailhouse.com.tw/home?maxCount=12&themeId=14" onClick="ga('send', 'event', 'hyperlink', 'onclick', '首頁成交專區');"><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/sold-out-banner.jpg" class="img-responsive"/></a>
                    
                     <!-- sold-out houses start 
                    <div id="news-carousel" class="owl-carousel owl-spaced">
                        <div>
                            <a href="https://snailhouse.com.tw/object/18172">
                                <div class="item-img-wrap">
                                    <div class="news-fixed-height" style="background-image: url('<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/deal-01.jpg')"></div>                                    
                                </div>                       
                            </a> 
                            <div class="news-desc">
                                <span>【內湖成功路四段美宅】</span>
                                <h4><a href="https://snailhouse.com.tw/object/18172">台北市內湖區成功路4段324巷1弄5號5樓</a></h4>
                                <span><a href="https://snailhouse.com.tw/object/18172">詳細內容</a></span>
                            </div>
                        </div> 
                        <div>
                            <a href="https://snailhouse.com.tw/object/18172">
                                <div class="item-img-wrap">
                                    <div class="news-fixed-height" style="background-image: url('<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/deal-02.jpg')"></div>
                                </div>                       
                            </a> 
                            <div class="news-desc">
                                <span>【躍虎科技大樓】</span>
                                <h4><a href="https://snailhouse.com.tw/object/18102">台北市內湖區瑞光路580號4樓</a></h4>
                                <span><a href="https://snailhouse.com.tw/object/18102">詳細內容</a></span>
                            </div>
                        </div>
                        
                    </div>
                     sold-out houses end -->    
                </div><!--col 7 end use for latest news owl carousel slide-->
                
             
                <div class="col-md-5 margin20">
                    <div id="services" class="video_block">
					    <video id="video_control" width="100%" controls="controls" preload="none">
					        <source src="video/10min.mp4" type="video/mp4">
                        </video>
					</div>
                </div>
            </div>
        </div><!--latest news and why us container end-->
        <!-- 台灣大車隊活動banner
        <section class="new-event02">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center no-padding">
                       <a href="${pageContext.request.contextPath}/activity/55688?utm_source=snailhouse&utm_medium=small_banner&utm_campaign=%E5%8F%B0%E7%81%A3%E5%A4%A7%E8%BB%8A%E9%9A%8A%E6%8E%A8%E5%BB%A3%E6%B4%BB%E5%8B%95">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner02-text-lg.png" class="img-responsive hidden-sm hidden-xs" />
                       </a>
                       <a href="${pageContext.request.contextPath}/activity/55688?utm_source=snailhouse&utm_medium=small_banner&utm_campaign=%E5%8F%B0%E7%81%A3%E5%A4%A7%E8%BB%8A%E9%9A%8A%E6%8E%A8%E5%BB%A3%E6%B4%BB%E5%8B%95">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner02-text-sm.png" class="img-responsive hidden-lg hidden-md " />
                       </a> 
                    </div>
                </div>
                
            </div>
        </section>
        -->
        <!-- 全民加薪活動 banner
        <section class="new-event">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center no-padding">
                       <a href="${pageContext.request.contextPath}/events/cooperative">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner01-text-lg.png" class="img-responsive hidden-sm hidden-xs" />
                       </a>
                       <a href="${pageContext.request.contextPath}/events/cooperative">
                         <img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/banner01-text-sm.png" class="img-responsive hidden-lg hidden-md " />
                       </a> 
                    </div>
                </div>
            </div>
        </section>
        -->
        <div class="divide70"></div>

<%@ include file="common/rwdfooter.jsp" %>
<%@ include file="common/ga.jsp" %> 	
</body>
</html>