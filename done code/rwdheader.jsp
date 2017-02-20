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
   	var yes = confirm("�ۤ����ϥΥx�s�Ȧ���y�A�ȡA���{�ĥγ̦w���� SSL 128 bits�w���[�K����\n�ۤ�����ĳ�ϥ��s���������GChrome, Firefox, Safari�AIE 11�H�W �y���z�����K�A�q�Ш��̡I");
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
                            			<i class="fa fa-file-text-o"></i><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/sell/object/applySetup"> �ڭn�Z�n</a>
                            			</c:when>
                            			<c:otherwise>
                            			<i class="fa fa-file-text-o"></i><a href="javascript:;" onclick="callApplyObj();"> �ڭn�Z�n</a>	
                            			</c:otherwise>
                            		</c:choose>
                            </li>
                            <c:choose>
    						<c:when test="${ empty sessionScope.usrmember }">
                            <li><i class="fa fa-lock"></i><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login"> �|���n�J</a></li>
                            </c:when>
                            </c:choose>
                            <li><i class="fa fa-user"></i>
                            	<c:choose>
    									<c:when test="${ not empty sessionScope.usrmember }">
                            						<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/center"> �|������(�A���|���s��:${ sessionScope.usrmember.memberNumber })</a>
                            			</c:when>
                            			<c:otherwise>
                            						<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/register?act=register"> ���U�|��</a>			
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
                            <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>">���� <i class="fa"></i></a>
                        </li>
                    	<li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">���M��<i class="fa fa-angle-down"></i></a>                          
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_HOME_URL%>"><i class="fa fa-chevron-circle-right"></i>��v</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_OFFICE_URL%>"><i class="fa fa-chevron-circle-right"></i>�ӿ�</a></li>  
                                </ul>           
                        </li> 
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">�̷s����<i class="fa fa-angle-down"></i></a>                          
                                <ul class="dropdown-menu" role="menu">
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/thekahan" target="_blank" onclick="ga('send', 'event', 'hyperlink', 'onclick', '�J���h�o�M��-navigation');"><i class="fa fa-chevron-circle-right"></i> �J���h�o�M��</a></li>	
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/cbm" onclick="ga('send', 'event', 'hyperlink', 'onclick', '���U�|���n�d�ְe-navigation');"><i class="fa fa-chevron-circle-right"></i> ���U�|�� �n�d�ְe</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/55688" onclick="ga('send', 'event', 'hyperlink', 'onclick', '�x�W�j�����u�f����-navigation');"><i class="fa fa-chevron-circle-right"></i> �x�W�j�����u�f����</a></li>	
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/activity/news98"><i class="fa fa-chevron-circle-right"></i> NEWS98�|����~�����</a></li>                               
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/events/cooperative"><i class="fa fa-chevron-circle-right"></i> �ڭn�����ȼ���</a></li>
                                  <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/events/cooperative_sub"><i class="fa fa-chevron-circle-right"></i> �����[�~���ʱM��</a></li>  
                                </ul>           
                        </li>
<%--                         <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_HOME_URL%>" class="dropdown">��v</a>                           
                        </li>
                        <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_OFFICE_URL%>" class="dropdown">�ӿ� </a>                          
                        </li> --%>
                        <c:if test="${ not empty sessionScope.usrmember }">
<!--                         <li class="dropdown">
                            <a href="https://newhouse.snailhouse.com.tw/case/proj/list" class="dropdown" target="_blank">�s�خ� <i class="fa"></i></a>        
                        </li> -->
                        </c:if>
                        <li class="dropdown">
                            <a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/price" class="dropdown">����n�� <i class="fa"></i></a>        
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">�Z�n��� <i class="fa fa-angle-down"></i></a>                            
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service_price.html"><i class="fa fa-chevron-circle-right"></i> �A�Ȥ��e</a></li>
                                <li>
                                    <c:choose>
	    								<c:when test="${ not empty sessionScope.usrmember }">
	                            			<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/sell/object/applySetup"><i class="fa fa-chevron-circle-right"></i> �ڭn�Z�n</a>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/login"><i class="fa fa-chevron-circle-right"></i> �ڭn�Z�n</a>	
	                            		</c:otherwise>
                                    </c:choose>
                                </li> 
                                <li>
                                		<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/tutor/apply"><i class="fa fa-chevron-circle-right"></i> �p��ֳt�Z�n</a>
                                </li>
                            </ul>
                        </li>
                        <!--menu ���� li end here
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">�M�ݬ��� <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#"><i class="fa fa-chevron-circle-right"></i> �۶ұ��ˤH����</a></li>
                                <li><a href="#"><i class="fa fa-chevron-circle-right"></i> �̷s����</a></li>
                            </ul>
                        </li>
                        -->
                        <!--menu �ۤ������� li end here-->
                        <li class="dropdown">
                            <a href="https://snailhouse.com.tw/news" target="_blank" class="dropdown">������ <i class="fa"></i></a>
                        </li>
                        <!--menu �|������-->
                         <c:if test="${ not empty sessionScope.usrmember }">
	                        <li class="dropdown">
	                        		<a href="<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/member/center_m" class="dropdown myfav"><i class="fa fa-lock"></i>�|������</a>	
	                        </li>  
                        </c:if>                        
                        <!--menu LOGIN-->
                        <li class="dropdown hidden-lg hidden-md hidden-sm">
                        <c:if test="${empty sessionScope.usrmember }">
                            <a href="${pageContext.request.contextPath}/member/login" class=" dropdown-toggle" ><i class="fa fa-lock"></i> �|���n�J</a>
                       		<a href="${pageContext.request.contextPath}/member/register?act=register" class=" dropdown-toggle" ><i class="fa fa-user"></i> ���U�|��</a>
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
                        <div class="sol-option" id="priceInput"><label class="sol-label"><input type="radio" id="priceradio" class="sol-radio" name="����" item="" value=""><input type="text" class="inputprice" id="pricelow" name="����" item="" placeholder="�̧C">-<input type="text" class="inputprice" id="priceheigh" name="����" item="" placeholder="�̰�"></label></div>
                    </div>
                    <div class="displayKeyword">
                        <div class="searchDiv">
                            <a class="searchButton" href="javascript:;">��Фl</a>
                        </div>
                        <div class="keywordBottom">
                            <span id="print-item">����r:</span>
                        </div>
                    </div>
                    <div class="col-search">
                  <input type="search" name="�j�M" id="searchRun" class="keywordBar" placeholder="��J����r�ΩЫνs��" value="">
                   <a class="searchButton" href="javascript:;">��Фl</a>
                    </div>
                </div>
            </div><!--search_bar-->
        </div><!--navbar-default-->
		<!-- header end -->	
		<div id="about"></div>
