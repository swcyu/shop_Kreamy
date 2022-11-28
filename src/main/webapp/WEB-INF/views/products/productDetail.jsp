<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KREAMY | 한정판 거래의 FLEX</title>

<title>${pIdto.korProduct }</title>
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/productDetail.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/cd5dd810df.js" crossorigin="anonymous"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 



<style type="text/css">


.slick-arrow.slick-next {
    right: 0;
    z-index: 1;
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxwYXRoIHN0cm9rZT0iI0QzRDNEMyIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik0xNi41IDExbDExIDExLTExIDExIi8+Cjwvc3ZnPg==) no-repeat;
}
.slick-arrow.slick-prev {
    left: 0;
    z-index: 1;
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxwYXRoIHN0cm9rZT0iI0QzRDNEMyIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik0yNy41IDMzbC0xMS0xMSAxMS0xMSIvPgo8L3N2Zz4=) no-repeat;
} 
 
.slick-prev:before,.slick-next:before {
    content: '';
} 
 
 .slick-dots>li>button {
    width: 32px;
    height: 12px;
    font-size: 0;
    color: rgba(0,0,0,0);
    vertical-align: top;
    cursor: pointer;
    margin: 0;
}
 
.slick-dots>li+li {
    margin-left: 8px;
}

.slick-dots {
    position: absolute;
    bottom: 7px;
    left: 0;
    right: 0;
    text-align: center;
    display: block!important;
}

.slick-dots>li {
    display: inline-block;
    vertical-align: top;
}

.slick-dots .slick-active button:before {
    background-color: #222;
}


.slick-dots>li>button:before {
    content: "";
    display: inline-block;
    width: 100%;
    height: 2px;
    background-color: #e0d9d8;
} 

.slick-dotted.slick-slider {
    margin-bottom: 0;
}

.slick-dots li {   
    margin: 0;
    width: 32px;
    height: 19px;
    
}


</style>


<script type="text/javascript">



$('html').ready(function(){
	if($(document).scrollTop()>($('.column_bind').height()-$('.column_box').height())){
		$('#column1').attr('class','column is_absolute');
	} 
	
	
	
	
	$.ajax({
		url : "http://localhost:8080/kreamy/pDAjax",
		data : {engProduct:'${pIdto.engProduct}',prodSize:"모든 사이즈",
			ob1:"tradeDate",sort1:"desc",
			ob2:"price",sort2:"",
			ob3:"price",sort3:"desc"},
		success : function(result) {
		 	var refine = $(".wrap_sales").html(result).find('.wrap_sales').children();
            $('.wrap_sales').html(refine);	               
            var refine2 = $(".wrap_bids").find('#panel2').html(result).find('#bidBuy').children('div').children();
            $('.wrap_bids').find('#panel2').html(refine2);            
            var refine3 = $(".wrap_bids").find('#panel1').html(result).find('#bidSell').children('div').children();
            $('.wrap_bids').find('#panel1').html(refine3); 
            var refine4 = $("#layer_market_price").find('#panel1').html(result).find('#mp').children('#panel1').children();
            $('#layer_market_price').find('#panel1').html(refine4); 
            var refine5 = $("#layer_market_price").find('#panel2').html(result).find('#mp').children('#panel2').children();
            $('#layer_market_price').find('#panel2').html(refine5);
            var refine6 = $("#layer_market_price").find('#panel3').html(result).find('#mp').children('#panel3').children();
            $('#layer_market_price').find('#panel3').html(refine6);
            
		}
	});
	
}); 




function searchBoxOn() {
	$("#searchBox").show();	
}
function closeSearch() {
	$("#searchBox").hide();	
}
function requestGet() {

	var bb = document.searchForm.searchKey.value;
		
	$("#searchContent").html(bb);
	$("#ajaxContent").show();	
	var aa = "searchKey=" + document.searchForm.searchKey.value;
		$.ajax({
		type:"POST",
		url : "searchPage",
		data:aa,
		success:function(args){
			
			$("#ajaxContent").html(args);
			
			
		},error:function(e){
			alert(e.responseText);
		}
		
	});
	$("#directSearch").hide();	

}
function searchBoxOn() {
	$("#main_searchKey").val('');
	$("#searchBox").hide();	
	$("#searchContent").val('');
	$("#ajaxContent").hide();	
	$("#directSearch").show();	
	$("#searchBox").show();	
}

function closeSearch() {

	$("#main_searchKey").val('');
	
	$("#searchBox").hide();	
	$("#searchContent").val('');
	$("#ajaxContent").hide();	
	$("#directSearch").show();	
}


function requestGet() {

	var bb = document.searchForm.searchKey.value;
		
	$("#searchContent").html(bb);
	$("#ajaxContent").show();	
	
	
	var aa = "searchKey=" + document.searchForm.searchKey.value;
	
	
		$.ajax({
		
		type:"POST",
		url : "searchPage",
		data:aa,
		success:function(args){
			
			$("#ajaxContent").html(args);			
			
		},error:function(e){
			alert(e.responseText);
		}		
		
	});
	$("#directSearch").hide();	

}
</script>

</head>
<body> 

<div id="nuxt" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block; font-size: 14px; font-weight: 400;
	line-height: 21px; text-align: left;">
	<!--  -->
	<div id="layout" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block;">
	
		<div class="wrap win_os lg" style="position: relative; padding-top: 100px;">
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); min-height: 90px; position: fixed; top: 0; left: 0; right: 0;
			 z-index: 1000; background-color: #fff;" >
				<div>
					<div class="header_top" style="box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);">
						<div class="top_inner" style="display: flex; padding: 8px 40px;">
							
							
							
							<ul class="top_list" style="align-items: center; margin-left: auto; display: flex; list-style: none;margin-top: 0;margin-bottom: -1rem; ">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="noticeList" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">고객센터</a>
								</li>
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="wish" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">관심상품</a>
								</li>
								<c:if test="${userNum!=0 }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/myPage" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">마이페이지</a>
								</li>
								</c:if>
								<c:if test="${userNum==0 }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/admin" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">관리자페이지</a>
								</li>
								</c:if>
								<c:if test="${userNum==null }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/login" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">로그인</a>
								</li>
								</c:if>
								<c:if test="${userNum!=null }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="logout" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">로그아웃</a>
								</li>
								</c:if>
							</ul>
						</div>
						<hr style="    margin-top: 1rem; margin-bottom: -1rem; height:1px;color:#222 ; opacity: 10%">
						
						<div class="header_main" style="" >
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 68px; min-width: 320px; align-items: center;" >
								<h1 style="margin-top: 14px;padding-top: 3px;" >
									<a href="mainPage" class="logo" >									
										<img src="/img/Kreamy.png" style="width: 167px; height: 41px;">
									</a>
								</h1>
								
								<div class="gnb_area" style="display: flex; align-items: center; margin-left: auto;" >
									<div class="gnb" style="" >
										<ul class="gnb_list" style="display: flex; align-items: center; list-style: none;margin-top: 0;margin-bottom: -1rem;" >											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="shop.action" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> SHOP </a>
											</li>
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="authPolicy" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> POLICY </a>
											</li>											
											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="noticeList" target="_blank" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> NOTICE </a>
											</li>		
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -6px; " >
											<a target="_blank" class="gnb_link" style="cursor: pointer;">
											<svg onclick="searchBoxOn();" xmlns="http://www.w3.org/2000/svg" id="i-nav-search" fill="none" viewBox="0 0 28 28" style="width: 28px;">
											<path fill="#222" fill-rule="evenodd" d="M20.167 12.25a7.918 7.918 0 11-15.835-.001 7.918
											 7.918 0 0115.835.001zm-.233 6.27a9.883 9.883 0 002.233-6.27c0-5.477-4.44-9.916-9.917-9.916-5.477
											  0-9.917 4.44-9.917 9.916 0 5.477 4.44 9.917 9.917 9.917a9.877 9.877 0 006.27-2.233l5.273 5.273
											   1.414-1.414-5.273-5.273z" clip-rule="evenodd"></path></svg>
											</a>
											</li>										
											
										</ul>
									</div>
								<!-- gnb_area -->	
								</div>
								
								<div class="layer_search lg" id="searchBox" style="position: fixed; top: 0; right: 0; left: 0; bottom: 0; height: 100%;
								background: rgba(34,34,34,.5); overflow-y: auto; display: none;">
									<div class="search_container" style="background-color: #fff;">
										<div class="search_wrap" style=" width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
										overflow: hidden; display: flex; padding: 25px 40px 19px;">
											<div class="search_area" style="flex: 1; margin-right: 20px;">
												<div class="search" style=" position: relative;  padding: 0 40px 0 44px; height: 40px;
												    background-color: #f4f4f4; border-radius: 8px;">
												    
												    
												 <form action="" name="searchForm">												
													<input id="main_searchKey" onkeyup="requestGet();" name="searchKey" type="text" class="input_search show_placeholder_on_focus"
													style="width: 100%; height: 100%; transition: all .1s;  font-size: 14px;  letter-spacing: -.21px;
													padding: 0;  outline: 0;  border: 0; resize: none; border-radius: 0; background-color: rgba(0,0,0,0);"/>
												</form>
												
												</div>
											</div>
											<button class="btn_close" style=" margin-left: auto;
											    padding: 0; border: 0; outline: none; background: none; background-color: rgba(0,0,0,0);
											    appearance: none; border-radius: 0;" onclick="closeSearch();">
											취소
											</button>
										</div>
									
									</div>
									
									<!-- 검색시 없어져야함 -->
									<div class="recent_wrap" id="directSearch" style="background-color: #fff;">
										<div class="recent_area" style="position: relative; padding-bottom: 42px;">
											<div class="recent_box" style="width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
											 overflow: hidden; padding: 0 40px 10px;">
											 <strong class="recent_title" style="display: inline-block; line-height: 20px; font-size: 12px;color: #000;
   											 vertical-align: middle;">바로검색</strong>									
											
											</div>
											
											<div class="brand_list lg" style=" width: 704px;  padding-left: 0; padding-right: 0; margin: 0 auto;
											 overflow: hidden; padding: 0 40px; white-space: nowrap;"> 
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shopSearch.action?searchKey=Jordan">
											<img width="85px" height="85px" src="/img/Jordan 1 Retro High OG University Blue_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Jordan</b></p>	
											</a>	
											</button>	
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shopSearch.action?searchKey=Dunk">
											<img width="85px" height="85px" src="/img/Nike Dunk Low Retro Black_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Dunk</b></p>
											</a>	
											</button>
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shopSearch.action?searchKey=Palace">
											<img width="85px" height="85px" src="/img/Palace Basically A Tri-Flag T-Shirt Black (21SS)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Palace</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shopSearch.action?searchKey=Backpack">
											<img width="85px" height="85px" src="/img/Supreme Backpack Red (18FW)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>백팩</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shopSearch.action?searchKey=Supreme">
											<img width="85px" height="85px" src="/img/Supreme Swarovski Zippo Red (20FW)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Supreme</b></p>
											</a>
											</button>
											
											</div>
											
										</div>
									</div>
									
									<!-- 아작스에 붙일부분 -->
									<div id="ajaxContent"  class="suggest_wrap" style="background-color: #fff; display: none;">
										
									
										<div class="suggest_area" style="width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
										 overflow: hidden; position: relative; padding: 0 44px 23px 40px; ">
											<div class="suggest_title_area" style="margin-right: 43px;font-size: 14px; letter-spacing: -.21px;
											    color: #000; line-height: 20px; font-weight: 700; padding-top: 9px; padding-right: 100px;
											     padding-bottom: 13px; border-bottom: 1px solid #ebebeb;">
													<p class="suggest_title" style="font-size: 14px; letter-spacing: -.21px; color: #000;" 
													id="searchContent">
													
													 </p>
													 <a class="suugest_count" style="right: 49px; position: absolute; top: 5px;">
													 <span class="more_text" style="margin-top: 1px; margin-right: 2px; display: inline-block;
													   vertical-align: top; font-size: 12px; line-height: 16px; letter-spacing: -.06px;
													    color: #000;">
													${maxNum1 }
													 </span>
													 </a>
											<!-- suggest_tile area -->
											</div>
											<div class="suggest_list lg" style="padding-right: 43px; max-height: 420px; overflow-y: auto;">
												<div class="suggest_item" style="height: auto; border-bottom: 1px solid #ebebeb;" >
													
													<c:if test="${maxNum1!=0 }">
													<c:forEach var="dto" items="${prodImagelists1}">		
													<a href="mainToProducts?engProduct=${dto.engProduct }" class="suggest_link" style="display: flex; align-items: center; height:84px;">
														<div class="suggest_thum" style="overflow: hidden; margin-right: 7px; width: 70px; height: 70px;flex-shrink: 0;border-radius: 8px;">
														<img src="/img/${dto.imageName }" style="width: 100%; height: 100%; border: 0; vertical-align: top;">
														</div>
														
														<div class="suggest_info">
														<p class="title_kor" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box;
														    font-size: 14px;letter-spacing: -.21px;">
														   ${dto.engProduct }
														 </p>
														 <p class="model_eng" style="margin-top: 2px; font-size: 12px; letter-spacing: -.06px;
														     color: rgba(34,34,34,.5); overflow: hidden; text-overflow: ellipsis; display: -webkit-box;">
														 	
														 	<c:if test="${dto.shopPrice!=null}">
														 	<fmt:formatNumber value="${dto.shopPrice }" type="number" maxFractionDigits="3"/>원
														 	</c:if>
														 	<c:if test="${dto.shopPrice==null}">
														 	<b>-</b>
														 	</c:if>
														 
														 </p>
														 
														</div>
													</a>
													</c:forEach>
													</c:if>
													<c:if test="${maxNum1==0 }">
	
														<div align="center">
														<br/><br/><br/><br/>
														<p style="font-size: 16px; letter-spacing: -.16px; color: rgba(34,34,34,.8);">검색하신 결과가 없습니다.</p>
														<p style="padding-top: 6px; font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">상품 등록 요청은 1:1 문의하기로 요청해주세요.</p>
														</div>
														
													</c:if>	
												</div>
												
												
											</div>
										<!-- suggestArea -->
										</div>
										
									<!-- suggest_wrap -->
									</div>
								
								<!-- layer_search lg -->
								</div>
								
								
							<!-- mainArea -->
							</div>
						
						</div>
						
					</div>
				</div>
			
			<!-- header lg -->
			</div>
		
		
			
		
		
		
			<div class="contain" style="overflow: hidden; position: relative; margin-top: -4px;min-height: 461px;">
			
			
			
			
			
	
			<div id="__nuxt" class="">
<div class="wrap">
<!-- span 검색하면 추천나오는거 추가 -->
<div class="container detail lg">
<div class="content">
<div class="column_area">
	<div class="column_bind">		
		<div id="column1" class="column is_fixed">
		
			<div class="spread"></div>
			
			<div class="column_box" style="max-width: 570px;">
							
				<div class="detail_banner_area lg">
				<c:if test="${imageLists.size() eq 1}">
					<div class="banner_slide">
					<div>
					<div class="slide_item" style="background-color: #f6f6f6;">
						<div class="item_inner">
							<div class="product" style="background-color: #f6f6f6;">
								<img src="/img/${repImage}" class="product_img">
							</div>
						</div>
					</div>
					</div>
					</div>
				</c:if>
				<c:if test="${imageLists.size() ne 1}">
				<!-- slick slide -->
					<div class="banner_slide">
					<c:forEach var="image" items="${imageLists }">					
						<div>
							<div class="slide_item" style="background-color: #f6f6f6;">
							<div class="item_inner">
								<div class="product" style="background-color: #f6f6f6;">
									<img src="/img/${image }" class="product_img">
								</div>
							</div>
							</div>
						</div>
					</c:forEach>			    
	
	  				</div>
				</c:if>							
				</div>	
				<div class="banner_method">						
					<a class="method_link"><div class="method_box"><p class="method_title">KREAMY 구매 방법</p><p class="method_text">구매 프로세스를 확인 후 구매해주세요.</p></div></a>					
				</div>
			</div>		
		</div>	
		
		<div class="column">
			<div class="column_box">
				<div class="column_top">
					<div class="detail_main_title lg has_btn">
						<div class="main_title_box">
							<h2 class="title" style="margin: 0;padding: 0"> ${pIdto.engProduct } </h2>
							<p class="sub_title">${pIdto.korProduct }</p>
						</div>
						<a class="btn_wish">
							<c:choose>
								<c:when test="${wsc>0 }">
									<svg class="wb hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-wish-off" fill="none" viewBox="0 0 24 24"><path stroke="#222" d="M5 3.5h14v17.367l-6.326-5.77a1.003 1.003 0 00-1.348 0L5 20.868V3.5z"></path></svg>
									<svg class="wb2" xmlns="http://www.w3.org/2000/svg" id="i-ico-wish-on" fill="none" viewBox="0 0 24 24"><path fill="#222" stroke="#222" d="M5 3.5h14v17.367l-6.326-5.77a1.003 1.003 0 00-1.348 0L5 20.868V3.5z"></path></svg>									
								</c:when>
								<c:otherwise>
									<svg class="wb" xmlns="http://www.w3.org/2000/svg" id="i-ico-wish-off" fill="none" viewBox="0 0 24 24"><path stroke="#222" d="M5 3.5h14v17.367l-6.326-5.77a1.003 1.003 0 00-1.348 0L5 20.868V3.5z"></path></svg>
									<svg class="wb2 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-wish-on" fill="none" viewBox="0 0 24 24"><path fill="#222" stroke="#222" d="M5 3.5h14v17.367l-6.326-5.77a1.003 1.003 0 00-1.348 0L5 20.868V3.5z"></path></svg>
								</c:otherwise>
							</c:choose>							
						</a>
					</div>
					
					<div id="layer_detail_size_select_buy" class="hide">
						<div class="layer_container">
							<div class="layer_header"><h2 class="title"> 사이즈 선택 <span class="subtitle">즉시 구매가(원)</span></h2></div>
							<div class="layer_content">
								<div class="select_area lg">
									<ul class="select_list">
									<c:forEach var="dto" items="${productsList }">
										<li class="select_item">
											<button class="select_link buy">											
												<div class="link_inner">
													<span class="size">${dto.prodSize }</span>
													<span class="price">
														<c:choose>
															<c:when test="${empty dto.immeBuyPrice }">구매입찰</c:when> 
															<c:otherwise><fmt:formatNumber value="${dto.immeBuyPrice }" type="number"/></c:otherwise>
														</c:choose> 
													</span>
												</div>												
											</button>
										</li>
									</c:forEach>	
									</ul>
								</div>
							</div>	
							<a href="#" class="btn_layer_close"><img src="/img/x_mark.png" class="pop_x_btn"></a>							
						</div>
					</div>
					
					<div id="layer_detail_size_select_sell" class="hide">
						<div class="layer_container">
							<div class="layer_header"><h2 class="title"> 사이즈 선택 <span class="subtitle">즉시 판매가(원)</span></h2></div>
							<div class="layer_content">
								<div class="select_area lg">
									<ul class="select_list">
									<c:forEach var="dto" items="${productsList }">
										<li class="select_item">
											<button class="select_link sell">											
												<div class="link_inner">
													<span class="size">${dto.prodSize }</span>
													<span class="price">
														<c:choose>
															<c:when test="${empty dto.immeSellPrice }">판매입찰</c:when> 
															<c:otherwise><fmt:formatNumber value="${dto.immeSellPrice }" type="number"/></c:otherwise>
														</c:choose> 
													</span>
												</div>												
											</button>
										</li>
									</c:forEach>	
									</ul>
								</div>
							</div>
							<a href="#" class="btn_layer_close"><img src="/img/x_mark.png" class="pop_x_btn"></a>									
						</div>
					</div>
					
					
					
					
					
					<div id="layer_detail_size_select" class="hide">
						<div class="layer_container">
							<div class="layer_header"><h2 class="title"> 사이즈 선택 <span class="subtitle">즉시 구매가(원)</span></h2></div>
							<div class="layer_content">
								<div class="select_area lg">
									<ul class="select_list">
										<li class="select_item active">
											<button role="button" aria-selected="true" class="select_link buy">
												<div class="link_inner">
													<span class="size">모든 사이즈</span>
													<span class="price">
														<c:choose>
															<c:when test="${empty prodTotdto.immeBuyPrice }">구매입찰</c:when> 
															<c:otherwise><fmt:formatNumber value="${prodTotdto.immeBuyPrice }" type="number"/></c:otherwise>
														</c:choose>
													</span>
													<p class="immeSellPrice"><fmt:formatNumber value="${prodTotdto.immeSellPrice }" type="number"/></p>
													<p class="latestPrice"><fmt:formatNumber value="${prodTotdto.latestPrice }" type="number"/></p>
													<p class="latestPrice2">${prodTotdto.latestPrice2 }</p>													
													<c:choose>
														<c:when test="${empty prodTotdto.latestPrice2 }">
															<p class="latestDif">-</p>
															<p class="latestDifPer"></p>															
														</c:when> 
														<c:otherwise>
															<c:choose>
																<c:when test="${(prodTotdto.latestPrice2 - prodTotdto.latestPrice)>0 }">
																	<p class="latestDif"><fmt:formatNumber value="${prodTotdto.latestPrice2 - prodTotdto.latestPrice }" type="number"/></p>
																</c:when>
																<c:otherwise>
																	<p class="latestDif"><fmt:formatNumber value="${prodTotdto.latestPrice - prodTotdto.latestPrice2 }" type="number"/></p>
																</c:otherwise>
															</c:choose>															
															<p class="latestDifPer"><fmt:formatNumber value="${100*(prodTotdto.latestPrice2 - prodTotdto.latestPrice)/prodTotdto.latestPrice2 }" pattern="0.0"/></p>
														</c:otherwise>
													</c:choose>  
												</div>
											</button>
										</li>
										<c:forEach var="productsDTO" items="${productsList }">
										<li class="select_item">
											<button role="button" aria-selected="false" class="select_link buy">
												<div class="link_inner">
													<span class="size">${productsDTO.prodSize }</span>
													<span class="price">
														<c:choose>
															<c:when test="${empty productsDTO.immeBuyPrice }">구매입찰</c:when> 
															<c:otherwise><fmt:formatNumber value="${productsDTO.immeBuyPrice }" type="number"/></c:otherwise>
														</c:choose> 
													</span>
													<p class="immeSellPrice"><fmt:formatNumber value="${productsDTO.immeSellPrice }" type="number"/></p>
													<p class="latestPrice"><fmt:formatNumber value="${productsDTO.latestPrice }" type="number"/></p>
													<p class="latestPrice2">${productsDTO.latestPrice2 }</p>													
													<c:choose>
														<c:when test="${empty productsDTO.latestPrice2 }">
															<p class="latestDif">-</p>
															<p class="latestDifPer"></p>															
														</c:when> 
														<c:otherwise>
															<c:choose>
																<c:when test="${(productsDTO.latestPrice2 - productsDTO.latestPrice)>0 }">
																	<p class="latestDif"><fmt:formatNumber value="${productsDTO.latestPrice2 - productsDTO.latestPrice }" type="number"/></p>
																</c:when>
																<c:otherwise>
																	<p class="latestDif"><fmt:formatNumber value="${productsDTO.latestPrice - productsDTO.latestPrice2 }" type="number"/></p>
																</c:otherwise>
															</c:choose>															
															<p class="latestDifPer"><fmt:formatNumber value="${100*(productsDTO.latestPrice2 - productsDTO.latestPrice)/productsDTO.latestPrice2 }" pattern="0.0"/></p>
														</c:otherwise>
													</c:choose>  
												</div>
											</button>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<a href="#" class="btn_layer_close"><img src="/img/x_mark.png" class="pop_x_btn"></a>
						</div>
					</div>
					
					
					
					
					
					
					
					<div class="detail_size lg" style="height: 76px">
						<div class="title">
							<span class="title_txt">사이즈</span>
						</div>
						<div class="size">
							<a class="btn_size">
								<span class="btn_text">모든 사이즈</span>
							 	<img src="/img/size_btn.png" style="width: 24px; height: 24px;">
							</a>
						</div>				
					
					</div>
					
					<div class="detail_price lg">
						<div class="title" style="float: left;">
							<span class="title_txt">최근 거래가</span>
						</div>
						<div class="price">
							<div class="amount">
								<c:choose>
									<c:when test="${empty prodTotdto.latestPrice }">
										<span class="num">-</span>
										<span class="won"></span>
									</c:when> 
									<c:otherwise>
										<span class="num"><fmt:formatNumber value="${prodTotdto.latestPrice }" type="number"/></span>
										<span class="won">원</span>
									</c:otherwise>
								</c:choose> 
								
							</div>
							<c:choose>
								<c:when test="${empty prodTotdto.latestPrice2 }">
									<div class="fluctuation">
										<p>-</p>
									</div>
								</c:when> 
								<c:otherwise>
									<c:choose>
										<c:when test="${(prodTotdto.latestPrice2 - prodTotdto.latestPrice)>0 }">
											<div class="fluctuation decrease">
												<p><fmt:formatNumber value="${prodTotdto.latestPrice2 - prodTotdto.latestPrice }" type="number"/>원 (<fmt:formatNumber value="${100*(prodTotdto.latestPrice2 - prodTotdto.latestPrice)/prodTotdto.latestPrice2 }" pattern="0.0"/>%)</p>
											</div>
										</c:when>
										<c:when test="${(prodTotdto.latestPrice2 - prodTotdto.latestPrice)<0 }">
											<div class="fluctuation increase">
												<p><fmt:formatNumber value="${prodTotdto.latestPrice - prodTotdto.latestPrice2 }" type="number"/>원 (<fmt:formatNumber value="${100*(prodTotdto.latestPrice2 - prodTotdto.latestPrice)/prodTotdto.latestPrice2 }" pattern="0.0"/>%)</p>
											</div>
										
										</c:when>
										<c:otherwise>
											<div class="fluctuation"><p>-</p></div>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
							
						</div>
					</div>
					
					<div class="division_btn_box lg">
						<a href="#" class="btn_division buy">
							<strong class="title">구매</strong>
							<div class="price">
								<span class="amount">
								<c:choose>
									<c:when test="${empty prodTotdto.immeBuyPrice }">
										<em class="num">-</em>
										<span class="won"></span>
									</c:when> 
									<c:otherwise>
										<em class="num"><fmt:formatNumber value="${prodTotdto.immeBuyPrice }" type="number"/></em>
										<span class="won">원</span>										
									</c:otherwise>								
								</c:choose>
								</span>
								<span class="desc" style="float: left; text-align: left;">즉시 구매가</span>
							</div>
						</a>
						<a href="#" class="btn_division sell">
							<strong class="title">판매</strong>
							<div class="price">
								<span class="amount">
									<c:choose>
									<c:when test="${empty prodTotdto.immeSellPrice }">
										<em class="num">-</em>
										<span class="won"></span>
									</c:when> 
									<c:otherwise>
										<em class="num"><fmt:formatNumber value="${prodTotdto.immeSellPrice }" type="number"/></em>
										<span class="won">원</span>										
									</c:otherwise>									
									</c:choose>								
								</span>
								<span class="desc" style="float: left; text-align: left;">즉시 판매가</span>
							</div>
						</a>
					</div>
					
					<div class="banner_alert lg">
						<a href="#" class="alert_wrap">
							<div class="alert_icon">
								<img src="/img/caution_mark.png" style="width: 28px; height: 28px;">
							</div>
							<div class="banner_alert_content">
								<p class="alert_title">판매 거래 주의사항</p>
								<p class="alert_subtext">반드시 보유한 상품만 판매하세요.</p>
							</div>
							<div class="alert_img">
								<img src="/img/right_sign.png" height="44" alt="상품 주의사항 이미지">
							</div>
						</a>
					</div>
					
					
				</div>
				
				
				<!-- ---------- confirm-wrap ---------------- -->
				
				<div class="confirm_wrap">
					<h3 class="confirm_title">구매 전 꼭 확인해주세요!</h3>
					<div class="confirm_content"><ul class="dropdown_list">
						<li class=""><div class="dropdown">
							<div class="dropdown_head"><p class="title">배송 기간 안내</p><i class="fas fa-angle-down" style="margin-left: auto; width: 24px; height: 24px; flex-shrink: 0;"></i></div>							
							<div class="dropdown_content"><div class="content">
								<div class="content_box">
									<div class="emphasis_box"><strong class="emphasis">KREAMY는 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</strong></div>
									<ul class="content_list">
										<li class="content_item">
											<p class="main_txt"> - 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 KREAMY 검수센터에 도착합니다. </p>
										</li>
										<li class="content_item">
											<p class="main_txt"> - 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다. </p>
											<p class="sub_txt">* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수 있습니다.</p>
										</li>
										<li class="content_item">
											<p class="main_txt"> - 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음 영업일에 출고됩니다. </p>
										</li>
									</ul>
								</div>
							</div></div>
						</div></li>
						<li class=""><div class="dropdown">
							<div class="dropdown_head"><p class="title">검수 안내</p><i class="fas fa-angle-down" style="margin-left: auto; width: 24px; height: 24px; flex-shrink: 0;"></i></div>
							<div class="dropdown_content"><div class="content">
								<div class="content_box">
									<div class="emphasis_box"><strong class="emphasis">판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</strong></div>
									<ul class="content_list">
										<li class="content_item">
											<p class="main_txt"> - 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다. </p>
										</li>
										<li class="content_item">
											<p class="main_txt"> - 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다. </p>
										</li>
									</ul>
								</div>
								<div class="content_box">
									<div class="emphasis_box"><strong class="emphasis">검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.</strong><a href="#" class="txt_link"> 검수기준 보기 </a></div>
									<ul class="content_list">
										<li class="content_item">
											<p class="sub_txt">* 검수 합격: KREAMY 검수택(Tag)이 부착되어 배송을 준비함</p>
										</li>
										<li class="content_item">
											<p class="sub_txt">* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)</p>
										</li>
										<li class="content_item">
											<p class="sub_txt">* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)</p>
										</li>
									</ul>
								</div>
							</div></div>
						</div></li>
						<li class=""><div class="dropdown">
							<div class="dropdown_head"><p class="title">구매 환불/취소/교환 안내</p><i class="fas fa-angle-down" style="margin-left: auto; width: 24px; height: 24px; flex-shrink: 0;"></i></div>
							<div class="dropdown_content"><div class="content">
								<div class="content_box">
									<div class="emphasis_box"><strong class="emphasis">KREAMY는 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</strong></div>
									<ul class="content_list">
										<li class="content_item">
											<p class="main_txt"> - 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 KREAMY에서 재판매를 하실 수 있습니다. </p>
										</li>
										<li class="content_item">
											<p class="main_txt"> - 상품 수령 후, 이상이 있는 경우 KREAMY 고객센터로 문의해주시기 바랍니다. </p>
										</li>
									</ul>
								</div>
							</div></div>
						</div></li>
					</ul></div>					
				</div>
				
				<!-- ---------- confirm-wrap end ---------------- -->				
				<!-- --------detail_wrap 시작 ------------- -->
				<div class="detail_wrap">
					 <div>
					 	<h3 class="detail_title lg"> 체결 거래 </h3>
					 	<div class="wrap_sales">
					 	</div>
					 </div>	
				 	<!-- ----------입찰내역 시작------------ -->
		 			<div>
		 				<h3 class="detail_title lg"> 입찰 내역 </h3>
		 				<div class="wrap_bids">
		 					<div class="tab_area">
		 						<ul role="tablist" class="tab_list">
		 							<li role="tab" aria-controls="panel1" class="item">
		 								<a class="item_link">판매 입찰</a>
		 							</li>
		 							<li role="tab" aria-controls="panel2" class="item on">
		 								<a class="item_link">구매 입찰</a>
		 							</li>
		 						</ul>
		 						<div id="panel1" class="tab_content">
		 							<div class="table_wrap lg">
		 								<table>
		 									<caption><span class="blind">데이터 테이블</span></caption>
		 									<colgroup>
		 										<col style="width:29.76%;">
		 										<col style="width:36.52%;">
		 										<col style="width:33.72%;">
		 									</colgroup>
		 									<thead>
			 									<tr>
			 										<th class="table_th"> 사이즈 </th>
			 										<th class="table_th align_right"> 판매 희망가 </th>
			 										<th class="table_th align_right"> 수량 </th>
			 									</tr>
		 									</thead>
		 									<tbody>
		 										<tr>
		 											<td class="table_td"> 320 </td>
		 											<td class="table_td align_right"> 800,000원 </td>
		 											<td class="table_td align_right"> 1 </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>					 										
		 									</tbody>
		 								</table>
		 							</div>
		 							<a type="button" class="btn outlinegrey full medium"> 입찰 내역 더보기 </a>
		 						</div>
		 						<div id="panel2" class="tab_content show">
		 							<div class="table_wrap lg">
		 								<table>
		 									<caption><span class="blind">데이터 테이블</span></caption>
		 									<colgroup>
		 										<col style="width:29.76%;">
		 										<col style="width:36.52%;">
		 										<col style="width:33.72%;">
		 									</colgroup>
		 									<thead>
		 										<tr>
		 											<th class="table_th"> 사이즈 </th>
		 											<th class="table_th align_right"> 구매 희망가 </th>
		 											<th class="table_th align_right"> 수량 </th>
		 										</tr>
		 									</thead>
		 									<tbody>
		 										<tr>
		 											<td class="table_td"> 320 </td>
		 											<td class="table_td align_right"> 156,000원 </td>
		 											<td class="table_td align_right"> 1 </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>
		 										<tr>
		 											<td class="table_td"> - </td>
		 											<td class="table_td align_right"> - </td>
		 											<td class="table_td align_right"> - </td>
		 										</tr>
		 									</tbody>
		 								</table>
		 							</div>
		 							<a type="button" class="btn outlinegrey full medium"> 입찰 내역 더보기 </a>
		 						</div>
		 					</div>
		 		</div>
		 	</div>	
		 			<!-- ----------입찰내역 끝------------ -->		
					 	
				 	<!-- ----------상품정보 시작------------ -->
				 	<div>
				 		<h3 class="detail_title info_title lg"> 상품 정보 </h3>
				 		<div class="detail_product_wrap">
					 		<dl class="detail_product">
					 			<dt class="product_title"> 브랜드 </dt>
					 			<dd class="product_info"> ${pIdto.brandName } </dd>
					 		</dl>
					 		<dl class="detail_product">
					 			<dt class="product_title"> 모델번호 </dt>
					 			<dd class="product_info"> ${pIdto.styleNum } </dd>
					 		</dl>
					 		<dl class="detail_product">
					 			<dt class="product_title"> 대표색상 </dt>
					 			<dd class="product_info"> ${pIdto.colorway } </dd>
					 		</dl>
					 		<dl class="detail_product">
					 			<dt class="product_title"> 출시일 </dt>
					 			<dd class="product_info"> ${pIdto.releaseDate} </dd>
					 		</dl>
					 		<dl class="detail_product">
					 			<dt class="product_title"> 발매가 </dt>
					 			<dd class="product_info"> ${pIdto.retailPrice} </dd>
					 		</dl>
				 		</div>
				 		<p class="meditaion_notice_product"> 크리미(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 크리미(주)에 있습니다. </p>
				 	</div>
					 	
					 				
				</div>
				
				<!-- --------detail_wrap 끝 ------------- -->				
				
		
			</div>		
		</div>


	</div>
	<!-- --컬럼바인드끝-- -->

<!-- 관심 상품 추가 -->
<div id="layer_interest" class="hide">
	<div class="layer_container">
		<div class="layer_header"><h2 class="title">관심 상품 추가</h2></div>
		<div class="layer_content">
			<div class="suggest_list lg">
				<div class="suggest_item">
					<span class="suggest_link">
						<div class="suggest_thumb">
							<img src="/img/${repImage}" alt="${pIdto.korProduct }" class="thumb_img">
						</div>
						<div class="suggest_info">
							<p class="model_title">${pIdto.engProduct }</p>
							<p class="model_sub_info">${pIdto.korProduct }</p>
						</div>
					</span>
				</div>
			</div>			
			<div class="lg interest_list column_double">
			<c:forEach var="dto" items="${wsLists }">
				<div class="interest_btn_box">					
					<c:choose>
						<c:when test="${empty dto.userNum }">
							<a href="#" type="button" class="btn outlinegrey medium btn_interest">
							<p class="info_txt">${dto.prodSize }</p>
							<svg class="wb3" xmlns="http://www.w3.org/2000/svg" id="i-wish-s-off" fill="none" viewBox="0 0 16 16"><path stroke="#222" d="M3.5 2.5h9v11.034l-3.826-3.49a1 1 0 00-1.348 0L3.5 13.534V2.5z"></path></svg>
							<svg class="wb4 hide" xmlns="http://www.w3.org/2000/svg" id="i-wish-s-on" fill="none" viewBox="0 0 16 16"><path fill="#222" stroke="#222" d="M3.5 2.5h9v11.034l-3.826-3.49a1 1 0 00-1.348 0L3.5 13.534V2.5z"></path></svg>
							</a>
						</c:when>
						<c:otherwise>
							<a href="#" type="button" class="btn outlinegrey medium btn_interest wish_on">
							<p class="info_txt">${dto.prodSize }</p>
							<svg class="wb3 hide" xmlns="http://www.w3.org/2000/svg" id="i-wish-s-off" fill="none" viewBox="0 0 16 16"><path stroke="#222" d="M3.5 2.5h9v11.034l-3.826-3.49a1 1 0 00-1.348 0L3.5 13.534V2.5z"></path></svg>
							<svg class="wb4" xmlns="http://www.w3.org/2000/svg" id="i-wish-s-on" fill="none" viewBox="0 0 16 16"><path fill="#222" stroke="#222" d="M3.5 2.5h9v11.034l-3.826-3.49a1 1 0 00-1.348 0L3.5 13.534V2.5z"></path></svg>
							</a>
						</c:otherwise>
					</c:choose>					
					
				</div>
			</c:forEach>	
			</div>
			
			<div class="layer_btn">
				<a type="button" class="btn outline medium"> 확인 </a>
			</div>
		</div>
		<a class="btn_layer_close">
			<img src="/img/x_mark.png" class="pop_x_btn">
		</a>
	</div>
</div>


<!-- ---상품특이사항---------------- -->
<div id="layer_product_notice" class="hide">
	<div id="layer_container" class="layer_container">
		<div class="layer_header"><h2 class="title"> 상품 특이 사항 </h2></div><!-- https://kream.co.kr/api/app/pages/0401_notice.html -->
		<div class="layer_content"><iframe width="100%" height="100%" src="http://localhost:8080/kreamy/0401_notice" frameborder="0"></iframe></div>
		<a class="btn_layer_close">
			<img src="/img/x_mark.png" class="pop_x_btn">
		</a>
	</div>
</div>


</div>
</div>
<!-- -------진짜 컨텐트끝--- -->
<!-- ---------시세창--------  -->
<div id="layer_market_price" class="hide">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">시세</h2>
		</div>
		<div class="layer_content">
			<div class="buy_product">
				<div class="product" style="background-color: #f6f6f6;">
					<img src="/img/${repImage}" class="product_img">
					<!---->
					<!---->
				</div>
				<div class="buy_info">
					<div class="model_info">
						<strong class="model_number"> · </strong>
						<p class="model_title">${pIdto.engProduct }</p>
						<p class="model_ko">${pIdto.korProduct }</p>
						<div class="size_select_wrap">
							<button id="btnselect" type="button" class="btn btn_size" slot="button">
								<span class="size">모든 사이즈</span>
								<svg style="width: 24px;height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle><path fill="#000" d="M17 10l-5 5-5-5h10z"></path></svg>								
							</button>
							<div class="layer_size_list layer lg hide">
								<div class="layer_container">
									<div class="layer_header">
										<h2 class="title">사이즈 선택</h2>
									</div>
									<div class="layer_content">
										<ul class="size_list">
											<li class="size_item item_on">
												<a class="size_link"> 모든 사이즈 <svg class="mpsvg" style="height: 24px; width: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg></a>
											</li>
											<c:forEach var="size" items="${sizeLists }">
												<li class="size_item">
													<a class="size_link"> ${size } <svg class="mpsvg hide" style="height: 24px; width: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg></a>
												</li>
											</c:forEach>
										</ul>
									</div>
									<a class="btn_layer_close"></a>
								</div>
							</div>
						</div>
					</div>
				</div>					
			</div>
			<div class="tab_area">
				<ul role="tablist" class="tab_list">
					<li id="li1" role="tab" aria-controls="panel1" class="item">
						<a class="item_link">최근 거래</a>
					</li>
					<li id="li2" role="tab" aria-controls="panel2" class="item">
						<a class="item_link">판매 입찰</a>
					</li>
					<li id="li3" role="tab" aria-controls="panel3" class="item">
						<a class="item_link">구매 입찰</a>
					</li>
				</ul>
				<div id="panel1" class="tab_content">
					<div class="price_table">
						<div class="market_price_table" style="display: none;">
							<div class="price_head">
								<div class="head_box">
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">사이즈</span>
										</a>
									</div>
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">거래가</span>
										</a>
									</div>
									<div class="head_sort is_active descending">
										<a class="sort_link sort">
											<span class="sort_txt">거래일</span>
										</a>
									</div>
								</div>
							</div>
							<div class="price_body">
							</div>
						</div>
						<div class="empty_content lg" style="">
							<div class="empty_bg">
								<span class="blind">빈 데이터 이미지</span>
							</div>
							<p class="empty_text">체결된 거래가 아직 없습니다</p>
						</div>
					</div>
				</div>
				<div id="panel2" class="tab_content">
					<div class="price_table">
						<div class="market_price_table" style="display: none;">
							<div class="price_head">
								<div class="head_box">
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">사이즈</span>
										</a>
									</div>
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">거래가</span>
										</a>
									</div>
									<div class="head_sort is_active descending">
										<a class="sort_link sort">
											<span class="sort_txt">거래일</span>
										</a>
									</div>
								</div>
							</div>
							<div class="price_body">
							</div>
						</div>
						<div class="empty_content lg" style="">
							<div class="empty_bg">
								<span class="blind">빈 데이터 이미지</span>
							</div>
							<p class="empty_text">2체결된 거래가 아직 없습니다</p>
						</div>
					</div>
				</div>
				<div id="panel3" class="tab_content">
					<div class="price_table">
						<div class="market_price_table" style="display: none;">
							<div class="price_head">
								<div class="head_box">
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">사이즈</span>
										</a>
									</div>
									<div class="head_sort">
										<a class="sort_link sort">
											<span class="sort_txt">거래가</span>
										</a>
									</div>
									<div class="head_sort is_active descending">
										<a class="sort_link sort">
											<span class="sort_txt">거래일</span>
										</a>
									</div>
								</div>
							</div>
							<div class="price_body">
							</div>
						</div>
						<div class="empty_content lg" style="">
							<div class="empty_bg">
								<span class="blind">빈 데이터 이미지</span>
							</div>
							<p class="empty_text">3체결된 거래가 아직 없습니다</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="btn_layer_close"><img src="/img/x_mark.png" class="pop_x_btn"></a>
	</div>

</div><!-- 시세창끝 -->

<!-- 구매방식 그림 -->
<div class="process_buy_sell lg">
	<h2 class="process_title">
		<span>KREAMY 구매 방식을</span> 
		<span>꼭 확인해주세요!</span>
	</h2>
	<div>
		<div class="process_list">
			<div class="procedure first">
				<div class="blind">
					<strong>구매자</strong>
					<p>원하는 상품과 사이즈 검색 후 선택</p>
					<strong>판매자</strong>
					<p>판매할 상품 등록</p>
				</div>
			</div>
			<div class="procedure_arrow">
				<span class="blind">다음</span>
			</div>
			<div class="procedure second">
				<div class="blind">
					<strong>KREAMY 거래 체결</strong>
					<p>구매자와 판매자가 원하는 가격이 일치하면 거래 체결</p>
				</div>
			</div>
			<div class="procedure_arrow">
				<span class="blind">다음</span>
			</div>
			<div class="procedure third">
				<div class="blind">
					<strong>구매자</strong>
					<p>등록된 카드로 자동 결제</p>
					<strong>판매자</strong>
					<p>검수센터로 상품 48시간 내외 발송</p>
				</div>
			</div>
			<div class="procedure_arrow">
				<span class="blind">다음</span>
			</div>
			<div class="procedure fourth">
				<div class="blind">
					<strong>KREAMY 검수센터</strong>
					<p>전문 검수팀 철저한 검수</p>
					<p>*정품 아닌 경우 3배 보상</p>
				</div>
			</div>
			<div class="procedure_arrow">
				<span class="blind">다음</span>
			</div>
			<div class="procedure fifth">
				<div class="blind">
					<strong>구매자</strong>
					<p>구매자에게 상품 배송 완료!</p>
					<strong>판매자</strong>
					<p>판매자에게 정산 완료!</p>
				</div>
			</div>
		</div>
	</div>
</div><!-- --구매방식 그림 끝-- -->
	

	
	
</div><!-- 컨테이너디테일lg끝 -->
</div><!-- wrap끝 -->

</div><!-- __nuxt끝 -->
			
			
		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					
				
			
			
			
				
			<!-- contain -->
			</div>
			
			
			
			
			<div class="banner_bottom lg" style="display: flex;">
					<a class="banner_box" style="background-color: #565656; background-image: url('/img/home_banner_bottom1.png');
					position: relative; padding: 36px 32px 0; width: 100%; height: 200px; background-position: 100% 0;
					 background-repeat: no-repeat; background-size: 350px 200px;">
						<div class="banner_info" style="max-width: 300px; color: #fff;">
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase;">
								service guide
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px;">
								
								"KREAMY은 처음이지?"
								<br/>
								"서비스 소개를 확인해보세요."
								
							</p>
						</div>					
					</a>
					
					
					<a class="banner_box" style="background-color: #3b3a3c; background-image: url('/img/home_banner_bottom2.png');
					position: relative; padding: 36px 32px 0; width: 100%; height: 200px; background-position: 100% 0;
					 background-repeat: no-repeat; background-size: 350px 200px;">
						<div class="banner_info" style="max-width: 300px; color: #fff;">
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase;">
								download the app
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px;">
								"KREAMY 앱을 설치하여"
								<br/>
								"한정판 스니커즈를 FLEX 하세요!"
																
							</p>
						</div>
					
					</a>
				
				<!-- banner_bottom lg -->
				</div>
			
					
					
			<div class="footer lg" style="padding: 50px 40px; border-top: 1px solid #ebebeb;">
				<div class="inner" style="position: relative;">
					<div class="service_area" style="display: flex; flex-direction: row-reverse; padding-bottom: 56px;
					border-bottom: 1px solid #ebebeb; justify-content: space-between;">
						<div class="custom_service" >
							<strong class="service_title" style="display: inline-flex; align-items: center;
							font-size: 16px; letter-spacing: -.16px; font-weight: 700;">
							고객센터
							<a class="serive_tel" style="margin-left: 4px; letter-spacing: normal;">
							1588-7813
							</a>
							</strong>
							<div class="service_time" style="padding-top: 8px;">
								<dl class="time_box" style="line-height: 17px;">
									<dt class="time_term" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgb(34,34,34,.5)">운영시간</dt>
									<dd class="time_description" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgba(34,34,34,.5)">
									평일 11:00 - 18:00 (토,일,공휴일 휴무)
									</dd>
								</dl>
								<dl class="time_box" style="padding-top: 4px; line-height: 17px;">
									<dt class="time_term" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgba(34,34,34,.5);">점심시간</dt>
									<dd class="time_description" style="float: left; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5)">평일 13:00 ~ 14:00 </dd>								
								</dl>
							<!-- serivce_term -->
							</div>							
																		
							
							<div class="service_btn_box" style="padding-top: 17px;margin-right:10px ; display: inline-block ;">
							 <a href="FAQList" class="btn solid small" type="button" style="border-radius: 0; color: #fafafa; background-color: #222;
							 font-size: 12px; letter-spacing: -.06px; padding: 0 14px; height: 34px; line-height: 32px;
							 display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;">
							 자주 묻는 질문
							 </a>
							</div>
							<div class="service_btn_box" style="padding-top: 17px; display: inline-block;" >
							 <a href="questionList" class="btn solid small" type="button" style="border-radius: 0; color: #fafafa; background-color: #222;
							 font-size: 12px; letter-spacing: -.06px; padding: 0 14px; height: 34px; line-height: 32px;
							 display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;">
							 1:1 문의하기
							 </a>
							</div>
							
						<!-- custom_service -->
						</div>
						
						<div class="footer_menu" style="display: flex; float: left;"> 
							
							
						<div>
								<div class="corporation_area" style="position: relative;">
						<ul class="term_list" style="padding-bottom: 16px; display: inline-flex; list-style: none;margin-top: 0;margin-bottom: -1rem;">
							<li class="term_item_privacy" style="margin-right: 20px; list-style: none;">
								<a class="term_link" style="font-weight: 700; display: block; font-size: 14px;
								letter-spacing: -.21px; color: #000;">
									개인정보처리방침
								</a>
							</li>
							<li class="term_item" style="margin-right: 20px;list-style: none;">
								<a class="term_link" style="display: block; font-size: 14px; letter-spacing: -.21px;
								color: #000;">
									이용약관
								</a>
							</li>
						</ul>
					
						<div class="footer_sns" style="position: absolute; top: 0; right: 0;">
						
						</div>
						
						<div class="business_info">
							<div class="info_list">
								<dl class="info_item" style="float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										크리미 주식회사 대표 
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										마진영
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										사업자등록번호:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										578-88-01618
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										통신판매업:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										제 2021-성남분당C-0093호
									</dd>
								</dl>
								
							<!-- info_list -->
							</div>
							
							
							
							<br/>
							<div class="info_list">
								<dl class="info_item" style="float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										사업장 소재지
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										경기도 성남시 분당구 분당내곡로 117,8층
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										개인정보책임관리자:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										유서원
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										호스팅서비스:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										네이버 클라우드(주)										
									</dd>
								</dl>
								
							<!-- info_list -->
							</div>
							
							
							
							
							
							
							
							
							
							
							
						
						<!-- business_info -->
						</div>
					<!-- corporation_area -->
					</div>
					
					<div class="notice_area" style="padding-top: 30px;">
						<p class="notice" style="max-width: 605px; font-size: 12px; letter-spacing: -.06px; 
						color: rgba(34,34,34,.4) "> 
						크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다.
						 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다. © 2021 KREAMY.Corp.
						</p>
						
					
					<!-- notice_area -->
					</div>
						
						</div>
						
							
					<!-- serivce area -->
					</div>
					
				
				</div>
			

			</div>
					
			<!-- footer lg -->
		</div>	
<!-- wrap win_os lg -->
	</div>
<!-- layout -->	
	</div>
	<!-- nuxt -->
</div>

<script type="text/javascript">

//tab	
$('ul.tab_list li').click(function(){
	var tab_id = $(this).attr('aria-controls');
	
	$(this).closest('ul').children('li').removeClass('on');
	$(this).closest('.tab_area').children('.tab_content').removeClass('show');

	$(this).addClass('on');
	$(this).closest('.tab_area').children("#"+tab_id).addClass('show');
})






//주의사항클릭(아코디언)
$('.dropdown_head').click(function() {	
	
	
	if(this.closest("li").className==""){
		$(this).closest("li").attr('class','open');	
	}else{
		$(this).closest("li").attr('class','');	
	} 
	
	$('.dropdown_list').children('li').not($(this).closest("li")).attr('class','');	
	
});
//관심상품 시작버튼(마크) 클릭
$(document).on('click','.wb,.wb2', function(){	
	if(${empty sessionScope.userNum}){
		$(location).attr('href','<%=cp%>/login');
		
	}else{
		$('body').attr('class','fixed_c');
		$('#__nuxt').attr('class','fixed_c');
		$('#layer_interest').attr('class','layer_interest layer lg');
		
		
	}
	
	
});

//관심상품 리스트항목들 클릭
$('.interest_btn_box').click(function() {		
	
	var prodSize = $(this).find('.info_txt').text().trim();
	
	if($(this).children("a").hasClass("wish_on")){
		
		$(this).children("a").removeClass("wish_on");	
		$(this).find('.wb3').attr("class","wb3");
		$(this).find('.wb4').attr("class","wb4 hide");
		
		 $.post("http://localhost:8080/kreamy/wishU",{engProduct:'${pIdto.engProduct}',prodSize:prodSize,aD:'d'},function(args){			
		}); 
		
	}else{
		
		$(this).children("a").addClass("wish_on");	
		$(this).find('.wb4').attr("class","wb4");
		$(this).find('.wb3').attr("class","wb3 hide");
		$.post("http://localhost:8080/kreamy/wishU",{engProduct:'${pIdto.engProduct}',prodSize:prodSize,aD:'a'},function(args){			
		}); 
		//children은 직계만?			
	}			
	
	
});
//구매 클릭
$(document).on('click','.btn_division.buy', function(){
	if(${empty sessionScope.userNum}){
		$(location).attr('href','<%=cp%>/login');
		
	}else{
		$('body').attr('class','fixed_c');
		$('#__nuxt').attr('class','fixed_c');
		$('#layer_detail_size_select_buy').attr('class','layer_detail_size_select layer lg');
		$(".link_inner .price:contains('구매입찰')").closest('button').attr('class','select_link buy bid');	
	}
});
//구매안 사이즈 클릭시 url
$(document).on('click','#layer_detail_size_select_buy .select_link', function(){
	location.href='http://localhost:8080/kreamy/buy/check?engProduct=${pIdto.engProduct}&prodSize='+$(this).find(".size").text().trim();	
});
//판매 클릭
$(document).on('click','.btn_division.sell', function(){
	
	if(${empty sessionScope.userNum}){
		$(location).attr('href','<%=cp%>/login');
		
	}else{
		$('body').attr('class','fixed_c');
		$('#__nuxt').attr('class','fixed_c');
		$('#layer_detail_size_select_sell').attr('class','layer_detail_size_select layer lg');
		$(".link_inner .price:contains('판매입찰')").closest('button').attr('class','select_link buy bid');
	}
	
});
//판매안 사이즈 클릭시 url
$(document).on('click','#layer_detail_size_select_sell .select_link', function(){
	location.href='http://localhost:8080/kreamy/buy/check2?engProduct=${pIdto.engProduct}&prodSize='+$(this).find(".size").text().trim();	
});


//모든 사이즈 클릭
$('.detail_size .btn_size').click(function() {		
	
	$('body').attr('class','fixed_c');
	$('#__nuxt').attr('class','fixed_c');
	$('#layer_detail_size_select').attr('class','layer_detail_size_select layer lg');
	$(".link_inner .price:contains('구매입찰')").closest('button').attr('class','select_link buy bid');
	
});
//사이즈 안에 클릭 select_item
$('#layer_detail_size_select .select_item').click(function() {		
	
	$('.select_item').attr('class','select_item');	
	$(this).addClass('active');	
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('#layer_detail_size_select').attr('class','hide');
	$('.detail_size .btn_text').html($(this).find('.size').text());
	if($(this).children().hasClass("bid")){//즉구가
		$('.btn_division.buy .num').html("-");
		$('.btn_division.buy .won').html("");
		
	}else{
		$('.btn_division.buy .num').html($(this).find('.price').text());
		$('.btn_division.buy .won').html("원");
	} 
	if($(this).find('.immeSellPrice').text()==""){//즉판가
		$('.btn_division.sell .num').html("-");
		$('.btn_division.sell .won').html("");
	}else{
		$('.btn_division.sell .num').html($(this).find('.immeSellPrice').text());
		$('.btn_division.sell .won').html("원");
	}
	//최근거래가
	if($(this).find('.latestPrice').text()==""){
		$('.detail_price .num').html("-");
		$('.detail_price .won').html("");
		$('.fluctuation').attr('class','fluctuation');
		$('.fluctuation').children('p').html("-");
	}else{
		$('.detail_price .num').html($(this).find('.latestPrice').text());
		$('.detail_price .won').html("원");
	}
	//두번째거래가
	if($(this).find('.latestPrice2').text()==""){
		$('.fluctuation').attr('class','fluctuation');
		$('.fluctuation').children('p').html("-");		
	}else{		
		if($(this).find('.latestDif').text()==0){			
			$('.fluctuation').attr('class','fluctuation');
			$('.fluctuation').children('p').html("-");			
		}else if($(this).find('.latestDifPer').text()>0){			
			$('.fluctuation').attr('class','fluctuation decrease');
			$('.fluctuation').children('p').html(
					" "+$(this).find('.latestDif').text()+"원 ("+$(this).find('.latestDifPer').text()+"%)");
		}else{			
			$('.fluctuation').attr('class','fluctuation increase');
			$('.fluctuation').children('p').html(
					" "+$(this).find('.latestDif').text()+"원 ("+$(this).find('.latestDifPer').text()+"%)");
		}
		
	}
	
	
	//시세 쪽사이즈변경
	var ss= $(this).find('.size').text().trim();
	$('.size_select_wrap').find('.size').html(" " + ss + " ");
	$('.mpsvg').attr('class','mpsvg hide');
	$('.size_item').attr('class','size_item');
	var sl = $('.size_link');
	sl.each( function(){
		if($(this).text().trim()==ss){
			$(this).children().attr('class','mpsvg');
			$(this).closest('li').addClass('item_on');
		}
	})

		
		
	$.ajax({
		url : "http://localhost:8080/kreamy/pDAjax",
		data : {engProduct:'${pIdto.engProduct}',prodSize:$(this).find('.size').text(),
			ob1:"tradeDate",sort1:"desc",
			ob2:"price",sort2:"",
			ob3:"price",sort3:"desc"},
		success : function(result) {
			var refine = $(".wrap_sales").html(result).find('.wrap_sales').children();
            $('.wrap_sales').html(refine);	               
            var refine2 = $(".wrap_bids").find('#panel2').html(result).find('#bidBuy').children('div').children();
            $('.wrap_bids').find('#panel2').html(refine2);            
            var refine3 = $(".wrap_bids").find('#panel1').html(result).find('#bidSell').children('div').children();
            $('.wrap_bids').find('#panel1').html(refine3); 
            var refine4 = $("#layer_market_price").find('#panel1').html(result).find('#mp').children('#panel1').children();
            $('#layer_market_price').find('#panel1').html(refine4); 
            var refine5 = $("#layer_market_price").find('#panel2').html(result).find('#mp').children('#panel2').children();
            $('#layer_market_price').find('#panel2').html(refine5);
            var refine6 = $("#layer_market_price").find('#panel3').html(result).find('#mp').children('#panel3').children();
            $('#layer_market_price').find('#panel3').html(refine6);
		}
	});
	
});





//상품 특이사항 클릭
$('.banner_alert').click(function() {		
	
	$('body').attr('class','fixed_c');
	$('#__nuxt').attr('class','fixed_c');
	$('#layer_product_notice').attr('class','layer_product_notice layer lg');
	
});
//검은화면(+확인버튼)과 x클릭 
$('.pop_x_btn, .btn.outline.medium').click(function() {
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('#layer_interest').attr('class','hide');
	$('#layer_product_notice').attr('class','hide');
	$('.layer_detail_size_select').attr('class','hide');
	$('#layer_market_price').attr('class','hide');
	if($('.interest_btn_box').children("a").hasClass("wish_on")){	
		$('.wb').attr('class','wb hide');
		$('.wb2').attr('class','wb2');
	}else{
		$('.wb2').attr('class','wb2 hide');
		$('.wb').attr('class','wb');		
	}
	/* if($('.model_info').find('.layer_size_list.layer.lg').hasClass('hide')){
		$('.model_info').find('.layer_size_list.layer.lg').removeClass('hide');
	}
	var a=$('.model_info').find('.layer_size_list.layer.lg').hasClass('hide');
	alert(a) */
	
	if(!$('#btnselect').closest('div').children('.layer_size_list').hasClass('hide')){
		$('#btnselect').closest('div').children('.layer_size_list').addClass('hide');
	}
}); 
//입찰거래내역클릭
$(document).on('click','.btn.outlinegrey.full.medium', function(){
//$('.btn.outlinegrey.full.medium').click(function() {		
		
		$('body').attr('class','fixed_c');
		$('#__nuxt').attr('class','fixed_c');
		$('#layer_market_price').attr('class','layer_market_price layer lg');
		$('#layer_market_price').find('.item').attr('class','item');
		$('#layer_market_price').find('.tab_content').attr('class','tab_content');	
		if($(this).closest('div').hasClass('wrap_sales')){//체결거래		
			$('#layer_market_price').find('#li1').addClass('on');
			$('#layer_market_price').find('#panel1').addClass('show');
		}else if($(this).closest('div').attr('id')=='panel1'){//입찰내역 판매	
			$('#layer_market_price').find('#li2').addClass('on');
			$('#layer_market_price').find('#panel2').addClass('show');
		}else if($(this).closest('div').attr('id')=='panel2'){//입찰내역 구매
			$('#layer_market_price').find('#li3').addClass('on');
			$('#layer_market_price').find('#panel3').addClass('show');
		}
		
		
		
//});
});


/* $('#layer_product_notice, #layer_interest').not($(this).find("*")).click(function() {	
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('#layer_interest').attr('class','hide');
	$('#layer_product_notice').attr('class','hide');
			
});   */

//입찰거래 판매 등등표에서 모든페이지클릭시
$(document).on('click','#btnselect', function(){	
	
	if($(this).closest('div').children('.layer_size_list').hasClass('hide')){
		$(this).closest('div').children('.layer_size_list').removeClass('hide');
	}else{
		$(this).closest('div').children('.layer_size_list').addClass('hide');
	}	
});
//나온 선택창 클릭시
$(document).on('click','.size_link', function(){
	$('.mpsvg').attr('class','mpsvg hide');
	$('.size_item').attr('class','size_item');
	$(this).children().attr('class','mpsvg');
	$(this).closest('li').addClass('item_on');
	$('.size_select_wrap').find('.size').html($(this).text());
	$('#btnselect').closest('div').children('.layer_size_list').addClass('hide');

	//아작스추가
	var o1,o2,o3;
	var s1,s2,s3;
	
	if($("#layer_market_price").find('#panel1').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o1="size";
	}else if($("#layer_market_price").find('#panel1').find('.is_active').find('.sort_txt').text()=="거래가"){
		o1="price";
	}else{
		o1="tradeDate";
	}
	if($("#layer_market_price").find('#panel2').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o2="size";
	}else{
		o2="price";
	}
	if($("#layer_market_price").find('#panel3').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o3="size";
	}else{
		o3="price";
	}
	if($("#layer_market_price").find('#panel1').find('.is_active').hasClass('descending')){
		s1="desc";
	}else{
		s1="";
	}
	if($("#layer_market_price").find('#panel2').find('.is_active').hasClass('descending')){
		s2="desc";
	}else{
		s2="";
	}
	if($("#layer_market_price").find('#panel3').find('.is_active').hasClass('descending')){
		s3="desc";
	}else{
		s3="";
	}
	$.ajax({
		url : "http://localhost:8080/kreamy/pDAjax",
		data : {engProduct:'${pIdto.engProduct}',prodSize:$(this).text().trim(),
			ob1:o1,sort1:s1,
			ob2:o2,sort2:s2,
			ob3:o3,sort3:s3},
		success : function(result) {	
			
			
            var refine4 = $("#layer_market_price").find('#panel1').html(result).find('#mp').children('#panel1').children();
            $('#layer_market_price').find('#panel1').html(refine4); 
            var refine5 = $("#layer_market_price").find('#panel2').html(result).find('#mp').children('#panel2').children();
            $('#layer_market_price').find('#panel2').html(refine5);
            var refine6 = $("#layer_market_price").find('#panel3').html(result).find('#mp').children('#panel3').children();
            $('#layer_market_price').find('#panel3').html(refine6);
            
		}
	});
	
	
});

//클릭시 sort
$(document).on('click','.sort_link.sort', function(){
	
	var hs=$(this).closest('div');
	
	
	if(hs.hasClass('is_active')){
		if(hs.hasClass('descending')){
			hs.removeClass('descending');
			hs.addClass('ascending');
		}else{
			hs.removeClass('ascending');
			hs.addClass('descending');
		}	
		
	}else{
		$(this).closest('.head_box').find('.head_sort').attr('class','head_sort');
		hs.addClass('is_active');
		if($(this).children().text().trim()=="구매 희망가"){
			hs.addClass('ascending');	
		}else{			
			hs.addClass('descending');
		}
		
	}
	
	var o1,o2,o3;
	var s1,s2,s3;
	
	if($("#layer_market_price").find('#panel1').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o1="size";
	}else if($("#layer_market_price").find('#panel1').find('.is_active').find('.sort_txt').text()=="거래가"){
		o1="price";
	}else{
		o1="tradeDate";
	}
	if($("#layer_market_price").find('#panel2').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o2="size";
	}else{
		o2="price";
	}
	if($("#layer_market_price").find('#panel3').find('.is_active').find('.sort_txt').text()=="사이즈"){
		o3="size";
	}else{
		o3="price";
	}
	if($("#layer_market_price").find('#panel1').find('.is_active').hasClass('descending')){
		s1="desc";
	}else{
		s1="";
	}
	if($("#layer_market_price").find('#panel2').find('.is_active').hasClass('descending')){
		s2="desc";
	}else{
		s2="";
	}
	if($("#layer_market_price").find('#panel3').find('.is_active').hasClass('descending')){
		s3="desc";
	}else{
		s3="";
	}
	
	var panel=$(this).closest('.tab_content').attr('id').trim();
	var pb=$(this).closest('.market_price_table').children('.price_body');
	var mpt=$(this).closest('.market_price_table');
	
	$.ajax({
		url : "http://localhost:8080/kreamy/pDAjax",
		data : {engProduct:'${pIdto.engProduct}',prodSize:$('.size_select_wrap').find('.size').text().trim(),
			ob1:o1,sort1:s1,
			ob2:o2,sort2:s2,
			ob3:o3,sort3:s3},
		success : function(result) {			
		
			
			var refine = pb.html(result).find('#mp').children('#'+panel).find('.price_body').children();
			
			pb.html(refine);
			
			
			//선택된거 진하게
			mpt.find('.list_txt').attr('class','list_txt');		
			if(hs.index()==0){
				mpt.find('.body_list div:nth-child(1)').addClass('is_active');
			}else if(hs.index()==1){
				mpt.find('.body_list div:nth-child(2)').addClass('is_active');
			}else{
				mpt.find('.body_list div:nth-child(3)').addClass('is_active');
			}
            
		}
	}); 
	
	


});


//method_link (그림밑에꺼 클릭시 바로가기)
$('.method_link').click(function() {
	$(window).scrollTop($('.process_buy_sell').offset().top-95);
});

//스크롤 이벤트들
//().offset().top 절대좌표
//().position().top(left) 부모로부터
//().height() (패딩마진 빼고)
 $(window).scroll(function(){
	
	//스크롤끝
	//if($(window).scrollTop()==($(document).height()-$(window).height())){}	
		
	if(($('.column_box').height()+$('.column_box').offset().top)> $('.column_bind').height()){
		$('#column1').attr('class','column is_absolute');
	}else if(($('.column_box').height()+$('.column_box').offset().top)< $('.column_bind').height()){
		$('#column1').attr('class','column is_fixed');
	}
	if($(document).scrollTop()+40<($('.column_box').offset().top)){
		$('#column1').attr('class','column is_fixed');
	}	
	
});
 




//슬릭
$('.banner_slide').slick({
	  dots: true,
	  arrows : true,
	  infinite: true,
	  speed: 500,
	  fade: true,
	  autoplay : false,
	  vertical : false,
	  prevArrow : "<button type='button' class='slick-prev' style='width: 44px; height: 44px;  left: 0; z-index: 1; background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxwYXRoIHN0cm9rZT0iI0QzRDNEMyIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik0yNy41IDMzbC0xMS0xMSAxMS0xMSIvPgo8L3N2Zz4=) no-repeat;'>Previous</button>",		// 이전 화살표 모양 설정
	  nextArrow : "<button type='button' class='slick-next' style='width: 44px; height: 44px; right: 0; z-index: 1; background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0NCIgaGVpZ2h0PSI0NCIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDQ0IDQ0Ij4KICAgIDxwYXRoIHN0cm9rZT0iI0QzRDNEMyIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik0xNi41IDExbDExIDExLTExIDExIi8+Cjwvc3ZnPg==) no-repeat;'>Next</button>",
	  dotsClass : "slick-dots",
	  cssEase: 'linear'
});






</script>



</body>
</html>