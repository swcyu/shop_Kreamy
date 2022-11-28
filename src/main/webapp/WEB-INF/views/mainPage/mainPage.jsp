<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	int col = 1;
	int list = 1;
	int list2 =1;
	int cnt = 1;
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KREAMY | 한정판 거래의 FLEX</title>


<script src="<%=cp %>/resources/js/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/resources/css/semantic.min.css">


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<style type="text/css">
*{
	margin: 0;
    padding: 0;
    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,"나눔고딕","Segoe UI",Helveica,Arial,Malgun;
 	box-sizing: border-box;
}


a {
	cursor: hand;
	color: #000000;
	text-decoration: none;
	font-size: 13pt;
	line-height: 150%;
}

dl, ol, ul {
    margin-top: 0;
    margin-bottom: -1rem;
}

.carousel {
  height: 400px;
}

.carousel-item,
.carousel-inner {
  height: 100%;
  width: auto;
}

.carousel-inner img {
 margin-left: 725px;
  width: 25%;
  height: auto;
}

.carousel-item {
  text-align: center;
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    max-width: 100%;
    height: 100%;
}


</style>


<script type="text/javascript">

	function moreList() {
		
		$("#more1").show();		
		
		document.getElementById("btnmore").setAttribute("onClick", "changed()");
	
		
		
	}
	
function changed() {
		
		//$("#more1").show();
		$("#more2").show();
		$("#btnmore").hide();
		
	}
	

function wish(engProduct) {
	
	
	var engProduct = engProduct;

	var aa = "engProduct=" + engProduct;

	aa += "&mode=mainPage";
	var f = document.myForm1;
	
	$.ajax({
		
		type:"POST",
		url : "wishProdcut.action",
		data:aa,
		success:function(args){
			
			$("#wishProduct").html(args);
			
			
		},error:function(e){
			alert(e.responseText);
		}
		
		
	});
	

	
}


function moreList2() {
	
	$("#more2_2").show();		
	
	document.getElementById("btnmore_2").setAttribute("onClick", "changed2()");

	
	
}

function changed2() {
	$("#more2_3").show();
	$("#btnmore_2").hide();
	
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
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); min-height: 100px; position: fixed; top: 0; left: 0; right: 0;
			 z-index: 1000; background-color: #fff;" >
				<div>
					<div class="header_top" style="box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);">
						<div class="top_inner" style="display: flex; padding: 8px 40px;">
							
							
							
							<ul class="top_list" style="align-items: center; margin-left: auto; display: flex; list-style: none;">
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
						<hr style="    margin-top: 1rem; margin-bottom: -1rem; border: 0; border-top: 1px solid rgba(0,0,0,.1);">
						
						<div class="header_main" style="" >
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 68px; min-width: 320px; align-items: center;" >
								<h1 style="margin-top: 14px;" >
									<a href="mainPage" class="logo" >									
										<img src="/img/Kreamy.png" style="width: 167px; height: 41px;">
									</a>
								</h1>
								
								<div class="gnb_area" style="display: flex; align-items: center; margin-left: auto;" >
									<div class="gnb" style="" >
										<ul class="gnb_list" style="display: flex; align-items: center; list-style: none;" >											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="shop.action" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> SHOP </a>
											</li>
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="authPolicy" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> POLICY </a>
											</li>											
											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="noticeList" target="_blank" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> NOTICE </a>
											</li>		
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
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
												    
												<svg style="position: absolute;  top: 8px; left: 12px;width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-search-gray" fill="none" viewBox="0 0 24 24"><path fill="#BBB" fill-rule="evenodd" d="M18 10.5a7.5 7.5 0 11-15 0 7.5 7.5 0 0115 0zm-1.146 5.646a8.5 8.5 0 10-.708.708l4.5 4.5.708-.708-4.5-4.5z" clip-rule="evenodd"></path></svg>
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
											<a href="shop.action?searchKey=Jordan">
											<img width="85px" height="85px" src="/img/Jordan 1 Retro High OG University Blue_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Jordan</b></p>	
											</a>	
											</button>	
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Dunk">
											<img width="85px" height="85px" src="/img/Nike Dunk Low Retro Black_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Dunk</b></p>
											</a>	
											</button>
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Palace">
											<img width="85px" height="85px" src="/img/Palace Basically A Tri-Flag T-Shirt Black (21SS)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Palace</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Backpack">
											<img width="85px" height="85px" src="/img/Supreme Backpack Red (18FW)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>백팩</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Supreme">
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
		
		
			<!-- 여기 까지가 윗부분 -->
		
			<div class="contain" style="overflow: hidden; position: relative; margin-top: -4px;">
			
			
				<div class="home lg" style="padding-bottom: 100px;">
					<div id="notice lg" style="background-color: #111; text-align: center; z-index: 1000;">
						<div class="inner" style="margin: 0 auto; padding: 0 40px; max-width: 1280px;">
							<!-- 공지사항 이동 -->
							<a href="" style="display: inline-block; padding: 8px 5px; color: #fff; font-size: 12px; letter-spacing: -.06px; ">
								[공지] 나이키 x 스투시 월드투어 티셔츠 상품 거래 관련 안내
							</a>
						
						</div>
					
					<!-- notice lg -->
					</div>
				
						<!-- 부트스트랩 배너 -->
					
			
					
					<div class="container" style="width: 100%;height:480px; padding: 0; min-height: 480px; min-width: 2000px;">
					
								
						 <div id="myCarousel" class="carousel slide" data-ride="carousel" 
						 style="overflow: hidden; position: relative; height: 480px;">
						    <!-- Indicators -->
						    <ol class="carousel-indicators">
						      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						      <li data-target="#myCarousel" data-slide-to="1"></li>
						      <li data-target="#myCarousel" data-slide-to="2"></li>
						       <li data-target="#myCarousel" data-slide-to="3"></li>
						    </ol>
					
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner">
					      <div class="item active" style="background-color:#f8f8f8 ">
					        <img class="d-block w-100" src="/img/boot1.jpg" style="margin-left: auto;margin-right:auto; width: auto;					        
					        	  height: 480px;">     
					      </div>
					
					      <div class="item" style="background-color:#e2dacd ">
					        <img class="d-block w-100" src="/img/boot2.jpg" style="margin-left: auto;margin-right:auto; width: auto;
					          height: 480px;">
					      </div>
					    
					      <div class="item" style="background-color:#0135ed	 ">
					        <img class="d-block w-100" src="/img/boot3.jpg" style="margin-left: auto;margin-right:auto;
					         width: auto; height: 480px;">
					      </div>
					       <div class="item" style="background-color:#263f2c ">
					       <img class="d-block w-100" src="/img/boot4.jpg" style="margin-left: auto;margin-right:auto;
					         width: auto; height: 480px;">
					      </div>
					    </div>
					
					    <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right"></span>
					      <span class="sr-only">Next</span>
					    </a>
					  </div>
					  
					</div>
										
							
				<div>
				<!-- 상품표시 -->
					<div class="product_title_lg" style="margin: 40px auto 0; padding: 0 40px; max-width: 1280px;">
						<div class="title" style="font-size: 20px; letter-spacing: -.1px; font-weight: 700px; color: #000;">
							Main Product
						</div>
						<div class="sub_title" style="font-size: 14px; letter-spacing: -.21px; color: rgba(34, 34, 34, .5);" >
							메인 상품
						</div>
					
					<!-- product_title_lg -->
					</div>
					<div class="product_list_wrap lg" style="max-width: 1280px; margin: 0 auto 60px; overflow-anchor: none;">
						<div class="product_list list_first" style="overflow: hidden; position: relative; margin: 0 auto; padding: 0 28px;
						width: 100%;">
							<div class="product_item" style="position: relative; float: left; margin: 20px 0; padding: 0 12px; width: 1000px;
							transition: all .4s ease-in-out;">
								
								<!-- 상품 사진 -->
					<table><tr id="more">

					<c:forEach var="dto" items="${prodImagelists}" begin="0" end="11" step="1">		
				
						<td><table style="margin-left: 6px; margin-right: 6px; margin-bottom: 50px;">
				
						<tr class="product" style="border-radius: 30px;">
							<td style="padding-right: 5px;">
							
							<div class="imgDefault" style="display: block; z-index: -1000;">
								<a href="mainToProducts?engProduct=${dto.engProduct }">
								<img style="width: 282px; height: 282px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
									src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
								</a>
							</div>

							<div class="imgReleasedate" style="display: none; z-index: -1000;">
							
								<c:if test="${dto.releasedate!=null }">
	
									<div style="position: relative;">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<fmt:parseDate value="${dto.releasedate }" var="releasedateFmt" pattern="yyyy-mm-dd"/>
										<b>발매 <fmt:formatDate value="${releasedateFmt }" pattern="yy/mm/dd"/></b>
										</div>
									</div>
								
								
								</c:if>
								
								<c:if test="${dto.releasedate==null }">
								
									<div style="position: relative;">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6; z-index: -1000;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<b>-</b>
										</div>
									</div>
								
								
								</c:if>
								
							</div>
							
							
								
							
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr class="info_box" style="width: 236px;">
							
							<td class="brand" style="float: left; position: relative; z-index: -1;">
		 
								<c:if test="${dto.brandImage!=null }">
								<img style="height:20px; width: auto;" src="/img/${dto.brandImage}" name="${dto.brandName }" alt="brand_${dto.brandName }" class="${dto.brandName }">
								</c:if>
								<c:if test="${dto.brandImage==null }">
								<p class=".brand-text " style="height: 20px; width: 30px;"><b>${dto.brandName }</b></p>
								</c:if>
							</td>
							
							<td style="float: right;">
								<c:if test="${empty sessionScope.userNum }">
									<img src="/img/bookmark_w.png" onclick="location.href='<%=cp %>/login'" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
									<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
								<c:if test="${!empty sessionScope.userNum }">
									<c:if test="${dto.checkNum==-1 }">	
									<img src="/img/bookmark_w.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
									<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
									</c:if>
									
									<c:if test="${dto.checkNum==1 }">	
									<img src="/img/bookmark_b.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
									<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
									</c:if>
								</c:if>	
							</td>
							
						</tr>
							
						<tr class="name" id="engProduct" style="height: 40px; font-size: 10pt;">
							<td>${dto.engProduct }</td>	
						</tr>		
							
						<tr style="height: 10px;"></tr>
							
							
						<tr class="price" style="height: 34px;">
													
							<c:if test="${dto.shopPrice!=null}">
							<td id="shopPrice"><b><fmt:formatNumber value="${dto.shopPrice }" type="number" maxFractionDigits="3"/> 원</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
							<c:if test="${dto.shopPrice==null}">
							<td id="shopPrice"><b>-</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
						</tr>
							
						<tr>
							<td style="font-size: 9pt;">즉시 구매가</td>
						</tr>
							
						
						</table></td>
						<%if(col%4==0) {%>
						<%list2 += 1; %>
						</tr>
						<%if(list2 ==2){ %>
						<tr id="more1" style="display: none;">					
						<%}else{%>
						<tr id="more2" style="display: none;">
						<%} %>
						<%} col++;%>
						</c:forEach>
						</tr>
						</table>
								
							
							</div>
							
						<!-- product_list list_first -->
						</div>
					
					
						<div class="btn_product" style="padding: 0 32px; text-align: center;">
							<a type="button" class="btn outlinegry medium" style="padding: 0 30px; margin-top: 20px; border: 1px solid #d3d3d3;
							color: rgba(34, 34, 34, .8); height: 42px; line-height: 40px;border-radius: 12px;font-size: 14px;
							 letter-spacing: -.14px; display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;
							  background-color: #fff;" onclick="moreList();" id="btnmore">
							더보기
							</a>
						
						</div>
					
					
					
					<!-- product_list_wrap lg -->
					</div>
				
				<!-- 상품표시 -->
				</div>	
					
				<div class="banner lg" style="overflow: hidden; vertical-align: top; cursor: pointer; max-height: 480px;">
					<div class="banner_item" style="background-color: #4b4b4b; position: relative;">
						<div class="item_inner" style="margin: 0 auto; width: 45vw; max-height: 480px;">
							<div class="img_box" style="position: relative; padding-top: 100%;">
							 	<img src="https://kream-phinf.pstatic.net/MjAyMTA2MTdfMTc3/MDAxNjIzOTI4MDI5NDQ3.wt_k3QR7__GYLyMdRfN0_0YGKSrMQya50x-VkQI9X5Ag.QeMLyUPhFXRno4wmqoA9ecD9R-22Qecw8sr__EM3zSgg.JPEG/p_39323997de3e4bfc94a497e960ea9665.jpg?type=l" 
							 	alt="조던 1 로우 OG 뉴트럴 그레이 2021" class="banner_img" style="position: absolute; top: 0; left: 15%;
							 	height: 100%; max-height: 480px; border: 0; vertical-align: top;">
							</div>
						</div>
					</div>
				
				
				
				<!-- banner lg -->
				</div>	
				
				
				
				
				
				<div>
					<!-- 상품표시 2번쨰 -->
					<div class="product_title_lg" style="margin: 40px auto 0; padding: 0 40px; max-width: 1280px;">
						<div class="title" style="font-size: 20px; letter-spacing: -.1px; font-weight: 700px; color: #000;">
							Most Popular
						</div>
						<div class="sub_title" style="font-size: 14px; letter-spacing: -.21px; color: rgba(34, 34, 34, .5);" >
							가장 인기 있는 상품
						</div>
					
					<!-- product_title_lg -->
					</div>
					<div class="product_list_wrap lg" style="max-width: 1280px; margin: 0 auto 60px; overflow-anchor: none;">
						<div class="product_list list_first" style="overflow: hidden; position: relative; margin: 0 auto; padding: 0 28px;
						width: 100%;">
							<div class="product_item" style="position: relative; float: left; margin: 20px 0; padding: 0 12px; width: 25%;
							transition: all .4s ease-in-out;">
								
								<!-- 상품 사진 -->
					<table><tr id="more2_1">

					<c:forEach var="dto" items="${prodImagelists}" begin="30" end="41" step="1">		
				
						<td><table style="margin-left: 6px; margin-right: 6px; margin-bottom: 50px;">
				
						<tr class="product" style="border-radius: 30px;">
							<td style="padding-right: 10px;">
							
							
							
							<div class="imgDefault" style="display: block; z-index: -1000;">

								<a href="mainToProducts?engProduct=${dto.engProduct }">
								<img style="width: 282px; height: 282px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
									src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
								</a>
							
							</div>

							<div class="imgReleasedate" style="display: none; z-index: -1000;">
							
								<c:if test="${dto.releasedate!=null }">
	
									<div style="position: relative;">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<fmt:parseDate value="${dto.releasedate }" var="releasedateFmt" pattern="yyyy-mm-dd"/>
										<b>발매 <fmt:formatDate value="${releasedateFmt }" pattern="yy/mm/dd"/></b>
										</div>
									</div>
								
								
								</c:if>
								
								<c:if test="${dto.releasedate==null }">
								
									<div style="position: relative;">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6; z-index: -1000;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<b>-</b>
										</div>
									</div>
								
								
								</c:if>
								
							</div>
							
							
								
							
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr class="info_box" style="width: 236px;">
							
							<td class="brand" style="float: left; position: relative; z-index: -1;">
		 
								<c:if test="${dto.brandImage!=null }">
								<img style="height:20px; width: auto;" src="/img/${dto.brandImage}" name="${dto.brandName }" alt="brand_${dto.brandName }" class="${dto.brandName }">
								</c:if>
								<c:if test="${dto.brandImage==null }">
								<p class=".brand-text " style="height: 20px; width: 30px;"><b>${dto.brandName }</b></p>
								</c:if>
							</td>
							
							<td style="float: right;">
								<c:if test="${empty sessionScope.userNum }">
								<img src="/img/bookmark_w.png" onclick="location.href='<%=cp %>/login'" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
								<c:if test="${!empty sessionScope.userNum }">
								<c:if test="${dto.checkNum==-1 }">	
								<img src="/img/bookmark_w.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
								
								<c:if test="${dto.checkNum==1 }">	
								<img src="/img/bookmark_b.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
							</c:if>	
							</td>
							
						</tr>
							
						<tr class="name" id="engProduct" style="height: 40px; font-size: 10pt;">
							<td>${dto.engProduct }</td>	
						</tr>		
							
						<tr style="height: 10px;"></tr>
							
							
						<tr class="price" style="height: 34px;">
													
							<c:if test="${dto.shopPrice!=null}">
							<td id="shopPrice"><b><fmt:formatNumber value="${dto.shopPrice }" type="number" maxFractionDigits="3"/> 원</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
							<c:if test="${dto.shopPrice==null}">
							<td id="shopPrice"><b>-</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
						</tr>
							
						<tr>
							<td style="font-size: 9pt;">즉시 구매가</td>
						</tr>
							
						
						</table></td>
						<%if(col%4==0) {%>
						<%list += 1; %>
						</tr>
						<%if(list==2){ %>
						<tr id="more2_2" style="display: none;">					
						<%}else{%>
						<tr id="more2_3" style="display: none;">
						<%} %>
						<%} col++;%>
						</c:forEach>
						</tr>
						</table>
								
							
							</div>
							
						<!-- product_list list_first -->
						</div>
					
					
						<div class="btn_product" style="padding: 0 32px; text-align: center;">
							<a type="button" class="btn outlinegry medium" style="padding: 0 30px; margin-top: 20px; border: 1px solid #d3d3d3;
							color: rgba(34, 34, 34, .8); height: 42px; line-height: 40px;border-radius: 12px;font-size: 14px;
							 letter-spacing: -.14px; display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;
							  background-color: #fff;" onclick="moreList2();" id="btnmore_2">
							더보기
							</a>
						
						</div>
					
					
					
					<!-- product_list_wrap lg -->
					</div>
				
				<!-- 상품표시 -->
				</div>
				
				
				<!-- home lg -->
				</div>
			
			
			
				
			<!-- contain -->
			</div>
			
			<!-- 여기부터 아랫부분 -->
				<div class="banner_bottom lg" style="display: flex;">
					<a class="banner_box" style="background-color: #565656; background-image: url('/img/KreamyBanner.png');
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
						<ul class="term_list" style="padding-bottom: 16px; display: inline-flex; list-style: none;">
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
			
			<!-- footer lg -->
			</div>
					
<!-- wrap win_os lg -->
		</div>	
		
		
		
		
<!-- layout -->	
	</div>
<!-- nuxt -->
</div>

</div>



<!-- 찜하기 창 -->
<div id="wishProduct">

</div>

</body>
</html>