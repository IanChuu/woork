<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.zstrength.CONSTANT"%>
<%@ page import="java.lang.String.*" %>
<%@ page import="com.zstrength.building.pojo.BuildingBasicdatas" %>
<%
 BuildingBasicdatas buildingInfo  =(BuildingBasicdatas)request.getAttribute("data");
 //樓層規劃
 String upCount = "";
 String underCount = "";
 if(buildingInfo.getFloorDesign() !=null){
     String[] floorDesignItems = buildingInfo.getFloorDesign().replaceAll("\\[", "").replaceAll("\\]", "").split(",");
     if(floorDesignItems.length==2){
        upCount = floorDesignItems[0];
        underCount = floorDesignItems[1];    
     }
 }
 //棟戶規劃
 String buildingCount = "";
 String objectCount = "";
 if(buildingInfo.getBuildingsPlan() !=null){
     String[] buildingPanItems = buildingInfo.getBuildingsPlan().replaceAll("\\[", "").replaceAll("\\]", "").split(",");
     if(buildingPanItems.length==2){
        buildingCount = buildingPanItems[0];
        objectCount = buildingPanItems[1];
     }
 } 
%>  
<c:set var="upCount" value="<%=upCount%>" />
<c:set var="underCount" value="<%=underCount%>" />
<c:set var="buildingCount" value="<%=buildingCount%>" />
<c:set var="objectCount" value="<%=objectCount%>" />


<html xmlns="http://www.w3.org/1999/xhtml" prefix="og: http://ogp.me/ns# fb:http://www.facebook.com/2008/fbml">
<head>
<title>${data.buildingName} ${address} - 窩牛網</title>
<meta name="description" content="${fn:replace(data.subject,'<br>','，')}" />
<!-- facebook -->
<meta property="og:description" content="${fn:replace(data.subject,'<br>','，')}" />
<meta property="og:title" content="大樓資訊 ${data.buildingName}"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://snailhouse.com.tw/building/${data.buildingId}"/>
<meta property="og:image" content="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/fb-dm4.jpg"/>
<meta property="og:site_name" content="窩牛網 SnailHouse | 買好窩 賣好窩 都在窩牛網" />
<%@ include file="../common/rwdlibrary_index.jsp" %>
<link href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/css/detail-page.css" rel="stylesheet" type="text/css" media="screen">
<link  href="<c:url value="/resources/css/fotorama-4.6.4/fotorama.css"/>" rel="stylesheet"> 
<style>
//google map icon
.gmap{
  margin: 10px;
  width: 100%;
  height: 400px;
}

.mapTable{
   font-size: 12px;
}

.mapTable .active {
    background: #3F51B5;
}
.mapTable img {

}
.active span {
    color:#fff;
}
#map_distance {
    float: left;
    width: 80%;
    height: 500px;
    border: 1px solid lightgrey;
}
#listing {
    float: left;
    width: 20%;
    height: 500px;
    overflow: auto;
    overflow-x: hidden;
    border: 1px solid lightgrey;
}
#controls {
    width: 100%;
    padding-top: 2px;
    border:1px solid lightgrey;
    height: inherit;
}
#typeLabel {
    font-weight:700;
    font-size:20px;
}
#rankByLabel {
    font-weight:700;
    font-size:20px;
}
#keywordField {
    position: relative;
    float: right;
    margin-top: -3px;
}
#keyword {
    width: 100%;
    border: 1px solid #B5B5B5;
    font-size:16px;
    min-height: inherit;
    line-height: inherit;
    transition:1s;
}
#keyword:focus {
    box-shadow: 0px 0px 5px 0px #3F51B5;
    border: 1px solid #3F51B5;
}
.placeIcon {
    width: 20px;
    height: 20px;
    margin: 10px;
}
.hotelIcon {
    width: 24px;
    height: 24px;
}
#resultsTable {
    border-collapse: collapse;
    width: 240px;
}
#rating {
    font-size: 13px;
}
#keywordsLabel {
    width: 300px;
    font-size: 14px;
    padding: 4px;
}

.iw_table_row {
    height: 18px;
}
.iw_attribute_name {
    font-weight: bold;
    text-align: right;
    font-color:000000;
    color:000000;
}
.control_panel {
    float: left;
    width: 150px;
}

.content {
    width: 1050px;
}

    .control_panel {
        width: 100%;
    }
    
    .mapTable label {
        color: #555;
        float: left;
        width: 10%;
        cursor: pointer;
    }
    .mapSearch {
      width: 10%;
        float: left;
    }
    .mapTable input {
        display: none;
    }
    #otherlabel {
          width: 100%;
    position: absolute;
    z-index: 10000;
    }
    #keywordField {
      position: inherit;
      float: inherit;
    }
    .distance {
    font-size:14px;
    }
    #results td {
    padding:5px 0;
    }
    
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.0.min.js" />"></script>
<!--google map api環景照片用-->
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyArtus-OdK3yUnFDDLE2Gpt5DMXmIi_Y6U"></script> -->
<!--google map 環境區域 距離用-->

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyArtus-OdK3yUnFDDLE2Gpt5DMXmIi_Y6U"></script>
</head>
<body>
<%@ include file="../common/rwdheader_index.jsp" %>
<%@ include file="../common/loading.jsp"%> 
<%@ include file="../price/popup.jsp" %>
       <!--container-->        
            <div class="breadcrumb-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 detail-title">
                        <h4>${data.buildingName}</h4>
                    </div>
                    <div class="col-sm-6 hidden-xs text-right">
                        <ol class="breadcrumb">
                            <li><a href="${homePath}">首頁</a></li>
                            <li><a href="${pageContext.request.contextPath}/building/navigation?landNumber=${data.landNumber}">區域導覽</a></li>
                            <li>${data.buildingName}(編號:${data.buildingId})</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div><!--breadcrumbs-->
        <div class="divide20"></div>
        <div class="container bottom-line">
             <div class="col-md-8 col-sm-12 padding-none">
                <ul id="myTab" class="nav nav-tabs">
                  <li class="active"><a href="#home" data-toggle="tab">大樓照片</a></li>              
                 </ul>
                <div id="myTabContent" class="tab-content">
                   <div class="tab-pane fade in active" id="home">
                     <c:choose>
                      <c:when test="${photos.size() eq 0}">
                          <div class="fotorama" data-width="100%" data-height="auto" data-maxwidth="100%"  data-maxheight="100%">
                            <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/non-building.jpg" data-caption="尚無照片">                   
                          </div>          
                      </c:when>
                      <c:otherwise>
                      <div class="fotorama" data-nav="thumbs" data-width="100%" data-height="auto" data-maxwidth="100%"  data-maxheight="100%" data-allowfullscreen="native" data-loop="true" style="background-color:rgba(0,0,0,0.7);">
                      <c:forEach var="item" items="${photos}" varStatus="idx">
                        <img src="${pageContext.request.contextPath}/images/get?photoId=${item.photoId}&type=medium"
                            data-full="${pageContext.request.contextPath}/images/get?photoId=${item.photoId}&type=large" 
                            data-caption="${data.buildingName} ${item.description}" >
                      </c:forEach>  
                      </div>
                      </c:otherwise>
                    </c:choose>  
               </div>
                </div>                       
             </div>     
       
            <div class=" col-md-4 col-sm-12 detail-border detail-margin-top-b list-detail-section">
            
               <h2>大樓基本資料</h2>
               <ul class="list-detail">
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>大樓名稱：</div><div class="col-xs-7">${data.buildingName}</div>
                    <div class="col-xs-5 pull-left"><i class="fa fa-caret-right padding-right"></i>大樓地址：</div><div class="col-xs-7">${address}</div>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>基地面積：</div><div class="col-xs-7"><fmt:formatNumber type="number" value="${data.baseTotalArea}" />
                        <c:choose>
                            <c:when test="${data.areaUnit eq '1'}">坪</c:when>
                            <c:otherwise>平方公尺</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>總面積：</div><div class="col-xs-7"><fmt:formatNumber type="number" value="${data.totalSquareMeters}" />平方公尺</div>          
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>標準單層：</div><div class="col-xs-7"><fmt:formatNumber type="number" value="${data.standardSquareMeters}" />平方公尺</div>          
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>使用分區：</div><div class="col-xs-7">${data.usageType}</div>
                    <c:choose>
                        <c:when test="${not empty houseAge}">
                            <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>屋齡：</div><div class="col-xs-7">
                            <c:choose>
                                <c:when test="${houseAge ==-1 }">
                                施工建照中
                                </c:when>
                                <c:otherwise>
                                <fmt:formatNumber type="number" pattern="###" value="${houseAge/12}" />年${houseAge%12}月
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>完工日期：</div><div class="col-xs-7">${data.completedDate}</div>
                        </c:otherwise>
                    </c:choose>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>樓層規劃：</div><div class="col-xs-7"><c:if test="${not empty upCount}">地上${upCount}層</c:if><c:if test="${not empty underCount}">/地下${underCount}層</c:if></div>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>建物結構：</div><div class="col-xs-7">${data.structureType}</div>
                    <div class="col-xs-5 pull-left"><i class="fa fa-caret-right padding-right"></i>棟數：</div>
                    <div class="col-xs-7 pull-left"><c:if test="${not empty buildingCount}">${buildingCount} 棟</c:if></div>
                    <div class="col-xs-5 pull-left"><i class="fa fa-caret-right padding-right"></i>戶數：</div>
                    <div class="col-xs-7 pull-left"><c:if test="${not empty objectCount}">${objectCount} 戶</c:if></div>
                    <div class="col-xs-5 pull-left"><i class="fa fa-caret-right padding-right"></i>大樓座向：</div>
                    <c:choose>
                        <c:when test="${not empty data.positions and data.positions ne '尚未設定'}">
                        <div class="col-xs-7 pull-left">${data.positions }</div>
                        </c:when>
                        <c:otherwise><div class="col-xs-7">&nbsp;</div></c:otherwise>
                    </c:choose>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>客貨電梯：</div><div class="col-xs-7">${data.elevator}客梯   ${data.goodsElevator}貨梯</div>
                    <div class="col-xs-5 pull-left"><i class="fa fa-caret-right padding-right"></i>車位規劃：</div>
                    <div class="col-xs-7 pull-left">
                        <c:if test="${parkings.size() eq 0}">&nbsp;</c:if> 
                        <c:forEach var="item" items="${parkings}" varStatus="idx">
                            ${item.description}
                        </c:forEach>
                    </div>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>1樓高度：</div><div class="col-xs-7">${data.firstFloorHeight}  米</div>
                    <div class="col-xs-5"><i class="fa fa-caret-right padding-right"></i>標準層高度：</div><div class="col-xs-7">${data.standardFloorHeight}  米</div>
               </ul>
            </div>
         </div>
        <!-- START OF 文章區塊--> 
        <c:if test="${articles.size() gt 0}">
        <div class="container bottom-line blog-connect">
        <c:choose>
        <c:when test="${articles.size() gt 3}">
            <h2>你會感興趣的<a href="http://news.snailhouse.com.tw" target="_blank" class="title-more">更多相關文章</a></h2>            
        </c:when>
        <c:otherwise><h2>你會感興趣的</h2></c:otherwise>
        </c:choose>
            <div class="row">
            <c:choose>
                <c:when test="${articles.size() eq 1}">
                <c:forEach var="item" items="${articles}" varStatus="idx">
                  <div class="post">
                    <div class="col-md-3 col-sm-6"><img src="${item.imageUrl}" class="img-responsive blog-img-02" /></div>
                    <div class="col-md-3 col-sm-6"><h3>${item.title}</h3><p class="blog-content">${fn:substring(item.content,1,65)}<span class="show-more">... <a href="${item.url}" target="_blank" class="content-more">閱讀文章</a></span></p></div>
                  </div>
                </c:forEach>
                <!-- 活動 -->             
              <div class="post">    
                <div class="col-md-3 col-sm-6"><img src="http://2.bp.blogspot.com/-U2aiSCMI8z0/VhdBsyKAUEI/AAAAAAAAAf4/suwmKlKFDrc/s640/suanpan-013.jpg" class="img-responsive blog-img-02" /></div>
                <div class="col-md-3 col-sm-6"><h3>實價登錄金算盤</h3><p class="blog-content">還在等待好康和運氣嗎？幸福不求人，現在就替自己算算想買的房子要付多少錢，全透明的實價資料和輕鬆的計算方式，讓你成為擁有金算盤的準贏家。<span class="show-more"><a href="${pageContext.request.contextPath}/price" target="_blank" class="content-more">立馬來算</a></span></p></div>
              </div>                
                </c:when>                               
                <c:when test="${articles.size() eq 2}">
                <c:forEach var="item" items="${articles}" varStatus="idx">
                  <div class="post">
                    <div class="col-md-3 col-sm-6"><img src="${item.imageUrl}" class="img-responsive blog-img-02" /></div>
                    <div class="col-md-3 col-sm-6"><h3>${item.title}</h3><p class="blog-content">${fn:substring(item.content,1,65)}<span class="show-more">... <a href="${item.url}" target="_blank" class="content-more">閱讀文章</a></span></p></div>
                  </div>
                </c:forEach>
                </c:when>                               
                <c:when test="${articles.size() ge 3}">
                <c:forEach var="item" items="${articles}" varStatus="idx">
                    <c:if test="${idx.index+1 le 3}">
                <div class="col-sm-4 "><img src="${item.imageUrl}" class="img-responsive blog-img-03" /><h3>${item.title}</h3><p class="blog-content">${fn:substring(item.content,1,65)}<span class="show-more">... <a href="${item.url}" target="_blank" class="content-more">閱讀文章</a></span></p></div>
                    </c:if>
                </c:forEach>
                </c:when>                               
            </c:choose>         
            </div>
        </div>
        </c:if> 
        <!-- END OF 文章區塊-->
        <c:if test="${not empty usageFile}"> 
        <div class="container bottom-line list-detail-section">
            <div class="col-md-12 list-detail">
               <h2>資料查閱</h2>
                    <c:choose>
                        <c:when test="${not empty sessionScope.usrmember }">
                            <c:if test="${not empty usageFile}">
                            <div class="col-md-3 col-sm-6 col-xs-6 no-padding"><a href="#"  onClick="javascript:openFile('${usageFile.fileId}');"><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/paper-check-01.png" class="img-responsive" alt="paper"></a><h4><a class="paper" href="#" onClick="javascript:openFile('${usageFile.fileId}');">使用執照</a></h4></div>
                           </c:if>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty usageFile}">
                            <div class="col-md-3 col-sm-6 col-xs-6 no-padding"><a href="#"  onClick="javascript:alertDocMsg();"><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/paper-check-01.png" class="img-responsive" alt="paper"></a><h4><a class="paper" href="#" onClick="javascript:alertDocMsg();">使用執照</a></h4></div>
                           </c:if>
                        </c:otherwise>
                    </c:choose>
            </div>
         </div>  
         </c:if>  
           
         <c:if test="${not empty data.subject and data.subject ne '尚未設定'}">       
         <div class="container bottom-line list-detail-section">
         <c:set var="arrayDesc" value="${fn:split(data.subject,'<br/>')}"/>
            <div class="col-md-12 list-detail">
               <h2>特色</h2>
                    <c:forEach var="row" items="${arrayDesc}" begin="0" end="3" varStatus="idx">
                         <div class="col-lg-12 list-align"><i class="fa fa-check-circle padding-right"></i>${row}</div>
                    </c:forEach>
            </div>
            <div class="col-md-12 list-detail">
               <h2>地理環境</h2>
                    <div class="container bottom-line list-detail-section">
                        <div class="col-lg-12">
                            <div class="control_panel">
                                    <div class="mapTable">
                                        <input type="radio" value="park" name="input" id="park" onclick="doOnClick(this)">
                                        <label for="park">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/park.png'><span>公園</span>
                                        </label>
                                        <input type="radio" value="hospital" name="input" id="hospital" onclick="doOnClick(this)">
                                        <label for="hospital">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/hospital.png'><span>醫院</span>
                                        </label>
                                        <input type="radio" value="school" name="input" id="school" onclick="doOnClick(this)">
                                        <label for="school">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/school.png'><span>學校</span>
                                        </label>
                                        <input type="radio" value="restaurant" name="input" id="restaurant" onclick="doOnClick(this)">
                                        <label for="restaurant">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/restaurant.png'><span>餐廳</span>
                                        </label>
                                        <input type="radio" value="bank" name="input" id="bank" onclick="doOnClick(this)">
                                        <label for="bank">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/bank.png'><span>銀行</span>
                                        </label>
                                        <input type="radio" value="convenience_store" name="input" id="convenience_store" onclick="doOnClick(this)">
                                        <label for="convenience_store">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/convenience_store.png'><span>便利商店</span>
                                        </label>
                                        <input type="radio" value="grocery_or_supermarket" name="input" id="grocery_or_supermarket" onclick="doOnClick(this)">
                                        <label for="grocery_or_supermarket">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/grocery_or_supermarket.png'><span>超級市場</span>
                                        </label>
                                        <input type="radio" value="train_station" name="input" id="train_station" onclick="doOnClick(this)">
                                        <label for="train_station">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/train_station.png'><span>捷運及火車</span>
                                        </label>
                                        <input type="radio" value="bus_station" name="input" id="bus_station" onclick="doOnClick(this)">
                                        <label for="bus_station">
                                            <img src='https://wr-snailhouse.cdn.hinet.net/webresource/office/img/mapicon/bus_station.png'><span>公車站</span>
                                        </label>
                                        <div class="mapSearch">
                                            <div id="keywordField">
                                                <input class="form-control" placeholder="搜尋關鍵字" style="display: block;color: #555;" id="keyword" type="text" onkeydown="if (event.keyCode == 13){doOnSearch(this);}">
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <div id="map_distance"></div>
                            <div id="listing">
                                <table id="resultsTable" style="color:#666;font-size:1.2em">
                                    <tbody id="results"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
            </div>
            <c:if test="${fn:length(arrayDesc) >4}">
                <div class="col-md-4 list-detail list-padding-top">
                        <c:forEach var="row" items="${arrayDesc}" begin="4" end="7" varStatus="idx">
                             <div class="col-lg-12 list-align"><i class="fa fa-check-circle padding-right"></i>${row}</div>
                        </c:forEach>
                </div>
            </c:if>
            <c:if test="${fn:length(arrayDesc)  >8}">
                <div class="col-md-4 list-detail list-padding-top">
                    <c:forEach var="row" items="${arrayDesc}" begin="8" end="11" varStatus="idx">
                         <div class="col-lg-12 list-align"><i class="fa fa-check-circle padding-right"></i>${row}</div>
                    </c:forEach>
                </div>
            </c:if>
            <div class="col-md-4 list-detail"></div>   
         </div>
         </c:if>
         
         <c:if test="${linkedList.size()>0}">
         <div class="container bottom-line real-price table-responsive"> 
            <h2>大樓關聯實價資料</h2>
              <table class="table table-striped" id="linkedPriceTable">
                       <thead>
                            <tr>
                                <th>交易日期</th>
                                <th>資料類型</th>
                                <th>距離(公尺)</th>
                                <th>地址</th>
                                <th>樓層</th>
                                <th>移轉總面積</th>
                                <th>售價</th>
                             </tr>
                       </thead>
                        <tbody >
                          <c:forEach var="item" items="${linkedList}" varStatus="idx">
                          <tr>
                            <td>${item.txnYearMonth}</td>
                            <td><c:if test="${not empty item.regType and item.regType == 01}">
                                    <c:out value="不動產買賣"></c:out>
                                </c:if>
                                <c:if test="${not empty item.regType and item.regType == 02}">
                                    <c:out value="預售屋買賣"></c:out>
                                </c:if>
                                <c:if test="${not empty item.regType and item.regType == 03}">
                                    <c:out value="租屋"></c:out>
                                </c:if>
                            </td>       
                            <td>${item.distance}</td>
                            <td><a href="${pageContext.request.contextPath}/price/reg/${item.regId}"  class="fancybox fancybox.iframe" style="color: #BE4A4A;">${item.address}</a></td>
                            <td>${item.migrationFloor}/共${item.totalFloors}層</td>
                            <td>土地:${item.totalLandPings}坪<br>建物:${item.totalbuildingPings}坪<br>停車位:${item.parkingTotalPings}坪</td>
                            <td><fmt:formatNumber type="number" value="${item.totalPrice/10000}" maxFractionDigits="3" />萬</td>       
                          </tr>         
                          </c:forEach>                        
                        </tbody>
                </table>
         </div>
         </c:if>         
         <div class="container bottom-line real-price table-responsive"> 
            <h2>附近實價登錄行情</h2>
              <div id="waitPrices" style="display:block;">資料查詢中...</div>
              <table class="table table-striped" id="priceTable">
                       <!-- table head -->
                       <thead>
                            <tr>
                                <th>交易日期</th>
                                <th>地址</th>
                                <th>類型</th>
                                <th>售價</th>
                                <th>每坪單價</th>
                                <th>建坪</th>
                                <th>屋齡</th>
                                <th>樓層</th>
                                <th>備註</th>
                              </tr>
                       </thead>

                        <tbody id="priceTableBody">
                        </tbody>
                </table>
                <c:choose>
                    <c:when test="${ not empty data.buildingKind and data.buildingKind eq 1}">
                        <div style="margin-top:10px;"><i class="fa fa-plus-square padding-right"></i><a href="${pageContext.request.contextPath}/price/list?regType=01&period=3&usageType=2&targetCode=A,B,C,D,E&latitude=${latitude}&longitude=${longitude}&meters=1500&count=100&townCode=${data.baseSection}" target="building">更多周遭實價登錄資料</a></div>
                    </c:when>
                    <c:when test="${ not empty data.buildingKind and data.buildingKind eq 2}">
                        <div style="margin-top:10px;"><i class="fa fa-plus-square padding-right"></i><a href="${pageContext.request.contextPath}/price/list?regType=01&period=3&usageType=1&targetCode=A,B&latitude=${latitude}&longitude=${longitude}&meters=1500&count=100&townCode=${data.baseSection}" target="building">更多周遭實價登錄資料</a></div>
                    </c:when>
                    <c:when test="${ not empty data.buildingKind and data.buildingKind eq 3}">
                        <div style="margin-top:10px;"><i class="fa fa-plus-square padding-right"></i><a href="${pageContext.request.contextPath}/price/list?regType=01&period=3&usageType=1&targetCode=A,B,C&latitude=${latitude}&longitude=${longitude}&meters=500&count=100&townCode=${data.baseSection}" target="building">更多周遭實價登錄資料</a></div>
                    </c:when>
                    <c:otherwise>
                        <div style="margin-top:10px;"><i class="fa fa-plus-square padding-right"></i><a href="${pageContext.request.contextPath}/price/list?regType=01&period=3&usageType=1&targetCode=A&latitude=${latitude}&longitude=${longitude}&meters=500&count=100&townCode=${data.baseSection}" target="building">更多周遭實價登錄資料</a></div>
                    </c:otherwise>                                      
                </c:choose>
         </div>
         
         <div class="container bottom-line list-detail-section">
            <div class="row margin30">
                 <div class="col-md-4">
                      <form method="post" action="#" class="padding-top padding-bottom">
                            <select class="form-control" onchange="refObj(this.value)" id="publishedObjectSorter">
                                 <option value="">價格排序</option>
                                 <option value="2">價格: 由低到高</option>
                                 <option value="1">價格: 由高到低</option>
                            </select>
                      </form><!--shorting form end-->
                  </div>
                  <div class="col-md-4"> 
                  <c:choose>
                    <c:when test="${ not empty sessionScope.usrmember}">
                        <a class="btn btn-primary btn-lg btn-light" href="${pageContext.request.contextPath}/member/sell/object/applySetup"><i class="fa fa-file-text-o padding-right"></i>我要刊登</a>
                    </c:when>
                    <c:otherwise>
                    
                      <a class="btn btn-primary btn-lg btn-light" onclick="alertApplyMsg();"><i class="fa fa-file-text-o padding-right"></i>我要刊登</a>
                    </c:otherwise>
                  </c:choose>
                    <form id="nonlogin_apply" action="${pageContext.request.contextPath}/member/login" method="POST">
                        <input type="hidden" name="fromUrl" value="/member/sell/object/applySetup"> 
                    </form>
                  </div>
            </div><!--row top end-->
            
            <!-- 相關物件 -->
            <div id="refObjDiv"></div>
         </div>
         <div class="container bottom-line  real-price ">
            <h2>地圖與街景</h2>
            <div id="google-map-canvas" class="col-md-12 gmap">
                <div id="map-canvas" class="col-md-6 detail-map"></div>
                <div id="pano" class="col-md-6 detail-map"></div>        
            </div>  
         </div>
         
         
         <div class="divide40"></div>
 <%--         <div class="container">        
                 <div class="col-md-8 comment-post">
                        <h2>大樓問與答</h2>
                        <div class="row margin40">
                        <div class="col-md-6 margin30">
                            <div class="contact-option-circle">
                                <i class="fa fa-home"></i>
                                <p>
                                    以下是有關買方對大樓的問題與回答，您也可以透過右方的按鈕點擊並提出您的問題，窩牛網將會盡快回覆您的問題。
                                </p>
                            </div><!--contact option circle-->
                        </div><!--contact option detail box col-->
                         <div class="col-md-3 margin30">
                            <div class="contact-option-circle">
                                <i class="fa fa-list-alt"></i>
                                <p>
                                    共有<br /><span class="qa-number">${fn:length(questions)}</span><br />項問題
                                </p>
                              
                            </div><!--contact option circle-->
                        </div><!--contact option detail box col-->
                         <a href="mailto:support@snailhouse.com.tw" >
                         <div class="col-md-3 margin30">
                            <div class="contact-option-circle">
                                <i class="fa fa-envelope"></i>
                                <p>
                                    聯繫窩牛網客服人員
                                </p>
                            </div><!--contact option circle-->
                        </div>
                        </a>
                        <!--contact option detail box col-->
                    </div>
                    <!-- comments list -->
                     <c:forEach var="item" items="${questions}" begin="0" end="0" varStatus="idx">
                        <div class="row comment-section">
                            <div class="col-md-6">
                                <div class="comment-list">
                                    <h4><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ask.png" class="img-responsive" alt="" />
                                        ${fn:substring(item.chineseName, 0, 1)}OO <span class="comment-time"> ${item.createdDatetime }</span><!-- <a href="#" class="btn btn-xs btn-theme-dark comment-btn reply-user">回覆</a> -->
                                    </h4>
                                    <p>
                                        ${item.content }
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="comment-list">
                                    <h4><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ans.png" class="img-responsive" alt="">
                                       屋主<span class="comment-time">${item.updateDateTime }</span>
                                    </h4>
                                    <p>
                                    <c:choose>
                                        <c:when test="${empty item.answers }">尚未回復</c:when>
                                        <c:otherwise>${item.answers }</c:otherwise>
                                    </c:choose>
                                    </p>
                                    <c:if test="${fn:length(questions) >1}">
                                    <input type="button" id="btnMoreQNAControl" class="btn btn-xs btn-theme-dark comment-btn reply-more" value='更多回覆內容...'/>
                                    </c:if>
                                </div>
                            </div>
                        </div> 
                         </c:forEach> 
                        <div id='divMain'>
                        </div>
                  </div>
                 
                  
                  <!--comments-->
                     <c:choose>
                        <c:when test="${ not empty sessionScope.usrmember || not empty sessionScope.entmember}">
                          <div class="col-md-4 comment-form" >
                                <h2>提出您的問題</h2>
                                <div class="form-contact">
                                    <form role="form">
                                        <div class="form-group">
                                            <label for="message">寫下您想問的問題</label>
                                            <textarea class="form-control" rows="7" id="content"  name="content" required></textarea>
                                        </div>                      
                                         <span style="
                                        margin-top: 2px;
                                        display: inline-block;
                                        color: #808080;">
                                        （已輸入字數<span id="hadwordage">0</span>，還剩<span id="wordage">  </span>字數） </span>
                                           <br>                      
                                            <button type="submit" class="btn btn-lg pull-right btn-color" onClick="createQuestion('${data.buildingId}');">問題送出</button>
                                    </form>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                          <div class="col-md-4 comment-form tilt">
                                <form id="nonlogin" action="${pageContext.request.contextPath}/member/login" method="POST" >
                                 <input type="hidden" name="fromUrl" value="${fromUrl}">    
                                </form>
                                 <a href="#" onclick="alertMsg();" ><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/qa-btn.png" class="img-responsive"/></a>
                          </div>
                        </c:otherwise>  
                    </c:choose>
                </div>
                 --%>
                <!--col-->
         <div class="divide20"></div>
         <!--footer start--> 
<script type="text/javascript" src="<c:url value="/resources/js/numeral.js" />"></script>             
<script src="<c:url value="/resources/js/fotorama-4.6.4/fotorama.js"/>"></script>  
<%@ include file="../common/rwdfooter.jsp" %>  
<%@ include file="../common/ga.jsp" %>  
<script>
$(document).ready(function(){
    //定義方法
    var limitNum = 500;
    //定義参數，可輸入的字數
    var pattern =  limitNum ;
    //定義参數還剩多少數字可以輸入
    $('#wordage').html(pattern);
    //wordageID獲得全部元素字數
    $('#content').keyup(
        function(){
        //定義方法按下按鍵時，改變文本域的顏色
            
            var remain = $(this).val().length;
            //定義参數，獲得當前值的長度是
            if(remain > 500){
            //當字數超過118個
                pattern = "0";
                //顯示不能在輸入了
            }else{
            //否則
                var result = limitNum - remain;
                //定義参數500-去當前字數
                pattern =  result ;
                //獲得還可以輸入多少字
            }
            if(remain>500){
                remain=500;
            }
            $('#hadwordage').html(remain);
            $('#wordage').html(pattern);
            //獲得所有元素還可以輸入多少字
        }
    );       
});
var map1;
var building = new google.maps.LatLng('${latitude}','${longitude}');
 
function spinit() {
var map_canvas = document.getElementById('map-canvas');
   // Set up the map
   var map_options = {
     center: building,
     zoom: 16,
     mapTypeId: google.maps.MapTypeId.ROADMAP
   };
   map1 = new google.maps.Map(map_canvas, map_options);
   var panoramaOptions = {
   position: building,
   pov: {
     heading: 34,
     pitch: 10
   }
 };
 var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
 map1.setStreetView(panorama);
}
google.maps.event.addDomListener(window, 'load', spinit);  
     
   
function refObj(orderByColumn){
    if(orderByColumn==null || orderByColumn==""){
        return;
    }
    $.ajax({ 
        url:'${pageContext.request.contextPath}/building/list/json?buildingId=${data.buildingId}&orderbyColumn='+orderByColumn,
        type:"GET", 
        dataType: "json", // expected format for response
        success: function(res) {
             addRefObjItem(res);
        },
        error: function() {
            //alert("系統有錯誤,請再試一次。");
        },
    });
}

function queryRefObject(){
    $.ajax({ 
        url:'${pageContext.request.contextPath}/building/list/json?buildingId=${data.buildingId}&orderbyColumn=0',
        type:"GET", 
        dataType: "json", // expected format for response
        success: function(res) {
            //  alert('res:'+JSON.stringify(res)); 
             addRefObjItem(res);
        },
        error: function() {
            //alert("系統有錯誤,請再試一次。");
        },
    });
};



function queryPriceJson(buildingType){
    var targetCode =''; 
    if(buildingType == ''){
        targetCode ='&usageType=1&targetCode=A'; 
    }
    else if(buildingType == '1'){//商辦
        targetCode ='&usageType=2&targetCode=A,B,C,D,E'; 
    }
    else if(buildingType == '2'){//新建案
        targetCode ='&usageType=1&targetCode=A,B'; 
    }    
    else if(buildingType == '3'){//中古屋
        targetCode ='&usageType=1&targetCode=A,B,C'; 
    }        
    //alert('targetCode:${pageContext.request.contextPath}/price/list/json?regType=01&period=1&latitude=${latitude}&longitude=${longitude}&meters=1500&count=5&townCode=${data.baseSection}'+targetCode);
    $.ajax({ 
        url:'${pageContext.request.contextPath}/price/list/json?regType=01&period=1&latitude=${latitude}&longitude=${longitude}&meters=1500&count=5&townCode=${data.baseSection}'+targetCode,
        type:"GET", 
        dataType: "json", // expected format for response
        success: function(res) {
           if(res.length==0){
               addEmptyRow();
           }
           else{
               addPriceItem(res);
           }
        },
        error: function() {
           //alert("errors!");
        },
    });
};
function addEmptyRow(){ 
    $('#waitPrices').hide();
    $("#priceTableBody").append( "<tr><td colspan='9'>目前查不到1,500公尺內有相關的實價資料.</td></tr>");  
}; 

function addPriceItem(response){   
    var data;
    $('#waitPrices').hide();
    var table = document.getElementById("priceTableBody");
    for(var i = 0; i < response.length; i++) {
        data = response[i]; 
        var row = table.insertRow(i);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1); 
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);
        var cell8 = row.insertCell(7);
        var cell9 = row.insertCell(8);

        //計算每坪單價
        var unitPrice;
        if(data.pricePerSquareMeters){
            unitPrice = numeral((data.pricePerSquareMeters/(0.3025*10000))).format('0,0')+'萬';
        }
        else{
            unitPrice = numeral(((data.totalPrice/(data.totalBuildingSquareMeters*0.3025))/10000)).format('0,0')+'萬';
        }
        //坪數
        var Pings = numeral((data.totalBuildingSquareMeters*0.3025)).format('0,0')+'坪';
        if(data.parkingTotalSquareMeters && data.parkingTotalSquareMeters >0){
            Pings += '(含車位:'+numeral(data.parkingTotalSquareMeters*0.3025).format('0,0')+'坪)';
        }
        //備註
        var remarkText = '';
        if(data.remark){
            remarkText = data.remark;
        }
        var floorData ='';
        if(data.migrationFloor!=null && data.totalFloors!=null){
            floorData = data.migrationFloor+'/共'+data.totalFloors+'層';
        }
        else if(data.migrationFloor==null && data.totalFloors!=null){
            floorData = '共'+data.totalFloors+'層';
        }
        else{
            floorData = '';
        }        
        cell1.innerHTML = data.txnYearMonth,
        cell2.innerHTML = data.address,
        cell3.innerHTML = data.buildingType,
        cell4.innerHTML = numeral((data.totalPrice/10000)).format('0,0')+'萬',
        cell5.innerHTML = unitPrice,
        cell6.innerHTML=  Pings,        
        cell7.innerHTML = numeral(data.Months/12).format('0,0')+'年'+ data.Months%12+'個月',
        cell8.innerHTML = floorData,
        cell9.innerHTML = remarkText;              
    }   
};
function createQuestion(buildingId){
    var hasSession='${sessionScope.usrmember }';
    if(hasSession.length==0){       
        alert('請登入後,才可提問。');
        document.getElementById('nonlogin_appointerments').submit();    
        return;
    }
    else{
    var json = {'buildingId':buildingId, 'content' : $('#content').val()};
    showProgress();
    $.ajax({ 
      url:'${pageContext.request.contextPath}/member/buy/qna/create',
      type:"POST", 
      dataType: 'json', // expected format for response
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(json),
      success: function(res) {
         if(res.returnCode == '<%=CONSTANT.ACTION_EXECUTTION_OK%>'){
          alert('您的問題我們收到了,將儘快回覆您。'); 
          location.reload();
         }else if(res.returnCode != '<%=CONSTANT.ACTION_SYSTEM_ERROR%>'){
            alert(res.returnReason);
        }else if(res.returnCode == '<%=CONSTANT.ACTION_SYSTEM_ERROR%>'){
                alert("系統回覆時間過長,請再試一次。");
        }   
      },
      error: function(jqXHR, exception) {
          hideProgress();
          alert("系統有錯誤,請再試一次。");
    }
 });
    }
};


//加入追蹤
function addCollection(refId,refType){
    var hasSession='${sessionScope.usrmember }';
    if(hasSession.length==0){       
        alert('請登入後,才可收藏。');
        document.getElementById('nonlogin_appointerments').submit();    
        return;
    }   
    else{
        var json = {'id':{'refId':refId,'refType':refType}};
        $.ajax({ 
          url:'${pageContext.request.contextPath}/member/buy/collection/save',
          type:"POST", 
          dataType: 'json', // expected format for response
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify(json),
          success: function(res) {
              alert('大樓已加入收藏。');  
          },
          error: function() {
              alert("系統有錯誤,請再試一次。");
            }
        }); 
    }   
}
function alertMsg() {
    alert('請登入後,才能提問題。');
    document.getElementById('nonlogin').submit();
}
function alertApplyMsg() {
    alert('請登入後,才能申請刊登。');
    document.getElementById('nonlogin_apply').submit();
}
$("#btnMoreQNAControl").click(function () { 
    
     $("#btnMoreQNAControl").hide();
     showProgress();
     var urlStr ='${pageContext.request.contextPath}/building/qnalist/json?buildingId=${data.buildingId}';
    $.ajax({ 
        url:urlStr,
        type:"GET", 
        dataType: "json", // expected format for response
        success: function(res) {
         // alert('res:'+JSON.stringify(res)); 
           hideProgress();
           addQNAItem(res);
        },
        error: function() {
           hideProgress();
           alert("系統有錯誤,請再試一次。");
        },
    });
});


function addQNAItem(response){
    
    for(var i = 1; i < response.length; i++) {
        data = response[i]; 
        var createUser =data.chineseName.substring(0,1);
        if(data.replyId == null || data.replyId== ""){
            $("#divMain").append("<div class='row comment-section'><div class='col-md-6'><div class='comment-list'><h4><img src='<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ask.png' class='img-responsive' />"+createUser.substring(0,1)+"OO"+"<span class='comment-time'>"+data.createdDatetime+"</span></h4><p>"+data.content+"</p></div></div><div class='col-md-6'><div class='comment-list'><h4><img src='<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ans.png' class='img-responsive'>屋主<span class='comment-time'></span></h4><p>尚未回復</p></div></div></div>");
           }else if(data.replyId.length >0 &&  data.chineseName.length >0){
                $("#divMain").append("<div class='row comment-section'><div class='col-md-6'><div class='comment-list'><h4><img src='<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ask.png' class='img-responsive' />"+createUser.substring(0,1)+"OO"+"<span class='comment-time'>"+data.createdDatetime+"</span></h4><p>"+data.content+"</p></div></div><div class='col-md-6'><div class='comment-list'><h4><img src='<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/ans.png' class='img-responsive'>屋主<span class='comment-time'>"+data.updateDateTime+"</span></h4><p>"+data.answers+"</p></div></div></div>");
           } 
    }
};

function addRefObjItem(response){
     $("#refObjDiv" ).html('');
     if(response.length == 0){
       $("#publishedObjectSorter").hide();
     }   
    for(var i = 0; i < response.length; i++) {
        data = response[i]; 
        var displayParkings='style=display:none' ;
        if(data.parkings >0){
            displayParkings='';
            }
        var content =   "<div class='col-md-6'>"+
                        "<div class='row items-list'>"+
                        "<div class='col-sm-5'>";
           //alert('data.coverId:'+data.coverId);
           if(data.coverId){      
                //alert('hello');
                content +=   "<img src='${pageContext.request.contextPath}/images/get?photoId="+data.coverId+"&type=small' class='img-responsive'' />";
           }
           else{
               content +=   "<img src='<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/non-list-ad.jpg' class='img-responsive'' />";
           }
           
           content +=   "</div>"+
                        "<div class='col-sm-7'>"+
                        "<h3><a href='${pageContext.request.contextPath}/object/"+data.objectId+"'>"+data.subject+"</a></h3>"+
                        /* "<ul class='list-inline rating-list'>"+                                
                        "<li class='review'><a href='${pageContext.request.contextPath}/object/"+data.objectId+"#qna'>("+data.qnaCount+" 則問與答)</a></li>"+
                        "<li><a href='${pageContext.request.contextPath}/object/"+data.objectId+"#qna'>我想問問題</a></li>"+
                        "</ul>"+ */
                        "<div>"+
                        "<div class='col-lg-12'><i class='fa fa-caret-right padding-right'></i>權狀"+data.totalSquareFootage+"坪</div>"+
                        "<div class='col-lg-12'><i class='fa fa-caret-right padding-right'></i>室內"+data.buildingFootage+"坪</div>"+
                        "<div class='col-lg-12'><i class='fa fa-caret-right padding-right'></i>屋齡"+data.objAge+"年 "+data.floor+"/"+data.totalFloors+"樓</div>"+
                        "<div class='col-lg-12'  "+displayParkings+" ><i class='fa fa-caret-right padding-right'></i>含"+data.parkings+"車位</div>"+
                        "<div class='col-lg-12'><i class='fa fa-caret-right padding-right'></i>瀏覽數"+data.counts+"次</div>"+
                        "</div>"+
                        "<p class='padding-all'>"+
                        "<span class='rate'>NT<span class='rate-lg padding-right padding-left'>"+numeral(data.price).format('0,0')+"</span>萬元</span>"+
                        "</p>"+
                        "<p><a href='${pageContext.request.contextPath}/object/"+data.objectId+"' class='btn btn-theme-bg'>觀看詳細資訊</a> <a href='javascript:;' class='btn btn-theme-red' onClick='addCollection("+data.objectId+",2);'>收藏</a>"+
                        "</p>"+
                        "</div>"+
                        "</div>"+
                        "</div>";
                        $("#refObjDiv" ).append( content);
        
    }  
 };
 function alertDocMsg() {
        alert('請登入後,才能閱覽文件。');
        document.getElementById('nonlogin').submit();
 }
 function openFile(docId){
        var url = '${pageContext.request.contextPath}/documents/get?docId='+docId;
        if(url!=''){
            $(this).target = "_blank";
            window.open(url);
        }
    }
</script>
<script>
var map, places, iw;
var mainInfoWindow;
var markers = [];
var centerMarker;
var hostnameRegexp = new RegExp('^https?://.+?/');
var lat = ${latitude};
var long = ${longitude};

var origin = lat.toString() + "," + long.toString();
//alert('origin:'+origin);
function initialize() {
    //alert('myLatlng:'+lat +','+ long);
    var myLatlng = new google.maps.LatLng(lat, long);
    var myOptions = {
        zoom: 16,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        draggable: !("ontouchend" in document)
    };
    map = new google.maps.Map(document.getElementById('map_distance'), myOptions);
    places = new google.maps.places.PlacesService(map);
    google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);

    document.getElementById('keyword').onkeyup = function(e) {
        if (!e) var e = window.event;
        if (e.keyCode != 13) return;
        document.getElementById('keyword').blur();
        search(document.getElementById('keyword').value);
    };
    //set bus_station as default click point
    $transion = $('#bus_station');
    $transion[0].checked = true;
    $transion[0].click();
}

function tilesLoaded() {
    search();
    google.maps.event.clearListeners(map, 'tilesloaded');
    map.setCenter(new google.maps.LatLng(lat, long));
    centerMarker = new google.maps.Marker({
        position: search.location,
        animation: google.maps.Animation.DROP,
        size: 500,
        map: map
    });
    makeInfoWindowEvent(map, mainInfoWindow, "基地位置", centerMarker);
    document.getElementById('keyword').disabled = false;
}

function search() {

}

function reallyDoSearch(value, id) {
    //-------------------------------------------------start of reallydosearch------------------------------------------------------------------------
    var keyword = document.getElementById('keyword').value;
    var rankBy = 'distance';
    var search = {};
    var img;
    if (id == 'keyword') {
        img = 'default';
    } else {
        img = value;
    }
    search.types = value;

    if (keyword) {
        search.keyword = keyword;
    }

    if (rankBy == 'distance' && (search.types || search.keyword)) {
        search.rankBy = google.maps.places.RankBy.DISTANCE;
        search.location = map.getCenter();
    } else {
        search.bounds = map.getBounds();
    }

    places.search(search, function(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
                var icon = 'https://newhouse.snailhouse.com.tw/resources/image/gmap/' + img + '.png';
                markers.push(new google.maps.Marker({
                    position: results[i].geometry.location,
                    icon: icon
                }));
                google.maps.event.addListener(markers[i], 'click', getDetails(results[i], i));
                window.setTimeout(dropMarker(i), 0);
                addResult(results[i], i, img);
            }
        }
        calculateDistances(results);
        zoomFit(results);
    });
}
//-----------------------------------------------------------------------end of reallydosearch----------------------------------------------------
function zoomFit(points) {
    var bounds = new google.maps.LatLngBounds();
    var center = new google.maps.LatLng(lat, long);
    bounds.extend(center);
    var i = points.length - 1
    var myPlace = new google.maps.LatLng(points[i].geometry.location.lat(), points[i].geometry.location.lng());
    // for (var i = 0; i < points.length; i++) {
    //     var myPlace = new google.maps.LatLng(points[i].geometry.location.k, points[i].geometry.location.D);
    // bounds.extend(myPlace);
    // // }
    // map.fitBounds(bounds);
}

function calculateDistances(dest) {
    //alert(JSON.stringify(dest));
    var dests = [];
    for (var i = 0; i < dest.length; i++) {
        dests.push(dest[i].geometry.location.lat() + "," + dest[i].geometry.location.lng());
    }
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [origin],
        destinations: dests,
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false,
    }, callback);
}

function callback(response, status) {
    if (status != google.maps.DistanceMatrixStatus.OK) {
        alert('查無距離資料!');
        //alert('Error was: ' + status);
    } else {
        var routes = response.rows[0];
        for (var i = 0; i < routes.elements.length; i++) {
            var rtelength = routes.elements[i].distance.text;
            var rtetime = routes.elements[i].duration.text;
            document.getElementById('listing' + i).innerHTML +="<span class='distance'>" +"<br>" + "距離:" + rtelength + " 開車:" + rtetime + "</span>";
        }
    }
}


function doOnClick(obj) {
    //alert('doOnClick():myLatlng:'+lat +','+ long);
    $('.mapTable').find('label').removeClass('active')
    $(obj).next().addClass('active')
    $('#keywordField input').val("")
    map.setCenter(new google.maps.LatLng(lat, long));
    search.location = map.getCenter();
    centerMarker = new google.maps.Marker({
        position: search.location,
        animation: google.maps.Animation.DROP,
        map: map
    });
    actuallySearch(obj.value, obj.id);
}

function doOnSearch(obj) {
    //alert('doOnClick():myLatlng:'+lat +','+ long);
    $('.mapTable').find('label').removeClass('active')
    map.setCenter(new google.maps.LatLng(lat, long));
    search.location = map.getCenter();
    centerMarker = new google.maps.Marker({
        position: search.location,
        animation: google.maps.Animation.DROP,
        map: map
    });
    actuallySearch(obj.value, obj.id);
}

function actuallySearch(obj, id) {
    clearResults();
    clearMarkers();
    document.getElementById('keyword').disabled = false;
    
    reallyDoSearch([obj], id);

}


function clearMarkers() {
    for (var i = 0; i < markers.length; i++) {

        markers[i].setMap(null);
    }
    markers = [];
    if (centerMarker) {
        centerMarker.setMap(null);
    }
}

function dropMarker(i) {
    return function() {
        if (markers[i]) {
            markers[i].setMap(map);
        }
    };
}

function addResult(result, i, value) {
    var results = document.getElementById('results');
    var tr = document.createElement('tr');
    tr.style.backgroundColor = (i % 2 == 0 ? '#F0F0F0' : '#FFFFFF');
    tr.onclick = function() {
        google.maps.event.trigger(markers[i], 'click');
    };

    var iconTd = document.createElement('td');
    var nameTd = document.createElement('td');
    nameTd.id = "listing" + i;
    var icon = document.createElement('img');
    icon.src = 'https://newhouse.snailhouse.com.tw/resources/image/gmap/' + value + '.png';
    icon.setAttribute('class', 'placeIcon');
    icon.setAttribute('className', 'placeIcon');
    var name = document.createTextNode(result.name);
    iconTd.appendChild(icon);
    nameTd.appendChild(name);
    tr.appendChild(iconTd);
    tr.appendChild(nameTd);
    results.appendChild(tr);
}

function clearResults() {
    var results = document.getElementById('results');
    while (results.childNodes[0]) {
        results.removeChild(results.childNodes[0]);
    }
}

function getDetails(result, i) {
    return function() {
        places.getDetails({
            reference: result.reference
        }, showInfoWindow(i));
    };
}

function makeInfoWindowEvent(map, window, contentString, marker) {
    mainInfoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
        mainInfoWindow.setContent(contentString);
        mainInfoWindow.open(map, marker);
    });
}

function showInfoWindow(i) {
    return function(place, status) {
        if (iw) {
            iw.close();
            iw = null;
        }

        if (status == google.maps.places.PlacesServiceStatus.OK) {
            iw = new google.maps.InfoWindow({
                content: getIWContent(place)
            });
            iw.open(map, markers[i]);
        }
    };
}

function getIWContent(place) {
    var content = '';
    content += '<div class="mapInfo">'
    content += '<img class="hotelIcon" src="' + place.icon + '"/>';
    content += '<a target="_blank" href="' + place.url + '">' + place.name + '</a>';
    content += '</div>';
    return content;
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</body>
 <script>
//查詢相關物件
queryRefObject();
//查詢實價登錄
queryPriceJson('${data.buildingKind}');
</script>

</html>
