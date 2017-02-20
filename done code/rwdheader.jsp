<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.zstrength.CONSTANT"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String userAgent = request.getHeader("user-agent");
System.out.println("userAgent ="+userAgent );
boolean isIE7 =userAgent.matches("(.*)MSIE 7.(.*)");

response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
%> 
<c:if test="${isIE7 }">
<script type="text/javascript">
function init() {
   	var yes = confirm("窩牛網使用台新銀行金流服務，全程採用最安全的 SSL 128 bits安全加密機制\n窩牛網建議使用瀏覽器版本：Chrome, Firefox, Safari，IE 11以上 造成您的不便，敬請見諒！");
   	location.replace("https://www.google.com/chrome/browser/desktop/index.html");    
}
window.onload = init;
</script>
</c:if>
<!-- Facebook Fanpage Like -->
<div id="fb-root"></div>
<script>
function callApplyObj() {
	document.getElementById('header_nonlogin').submit();
}

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.6&appId=149788711726120";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

</script>

	<form id="header_nonlogin" action="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login" method="POST" >
      		 	<input type="hidden" name="fromUrl" value="/member/sell/object/applySetup">
     </form>



        <!--top-bar-dark start here-->
         <div class="top-bar-dark">            
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-xs-3 ">                  
                    </div>
                    <div class="col-md-9 col-xs-9 text-right">
                        <ul class="list-inline top-dark-right">                      
                            <li><i class="fa fa-envelope"></i><a href="mailto:support@snailhouse.com.tw">support@snailhouse.com.tw</a></li>
                            <li><i class="fa fa-phone"></i><a href="tel:0277292997"> 02 7729 2997</a></li>
                            <li>
                            	<c:choose>
    									<c:when test="${ not empty sessionScope.usrmember }">
                            			<i class="fa fa-file-text-o"></i><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/sell/object/applySetup"> 我要刊登</a>
                            			</c:when>
                            			<c:otherwise>
                            			<i class="fa fa-file-text-o"></i><a href="javascript:;" onclick="callApplyObj();"> 我要刊登</a>	
                            			</c:otherwise>
                            		</c:choose>
                            </li>
                            <c:choose>
    						<c:when test="${ empty sessionScope.usrmember }">
                            <li><i class="fa fa-lock"></i><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login"> 會員登入</a></li>
                            </c:when>
                            </c:choose>
                            <li><i class="fa fa-user"></i>
                            	<c:choose>
    									<c:when test="${ not empty sessionScope.usrmember }">
                            						<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/center"> 會員中心(你的會員編號:${ sessionScope.usrmember.memberNumber })</a>
                            			</c:when>
                            			<c:otherwise>
                            						<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/register?act=register"> 註冊會員</a>			
                            			</c:otherwise>
                            	</c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!--top-bar-dark end here-->
        <!--navigation -->
        <!-- Static navbar -->
        <div class="navbar navbar-static-top yamm sticky header-container" id="stick-header" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand logo-style" href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>"><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/logo-index.png" alt="index"></a>
                    
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>">首頁 <i class="fa"></i></a>
                        </li>
                    	<li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">精選專區<i class="fa fa-angle-down"></i></a>                          
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_HOME_URL%>"><i class="fa fa-chevron-circle-right"></i>住宅</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_OFFICE_URL%>"><i class="fa fa-chevron-circle-right"></i>商辦</a></li>  
                                </ul>           
                        </li> 
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">最新活動<i class="fa fa-angle-down"></i></a>                          
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/thekahan" target="_blank" onclick="ga('send', 'event', 'hyperlink', 'onclick', '遇水則發專案-navigation');"><i class="fa fa-chevron-circle-right"></i> 遇水則發專案</a></li>	
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/cbm" onclick="ga('send', 'event', 'hyperlink', 'onclick', '註冊會員好康快送-navigation');"><i class="fa fa-chevron-circle-right"></i> 註冊會員 好康快送</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/55688" onclick="ga('send', 'event', 'hyperlink', 'onclick', '台灣大車隊優惠活動-navigation');"><i class="fa fa-chevron-circle-right"></i> 台灣大車隊優惠活動</a></li>	
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/news98"><i class="fa fa-chevron-circle-right"></i> NEWS98會員住品味精選</a></li>                               
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/events/cooperative"><i class="fa fa-chevron-circle-right"></i> 我要推薦賺獎金</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/events/cooperative_sub"><i class="fa fa-chevron-circle-right"></i> 全民加薪活動專區</a></li>  
                                </ul>           
                        </li>
<%--                         <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_HOME_URL%>" class="dropdown">住宅</a>                           
                        </li>
                        <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_OFFICE_URL%>" class="dropdown">商辦 </a>                          
                        </li> --%>
                        <c:if test="${ not empty sessionScope.usrmember }">
<!--                         <li class="dropdown">
                            <a href="https://newhouse.snailhouse.com.tw/case/proj/list" class="dropdown" target="_blank">新建案 <i class="fa"></i></a>        
                        </li> -->
                        </c:if>
                        <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/price" class="dropdown">實價登錄 <i class="fa"></i></a>        
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">刊登方案 <i class="fa fa-angle-down"></i></a>                            
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service_price.html"><i class="fa fa-chevron-circle-right"></i> 服務內容</a></li>
                                <li>
                                    <c:choose>
	    								<c:when test="${ not empty sessionScope.usrmember }">
	                            			<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/sell/object/applySetup"><i class="fa fa-chevron-circle-right"></i> 我要刊登</a>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login"><i class="fa fa-chevron-circle-right"></i> 我要刊登</a>	
	                            		</c:otherwise>
                                    </c:choose>
                                </li> 
                                <li>
                                		<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/tutor/apply"><i class="fa fa-chevron-circle-right"></i> 如何快速刊登</a>
                                </li>
                            </ul>
                        </li>
                        <!--menu 活動 li end here
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">專屬活動 <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#"><i class="fa fa-chevron-circle-right"></i> 招募推薦人活動</a></li>
                                <li><a href="#"><i class="fa fa-chevron-circle-right"></i> 最新活動</a></li>
                            </ul>
                        </li>
                        -->
                        <!--menu 窩牛情報站 li end here-->
                        <li class="dropdown">
                            <a href="https://snailhouse.com.tw/news" target="_blank" class="dropdown">情報站 <i class="fa"></i></a>
                        </li>
                        <!--menu 會員中心-->
                         <c:if test="${ not empty sessionScope.usrmember }">
	                        <li class="dropdown">
	                        		<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/center_m" class="dropdown myfav"><i class="fa fa-lock"></i>會員中心</a>	
	                        </li>  
                        </c:if>                        
                        <!--menu LOGIN-->
                        <li class="dropdown hidden-lg hidden-md hidden-sm">
                        <c:if test="${empty sessionScope.usrmember }">
                            <a href="${pageContext.request.contextPath}/member/login" class=" dropdown-toggle" ><i class="fa fa-lock"></i> 會員登入</a>
                       		<a href="${pageContext.request.contextPath}/member/register?act=register" class=" dropdown-toggle" ><i class="fa fa-user"></i> 註冊會員</a>
                        </c:if>
                        </li> <!--menu login li end here-->                        
                    </ul>
                </div><!--/.nav-collapse -->
            </div><!--container-->
            <div class="searchbar-bg">
               <div class="container searchbar_container" style="opacity: 0">
                    <div class="col-city first_select">
                        <div id="my-select"></div>
                    </div>
                    <div class="col-area second_select">
                        <div id="my-select2"></div>
                    </div>
                    <div class="col-type third_select">
                        <div id="my-select3"></div>
                    </div>
                    <div class="col-price forth_select">
                        <div id="my-select4"></div>
                        <div class="sol-option" id="priceInput"><label class="sol-label"><input type="radio" id="priceradio" class="sol-radio" name="價格" item="" value=""><input type="text" class="inputprice" id="pricelow" name="價格" item="" placeholder="最低">-<input type="text" class="inputprice" id="priceheigh" name="價格" item="" placeholder="最高"></label></div>
                    </div>
                    <div class="displayKeyword">
                        <div class="searchDiv">
                            <a class="searchButton" href="javascript:;">找房子</a>
                        </div>
                        <div class="keywordBottom">
                            <span id="print-item">關鍵字:</span>
                        </div>
                    </div>
                    <div class="col-search">
                  <input type="search" name="搜尋" id="searchRun" class="keywordBar" placeholder="輸入關鍵字或房屋編號" value="">
                   <a class="searchButton" href="javascript:;">找房子</a>
                    </div>
                </div>
            </div><!--search_bar-->
        </div><!--navbar-default-->
		<!-- header end -->	
		<div id="about"></div>
