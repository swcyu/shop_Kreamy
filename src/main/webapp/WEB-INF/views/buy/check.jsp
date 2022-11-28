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

<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/check.css"/>
<script type="text/javascript" src="/kreamy/resources/js/jquery-3.6.0.js"></script>



<style type="text/css">


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
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); min-height: 90px; position: fixed; top: 0; left: 0; right: 0;
			 z-index: 1000; background-color: #fff;" >
				<div>
					<div class="header_top" style="box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);">
						<div class="top_inner" style="display: flex; padding: 8px 40px;">
							
							
							
							<ul class="top_list" style="align-items: center; margin-left: auto; display: flex; list-style: none;margin-top: 0;margin-bottom: -1rem; ">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/noticeList" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">고객센터</a>
								</li>
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/wish" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
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
									<a href="<%=cp %>/logout" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">로그아웃</a>
								</li>
								</c:if>
							</ul>
						</div>
						<hr style="    margin-top: 1rem; margin-bottom: -1rem; height:1px;color:#222 ; opacity: 10%">
						
						<div class="header_main" style="" >
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 68px; min-width: 320px; align-items: center;" >
								<h1 style="margin-top: 14px;padding-top: 3px;" >
									<a href="<%=cp %>/mainPage" class="logo" >									
										<img src="/img/Kreamy.png" style="width: 167px; height: 41px;">
									</a>
								</h1>
								
								<div class="gnb_area" style="display: flex; align-items: center; margin-left: auto;" >
									<div class="gnb" style="" >
										<ul class="gnb_list" style="display: flex; align-items: center; list-style: none;margin-top: 0;margin-bottom: -1rem;" >											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="<%=cp %>/shop.action" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> SHOP </a>
											</li>
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="<%=cp %>/authPolicy" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> POLICY </a>
											</li>											
											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="<%=cp %>/noticeList" target="_blank" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
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
			
			
			
			
			
	
			
			
			
		
				
				<div id="__nuxt">
<div id="__layout">
<div class="wrap lg win_os">
	<div></div><!-- 위에 메뉴들 로그인 검색 -->
	<div class="container buy lg">
		<div class="content">
			<div class="buy_before">
				<div class="buy_before_check">
					<div>
						<div class="title_area">
							<h2 class="check_title">
								<span class="accent_text">구매</span>하시기 전에 <br class="br_mo">꼭 확인하세요. 
							</h2>
						</div>
						<div class="buy_product">
							<div class="product" style="background-color: #f6f6f6;">
								<img src="/img/${repImage}" class="product_img">
								<!----><!---->
							</div>
							<div class="buy_info">
								<div class="model_info">
									<strong class="model_number">${pIdto.styleNum }</strong>
									<p class="model_title">${pIdto.engProduct }</p>
									<p class="model_ko"></p>
									<div class="size_select_wrap">
										<button class="btn btn_size">
											<span class="size">${prodSize }</span>
											<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle><path fill="#000" d="M17 10l-5 5-5-5h10z"></path></svg>
										</button>
										<div class="layer_detail_size_select layer lg hide">
											<div class="layer_container">
												<div class="layer_header">
													<h2 class="title"> 사이즈 선택 <span class="subtitle">즉시 구매가(원)</span></h2>
												</div>
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
												<a class="btn_layer_close">
													<svg class="pop_x_btn" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!-- buy_product 끝 -->				
					</div><!-- 첫번쨰 생 div 끝 -->
					<div>
						<ul class="check_list lg">
							<li class="check_item">
								<a class="check_area">
									<div class="notice_group">
										<p class="notice_maintext">구매하려는 상품이 맞습니다.</p>
										<p class="notice_subtext">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.</p>
										<!---->
									</div>
									<div class="checkbox_item">										
										<label class="check_label">										
											<svg class="cb" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<svg class="cb2 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<!---->
										</label>										
									</div>
								</a>
							</li>
							<li class="check_item">
								<a class="check_area">
									<div class="notice_group">
										<p class="notice_maintext">국내/해외에서 발매한 정품 · 새상품입니다.</p>
										<p class="notice_subtext">모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 국내 발매 상품 여부는 확인드리지 않습니다.</p>
										<!---->
									</div>
									<div class="checkbox_item">										
										<label class="check_label">										
											<svg class="cb" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<svg class="cb2 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<!---->
										</label>										
									</div>
								</a>
							</li>
							<li class="check_item">
								<a class="check_area">
									<div class="notice_group">
										<p class="notice_maintext">제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</p>
										<p class="notice_subtext">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</p>
										<!---->
									</div>
									<div class="checkbox_item">										
										<label class="check_label">										
											<svg class="cb" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<svg class="cb2 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<!---->
										</label>										
									</div>
								</a>
							</li>
							<li class="check_item">
								<a class="check_area">
									<div class="notice_group">
										<p class="notice_maintext">KREAMY의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</p>
										<p class="notice_subtext">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.</p>
										<!---->
									</div>
									<div class="checkbox_item">										
										<label class="check_label">										
											<svg class="cb" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<svg class="cb2 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
											<!---->
										</label>										
									</div>
								</a>
							</li>							
						</ul>
						<div class="btn_confirm lg">
							<a class="btn full solid disabled" id="nextPagebtn"> 구매 계속 </a>
						</div>
					</div><!-- 두번째 생 div 끝 -->
				</div><!-- buy_before_check 끝 -->
			</div><!-- buy_before 끝 -->
		</div><!-- content 끝 -->
	</div><!-- container buy lg 끝 -->
</div><!-- wrap lg win_os 끝 -->
</div><!-- layout 끝 -->	
</div><!-- nuxt 끝 -->
				
				
				
				
				
				
				
				
				
				
				
				
				
					
				
			
			
			
				
			<!-- contain -->
			</div>
			
			
			
			
			<div class="banner_bottom lg" style="display: flex;">
					<a class="banner_box" style="background-color: #565656; background-image: url('/img/home_banner_bottom1.png');
					position: relative; padding: 36px 32px 0; width: 100%; height: 200px; background-position: 100% 0;
					 background-repeat: no-repeat; background-size: 350px 200px;">
						<div class="banner_info" style="max-width: 300px; color: #fff;">
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase; color: #fff;">
								service guide
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px; color: #fff;" >
								
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
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase; color: #fff;">
								download the app
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px; color: #fff;">
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
$(document).on('click','.model_info .btn.btn_size', function(){		
	
	$('body').attr('class','fixed_c');
	$('#__nuxt').attr('class','fixed_c');
	$('.model_info .layer_detail_size_select').removeClass('hide');
	$(".link_inner .price:contains('구매입찰')").closest('button').attr('class','select_link buy bid');
	$('.model_info .select_item').attr('class','select_item');
	
	var size = $(this).children().text().trim();	
	var sls = $('.select_link .size');	
	
	sls.each( function(){	
		if($(this).text().trim()==size){			
			$(this).closest('li').addClass('active');
		}
	})	
});
//사이즈에서클릭
$(document).on('click','.model_info .select_link', function(){
	
	$('.model_info .btn.btn_size .size').html($(this).find('.size').text().trim());
	
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('.model_info .layer_detail_size_select').addClass('hide');
	
});

//x버튼
$('.pop_x_btn').click(function() {
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('.model_info .layer_detail_size_select').addClass('hide');

});

//체크박스
$(document).on('click','.check_area', function(){
	if($(this).find('.cb').hasClass('hide')){
		$(this).find('.cb').removeClass('hide');
	}else{
		$(this).find('.cb').addClass('hide');
	}
	if($(this).find('.cb2').hasClass('hide')){
		$(this).find('.cb2').removeClass('hide');
	}else{
		$(this).find('.cb2').addClass('hide');
	}
	//클래스갯수세기
	//alert($('.cb.hide').length);
	if($('.cb.hide').length==$('.cb').length){
		$('#nextPagebtn').removeClass('disabled');
	}else{
		$('#nextPagebtn').attr('class','btn full solid disabled');
	}
});

//다음페이지로
$(document).on('click','#nextPagebtn', function(){
	if($('.cb.hide').length==$('.cb').length){
		location.href='http://localhost:8080/kreamy/buy?engProduct=${pIdto.engProduct}&prodSize='+$('.btn.btn_size .size').text().trim();
	}
});
</script>



</body>
</html>