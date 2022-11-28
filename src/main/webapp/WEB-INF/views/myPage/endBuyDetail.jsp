<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KREAMY | 한정판 거래의 FLEX</title>
<link rel="stylesheet" href="<%=cp %>/resources/css/bootstrap.css">
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
<script src="https://kit.fontawesome.com/cd5dd810df.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="<%=cp%>/resources/js/jquery-3.6.0.js"></script>

<style type="text/css">
*{
	font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,"나눔고딕",
	"Segoe UI",Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	margin: 0px;
	padding: 0px;
}
.menu{
	list-style: none;
	text-align: left;
	font-size: 15px;
	letter-spacing: -.15px;
	color: rgba(34,34,34,.5);
	cursor: pointer;
	margin-bottom: 8px;
	height: 20px;
}
.content{
	font-size: 16px;
	letter-spacing: -.16px;
	height: 21px;
	margin-bottom: 12px;
}
h2{
	font-size: 32px;
	letter-spacing: -1.5px;
}
ul{
	margin-top: 13px;
	padding-left: 0px;
	margin-bottom: 8px;
}

.usable_item{
list-style: none;
    position: relative;
    padding-left: 11px;
    font-size: 12px;
    letter-spacing: -.06px;
    color: rgba(34,34,34,.8);
}

.usable_item:before{
	content: "";
    position: absolute;
    top: 9px;
    left: 0;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
    width: 3px;
    height: 3px;
    background-color: #333;
    border-radius: 50%;
}

.item_inner:before{
	content: "";
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    width: 1px;
    background-color: #ebebeb;
}

.dot:before{
	content: "";
    margin-left: 2px;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    width: 5px;
    height: 5px;
    background-color: #222;
    border-radius: 100%;
}
.dot:after{
	content: "";
    margin-left: 2px;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    width: 5px;
    height: 5px;
    background-color: #222;
    border-radius: 100%;
}
a {
	cursor: hand;
	color: #000000;
	text-decoration: none;
	font-size: 13pt;
	line-height: 150%;
}
dl{
    margin-top: 0;margin-bottom: -1rem;
}
</style>


<script type="text/javascript">








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
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); min-height: 100px; position: fixed; top: 0; left: 0; right: 0;
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
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 75px; min-width: 320px; align-items: center;" >
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
		
		
			
		
		
		
			<div class="contain" style="overflow: hidden; position: relative; margin-top: -4px;min-height: 461px;margin-bottom: 120px;">
			
			
			
			<div align="center">
	<div align="center" style="width: 1300px; padding: 40px;">
		<table cellpadding="0" cellspacing="0" >
		<tr valign="top">
			<td style="width: 160px;">
				<h2 style="margin: 0px;padding-bottom:25px; cursor: pointer;font-weight: 700;width: 160px;height: 63px;" 
				onclick="location.href='<%=cp%>/myPage'">MY PAGE</h2>
				<div>
					<div class="content"><strong >쇼핑 정보</strong></div>
					
					<ul>
						<li class="menu" onclick="location.href='<%=cp%>/buying'"style="color: black; font-weight: bolder;">구매 내역</li>
						<li class="menu" onclick="location.href='<%=cp%>/selling'">판매 내역</li>
						<li class="menu" onclick="location.href='<%=cp%>/wish'">관심 상품</li>
					</ul>
				</div>
				<div style="margin-top: 30px;">
					<div class="content"><strong >내 정보</strong></div>
					<ul>
						<li class="menu" onclick="location.href='<%=cp%>/profile'">프로필 정보</li>
						<li class="menu" onclick="location.href='<%=cp%>/address'">주소록</li>
						<li class="menu" onclick="location.href='<%=cp%>/payment'">결제 정보</li>
						<li class="menu" onclick="location.href='<%=cp%>/account'">판매 정산 계좌</li>
					</ul>
				</div>
			</td>
			<td style="padding-left: 40px; width: 1000px;" align="center">
				<div style="padding-top: 5px;margin-bottom: 20px;">
					<div style="color: #222; margin: 0px;  padding: 5px 0px;width: 1000px;">
						<div style="color: #222; margin: 0px; display: flex;">
							<div style="float: left; width: 500px;" align="left" id="title">
								<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">구매내역 > 종료된 거래</h3>
							</div>
							<div style="margin-left: auto;padding-left: 30px;flex-shrink: 0;display: flex;">
								
								<div style="cursor: pointer;vertical-align: middle;text-align: center;background-color: #fff;display: flex;margin-right: -6px;
							    padding: 0 6px;-webkit-box-align: center;align-items: center;font-size: 14px;letter-spacing: -.21px;margin-left: 8px;"
							    onclick="location.href='<%=cp%>/questionList'">
							    	<span style="cursor: pointer;text-align: center;font-size: 14px;letter-spacing: -.21px;">문의하기</span>
							    </div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div>
						<div style="display: flex;-webkit-box-align: center;align-items: center;">
							<h4 style="padding: 11px 0;font-size: 18px;line-height: 26px;letter-spacing: -.27px;font-weight: 400;">
							주문번호
							<em style="font-size: 18px;box-sizing: border-box;font-style: normal;line-height: 28px;letter-spacing: -.09px;
    						font-weight: 700;"> EB-${endBuyDTO.tradeNum } </em>
    						</h4>
						</div>
					</div>
					<div style="position: relative;border-top: 2px solid #222;">
						<div style="display: flex;padding: 16px 105px 16px 0;border-bottom: 1px solid #ebebeb;">
							<div style="-webkit-box-flex: 0;flex: none;width: 100px;height: 100px;">
								<div style="overflow: hidden;position: relative;padding-top: 100%;border-radius: 12px;background-color: rgb(244, 244, 244);">
									<img src="/img/${endBuyDTO.imageName}" 
									style="vertical-align: top;user-select: none!important;-webkit-user-drag: none;
    								position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);width: 81.5%;height: auto;"/>
								</div>
							</div>
							<div style="margin-left: 16px;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;flex-direction: column;
    						align-self: center;">
								<strong style="-webkit-box-direction: normal;display: inline-flex;font-size: 14px;">${endBuyDTO.condition } · ${endBuyDTO.styleNum }</strong>
								<p style="margin: 0;padding: 0;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;
							    -webkit-box-orient: vertical;margin-top: 4px;font-size: 14px;">${endBuyDTO.engProduct }</p>
							    <span style="margin-top: 4px;font-size: 14px;display: inline-flex;letter-spacing: -.21px;font-weight: 700;
    							color: rgba(34,34,34,.5);">${endBuyDTO.userSize }</span>
							</div>
						</div>
						<div style="border-bottom: 1px solid #ebebeb;">
							<ul style="margin:0;padding:0; list-style: none;display: table;table-layout: fixed;width: 100%;">
								<li style="list-style: none;padding: 16px 0 20px;display: table-cell;text-align: center;">
									<div style="position: relative;">
										<span style="text-align: center;font-size: 12px;letter-spacing: -.06px;color: rgba(34,34,34,.5);">즉시 구매가</span>
										<p style="text-align: center;margin: 0;">
											<span style="display: inline-block;font-size: 14px;">${endBuyDTO.immediateBuyPrice }</span>
										</p>
									</div>
								</li>
								<li style="list-style: none;padding: 16px 0 20px;display: table-cell;text-align: center;">
									<div style="position: relative;" class="item_inner">
										<span style="text-align: center;font-size: 12px;letter-spacing: -.06px;color: rgba(34,34,34,.5);">즉시 판매가</span>
										<p style="text-align: center;margin: 0;">
											<span style="display: inline-block;font-size: 14px;">${endBuyDTO.immediateSellPrice }</span>
										</p>
									</div>
								</li>
							</ul>
						</div>
						<div style="position: absolute;top: 49px;right: 0;">
							<div style="display: inline-block;cursor: pointer;vertical-align: middle;text-align: center;background-color: #fff;
						    padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;font-size: 12px;letter-spacing: -.06px;
						    border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);"onclick="location.href='<%=cp%>/products?prodNum=${endBuyDTO.productNum }'">상품 상세보기</div>
						</div>
					</div>
				</div>
				<div>
					<div style="margin-top: 32px;">
						<div style="display: flex;-webkit-box-align: center;align-items: center;">
							<h4 style="padding: 6px 0;margin:0px;font-size: 16px;letter-spacing: -.16px;line-height: 20px;">구매 거래 내역</h4>
						</div>
					</div>
					<div style="border-top: 2px solid #222;">
						<div style="border-bottom: 1px solid #ebebeb;">
							<div style="background-color: #fafafa;"align="left">
								<dl style="margin: 0;padding: 0;font-weight: 700;">
									<dt style="font-weight: 700;margin: 0;float: left;padding: 26px 0 26px 16px;margin-right: 12px;
								    width: 160px;font-size: 14px;line-height: 28px;">구매 가격</dt>
									<dd style="font-weight: 700;margin: 0;padding: 26px 0;overflow: hidden;font-size: 0;">
										<span style="font-weight: 700;display: inline-block;font-size: 22px;line-height: 28px;letter-spacing: -.11px;
    									vertical-align: top;">${endBuyDTO.tradeWonPrice }</span>
									</dd>
								</dl>
							</div>
							<div style="margin: 0;padding: 20px 0;border-top: 1px solid #ebebeb;" align="left">
								
								<dl style="display: flex;margin:0;-webkit-box-align: center;align-items: center;min-height: 26px;font-size: 13px;
							    letter-spacing: -.07px;-webkit-box-pack: start;justify-content: flex-start;">
							    	<dt style="color: rgba(34,34,34,.5);font-size: 14px;margin-right: 12px;padding-left: 16px;width: 160px;
    								line-height: 20px;letter-spacing: -.2px;">
    									<span style="color: rgba(34,34,34,.5);font-size: 14px;line-height: 20px;letter-spacing: -.2px;">검수비</span>
    								</dt>
							    	<dd style="white-space: nowrap;color: #222;font-size: 14px;margin:0; line-height: 20px;letter-spacing: -.2px;">무료</dd>
							    </dl>
								<dl style="display: flex;margin:0;-webkit-box-align: center;align-items: center;min-height: 26px;font-size: 13px;
							    letter-spacing: -.07px;-webkit-box-pack: start;justify-content: flex-start;">
							    	<dt style="color: rgba(34,34,34,.5);font-size: 14px;margin-right: 12px;padding-left: 16px;width: 160px;
    								line-height: 20px;letter-spacing: -.2px;">
    									<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">총 결제금액</span>
    								</dt>
							    	<dd style="margin:0px;white-space: nowrap;font-weight: 700;color: #f15746;font-size: 14px;line-height: 20px;letter-spacing: -.2px;">
							    	${endBuyDTO.tradeWonPrice }</dd>
							    </dl>
							</div>
							<div style="margin: 0;padding: 20px 0;border-top: 1px solid #ebebeb;" align="left">
								<dl style="display: flex;margin:0;-webkit-box-align: center;align-items: center;min-height: 26px;font-size: 13px;
							    letter-spacing: -.07px;-webkit-box-pack: start;justify-content: flex-start;">
							    	<dt style="color: rgba(34,34,34,.5);font-size: 14px;margin-right: 12px;padding-left: 16px;width: 160px;
    								line-height: 20px;letter-spacing: -.2px;">
    									<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">거래일</span>
    								</dt>
							    	<dd style="margin: 0;padding: 0;white-space: nowrap;color: #222;font-size: 14px;line-height: 20px;letter-spacing: -.2px;">
							    	${endBuyDTO.tradeDate }</dd>
							    </dl>
								<dl style="display: flex;margin:0;-webkit-box-align: center;align-items: center;min-height: 26px;font-size: 13px;
							    letter-spacing: -.07px;-webkit-box-pack: start;justify-content: flex-start;">
							    	<dt style="color: rgba(34,34,34,.5);font-size: 14px;margin-right: 12px;padding-left: 16px;width: 160px;
    								line-height: 20px;letter-spacing: -.2px;">
    									<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">거래 상태</span>
    								</dt>
    								<c:if test="${endBuyDTO.tradeBuyState=='취소완료' }">
								    	<dd style="margin: 0;padding: 0;white-space: nowrap;color: #f15746;font-size: 14px;line-height: 20px;letter-spacing: -.2px;">
								    	${endBuyDTO.tradeBuyState }</dd>
							    	</c:if>
    								<c:if test="${endBuyDTO.tradeBuyState!='취소완료' }">
								    	<dd style="margin: 0;padding: 0;white-space: nowrap;color: #222;font-size: 14px;line-height: 20px;letter-spacing: -.2px;">
								    	${endBuyDTO.tradeBuyState }</dd>
							    	</c:if>
							    </dl>
							</div>
						</div>
							
					</div>
				</div>
				<div align="left">
					<div style="margin-top: 40px;">
						<div style="display: flex;-webkit-box-align: center;align-items: center;">
							<h4 style="color: #222;margin: 0;padding: 6px 0;font-size: 16px;letter-spacing: -.16px;line-height: 20px;"> 배송 주소 </h4>
						</div>
											
					</div>
					<div style="border-top: 2px solid #222;">
						<dl style="margin: 0;padding: 20px 0;border-bottom: 1px solid #ebebeb;">
					    	<dt style="margin: 0;padding: 0;float: left;margin-right: 26px;width: 100px;font-size: 14px;letter-spacing: -.21px;">
								<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">받는 사람</span>
							</dt>
					    	<dd style="margin: 0;padding: 0;overflow: hidden;font-size: 14px;letter-spacing: -.21px;">
					    	${addrDTO.recvName }</dd>
					    </dl>
						<dl style="margin: 0;padding: 20px 0;border-bottom: 1px solid #ebebeb;">
					    	<dt style="margin: 0;padding: 0;float: left;margin-right: 26px;width: 100px;font-size: 14px;letter-spacing: -.21px;">
								<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">휴대폰 번호</span>
							</dt>
					    	<dd style="margin: 0;padding: 0;overflow: hidden;font-size: 14px;letter-spacing: -.21px;">
					    	${addrDTO.recvPhone }</dd>
					    </dl>
						<dl style="margin: 0;padding: 20px 0;border-bottom: 1px solid #ebebeb;">
					    	<dt style="margin: 0;padding: 0;float: left;margin-right: 26px;width: 100px;font-size: 14px;letter-spacing: -.21px;">
								<span style="font-size: 14px;color: #222;line-height: 20px;letter-spacing: -.2px;">주소</span>
							</dt>
					    	<dd style="margin: 0;padding: 0;overflow: hidden;font-size: 14px;letter-spacing: -.21px;">
					    	(${addrDTO.postNum }) ${addrDTO.addr1 } ${addrDTO.addr2 }</dd>
					    </dl>		
					</div>
				</div>	
				<div align="left">
					<div style="margin-top: 40px;">
						<div style="display: flex;-webkit-box-align: center;align-items: center;">
							<h4 style="color: #222;margin: 0;padding: 6px 0;font-size: 16px;letter-spacing: -.16px;line-height: 20px;"> 결제 정보 </h4>
						</div>					
					</div>
					<div style="border-top: 2px solid #222; border-bottom: 1px solid #ebebeb;">
						<div style="display: flex;-webkit-box-align: center;align-items: center;padding: 19px 0;">
							<span style="color: #222;font-size: 15px;letter-spacing: -.15px;line-height: 22px;left: -.15px;">
							${payDTO.bank }</span>
							<div style="margin-left: 17px;font-size: 0;">
								<span style="color: #222;font-size: 0;display: flex;-webkit-box-align: center;align-items: center;flex-wrap: wrap;">
									<span style="display: flex;-webkit-box-align: center;align-items: center;flex-wrap: wrap;" class="dot">
										<span style="white-space: nowrap;" class="dot"></span>
									</span>
									<span style="margin-left: 4px;margin-right: 2px; width: 4px;height: 1px;background-color: #000;display: inline-flex;"></span>
									<span style="display: flex;-webkit-box-align: center;align-items: center;flex-wrap: wrap;" class="dot">
										<span style="white-space: nowrap;" class="dot"></span>
									</span>
									<span style="margin-left: 4px;margin-right: 2px; width: 4px;height: 1px;background-color: #000;display: inline-flex;"></span>
									<span style="display: flex;-webkit-box-align: center;align-items: center;flex-wrap: wrap;" class="dot">
										<span style="white-space: nowrap;" class="dot"></span>
									</span>
									<span style="margin-left: 4px;margin-right: 2px; width: 4px;height: 1px;background-color: #000;display: inline-flex;"></span>
									<span style="display: inline-flex;margin-left: 2px;font-size: 14px;letter-spacing: -.07px;line-height: 20px;">
									${fn:substring(payDTO.cardNum,15,19) }</span>
								</span>
							</div>
						</div>
					</div>
				</div>	
				<div style="padding-top: 100px;text-align: center;">
				  	<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);display: inline-block;cursor: pointer;vertical-align: middle;text-align: center;
					background-color: #fff;padding: 0 18px;height: 42px;line-height: 40px;border-radius: 12px;font-size: 14px;letter-spacing: -.14px;
					border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);min-width: 120px;" onclick="location.href='<%=cp %>/buying'" >목록보기</div>
				</div>
			</td>
		</tr>
		</table>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 360px; top:300px;border-radius: 16px;text-align: center;background-color: #fff;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,.1); " >
			<div>
				<h2 style="font-size: 18px;letter-spacing: -.27px;font-weight: 700;color: #000;text-align: center;padding: 32px 16px 0;
    			min-height: 46px;">거래 내역 지우기</h2>
			</div>
			<div>
				<div style="padding: 8px 32px 0;">
					<p style="margin: 0;padding: 0;font-size: 14px;letter-spacing: -.21px;color: rgba(34,34,34,.8);">
					거래 내역이 삭제됩니다.</p>
				</div>
				<div style="padding: 24px 32px 32px;display: flex;-webkit-box-pack: center;justify-content: center;">
					<div style="display: inline-block;cursor: pointer;vertical-align: middle;text-align: center;background-color: #fff;padding: 0 18px;
				    height: 42px;line-height: 40px;border-radius: 12px;font-size: 14px;letter-spacing: -.14px;border: 1px solid #d3d3d3;
				    color: rgba(34,34,34,.8);width: 120px;"data-bs-dismiss="modal">취소</div>
					<div style="display: inline-block;cursor: pointer;vertical-align: middle;text-align: center;padding: 0 18px;height: 42px;
				    line-height: 40px;border-radius: 12px;font-size: 14px;letter-spacing: -.14px;background-color: #222;color: #fff;width: 120px;
				    margin-left: 8px;"data-bs-dismiss="modal" onclick="deleteEnd('${endBuyDTO.tradeNum}');">지우기</div>
				</div>
			</div>


			
		</div>
	</div>
</div>
			
			
				
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





</body>
</html>