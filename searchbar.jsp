<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.zstrength.CONSTANT,com.zstrength.S3_CONSTANT"%>
<html>
<head>
<title>窩牛網 買屋 好窩快搜</title>
<!-- facebook -->
<meta property="og:description" content="買屋 好窩快搜 窩牛網只給透明的房訊" />
<meta property="og:title" content="窩牛網 買屋 好窩快搜"/>
<meta property="og:type" content="website"/>
<meta property="og:url" content="https://snailhouse.com.tw/object/list"/>
<meta property="og:image" content="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/logo-index.png"/>
<meta property="og:site_name" content="窩牛網" />
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 

<!-- css highlight -->
<style>
    .highlight-box {
        color: #fff;
    }
    .highlight-title {
        padding: 5px 0;
        border-bottom: 3px solid #fff;
    }
    .highlight-title h4 {
        color: #FDEBA6;
        font-size: 22px;
        margin:5px;
    }
    .highlight-title p {
        color: #fff;
    }
    .list-item {
        padding: 10px 10px 5px;
        text-align: left;
    }
    .list-item h3,.list-item p {
        color: #fff;
        font-weight: initial;
        font-size: initial;
        padding: 1px 0;
        margin: 0;
    }
    .list-item p:last-child {
        color: #FDEBA6;
        font-size: 24px;
        margin: 5px 0;
        font-weight: 900;
    }

    .list-item-img {
        position: relative;
    }
    .list-item img {
        max-width: 100%;
    }
    .list-item-img  .highlight-img {
        position: absolute;
        top: 5px;
        right: 5px;
        width: 40%;
    }
    .list-item-img .list-tag {
        padding: 1px 5px;
        width: initial;
        height: initial;
    }
    .list-item-img .list-price {
        top: initial;
        left: initial;
        bottom: 0;
        right: 0;
    }
</style>

<%@ include file="../common/rwdlibrary_list.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/buildlists.css"/>">
<link rel="stylesheet" href="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/css/demo.css"/>

<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/js/jquery.deepcheckbox.js" type="text/javascript"></script> 
<script src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/js/jquery.twbsPagination.js"></script>
<script src="<c:url value="/resources/js/jquery.url.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/numeral.js" />"></script> 

<!--引入外部css js-->
<link rel="stylesheet" href="https://ianchuu.github.io/woork/sol.css">
<script type="text/javascript" src="https://ianchuu.github.io/woork/sol.js"></script>
</head>
<body>
<%@ include file="../common/rwdheader_list.jsp" %>
<%@ include file="../common/loading.jsp"%>

<div id="primaryContainer" class="primaryContainer clearfix">
<div class="mw">

<!--  <form id="searchForm" name="searchForm" method="post"> -->

<!--   </form>  -->   
        
        <div id="rcolumn">
            <div id="sorting" class="b_item">
               <p class="b_pprice" id="objcounts" name="objcounts"></p>
               <div style="float: right; margin: 5px 10px;">
                 <p class="arrangement-title">排序：</p>
             <select id="orderSelect" name="orderSelect" class="arrangement select-color" >
                  <option value="modifyDatetime_desc">刷新日期新到舊</option>
                    <option value="modifyDatetime_asc">刷新日期舊到新</option>
                    <option value="unitprice_desc">單價由高到低</option>
                    <option value="unitprice_asc">單價由低到高</option>
                    <option value="price_desc">總價由高到低</option>
                    <option value="price_asc">總價由低到高</option>
                    <option value="totalSquareFootage_desc">坪數由高到低</option>
                    <option value="totalSquareFootage_asc">坪數由低到高</option>
             </select>
           </div>
            </div>
            
            <div id="filters" class="b_item">
                <div style="display:inline-block">
           <p>篩選條件：<span class="selected-readable"></span></p>
              
          </div>
            </div>
            
<%--                 <div class="b_item">
                  <div class="event_item">
                          <div class="list-money">
                               <h2 class="money-h2">5500萬</h2>
                               <a class="btn info-more" id=""><i class="fa fa-search"></i> 點我看更多</a>
                          </div>
                  </div>
                    <div class="bitem_show">
                        <div class="bitem_base">
                            <a href="${pageContext.request.contextPath}/object/18154">                        
                                <div class="fixed-height" style="background-image: url('<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/showcase-7.jpg')"></div>
                                <!-- <img src="${pageContext.request.contextPath}?photoId=${row.photoId}&type=small" class="cover_image"/> -->
                            </a>  
                        </div>
                    </div>
                    <div class="bitem_des">                 
                      <div class="profile"/></div><div class="house-title"><a href="${pageContext.request.contextPath}/object/${row.objectId}" class="case_link">五分埔商圈黃金店面</a></div>     
                      <p class="bhouse_num"><i class="fa fa-map-marker"></i>永吉路 五分埔商圈店面(綜合商辦大樓)</p>
                      <p class="add"></p>
                      <p class="b_persq"><span class="info-list">總坪數 6.53坪</span><span class="info-list">N房N廳N衛</span><span class="info-list">屋齡57年</span></p>
                      <p class="add">
                        <span class="info-list">1樓/共3樓</span><span class="info-list">含0車位</span><span class="info-list">有電梯</span>
                      </p> 
                      <p class="small-tab"><span class="tab-proof"><i class="fa fa-trophy"></i> 窩牛認證</span><span class="tab-video"><i class="fa fa-youtube-play"></i> 有專屬影片</span><span class="tab-rent"><i class="fa fa-user-plus"></i> 帶租約</span></p>
                    </div>
                </div>  --%>

      <div id="objlist">    
          </div>  
          
           
              <div id="no_objectlist" style="display:none" >
                  <div class="no-object">
                      <h2>您所搜尋的條件，目前沒有符合的物件！</h2>
                      <h4>建議您可以擴大搜尋範圍，或是參考我們所提供的分類搜尋 <i class="fa fa-arrow-circle-down"></i></h4>
                      <div class="promote">
                        <a class="pro-a" href="${pageContext.request.contextPath}/object/themeId/1">內湖精選 TOP20</a>
                        <a href="${pageContext.request.contextPath}/object/themeId/1" ><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/no-object01.png" /></a>
                        
                      </div>
                      <div class="promote">
                        <a class="pro-a" href="${pageContext.request.contextPath}/object/themeId/2">台北市總價1500萬內</a>
                        <a href="${pageContext.request.contextPath}/object/themeId/2" ><img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/no-object03.png" /></a>
                      </div>
                  </div>
              </div>
            <section class="pagination-area">
              <div class="col-md-12 text-center">
                  <nav>
                  <!--  <div id="page"></div> -->
                   <ul  id='pagination' class="pagination"></ul>
             </nav>    
              </div>
            </section>  
            
        </div>
    <div id="lcolumn" class="clearfix highlight-box" style="clear: initial">
        <div class="highlight-title">
            <h4>超激安 機會價</h4>
            <p>誠實屋主在這裡，出價就有機會買到</p>
        </div>
        <div class="list-highlight">
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
            <div class="list-item">
                <div class="list-item-img">
                    <img src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/18872.jpg" alt="">
                    <img class="highlight-img" src="https://wr-snailhouse.cdn.hinet.net/webresource/office/img/promo_icon/18788.png">
                    <span class="list-tag">電梯大樓</span>
                    <span class="list-tag list-price">開價 1500萬</span>
                </div>
                <h3>板橋大智街優雅一樓</h3>
                <p>總坪數18.74</p>
                <p>機會價 1480 +</p>
            </div>
        </div>
    </div>


       <!-- pagination --> 
       

</div>
   
</div>
<script type="text/javascript">



function ChangePage(Total) {
    $('.pagination').twbsPagination({
        totalPages: Total, //分頁數
        visiblePages: 10,
        first: '首頁',
        prev: '前一頁',
        next: '下一頁',
        last: '尾頁',
        onPageClick: function(evt, page) { //分頁切換事件
            getPageItems(page);
        }
    });

}






$(document).ready(function() {
            //alert("${keyword}"+",縣市"+"${region}"+ ",地區"+"${districeCode}"+",類型"+"${objType}"+",價格"+"${price}");
            //search bar javascript
            $('html').click(function() {
                if ($('.sol-container').hasClass('sol-active')) {
                    removeSelect()
                }
                if($('.more-container').css('display')=='block'){
                    $('.more-container').hide();
                }
            });
            //more select control
            $('.col-more').click(function(event) {
                event.stopPropagation();
            });
            $('.col-more-button').click(function(event) {
              removeSelect()
              $('#squareInput').appendTo($('.col-square').find('form'))
              $('.displayKeyword').appendTo('.more-container')
              $('.more-container').toggle()
            });
            $('.searchButton').click(function(event) {
                if ($('.searchButton').hasClass('disable_button')) {
                    alert('please choose 縣市')
                } else {
                    search();
                }
            });
            //按鈕失效
            function enableButton() {
              var selectArea = $(".col-city input[id$='selectDisplay']").attr("value") + $(".col-area input[id$='selectDisplay']").attr("value") +$('#searchRun').attr("value")
                if (selectArea.length == 0) {
                    $('.searchButton').addClass('disable_button')
                } else {
                    $('.searchButton').removeClass('disable_button')
                }
            }
            //附加price input
            function appendPrice() {
                $('.col-price form').append($('#priceInput'))
            }
            //關閉選單
            function removeSelect() {
                $('.sol-container').removeClass('sol-active')
                // $('.displayKeyword').css('display', 'none')
            }

            function addKeyword() {
                var selectText = $('#searchRun').val();
                if (selectText !== "") {
                    $('.selected-readable').append('<span class="item"><i id="inputDelete" class="fa fa-times" value="' + selectText + '"></i> 搜尋' + selectText + "</span>")
                }
            }
            //處理input 輸入部分
            function dealInput(){
                    if ($(this).parent().attr('id')=="inputRange") {
                      var tagname = 'inputTag'+$(this).attr('tag');
                      var unit = $(this).attr('unit');
                      var value = $(this).val()
                      if($(this).val().includes('ge')){
                      var value = parseInt($(this).val())
                      var unit = $(this).attr('unit') + "以上"
                      }else if($(this).val().includes('le')){
                      var value = parseInt($(this).val())
                      var unit = $(this).attr('unit') + "以下"
                      }
                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times '+tagname+'" value="' + $(this).val() + '"></i> ' + value + unit+ "</span>")

                    }else if($(this).val() != 00){
                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                    }
            }
            function search() {
                $('.selected-readable').empty()
                $("input:checked").each(function() {
                    var selectText = $(this).parent().text();

                    if ($(this).parent().attr('id')=="inputRange") {
                      var tagname = 'inputTag'+$(this).attr('tag');
                      var unit = $(this).attr('unit');
                      var value = $(this).val()
                      if($(this).val().includes('ge')){
                      var value = parseInt($(this).val())
                      var unit = $(this).attr('unit') + "以上"
                      }else if($(this).val().includes('le')){
                      var value = parseInt($(this).val())
                      var unit = $(this).attr('unit') + "以下"
                      }
                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times '+tagname+'" value="' + $(this).val() + '"></i> ' + value + unit+ "</span>")

                    }else if($(this).val() != 00){
                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                    }
                    // if ($(this).val() != 00) {
                    //     $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                    // }else if($(this).parent().attr('id')=="priceinput"){
                    //   alert($(this).parent().attr('id'))
                    // }
                });
                // if ($('#pricelow').val() || $('#priceheigh').val()) {
                //     var selectText = $('#pricelow').val() + "-" + $('#priceheigh').val() + "萬"
                //     var pricerange = $('#pricelow').val() + "-" + $('#priceheigh').val()
                //     $('.selected-readable').append('<span class="item"><i id="inputDelete" class="fa fa-times" value="' + pricerange + '"></i> ' + selectText + "</span>")
                // }
                // if ($('#squarelow').val() || $('#squareheigh').val()) {
                //     var selectText = $('#squarelow').val() + "-" + $('#squareheigh').val() + "坪"
                //     var pricerange = $('#squarelow').val() + "-" + $('#squareheigh').val()
                //     $('.selected-readable').append('<span class="item"><i id="inputDelete" class="fa fa-times" value="' + pricerange + '"></i> ' + selectText + "</span>")
                // }
                addKeyword()
                if ($('.item').length == 0) {
                    $('.selected-readable').append('<span>不限</span>')
                }

                var city_Checkboxes = new Array();
                //以name篩選 選取項目value
                $("input[name=都市]:checked").each(function() {
                    city_Checkboxes.push($(this).val());
                });
                var area_Checkboxes = new Array();
                $("input[name=地區]:checked").each(function() {
                    area_Checkboxes.push($(this).val());
                });
                var type_Checkboxes = new Array();
                $("input[name=居住類型]:checked").each(function() {
                    type_Checkboxes.push($(this).val());
                });
                var price_Checkboxes = new Array();
                $("input[name=價格]:checked").each(function() {
                    price_Checkboxes.push($(this).val());
                });

                var square_Checkboxes = new Array();
                $("input[name=坪數]:checked").each(function() {
                    square_Checkboxes.push($(this).val());
                });

                var room_Checkboxes = new Array();
                $("input[name=格局]:checked").each(function() {
                    room_Checkboxes.push($(this).val());
                });
                var adv_Checkboxes = new Array();
                $("input[name=advradio]:checked").each(function() {
                    adv_Checkboxes.push($(this).val());
                });

                var keyword = $("input[name=搜尋]").val();
                var region = city_Checkboxes;
                var districeCode = area_Checkboxes;
                var objType = type_Checkboxes;
                var square = square_Checkboxes;
                var rooms = room_Checkboxes;
                var price = price_Checkboxes;
                var advances = adv_Checkboxes;
                var objlist = "";
                var page = "1";
                var url = 'http://localhost:8080/OfficeSnailHouses/service/api/obj/search?';
                var urlbar = 'http://localhost:8080/OfficeSnailHouses/object/list?';

                url = url + 'keyword=' + keyword + '&region=' + region + '&districeCode=' + districeCode + '&objType=' + objType + '&price=' + price + '&square=' + square + '&rooms=' + rooms + '&advances=' + advances + '&objlist=' + objlist + '&order=modifyDatetime_desc&page=' + page;
                urlbar = urlbar + 'keyword=' + keyword + '&region=' + region + '&districeCode=' + districeCode + '&objType=' + objType + '&price=' + price + '&square=' + square + '&rooms=' + rooms + '&advances=' + advances + '&objlist=' + objlist + '&order=modifyDatetime_desc&page=' + page;
                console.log('url =' + url);
                console.log('彈出頁面:' + urlbar)
                window.history.pushState("object or string", "Title", urlbar);
                removeSelect();
                ancyFun(url, 1, 1)
            }

            $('#my-select-room').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "格局",
                    "children": [
                        { "type": "option", "value": "00", "label": "格局不限","selected": "true" },
                        { "type": "option", "value": "1", "label": "1房" },
                        { "type": "option", "value": "2", "label": "2房" },
                        { "type": "option", "value": "3", "label": "3房" },
                        { "type": "option", "value": "4", "label": "4房" },
                        { "type": "option", "value": "5-UP", "label": "5房以上" },
                    ]
                }],
                name: "格局",
                texts: {
                    searchplaceholder: '格局'
                },
                multiple: false,
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        this.$selectionContainer
                            .css('left', 0)
                    },
                    onChange: function() {
                        if($('.col-room input:checked').length==0){
                          $('.col-room input:first')
                              .prop('checked', true)
                              .trigger('change', true)
                        }
                    },
                    onScroll: function() {
                      $('.sol-selection-container').click(function(event){
                           event.stopPropagation();
                      });
                    }
                }
            }); 

            $('#my-select-square').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "坪數",
                    "children": [
                        { "type": "option", "value": "00", "label": "坪數不限" ,"selected": "true"},
                        { "type": "option", "value": "0-14", "label": "0 - 14坪" },
                        { "type": "option", "value": "15-29", "label": "15 - 29坪" },
                        { "type": "option", "value": "30-UP", "label": "30坪以上" },
                        { "type": "option", "value": "40-UP", "label": "40坪以上" },
                        { "type": "option", "value": "50-UP", "label": "50坪以上" },
                    ]
                }],
                name: "坪數",
                texts: {
                    searchplaceholder: ''
                },
                multiple: false,
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        if ('${square}' !== "" && '${square}' !== '00') {
                        $("input[name=坪數]:first")
                            .prop('checked', false)
                            .trigger('change', true)
                            clearTagText()
                            var square = '${square}'.split(",");
                            for (var i = 0; i < square.length; i++) {
                                $("input[name=坪數]").each(function() {
                                    if ($(this).val() == square[i]) {
                                        $(this)
                                            .prop('checked', true)
                                            .trigger('change', true)

                                        var selectText = $(this).parent().text();

                                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                                    }
                                });
                            }
                            if($("input[name=坪數]:checked").length !== square.length){
                                $('#squareradio')
                                    .prop('checked', true)
                                    .trigger('change', true)
                                    .attr({value: '${square}'});
                                if('${square}'.includes("ge")){
                                    var puresquare = '${square}'.replace("ge", "");
                                    $('#squarelow').val(puresquare);
                                    var selectText = puresquare +"坪以上"
                                }else if('${price}'.includes("le")){
                                    var puresquare = '${square}'.replace("le", "");
                                    $('#squareheigh').val(puresquare);
                                    var selectText = puresquare +"坪以下"
                                }else {
                                    var puresquare = '${square}'.split("-");
                                    $('#squarelow').val(puresquare[0]);
                                    $('#squareheigh').val(puresquare[1]);
                                    var selectText = '${square}'+"坪"
                                }
                                    $('#squareInput input').trigger('blur', true)
                                $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times inputTagsquare" value="'+'${square}' + '"></i> ' + selectText +'</span>')
                            }
                        }

                        this.$selectionContainer
                            .css('left', 0)
                    },
                    onChange: function() {
                        if($('.col-square input:checked').length==0){
                          $('.col-square input:first')
                              .prop('checked', true)
                              .trigger('change', true)
                        }
                        $('#deleteInput-room').remove();
                        enableButton()
                        $('#squarelow,#squareheigh').val('')
                    },
                    onScroll: function() {
                      $('.sol-selection-container').click(function(event){
                           event.stopPropagation();
                      });
                    }
                }
            });
            $('#my-select4').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "請選擇價格",
                    "children": [
                        { "type": "option", "value": "00", "label": "價格不限", "selected": "true" },
                        { "type": "option", "value": "0-800", "label": "0 - 800 萬" },
                        { "type": "option", "value": "800-1200", "label": "800 - 1,200 萬" },
                        { "type": "option", "value": "1200-2000", "label": "1,200 - 2,000 萬" },
                        { "type": "option", "value": "2000-4000", "label": "2,000 - 4,000 萬" },
                        { "type": "option", "value": "4000-UP", "label": "4,000 萬以上" },
                    ]
                }],
                name: "價格",
                texts: {
                    searchplaceholder: '價格'
                },
                multiple: false,
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        appendPrice()
                        if ('${price}' !== "" && '${price}' !== '00') {
                        $("input[name=價格]:first")
                            .prop('checked', false)
                            .trigger('change', true)
                            clearTagText()
                            var price = '${price}'.split(",");
                            for (var i = 0; i < price.length; i++) {
                                $("input[name=價格]").each(function() {
                                    if ($(this).val() == price[i]) {
                                        $(this)
                                            .prop('checked', true)
                                            .trigger('change', true)
                                        var selectText = $(this).parent().text();

                                        $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                                    }
                                });
                            }
                            if($("input[name=價格]:checked").length !== price.length){
                                $('#priceradio')
                                    .prop('checked', true)
                                    .trigger('change', true)
                                    .attr({value: '${price}'});
                                if('${price}'.includes("ge")){
                                    var pureprice = '${price}'.replace("ge", "");
                                    $('#pricelow').val(pureprice);
                                    var selectText = pureprice+"萬以上"
                                }else if('${price}'.includes("le")){
                                    var pureprice = '${price}'.replace("le", "");
                                    $('#priceheigh').val(pureprice);
                                    var selectText = pureprice+"萬以下"
                                }else {
                                    var pureprice = '${price}'.split("-");
                                    $('#pricelow').val(pureprice[0]);
                                    $('#priceheigh').val(pureprice[1]);
                                    var selectText = '${price}'+"萬"
                                }
                                    $('#priceInput input').trigger('blur', true)
                                $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times inputTagprice" value="'+'${price}' + '"></i>' + selectText +'</span>')

                            }
                        }

                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項

                        if (this.$selection.find('input:checked').length > 0) {
                            this.$container.find('#selectDisplay:input').attr({
                                value: selected
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        }
                    },
                    onChange: function() {
                        if($('.col-price input:checked').length==0){
                          $('.col-price input:first')
                              .prop('checked', true)
                              .trigger('change', true)
                        }
                        $('#deleteInput').remove();
                        //print select check 選項
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項

                        if (this.$selection.find('input:checked').length > 0) {
                            this.$container.find('#selectDisplay:input').attr({
                                value: selected
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        }

                        enableButton()
                        $('#pricelow,#priceheigh').val('')

                    }
                }
            });
            $('#my-select3').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "請選擇類型",
                    "children": [
                        { "type": "option", "value": "00", "label": "類型不拘" },
                        { "type": "option", "value": "電梯大樓", "label": "電梯大樓" },
                        { "type": "option", "value": "別墅", "label": "別墅" },
                        { "type": "option", "value": "透天厝", "label": "透天厝" },
                        { "type": "option", "value": "店面", "label": "店面" },
                        { "type": "option", "value": "辦公大樓", "label": "辦公大樓" },
                        { "type": "option", "value": "倉庫", "label": "倉庫" },
                        { "type": "option", "value": "廠房", "label": "廠房" },
                        { "type": "option", "value": "住辦", "label": "住辦" },
                        { "type": "option", "value": "土地", "label": "土地" },
                        { "type": "option", "value": "其他", "label": "其他" },
                    ]
                }],
                name: "居住類型",
                texts: {
                    searchplaceholder: '居住類型'
                },
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        if ('${objType}' !== "") {
                            clearTagText()
                            var objType = '${objType}'.split(",");

                            for (var i = 0; i < objType.length; i++) {
                                $("input[name=居住類型]").each(function() {
                                    if ($(this).val() == objType[i]) {
                                        $(this)
                                            .prop('checked', true)
                                            .trigger('change', true)

                                        var selectText = $(this).parent().text();

                                        $('.selected-readable').prepend('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                                    }
                                });
                            }
                        }
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 2) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }
                    },
                    onChange: function() {
                        //print select check 選項
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 3) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }
                        enableButton()
                    }
                }
            });
            $('#my-select2').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "台北市",
                    "children": [
                        { "type": "option", "value": "A01", "label": "中正區" },
                        { "type": "option", "value": "A05", "label": "大安區" },
                        { "type": "option", "value": "A03", "label": "中山區" },
                        { "type": "option", "value": "A07", "label": "信義區" },
                        { "type": "option", "value": "A04", "label": "松山區" },
                        { "type": "option", "value": "A02", "label": "大同區" },
                        { "type": "option", "value": "A10", "label": "內湖區" },
                        { "type": "option", "value": "A12", "label": "文山區" },
                        { "type": "option", "value": "A11", "label": "南港區" },
                        { "type": "option", "value": "A08", "label": "士林區" },
                        { "type": "option", "value": "A09", "label": "北投區" },
                        { "type": "option", "value": "A06", "label": "萬華區" }
                    ]
                }, {
                    "type": "optiongroup",
                    "label": "新北市",
                    "children": [
                        { "type": "option", "value": "B03", "label": "板橋區" },
                        { "type": "option", "value": "B11", "label": "新店區" },
                        { "type": "option", "value": "B20", "label": "三重區" },
                        { "type": "option", "value": "B14", "label": "永和區" },
                        { "type": "option", "value": "B21", "label": "新莊區" },
                        { "type": "option", "value": "B15", "label": "中和區" },
                        { "type": "option", "value": "B16", "label": "土城區" },
                        { "type": "option", "value": "B23", "label": "林口區" },
                        { "type": "option", "value": "B27", "label": "淡水區" },
                        { "type": "option", "value": "B01,B02,B04,B05,B06,B07,B08,B09,B10,B12,B13,B16,B17,B18,B19,B22,B24,B25,B26,B28,B29", "label": "其他區域" }
                    ]
                }, {
                    "type": "optiongroup",
                    "label": "基隆市",
                    "children": [
                        { "type": "option", "value": "C01,C02,C03,C04,C05,C06,C07", "label": "基隆市全區" },
                    ]
                }],
                name: "地區",
                texts: {
                    searchplaceholder: '地區'
                },
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        if ('${districeCode}' !== "") {
                            clearTagText()
                            var districeCode = '${districeCode}'.split(",");

                            for (var i = 0; i < districeCode.length; i++) {
                                $("input[name=地區]").each(function() {
                                    if ($(this).val() == districeCode[i]) {
                                        $(this)
                                            .prop('checked', true)
                                            .trigger('change', true)

                                        var selectText = $(this).parent().text();

                                        $('.selected-readable').prepend('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                                    }
                                });
                            }
                        }
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 3) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }

                        this.$selectionContainer
                            .css('left', $('.col-city').offset().left - $('.col-area').offset().left)
                    },
                    onChange: function() {
                        //print select check 選項
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();

                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 3) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }
                        enableButton()
                    },
                    onOpen: function() {
                        //判斷 區域displaynone or 都市選項placeholder -> 開啟city選單 
                        if ($(".col-city input[id$='selectDisplay']").attr("value") == null || $(".col-city input[id$='selectDisplay']").attr("value") == "") {
                            $('.sol-container').removeClass('sol-active')
                            $('.sol-container:eq(0)').addClass('sol-active')
                            $('.displayKeyword').appendTo($('.col-city').find('.sol-selection-container'))
                            // var height = $('.col-city').find('.sol-selection-container').outerHeight() + $('.col-city').find('.sol-selection-container').offset().top;
                            // $('.displayKeyword').css('top', height - 3)

                        } else {
                            var lastitem = $('.sol-current-selection:eq(0)').find('.sol-selected-display-item-text').last().text()
                                //篩選是否符合地區
                            $('.sol-container:eq(1) .sol-optiongroup-label').filter(function() {
                                return this.innerHTML == lastitem;
                            }).parent().css('display', 'block')
                            $('.sol-container:eq(1) .sol-optiongroup-label').filter(function() {
                                return this.innerHTML !== lastitem;
                            }).parent().css('display', 'none')
                            $('.displayKeyword').appendTo($('.col-area').find('.sol-selection-container'))
                            // var selectheight = this.$selectionContainer.outerHeight() + this.$selectionContainer.offset().top;

                            // $('.displayKeyword').css('top', selectheight - 3)
                        }
                    }
                }
            });
            // 第一個選項操作 
            $('#my-select').searchableOptionList({
                data: [{
                    "type": "optiongroup",
                    "label": "請選擇縣市",
                    "children": [
                        { "type": "option", "value": "A", "label": "台北市" },
                        { "type": "option", "value": "B", "label": "新北市" },
                        { "type": "option", "value": "C", "label": "基隆市" }
                    ]
                }],
                name: "都市",
                texts: {
                    searchplaceholder: '縣市'
                },
                events: {
                    onRendered: function() {

                    },
                    onInitialized: function() {
                        if ('${region}' !== "") {
                            clearTagText()
                            var region = '${region}'.split(",");

                            for (var i = 0; i < region.length; i++) {
                                $("input[name=都市]").each(function() {
                                    if ($(this).val() == region[i]) {
                                        $(this)
                                            .prop('checked', true)
                                            .trigger('change', true)
                                        var selectText = $(this).parent().text();
                                        $('.selected-readable').prepend('<span class="item"><i id="tagDelete" class="fa fa-times" value="' + $(this).val() + '"></i> ' + selectText + "</span>")
                                    }
                                });
                            }
                        }
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 2) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }
                        $('#priceInput').show()
                        $('.searchbar_container').css({
                          opacity: '1',
                          filter: 'Alpha(opacity=100)'
                        });
                        this.$selectionContainer
                            .css('left', 0)
                        $('.sol-selection-container').wrapInner('<div id="display_select"></div>')
                    },
                    onChange: function() {
                        //print select check 選項
                        var selected = this.$selection.find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();
                        // 判斷 select check 數量 印出選項
                        if (this.$selection.find('input:checked').length > 3) {
                            this.$container.find('#selectDisplay').attr({
                                value: this.$selection.find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            this.$container.find('#selectDisplay').attr({
                                value: selected
                            });
                        }
                        enableButton()
                            //獲取列出的item名稱
                            // var lastitem = $('.col-city').find('.sol-selected-display-item-text').last().text()
                        var lastitem = $('.sol-current-selection:eq(0)').find('.sol-selected-display-item-text').last().text()

                        if ($('.col-city').find('.sol-container').hasClass('sol-active')) {

                            if (lastitem !== "") {
                                $('.sol-container').removeClass('sol-active')

                                $('.sol-container:eq(1)').addClass('sol-active')
                                    //篩選是否符合地區
                                $('.sol-container:eq(1) .sol-optiongroup-label').filter(function() {
                                    return this.innerHTML == lastitem;
                                }).parent().css('display', 'block')
                                $('.sol-container:eq(1) .sol-optiongroup-label').filter(function() {
                                    return this.innerHTML !== lastitem;
                                }).parent().css('display', 'none')
                                // var height = $('.col-area').find('.sol-selection-container').outerHeight() + $('.col-area').find('.sol-selection-container').offset().top;
                                $('.displayKeyword').appendTo($('.col-area').find('.sol-selection-container'))

                            } else {
                                $('.sol-container:eq(1) .sol-optiongroup-label').filter(function() {
                                    return this.innerHTML !== lastitem;
                                }).parent().css('display', 'none')
                            }
                        }
                    }
                }
            });

            //價格input click 取消all checked
            $('#priceInput,#squareInput').click(function(event) {
                // $(this).closest('form').find('input:checked').each(function(index, el) {
                //     //alert($(this).attr('value'));
                //     $(this)
                //         .prop('checked', false)
                //         .trigger('change', true)
                // })
                // $(this).find('input:radio')
                //     .prop('checked', true)
                //     .trigger('change', true)

            });
            //priceInput 只能keyin 數字
            $('#priceInput input,#squareInput input').bind('keyup paste', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
            });
            //priceInput 離開 新增tag
            $('#priceInput input').blur(function(event) {
                if($('#pricelow').val()+$('#priceheigh').val().length>0){
                $(this).closest('form').find('input:checked').each(function(index, el) {
                    //alert($(this).attr('value'));
                    $(this)
                        .prop('checked', false)
                        .trigger('change', true)
                })
                $('#priceradio')
                    .prop('checked', true)
                    .trigger('change', true)
                }
                if ($('#pricelow').val()!=="" && $('#priceheigh').val()!=="") {
                    var a = Number($('#pricelow').val());
                    var b = Number($('#priceheigh').val());
                    //比大小 跑第二次之後會卡在第一次判斷哪邊比較大
                    var bigger = (a > b) ? a : b;
                    var smaller = (a < b) ? a : b;
                    console.log(bigger)

                    $('#priceheigh').val(bigger)
                    $('#pricelow').val(smaller)

                    $('#deleteInput').remove();
                    $('.sol-current-selection:eq(3)').append('<div id="deleteInput" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#pricelow').val() + '-' + $('#priceheigh').val() + '萬</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                        .click(function(event) {
                            $('#priceradio')
                                .prop('checked', false)
                                .trigger('change', true);
                            $('#deleteInput').remove();
                        })
                        .prependTo('#deleteInput')
                    $('#priceradio').attr({
                        value: $('#pricelow').val() + "-" + $('#priceheigh').val()
                    });
                }

                if($('#pricelow').val()==""&& $('#priceheigh').val()!==""){
                    var priceRange =  $('#priceheigh').val()+"le";
                    $('#priceradio').attr({value: priceRange});
                    $('#deleteInput').remove();
                    $('.sol-current-selection:eq(3)').append('<div id="deleteInput" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#priceheigh').val() + '萬以下</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                }else if ($('#pricelow').val()!==""&& $('#priceheigh').val()==""){
                    var priceRange =  $('#pricelow').val()+"ge";
                    $('#priceradio').attr({value: priceRange});
                    $('#deleteInput').remove();
                    $('.sol-current-selection:eq(3)').append('<div id="deleteInput" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#pricelow').val() + '萬以上</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                }
            })

            $('#priceheigh,#pricelow').keyup(function() {
                // $('#deleteInput').remove();
                // $('.sol-current-selection:eq(3)').append('<div id="deleteInput" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#pricelow').val() + '-' + $('#priceheigh').val() + '萬</span></div>')

                // $('<span class="sol-quick-delete">×</span>')
                //     .click(function(event) {
                //         $('#priceradio')
                //             .prop('checked', false)
                //             .trigger('change', true);
                //         $('#deleteInput').remove();
                //     })
                //     .prependTo('#deleteInput')
            });
            //squareInput 離開 新增tag
            $('#squareInput input').blur(function(event) {
                if($('#squarelow').val()+$('#squareheigh').val().length>0){
                $(this).closest('form').find('input:checked').each(function(index, el) {
                    //alert($(this).attr('value'));
                    $(this)
                        .prop('checked', false)
                        .trigger('change', true)
                })
                $('#squareradio')
                    .prop('checked', true)
                    .trigger('change', true)
                }
                //check two input value
                if ($('#squarelow').val()!=="" && $('#squareheigh').val()!=="") {
                    var a = Number($('#squarelow').val());
                    var b = Number($('#squareheigh').val());
                    //比大小 跑第二次之後會卡在第一次判斷哪邊比較大
                    var bigger = (a > b) ? a : b;
                    var smaller = (a < b) ? a : b;
                    console.log(bigger)

                    $('#squareheigh').val(bigger)
                    $('#squarelow').val(smaller)

                    $('#deleteInput-room').remove();
                    $('.sol-current-selection:eq(5)').append('<div id="deleteInput-room" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#squarelow').val() + '-' + $('#squareheigh').val() + '坪</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                        .click(function(event) {
                            $('#squareradio')
                                .prop('checked', false)
                                .trigger('change', true);
                            $('#deleteInput-room').remove();
                        })
                        .prependTo('#deleteInput-room')
                    var squareRange = $('#squarelow').val() + '-' + $('#squareheigh').val();
                    $('#squareradio').attr({value: squareRange});
                }
                if($('#squarelow').val()==""&& $('#squareheigh').val()!==""){
                    var squareRange =  $('#squareheigh').val()+"le";
                    $('#squareradio').attr({value: squareRange});
                    $('#deleteInput-room').remove();
                    $('.sol-current-selection:eq(5)').append('<div id="deleteInput-room" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#squareheigh').val() + '坪以下</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                }else if ($('#squarelow').val()!==""&& $('#squareheigh').val()==""){
                    var squareRange =  $('#squarelow').val()+"ge";
                    $('#squareradio').attr({value: squareRange});
                    $('#deleteInput-room').remove();
                    $('.sol-current-selection:eq(5)').append('<div id="deleteInput-room" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#squarelow').val() + '坪以上</span></div>')
                    $('<span class="sol-quick-delete">×</span>')
                }
            })

            $('#squareheigh,#squarelow').keyup(function() {
                // if($('#squarelow').val()==""&& $('#squareheigh').val()!==""){
                //     var squareRange =  $('#squareheigh').val()+"le";
                //     $('#squareradio').attr({value: squareRange});
                // }else if ($('#squarelow').val()!==""&& $('#squareheigh').val()==""){
                //     var squareRange =  $('#squarelow').val()+"ge";
                //     $('#squareradio').attr({value: squareRange});
                // }
                // $('#deleteInput-room').remove();
                // $('.sol-current-selection:eq(5)').append('<div id="deleteInput-room" class="sol-selected-display-item"><span class="sol-selected-display-item-text">' + $('#squarelow').val() + '-' + $('#squareheigh').val() + '坪</span></div>')

                // $('<span class="sol-quick-delete">×</span>')
                //     .click(function(event) {
                //         $('#squarelow')
                //             .prop('checked', false)
                //             .trigger('change', true);
                //         $('#deleteInput-room').remove();
                //     })
                //     .prependTo('#deleteInput-room')
            });
            $('#searchRun').keyup(function(event) {
                enableButton()
            });
            $('#searchRun').click(function(event) {
                removeSelect()
            });
            //press enter search 
            $('#searchRun').keypress(function (e) {
                if (e.which == 13) {
                    if ($('.searchButton').hasClass('disable_button')) {
                        alert('please choose 縣市')
                    } else {
                        search();
                    }
                }
            });
            $('#filters').on('click', '.inputTagsquare', function(event) {
                $('#deleteInput-room').remove()
                   $('.col-square input:first')
                    .prop('checked', true)
                    .trigger('change', true)
            })
            $('#filters').on('click', '.inputTagprice', function(event) {
                $('#deleteInput').remove()
                   $('.col-price input:first')
                    .prop('checked', true)
                    .trigger('change', true)
            })
            $('#filters').on('click', '#tagDelete', function(event) {
                //get tagDelete value to check input
                var tag = ($(this).attr('value'));
                //check if checked   to unchecked
                $('input:checked').each(function(index, el) {
                    //alert($(this).attr('value'));
                    if ($(this).attr('value') == tag) {
                        $(this)
                            .prop('checked', false)
                            .trigger('change', true)
                            .parent('#selectDisplay');

                        var selected = $(this).closest('.sol-selection').find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();

                        // 判斷 select check 數量 印出選項
                        if ($(this).closest('.sol-container').find('input:checked').length > 3) {
                            $(this).closest('.sol-container').find('#selectDisplay').attr({
                                value: $(this).closest('.sol-selection').find('input:checked').length + '項選擇'
                            });
                            // alert("selected = [" + selected + "]\nas string = \"" + selected.join(";") + "\"");
                        } else {
                            $(this).closest('.sol-container').find('#selectDisplay').attr({
                                value: selected
                            });
                        }

                    }
                });
                search()
                $(this).parent().remove();
                enableButton()
            });
            $('#filters').on('click', '#inputDelete', function(event) {
                $('#pricelow,#priceheigh').val('')
                    //get tagDelete value to check input
                var tag = ($(this).attr('value'));

                if ($('#searchRun').val() == tag) {
                    $('#searchRun').val('')
                }
                //check if checked   to unchecked
                $('input:checked').each(function(index, el) {
                    //alert($(this).attr('value'));
                    if ($(this).attr('value') == tag) {
                        $(this)
                            .prop('checked', false)
                            .trigger('change', true)
                            .parent('#selectDisplay');

                        var selected = $(this).closest('.sol-selection').find('input:checked').map(function(i, el) {
                            return $(this).attr("item");
                        }).get();

                        $(this).closest('.sol-container').find('#selectDisplay').attr({
                            value: selected
                        });
                    }
                });

                search()
                    //alert($(this).parent().text)
                $('#deleteInput').remove();
                $(this).parent().remove();
            });
            //clear 不限
            function clearTagText() {
                if ($('.item').length == 0) {
                    $('.selected-readable').empty()
                }
            }
//載入執行
  if('${keyword}'!==""){
    clearTagText()
    $('.selected-readable').append('<span class="item"><i id="inputDelete" class="fa fa-times" value="'+'${keyword}'+'"></i> 搜尋'+ '${keyword}' +"</span>")
    $('#searchRun').val('${keyword}')
  }
    //判斷勾選  
  var keyword='${keyword}';
  var region='${region}';
  if('${region}' + '${districeCode}' + '${keyword}' ==""){
  $('.searchButton').addClass('disable_button')
  }
  var districeCode='${districeCode}';
  var objType ='${objType}'; 
  var square='${square}';
  var rooms ='${rooms}';
  var price='${price}';
  var advances='${advances}';
  var objlist='${objlist}';
  var page ='${page}';
  var url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  var urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';

    if(empty(page)){
      page=1;
    }
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&objlist='+objlist+'&order=modifyDatetime_desc&page='+page;
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&objlist='+objlist+'&order=modifyDatetime_desc&page='+page;
    console.log('url ='+url);
      window.history.pushState("object or string", "Title", urlbar);
      ancyFun(url,page,0);
});



//check A區域
 $('#checkRegionA').click(function() {
    
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  var districeCCodeArr='';

   if(empty(keyword)){
     keyword ='';
   }
  
  //A 子區域
    var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();
    
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
   

  
  if ( $("#checkRegionB").attr('checked') && $("#checkRegionC").attr('checked') ) { 
      region ='B,C';
  } if ( !$("#checkRegionB").attr('checked') && $("#checkRegionC").attr('checked') ) { 
      region ='C';
  } if ( $("#checkRegionB").attr('checked') && !$("#checkRegionC").attr('checked') ) { 
      region ='B';
  } 
  
    
   //region
  if($(this).is(":checked")) {
     if(region.length > 0){
        region =region+',A';
       }else{
         region ='A'; 
       }  
    districeACodeArr='A01,A02,A03,A04,A05,A06,A07,A08,A09,A10,A11,A12';
  }else{
        districeACodeArr ='';
    }

  console.log('region ='+region);
   console.log('region ='+districeACodeArr+'--->A');
   console.log('region ='+districeBCodeArr+'--->B');

   
   if(districeACodeArr.length >0){
     if(districeCode.length >0){
       districeCode= districeCode+','+districeACodeArr;    
     }else{
       districeCode=districeACodeArr; 
     }
  }
   
   if(districeBCodeArr.length >0){
     if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }
  }
  if(districeCCodeArr.length >0){
     if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeCCodeArr; 
     }
  }

      //objType
      var objectTypes = $('.objTypeValue:checked').map(function () {
      return this.value;
     }).get();
    console.log('objTypeValue='+objectTypes);
     if(!empty(objectTypes)){
        objType=objectTypes;
     }
    console.log('price districeCode ='+districeCode);
      //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }
      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop;
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
      if(!empty(rooms)){
        rooms=rooms;
      } 
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);  
      $("#orderSelect").attr("value",'modifyDatetime_desc');
});  

//A子區域
  var locAArray = [];
$("#locA :checkbox").change(function(e){
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  var districeCCodeArr='';
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
   
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
      
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  
  if(empty(keyword)){
    keyword ='';
  }

   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
        locAArray=districeACodeArr;
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
      
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
        locAArray=districeACodeArr;
  }  

  if($("#checkRegionC").attr('checked')){
    if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
  }
  
  if(empty(region)){
    region ='';
  }

  
    if ($(this).is(":checked")){
        console.log("checked Score: " + $(this).val());
        
        locAArray.push($(this).val());
        
    }else{
        while (locAArray.indexOf($(this).val()) !== -1) {
      locAArray.splice(locAArray.indexOf($(this).val()), 1);
    }
    }
   
    districeACodeArr=locAArray;
    
    if(!empty(districeACodeArr)){
     districeCode= districeACodeArr;
     if(region.indexOf('A')==-1){
       if(empty(region)){
          region='A';
        }else{
          region =region+',A';
        }
     }
  }

  if(!empty(districeBCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('B')==-1){
       if(empty(region)){
          region='B';
        }else{
          region =region+',B';
        }
     }
  }
  
  if(!empty(districeCCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeCCodeArr; 
     }   
     if(region.indexOf('C')==-1){
       if(empty(region)){
          region='C';
        }else{
          region =region+',C';
        }
     }
  }

    //objType
      var objectTypes = $('.objTypeValue:checked').map(function () {
      return this.value;
     }).get();
    console.log('objTypeValue='+objectTypes);
     if(!empty(objectTypes)){
        objType=objectTypes;
       
     }
    console.log('test 1 districeCode ='+districeCode);
    console.log('test 1 localsubA' );
    //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }
      console.log('test 2 localsubA' );
      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop;
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
      console.log('test 3 localsubA' );
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }
        console.log('test 4 localsubA' );
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);  
      $("#orderSelect").attr("value",'modifyDatetime_desc');
});


//check B區域
 $('#checkRegionB').click(function() {
    
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  var districeCCodeArr='';
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';

   if(empty(keyword)){
     keyword ='';
   }
  
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  


   if ( $("#checkRegionA").attr('checked') && $("#checkRegionC").attr('checked') ) { 
        region ='A,C';
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionC").attr('checked') ) { 
        region ='C';
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionC").attr('checked') ) { 
        region ='A';
  } 
   

  
   if($(this).is(":checked")) {
     
       if(region.length > 0){
          region =region+',B';
         }else{
           region ='B'; 
         }  
       
     console.log('checkRegionB region ='+region);
     districeBCodeArr='B01,B02,B03,B04,B05,B06,B07,B08,B09,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29';  
    }else{
        districeBCodeArr='';
      }
   
     console.log('region ='+region);
     console.log('region ='+districeACodeArr+'--->A');
     console.log('region ='+districeBCodeArr+'--->B');
     if(districeACodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeACodeArr;    
       }else{
         districeCode=districeACodeArr; 
       }
    }
     
     if(districeBCodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }
    }
    if(districeCCodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }
    }
    
       //objType
      var objectTypes = $('.objTypeValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('objTypeValue='+objectTypes);
       if(!empty(objectTypes)){
          objType=objectTypes;
         
       }
    console.log('price districeCode ='+districeCode);
    //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }
      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop;
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
    
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);  
      $("#orderSelect").attr("value",'modifyDatetime_desc');
}); 


//B子區域
 var locBArray = [];
$("#locB :checkbox").change(function(e){
    var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    var districeCCodeArr='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
  
  if(empty(keyword)){
    keyword ='';
  }

  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
  return this.value;
   }).get();

  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  

  
  
   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
      locBArray=districeBCodeArr;
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
        locBArray=districeBCodeArr;
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
  }  
  
  if($("#checkRegionC").attr('checked')){
    if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
  }
  
  if(empty(region)){
    region ='';
  }
  
  if ($(this).is(":checked")){
       console.log("checked Score: " + $(this).val());
       locBArray.push($(this).val());
   }else{
       while (locBArray.indexOf($(this).val()) !== -1) {
        locBArray.splice(locBArray.indexOf($(this).val()), 1);
        }
   }
 
  districeBCodeArr=locBArray;

  if(!empty(districeACodeArr)){
     districeCode= districeACodeArr;
     if(region.indexOf('A')==-1){
       if(empty(region)){
          region='A';
        }else{
          region =region+',A';
        }
     }
  }

  if(!empty(districeBCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('B')==-1){
       if(empty(region)){
          region='B';
        }else{
          region =region+',B';
        }
     }
  }
  
  if(!empty(districeCCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('C')==-1){
       if(empty(region)){
          region='C';
        }else{
          region =region+',C';
        }
     }
  }
  
   
 //objType
      var objectTypes = $('.objTypeValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('objTypeValue='+objectTypes);
       if(!empty(objectTypes)){
          objType=objectTypes;
         
       }
    console.log('price districeCode ='+districeCode);
    //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }
      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);
      $("#orderSelect").attr("value",'modifyDatetime_desc');
});





//check C區域
$('#checkRegionC').click(function() {
   
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
  
   if(empty(keyword)){
     keyword ='';
   }
  
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  

  
   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
  } 
   
   console.log('region length ='+region.length);
   
   if($(this).is(":checked")) {
     
     if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';  
    
   }else{
      districeCCodeArr='';
      }
    console.log('districeCCodeArr length ='+districeCCodeArr.length);
    console.log('region ='+region);
     console.log('region ='+districeACodeArr+'--->A');
     console.log('region ='+districeBCodeArr+'--->B');
     
     
     if(districeACodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeACodeArr;    
       }else{
         districeCode=districeACodeArr; 
       }
    }
     
     if(districeBCodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }
    }
    if(districeCCodeArr.length >0){
       if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }
    }
     
    console.log('test districeCode='+districeCode);
    
       //objType
      var objectTypes = $('.objTypeValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('objTypeValue='+objectTypes);
       if(!empty(objectTypes)){
          objType=objectTypes;
         
       }
    console.log('price districeCode ='+districeCode);
    //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }
      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop;
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
    ancyFun(url,1,1);  
    $("#orderSelect").attr("value",'modifyDatetime_desc');
}); 







//房屋類型

  var objTypeArray = [];
$("#objectType :checkbox").change(function(e){
  
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  var districeCCodeArr='';
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
  
  if(empty(keyword)){
    keyword ='';
  }
  
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  

  
   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
  } 
  
  
  if($("#checkRegionC").attr('checked')){
    if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
  }
  
  if(!empty(districeACodeArr)){
     districeCode= districeACodeArr;
     if(region.indexOf('A')==-1){
       if(empty(region)){
          region='A';
        }else{
          region =region+',A';
        }
     }
  }

  if(!empty(districeBCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('B')==-1){
       if(empty(region)){
          region='B';
        }else{
          region =region+',B';
        }
     }
  }
  
  if(!empty(districeCCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeCCodeArr; 
     }   
     if(region.indexOf('C')==-1){
       if(empty(region)){
          region='C';
        }else{
          region =region+',C';
        }
     }
  }
  
     
     
  if ($(this).is(":checked")){
        console.log("checked Score: " + $(this).val());
        objTypeArray.push($(this).val());
    }else{
        while (objTypeArray.indexOf($(this).val()) !== -1) {
          objTypeArray.splice(objTypeArray.indexOf($(this).val()), 1);
          }
        
    }
    
    console.log('objTypeArray  ='+objTypeArray);
    
    
    if(!empty(objTypeArray)){
      
      if(objTypeArray.indexOf('00') !== -1){
        objType='';
        }else{
          objType =objTypeArray;
        }
    }
    
  //價格
    price =$('input[name="priceradio"]:checked', '#priceForm').val();
    if(price=== undefined){
      price='';
    }if(price =='NON'){
      var priceUp = $('#priceUP').val();
    var priceBottom =$('#priceBottom').val();
      
    if(!empty(priceUp) && !empty(priceBottom)){
      price =priceUp+"-"+priceBottom;
    }else if(empty(priceUp) && !empty(priceBottom)){
      price = priceBottom+'le';
    }else if(!empty(priceUp) && empty(priceBottom)){
      price = priceUp+'ge';
    }else{
      price='';
    }
    }
    //坪數
    square =$('input[name="squarelow"]:checked', '#squareForm').val();
    if(square=== undefined){
      square='';
    }if(square =='NON'){
      var squareTop = $('#squareTop').val();
    var squareLow = $('#squareLow').val();
    console.log('squareTop ='+squareTop +' squareLow='+squareLow);
    if(!empty(squareLow) && !empty(squareTop)){
      square =squareLow+"-"+squareTop;
    }else if(!empty(squareLow) && empty(squareTop)){
      square = squareLow+'le';
    }else if(empty(squareLow) && !empty(squareTop)){
      square = squareTop+'ge';
    }
    }
    if(!empty(square)){
      square=square;
    } 
    //格局
    rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
    if(rooms=== undefined){
      rooms='';
    }

  //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('advanceCheck='+advanceCheck);
       if(!empty(advanceCheck)){
        advances=advanceCheck;
         
       }

  url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
  console.log('url ='+url);
  urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
  window.history.pushState("object or string", "Title", urlbar); 
  ancyFun(url,1,1); 
  $("#orderSelect").attr("value",'modifyDatetime_desc');
});

//價格

 $('input:radio[name=priceradio]').change(function() {
   
   console.log('priceradio ='+this.value);
       
   var keyword= $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    var districeCCodeArr='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?'; 
    
    if(empty(keyword)){
      keyword ='';
    }
    
    //A 子區域
    var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
    //B 子區域
    var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();  
    

    
     if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='A,B';
    } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='B';
    } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
          region ='A';
    } 
    
    
    if($("#checkRegionC").attr('checked')){
      if(region.length > 0){
        region =region+',C';
       }else{
         region ='C'; 
       }  
       districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
    }
    
    if(!empty(districeACodeArr)){
       districeCode= districeACodeArr;
       if(region.indexOf('A')==-1){
         if(empty(region)){
            region='A';
          }else{
            region =region+',A';
          }
       }
    }

    if(!empty(districeBCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }   
       if(region.indexOf('B')==-1){
         if(empty(region)){
            region='B';
          }else{
            region =region+',B';
          }
       }
    }
    
    if(!empty(districeCCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }   
       if(region.indexOf('C')==-1){
         if(empty(region)){
            region='C';
          }else{
            region =region+',C';
          }
       }
    }
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
        console.log('price districeCode ='+districeCode);
        
   
    if(!empty(this.value)){
        price =this.value;
        if(price=='00'){
          price ='';
        }if(price =='NON'){
            price='';
          
          }
      }

      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop;
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);
      $("#orderSelect").attr("value",'modifyDatetime_desc');
    });


//space squarelow

 $('input:radio[name=squarelow]').change(function() {
   
   console.log('squarelow ='+this.value);
       
    var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    var districeCCodeArr='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?'; 
    
    if(empty(keyword)){
      keyword ='';
    }
    
    //A 子區域
    var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
    //B 子區域
    var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();  
    

    
     if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='A,B';
    } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='B';
    } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
          region ='A';
    } 
    
    
    if($("#checkRegionC").attr('checked')){
      if(region.length > 0){
        region =region+',C';
       }else{
         region ='C'; 
       }  
       districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
    }
    
    if(!empty(districeACodeArr)){
       districeCode= districeACodeArr;
       if(region.indexOf('A')==-1){
         if(empty(region)){
            region='A';
          }else{
            region =region+',A';
          }
       }
    }

    if(!empty(districeBCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }   
       if(region.indexOf('B')==-1){
         if(empty(region)){
            region='B';
          }else{
            region =region+',B';
          }
       }
    }
    
    if(!empty(districeCCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }   
       if(region.indexOf('C')==-1){
         if(empty(region)){
            region='C';
          }else{
            region =region+',C';
          }
       }
    }
    
  
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
             
        console.log('price districeCode ='+districeCode);
        
        
        
    if(!empty(this.value)){
      square =this.value;
        if(square=='00' ){
          square ='';
        }
        
      }
    //價格
      price =$('input[name="priceradio"]:checked', '#priceForm').val();
      if(price=== undefined){
        price='';
      }if(price =='NON'){
        var priceUp = $('#priceUP').val();
      var priceBottom =$('#priceBottom').val();
        
      if(!empty(priceUp) && !empty(priceBottom)){
        price =priceUp+"-"+priceBottom;
      }else if(empty(priceUp) && !empty(priceBottom)){
        price = priceBottom+'le';
      }else if(!empty(priceUp) && empty(priceBottom)){
        price = priceUp+'ge';
      }else{
        price='';
      }
      }

      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }
    //進階 advanceValue
         var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }
         //print 出選項
          $('.selected-readable').empty()
            $("input:checked").each(function() {
              var selectText = $(this).parent().text();
              if($(this).val() != 00) {
                $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="'+$(this).val()+'"></i> '+ selectText +"</span>")
            }
      
             });
      if($('.item').length == 0){
        $('.selected-readable').append('<span>不限</span>')
      }
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      if(square !='NON'){
      ancyFun(url,1,1); 
      }
      $("#orderSelect").attr("value",'modifyDatetime_desc');
    });


//rooms squarelow格局

$('input:radio[name=squarelow]').change(function() {
   
   console.log('squarelow ='+this.value);
       
    var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    var districeCCodeArr='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?'; 
    
    if(empty(keyword)){
      keyword ='';
    }
    //A 子區域
    var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
    //B 子區域
    var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();  
    

    
     if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='A,B';
    } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='B';
    } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
          region ='A';
    } 
    
    
    if($("#checkRegionC").attr('checked')){
      if(region.length > 0){
        region =region+',C';
       }else{
         region ='C'; 
       }  
       districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
    }
    
    if(!empty(districeACodeArr)){
       districeCode= districeACodeArr;
       if(region.indexOf('A')==-1){
         if(empty(region)){
            region='A';
          }else{
            region =region+',A';
          }
       }
    }

    if(!empty(districeBCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }   
       if(region.indexOf('B')==-1){
         if(empty(region)){
            region='B';
          }else{
            region =region+',B';
          }
       }
    }
    
    if(!empty(districeCCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }   
       if(region.indexOf('C')==-1){
         if(empty(region)){
            region='C';
          }else{
            region =region+',C';
          }
       }
    }
    
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
             
        console.log('price districeCode ='+districeCode);
        //價格
        price =$('input[name="priceradio"]:checked', '#priceForm').val();
        if(price=== undefined){
          price='';
        }if(price =='NON'){
          var priceUp = $('#priceUP').val();
        var priceBottom =$('#priceBottom').val();
          
        if(!empty(priceUp) && !empty(priceBottom)){
          price =priceUp+"-"+priceBottom;
        }else if(empty(priceUp) && !empty(priceBottom)){
          price = priceBottom+'le';
        }else if(!empty(priceUp) && empty(priceBottom)){
          price = priceUp+'ge';
        }else{
          price='';
        }
        }
        //坪數
        square =$('input[name="squarelow"]:checked', '#squareForm').val();
        if(square=== undefined){
          square='';
        }if(square =='NON'){
          var squareTop = $('#squareTop').val();
        var squareLow = $('#squareLow').val();
        console.log('squareTop ='+squareTop +' squareLow='+squareLow);
        if(!empty(squareLow) && !empty(squareTop)){
          square =squareLow+"-"+squareTop;
        }else if(!empty(squareLow) && empty(squareTop)){
          square = squareLow+'le';
        }else if(empty(squareLow) && !empty(squareTop)){
          square = squareTop+'ge';
        }
        }
        if(!empty(square)){
          square=square;
        } 

         
        if(!empty(this.value)){
          rooms =this.value;
            if(rooms=='00'){
              rooms ='';
            }
          }
      //進階 advanceValue
             var  advanceCheck = $('.advanceValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('advanceCheck='+advanceCheck);
             if(!empty(advanceCheck)){
              advances=advanceCheck;
               
             }
    
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
      urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);
      $("#orderSelect").attr("value",'modifyDatetime_desc');
    });

//進階
var advanceArray = [];
$("#adv :checkbox").change(function(e){
  
  var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances=''
  var districeCCodeArr ='';
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
  
  if(empty(keyword)){
    keyword ='';
  }
  
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  

  
   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
  } 
  
  
  if($("#checkRegionC").attr('checked')){
    if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
  }
  
  if(!empty(districeACodeArr)){
     districeCode= districeACodeArr;
     if(region.indexOf('A')==-1){
       if(empty(region)){
          region='A';
        }else{
          region =region+',A';
        }
     }
  }

  if(!empty(districeBCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('B')==-1){
       if(empty(region)){
          region='B';
        }else{
          region =region+',B';
        }
     }
  }
  
  if(!empty(districeCCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeCCodeArr; 
     }   
     if(region.indexOf('C')==-1){
       if(empty(region)){
          region='C';
        }else{
          region =region+',C';
        }
     }
  }
  
  
  //objType
  var objectTypes = $('.objTypeValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('objTypeValue='+objectTypes);
       if(!empty(objectTypes)){
          objType=objectTypes;
    } 
  //進階
  if ($(this).is(":checked")){
        console.log("checked Score: " + $(this).val());
        advanceArray.push($(this).val());
    }else{
        while (advanceArray.indexOf($(this).val()) !== -1) {
          advanceArray.splice(advanceArray.indexOf($(this).val()), 1);
          }
    }
   if(!empty(advanceArray)){
      advances =advanceArray;
     }
  
    console.log('advanceArray  ='+advanceArray);
    
  //價格
    price =$('input[name="priceradio"]:checked', '#priceForm').val();
    if(price=== undefined){
      price='';
    }if(price =='NON'){
      var priceUp = $('#priceUP').val();
    var priceBottom =$('#priceBottom').val();
      
    if(!empty(priceUp) && !empty(priceBottom)){
      price =priceUp+"-"+priceBottom;
    }else if(empty(priceUp) && !empty(priceBottom)){
      price = priceBottom+'le';
    }else if(!empty(priceUp) && empty(priceBottom)){
      price = priceUp+'ge';
    }else{
      price='';
    }
    }
    //坪數
    square =$('input[name="squarelow"]:checked', '#squareForm').val();
    if(square=== undefined){
      square='';
    }if(square =='NON'){
      var squareTop = $('#squareTop').val();
    var squareLow = $('#squareLow').val();
    console.log('squareTop ='+squareTop +' squareLow='+squareLow);
    if(!empty(squareLow) && !empty(squareTop)){
      square =squareLow+"-"+squareTop
    }else if(!empty(squareLow) && empty(squareTop)){
      square = squareLow+'le';
    }else if(empty(squareLow) && !empty(squareTop)){
      square = squareTop+'ge';
    }
    }
    if(!empty(square)){
      square=square;
    } 
    //格局
    rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
    if(rooms=== undefined){
      rooms='';
    }

         //print 出選項
          $('.selected-readable').empty()
            $("input:checked").each(function() {
              var selectText = $(this).parent().text();
              if($(this).val() != 00) {
                $('.selected-readable').append('<span class="item"><i id="tagDelete" class="fa fa-times" value="'+$(this).val()+'"></i> '+ selectText +"</span>")
            }
      
             });
      if($('.item').length == 0){
        $('.selected-readable').append('<span>不限</span>')
      }
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);  
      $("#orderSelect").attr("value",'modifyDatetime_descc');
});


//order

$('#orderSelect').change(function() {
/*     if ($(this).val() === '2') {
        // Do something for option "b"
    } */
    var order='';
    var keyword=  $('input[name="keyword"]').val();
  var region='';
  var districeCode='';
  var objType =''; 
  var square='';
  var rooms ='';
  var price='';
  var advances='';
  var districeCCodeArr ='';
  var objlist=$.url.param("objlist");
  url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
  urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?';
  
  
  if(empty(keyword)){
    keyword ='';
  }
  
  //A 子區域
  var districeACodeArr = $('.districeACode:checked').map(function () {
    return this.value;
     }).get();
  //B 子區域
  var districeBCodeArr = $('.districeBCode:checked').map(function () {
      return this.value;
     }).get();  
  

  
   if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='A,B';
  } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
        region ='B';
  } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
        region ='A';
  } 
  
  
  if($("#checkRegionC").attr('checked')){
    if(region.length > 0){
      region =region+',C';
     }else{
       region ='C'; 
     }  
     districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
  }
  
  if(!empty(districeACodeArr)){
     districeCode= districeACodeArr;
     if(region.indexOf('A')==-1){
       if(empty(region)){
          region='A';
        }else{
          region =region+',A';
        }
     }
  }

  if(!empty(districeBCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeBCodeArr;    
     }else{
       districeCode=districeBCodeArr; 
     }   
     if(region.indexOf('B')==-1){
       if(empty(region)){
          region='B';
        }else{
          region =region+',B';
        }
     }
  }
  
  if(!empty(districeCCodeArr)){
    if(districeCode.length >0){
       districeCode= districeCode+','+districeCCodeArr;    
     }else{
       districeCode=districeCCodeArr; 
     }   
     if(region.indexOf('C')==-1){
       if(empty(region)){
          region='C';
        }else{
          region =region+',C';
        }
     }
  }
  
  
  //objType
  var objectTypes = $('.objTypeValue:checked').map(function () {
        return this.value;
       }).get();
      console.log('objTypeValue='+objectTypes);
       if(!empty(objectTypes)){
          objType=objectTypes;
    } 
      
  //進階 advanceValue
    var advanceCheck = $('.advanceValue:checked').map(function () {
  return this.value;
  }).get();
  console.log('advanceCheck='+advanceCheck);
  if(!empty(advanceCheck)){
    advances=advanceCheck;
  }
    
  //價格
    price =$('input[name="priceradio"]:checked', '#priceForm').val();
    if(price=== undefined){
      price='';
    }if(price =='NON'){
      var priceUp = $('#priceUP').val();
    var priceBottom =$('#priceBottom').val();
      
    if(!empty(priceUp) && !empty(priceBottom)){
      price =priceUp+"-"+priceBottom;
    }else if(empty(priceUp) && !empty(priceBottom)){
      price = priceBottom+'le';
    }else if(!empty(priceUp) && empty(priceBottom)){
      price = priceUp+'ge';
    }else{
      price='';
    }
    }
    //坪數
    square =$('input[name="squarelow"]:checked', '#squareForm').val();
    if(square=== undefined){
      square='';
    }if(square =='NON'){
      var squareTop = $('#squareTop').val();
    var squareLow = $('#squareLow').val();
    console.log('squareTop ='+squareTop +' squareLow='+squareLow);
    if(!empty(squareLow) && !empty(squareTop)){
      square =squareLow+"-"+squareTop
    }else if(!empty(squareLow) && empty(squareTop)){
      square = squareLow+'le';
    }else if(empty(squareLow) && !empty(squareTop)){
      square = squareTop+'ge';
    }
    }
    if(!empty(square)){
      square=square;
    } 
    //格局
    rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
    if(rooms=== undefined){
      rooms='';
    }
    
    //sort
    order=$(this).val();
    if(!empty(order)){
      order=order;
    }
    
   
    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&objlist='+objlist+'&order='+order+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&objlist='+objlist+'&order='+order+'&page=1';
      window.history.pushState("object or string", "Title", urlbar); 
      ancyFun(url,1,1);
    
});


function query(){
  
 
    var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    var districeCCodeArr ='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?'; 
    

    if(empty(keyword)){
      keyword ='';
    }
    
    //A 子區域
    var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
    //B 子區域
    var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();  
    

    
     if ( $("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='A,B';
    } if ( !$("#checkRegionA").attr('checked') && $("#checkRegionB").attr('checked') ) { 
          region ='B';
    } if ( $("#checkRegionA").attr('checked') && !$("#checkRegionB").attr('checked') ) { 
          region ='A';
    } 
    
    
    if($("#checkRegionC").attr('checked')){
      if(region.length > 0){
        region =region+',C';
       }else{
         region ='C'; 
       }  
       districeCCodeArr='C01,C02,C03,C04,C05,C06,C07';
    }
    
    if(!empty(districeACodeArr)){
       districeCode= districeACodeArr;
       if(region.indexOf('A')==-1){
         if(empty(region)){
            region='A';
          }else{
            region =region+',A';
          }
       }
    }

    if(!empty(districeBCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeBCodeArr;    
       }else{
         districeCode=districeBCodeArr; 
       }   
       if(region.indexOf('B')==-1){
         if(empty(region)){
            region='B';
          }else{
            region =region+',B';
          }
       }
    }
    
    if(!empty(districeCCodeArr)){
      if(districeCode.length >0){
         districeCode= districeCode+','+districeCCodeArr;    
       }else{
         districeCode=districeCCodeArr; 
       }   
       if(region.indexOf('C')==-1){
         if(empty(region)){
            region='C';
          }else{
            region =region+',C';
          }
       }
    }
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
        console.log('price districeCode ='+districeCode);
        
      
        //價格
        price =$('input[name="priceradio"]:checked', '#priceForm').val();
        if(price=== undefined){
          price='';
        }if(price =='NON'){
          var priceUp = $('#priceUP').val();
        var priceBottom =$('#priceBottom').val();
          
        if(!empty(priceUp) && !empty(priceBottom)){
          price =priceUp+"-"+priceBottom;
        }else if(empty(priceUp) && !empty(priceBottom)){
          price = priceBottom+'le';
        }else if(!empty(priceUp) && empty(priceBottom)){
          price = priceUp+'ge';
        }else{
          price='';
        }
        }
      

      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    window.history.pushState("object or string", "Title", urlbar); 
    ancyFun(url,1,1);
    console.log('url2 ='+url);
    $("#orderSelect").attr("value",'modifyDatetime_desc');
  
    $('input:radio[name="priceradio"][value="NON"]').prop('checked', true);
    
};


function Search(e){
  
  
  
   e = e || window.event;  
      var keynum = e.keyCode || e.which;
      if(keynum === 13){
       var keyword= $('input[name="keyword"]').val();
       var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?';
    urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?'; 
    
    if ( $("#checkRegionA").attr('checked') ) { 
        region ='A';
    }else{
      region ='';
    } 
    
    if ( $("#checkRegionB").attr('checked') ) { 
      if(empty(region)){
        region='B';
      }else{
        region ='A,B';
      }
    }

    //districeACode
      var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
        console.log('districeACodeArr='+districeACodeArr);
      if(!empty(districeACodeArr)){
        if (region.indexOf('B') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='A';
          } 
          districeCode =districeACodeArr;
        }
      //districeBCode
        var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();
      console.log('districeBCodeArr='+districeBCodeArr);
       if(!empty(districeBCodeArr)){
        if (region.indexOf('A') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='B';
            } 
        if(!empty(districeACodeArr)){
            districeCode =districeACodeArr+","+districeBCodeArr;
        }else{
          districeCode =districeBCodeArr;
        }
      }
         
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
        console.log('price districeCode ='+districeCode);
        
      
        //價格
        price =$('input[name="priceradio"]:checked', '#priceForm').val();
        if(price=== undefined){
          price='';
        }if(price =='NON'){
          var priceUp = $('#priceUP').val();
        var priceBottom =$('#priceBottom').val();
          
        if(!empty(priceUp) && !empty(priceBottom)){
          price =priceUp+"-"+priceBottom;
        }else if(empty(priceUp) && !empty(priceBottom)){
          price = priceBottom+'le';
        }else if(!empty(priceUp) && empty(priceBottom)){
          price = priceUp+'ge';
        }else{
          price='';
        }
        }
      

      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    window.history.pushState("object or string", "Title", urlbar); 
    ancyFun(url,1,1);
    $("#orderSelect").attr("value",'modifyDatetime_desc');
  
    $('input:radio[name="priceradio"][value="NON"]').prop('checked', true);
        
        
      
    }
}



function empty(str){
    return !str || !/[^\s]+/.test(str);
}

function reset(){
  window.location.href='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list';   
};



function ancyFun(url,page ,isdestroy){
   console.log('isdestroy ='+isdestroy);

    
  showProgress();
  $.ajax({ 
    url:url,
    type:"GET", 
    dataType: "json", // expected format for response
    success: function(res) {
        hideProgress();
       //alert('res:'+JSON.stringify(res)); 
       //alert('res.length ='+res.list.length);
      var items=res.list;
    
        if(items.length == '0'){
          $('#objcounts').text('目前顯示0個物件:');
          $("#no_objectlist").show();
          $("#objlist").hide();
          $("#page").hide();
        }else{
          $("#no_objectlist").hide();
          $("#objlist").show();
          $("#page").show();

          displayItem(items);
        //displayPage(res.totalPages,page);
        if(res.totalPages >0){
            if(isdestroy ==1){
              console.log('isdestroy ='+isdestroy);
             $(".pagination").twbsPagination('destroy');  
           }  
         ChangePage(res.totalPages);
         window.scrollTo(0, 0);
        }
         $('#objcounts').text('目前顯示'+res.totalCount+'個物件:');
        //目前顯示1個物件：
      }    
    },
    error: function() {
/*      alert("查詢環景照片失敗,請再重新更新畫面1次。");
      $( "#720Div" ).append('<img src="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/720_tour.jpg" data-caption="尚無環景圖片">'); */
    },
  }); 
  
}



function getItems(page){
  
   var url='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search?page='+page;
   console.log('url ='+url);
   urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list?page='+page;
   window.history.pushState("object or string", "Title", urlbar);
   ancyFun(url,page,0);
}



function getPageItems(page){

console.log('getPageItems search='+location.search);

var getUrl=location.search;
var urlbar='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/object/list'; 
console.log('location.search ='+getUrl);
console.log('location.search ='+getUrl.substring(0,getUrl.indexOf('page'))+'page='+page);
url ='<%=CONSTANT.WEBRESOURCE_INDEX_URL%>/service/api/obj/search'+getUrl.substring(0,getUrl.indexOf('page'))+'page='+page;

console.log('location.url='+location.search);
ancyFun(url,page);

urlbar=urlbar+getUrl.substring(0,getUrl.indexOf('page'))+'page='+page;
console.log('urlbar ='+urlbar);
window.history.pushState("object or string", "Title", urlbar); 

}


function displayItem(items){
  
  $("#objlist").empty();
  for(var i = 0; i < items.length; i++) {
    data = items[i];  
    
    var displayCerts ='style=display:none' ;
    var displayVideo ='style=display:none' ;
    var displayrentEndDay='style=display:none' ;
    var displayHasElevator='style=display:none' ;
    var displayParkings='style=display:none' ;
    if(data.certs >0){
      displayCerts='';
    }
    if(data.videoId >0){
      displayVideo='';
    }
    if(data.rentEndDay >0){
      displayrentEndDay='';
    }
    //has_elevator
    if(data.has_elevator >0){
      displayHasElevator='';
    }
    if(data.parkings >0){
      displayParkings='';
      }
    
    var locdesc;
    if(data.floor == 0){
      locdesc="全棟"+data.totalFloors+"樓";
    }else if(data.floor < 0){
      var floors = data.floor;
      floors =floors.toString();
      locdesc="地下"+floors.substring(1, 2)+"樓/共"+data.totalFloors+"樓";
    }
    else{
      locdesc=data.floor+"樓/共"+data.totalFloors+"樓";
    }
    
    var imgeUrl =data.coverUrl; 
    console.log('imgeUrl ='+imgeUrl);
    
    var lasttimePrice=data.lastTimePrice; 
        
    if(empty(lasttimePrice)){
      lasttimePrice='';
    }else{
      if(data.price < lasttimePrice){
      lasttimePrice=
      "<h3 class='money-h3'>"+formatNumber(lasttimePrice)+"萬</h3>";
      }else{
        lasttimePrice='';
      }
    }
    
    var coverUrl;
    if(empty(data.coverPhotoId)){
      coverUrl="<%=CONSTANT.WEBRESOURCE_URL%>/webresource/office/img/photo-pre.jpg'";
      
    }else{
      //coverUrl="${pageContext.request.contextPath}/images/get?photoId="+data.coverPhotoId+"&type=small'";
      coverUrl='<%=S3_CONSTANT.S3_CDN_HTTP_URL%><%=S3_CONSTANT.ROOT_BUCKET_NAME%>/images/<%=S3_CONSTANT.IMAGE_SMALL_PATH%>'+data.coverPhotoId;
    }
    
    
        //計算坪數          
        if(data.parking_square && data.parking_square >0){
        Pings = numeral(parseFloat(data.parking_square)+parseFloat(data.totalSquareFootage)).format('0.00');
      }
      else{
        Pings = numeral(data.totalSquareFootage).format('0.00');
      }
    
    
      var content =
      "<div class='b_item'>"+
      "<div class='event_item'>"+
      "<div class='list-money'>"+
      "<h2 class='money-h2'>"+formatNumber(data.price)+"萬</h2>"+lasttimePrice+
      
      "<a class='btn info-more' href='${pageContext.request.contextPath}/object/"+data.objectId+"?s=I20' target='_blank'><i class='fa fa-search'></i>點我看更多</a>"+
      "<h6 class='info-num' >物件編號：<span class='object-num'>"+data.objectId+"</span></h6>";
      var viewClass ='info-num';
      if(data.viewCount>=300){
        viewClass = 'nice-num';
      }
      content += "<h6 class='"+viewClass+"' >瀏覽次數：<span class='info-num'>"+data.viewCount+"</span></h6>"+
      "</div>"+
      "</div>"+
      "<div class='bitem_show'>"+
      "<div class='bitem_base'>";
      if(data.objStatus == 30 || data.objStatus == 4 || data.objStatus == 5 ){//成交,
        content += "<div><span class='soldout-tag'>已成交</span></div>";       
      }else{
        content += "<div><span class='list-tag'>"+data.objectKind2+"</span></div>";       
      }
      content += "<a href='${pageContext.request.contextPath}/object/"+data.objectId+"?s=I20' target='_blank'>"+
      "<img class='fixed-height' src='"+coverUrl+"'></img>"+ 
      "</a>"+
      "</div>"+
      "</div>"+
      "<div class='bitem_des'>"+                  
        "<div class='profile'></div><div class='house-title'><a href='${pageContext.request.contextPath}/object/"+data.objectId+"?s=I20' class='case_link' target='_blank'>"+data.subject+"</a></div>"+     
        "<p class='bhouse_num'><i class='fa fa-map-marker'></i>"+data.short_address+"</p>"+
        "<p class='add'></p>"+
        "<p class='b_persq'><span class='info-list'>總坪數 "+Pings+"坪</span><span class='info-list'>"+data.rooms+"房"+data.halls+"廳"+data.bathrooms+"衛</span><span class='info-list'>屋齡"+data.houseYears+"年</span></p>"+
        "<p class='add'>"+
         "<span class='info-list'>"+locdesc+"</span><span class='info-list'"+displayParkings+">含"+data.parkings+"車位</span><span class='info-list' "+displayHasElevator+">有電梯</span>"+
        "</p>"+
    "<p class='small-tab'><span class='tab-proof' "+displayCerts+" ><i class='fa fa-trophy' ></i> 窩牛認證</span><span class='tab-video' "+displayVideo+"><i class='fa fa-youtube-play'></i> 有專屬影片</span><span class='tab-rent' "+displayrentEndDay+"><i class='fa fa-user-plus'></i>帶租約</span></p>"+
    "</div>"+
  "</div>"; 
      $("#objlist").append(content);
  }
}



function formatNumber(str, glue) {

  // 如果傳入必需為數字型參數，不然就噴 isNaN 回去
  if(isNaN(str)) {
  return NaN;
  }

  // 決定三個位數的分隔符號

  var glue= (typeof glue== 'string') ? glue: ',';
  var digits = str.toString().split('.'); // 先分左邊跟小數點
  var integerDigits = digits[0].split(""); // 獎整數的部分切割成陣列
  var threeDigits = []; // 用來存放3個位數的陣列

  // 當數字足夠，從後面取出三個位數，轉成字串塞回 threeDigits

  while (integerDigits.length > 3) {

  threeDigits.unshift(integerDigits.splice(integerDigits.length - 3, 3).join(""));

  }

  threeDigits.unshift(integerDigits.join(""));

  digits[0] = threeDigits.join(glue);

  return digits.join(".");

  }

function displayPage(totalPate,page){
/*  alert("display keyword="+keyword);
  alert("display regionA="+regionA);
  alert("display districeCode="+districeCode); */
  console.log('totalPate ='+totalPate);
  var keyword=keyword;
  var regionA=regionA;

  var districeCode =districeCode;
  var districeCode
  if(empty(keyword)){
     keyword ='null';
   }
  if(empty(regionA)){
    regionA ='null';
   }
  if(empty(districeCode)){
    districeCode ='null';
   }
  $("#page").empty();
  var top;
  var pagelist='';
  var bottom;
  top=
"<ul class='pagination'>"+
"<li>"+
"<a href='javascript:;' onclick='getPageItems(1);' aria-label='first'>"+
    "<span aria-hidden='true'>←</span>"+
  "</a>"+
"</li>"+
"<li>"+
  "<a href='javascript:;' onClick='prePage("+page+");' aria-label='Previous'>"+
    "<span aria-hidden='true'>&laquo;</span>"+
  "</a>"+
"</li>";


for (i=1; i<=totalPate; i++)  
{     
  console.log('display  keyword='+keyword);
  console.log('display regionA='+regionA);
  console.log('display districeCode='+districeCode);
  var  displayActive='';
  if(page==i){
    displayActive ="<li class='active'>";
  }else{
    displayActive ="<li>";
  } 
   pagelist = pagelist +displayActive+"<a href='javascript:;' onclick='getPageItems("+i+");'>"+i+"</a></li>";  
  /* pagelist = pagelist +displayActive+"<a href='javascript:;' onclick='getItems("+i+","+keyword+","+regionA+","+districeCode+");'>"+i+"</a></li>";  */
  
  /* pagelist = pagelist +displayActive+"<a href='javascript:;' onclick='getItems("+i+","+keyword+");'>"+i+"</a></li>";  */
  /* pagelist = pagelist +displayActive+"<a href='javascript:;' onclick='getItems("+i+");'>"+i+"</a></li>"; */
}
 console.log("pagelist ="+pagelist);
/* "<li><a href='javascript:;' onclick='getItems(2);'>2</a></li>"+ */
bottom=
"<li>"+
  "<a href='javascript:;' onclick='nextPage("+totalPate+","+page+");' aria-label='Next'>"+
    "<span aria-hidden='true'>&raquo;</span>"+
  "</a>"+
"</li>"+  
"<li>"+
"<a href='javascript:;' onclick='getPageItems("+totalPate+");' aria-label='last'>"+
    "<span aria-hidden='true'>→</span>"+
  "</a>"+
"</li>"+
"</ul>";

$("#page").append(top+pagelist+bottom);
}


function prePage(page){
  
  if(page!=1){
    getPageItems(page-1);
  } 
}
function nextPage(totalPages,page){
  if(page!=totalPages){
    getPageItems(page+1);
  }     
}


function priceRangeFun(){
  
     
      var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    url ='${pageContext.request.contextPath}/service/api/obj/search?';
    urlbar='${pageContext.request.contextPath}/object/list?'; 
    
    
    
    if ( $("#checkRegionA").attr('checked') ) { 
        region ='A';
    }else{
      region ='';
    } 
    
    if ( $("#checkRegionB").attr('checked') ) { 
      if(empty(region)){
        region='B';
      }else{
        region ='A,B';
      }
    }

    //districeACode
      var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
        console.log('districeACodeArr='+districeACodeArr);
      if(!empty(districeACodeArr)){
        if (region.indexOf('B') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='A';
          } 
          districeCode =districeACodeArr;
        }
      //districeBCode
        var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();
      console.log('districeBCodeArr='+districeBCodeArr);
       if(!empty(districeBCodeArr)){
        if (region.indexOf('A') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='B';
            } 
        if(!empty(districeACodeArr)){
            districeCode =districeACodeArr+","+districeBCodeArr;
        }else{
          districeCode =districeBCodeArr;
        }
      }
         
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
        console.log('price districeCode ='+districeCode);
        
      
      var priceUp = $('#priceUP').val();
    var priceBottom =$('#priceBottom').val();
      
    if(!empty(priceUp) && !empty(priceBottom)){
      price =priceUp+"-"+priceBottom;
    }else if(empty(priceUp) && !empty(priceBottom)){
      price = priceBottom+'le';
    }else if(!empty(priceUp) && empty(priceBottom)){
      price = priceUp+'ge';
    }
      

      //坪數
      square =$('input[name="squarelow"]:checked', '#squareForm').val();
      if(square=== undefined){
        square='';
      }if(square =='NON'){
        var squareTop = $('#squareTop').val();
      var squareLow = $('#squareLow').val();
      console.log('squareTop ='+squareTop +' squareLow='+squareLow);
      if(!empty(squareLow) && !empty(squareTop)){
        square =squareLow+"-"+squareTop
      }else if(!empty(squareLow) && empty(squareTop)){
        square = squareLow+'le';
      }else if(empty(squareLow) && !empty(squareTop)){
        square = squareTop+'ge';
      }
      }
      if(!empty(square)){
        square=square;
      } 
      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    window.history.pushState("object or string", "Title", urlbar); 
    ancyFun(url,1,1);
    $("#orderSelect").attr("value",'modifyDatetime_desc');
  
    $('input:radio[name="priceradio"][value="NON"]').prop('checked', true);
  
}


function squareRangeFun(){
  
      var keyword=  $('input[name="keyword"]').val();
    var region='';
    var districeCode='';
    var objType =''; 
    var square='';
    var rooms ='';
    var price='';
    var advances='';
    url ='${pageContext.request.contextPath}/service/api/obj/search?';
    urlbar='${pageContext.request.contextPath}/object/list?'; 
    
    if ( $("#checkRegionA").attr('checked') ) { 
        region ='A';
    }else{
      region ='';
    } 
    
    if ( $("#checkRegionB").attr('checked') ) { 
      if(empty(region)){
        region='B';
      }else{
        region ='A,B';
      }
    }

    //districeACode
      var districeACodeArr = $('.districeACode:checked').map(function () {
      return this.value;
       }).get();
        console.log('districeACodeArr='+districeACodeArr);
      if(!empty(districeACodeArr)){
        if (region.indexOf('B') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='A';
          } 
          districeCode =districeACodeArr;
        }
      //districeBCode
        var districeBCodeArr = $('.districeBCode:checked').map(function () {
        return this.value;
       }).get();
      console.log('districeBCodeArr='+districeBCodeArr);
       if(!empty(districeBCodeArr)){
        if (region.indexOf('A') !== -1) {
              region='A,B';
           }else if(empty(region)){
            region='B';
            } 
        if(!empty(districeACodeArr)){
            districeCode =districeACodeArr+","+districeBCodeArr;
        }else{
          districeCode =districeBCodeArr;
        }
      }
         
         
         //objType
            var objectTypes = $('.objTypeValue:checked').map(function () {
              return this.value;
             }).get();
            console.log('objTypeValue='+objectTypes);
             if(!empty(objectTypes)){
                objType=objectTypes;
               
             }
        console.log('price districeCode ='+districeCode);

        
        
        //坪數
          var squareTop = $('#squareTop').val();
        var squareLow = $('#squareLow').val();
        console.log('squareTop ='+squareTop +' squareLow='+squareLow);
        
        if(!empty(squareLow) && !empty(squareTop)){
          square =squareLow+"-"+squareTop
        }else if(!empty(squareLow) && empty(squareTop)){
          square = squareLow+'le';
        }else if(empty(squareLow) && !empty(squareTop)){
          square = squareTop+'ge';
        }
        
        
        //價格
          price =$('input[name="priceradio"]:checked', '#priceForm').val();
          if(price=== undefined){
            price='';
          }if(price =='NON'){
            var priceUp = $('#priceUP').val();
          var priceBottom =$('#priceBottom').val();
            
          if(!empty(priceUp) && !empty(priceBottom)){
            price =priceUp+"-"+priceBottom;
          }else if(empty(priceUp) && !empty(priceBottom)){
            price = priceBottom+'le';
          }else if(!empty(priceUp) && empty(priceBottom)){
            price = priceUp+'ge';
          }else{
            price='';
          }
          }


      //格局
      rooms =$('input[name="squarelow"]:checked', '#roomsForm').val();
      if(rooms=== undefined){
        rooms='';
      }   
    //進階 advanceValue
       var  advanceCheck = $('.advanceValue:checked').map(function () {
          return this.value;
         }).get();
        console.log('advanceCheck='+advanceCheck);
         if(!empty(advanceCheck)){
          advances=advanceCheck;
           
         }

    url=url+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    console.log('url ='+url);
    urlbar=urlbar+'keyword='+keyword+'&region='+region+'&districeCode='+districeCode+'&objType='+objType+'&price='+price+'&square='+square+'&rooms='+rooms+'&advances='+advances+'&page=1';
    window.history.pushState("object or string", "Title", urlbar); 
    ancyFun(url,1,1);
    $("#orderSelect").attr("value",'modifyDatetime_desc');
  
    $('input:radio[name="squarelow"][value="NON"]').prop('checked', true);
  
}



</script>
<script>
    $('.anchor').deepcheckboxa({
      readableListTarget: '.selected-readable',
      onChange: function(items, except) {
        $('.selected').html('[' + items.join(', ') + ']');
        $('.excepted').html('[' + except.join(', ') + ']');
      }
    });
</script>      

<div class="divide40"></div>
  <%@ include file="../common/hotjar.jsp" %>
<%@ include file="../common/rwdfooter-list.jsp"%>
<%@ include file="../common/ga.jsp"%>
<style>
.b_item {
z-index:10;
}
</style>
</body>
</html> 

