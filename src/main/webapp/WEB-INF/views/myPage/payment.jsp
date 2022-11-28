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
.dot{
   	color: #222;
    font-size: 0;
    box-sizing: border-box;
    white-space: nowrap;
}
.hyphen{
	color: #222;
    font-size: 0;
    box-sizing: border-box;
    margin-left: 4px;
    margin-right: 2px;
    width: 4px;
    height: 1px;
    background-color: #000;
    display: inline-flex;
}
.dot:before{
	content: "";
    margin-left: 2px;
    display: inline-flex;
    width: 5px;
    height: 5px;
    background-color: #222;
    border-radius: 100%;
}
.dot:after{
	content: "";
    margin-left: 2px;
    display: inline-flex;
    width: 5px;
    height: 5px;
    background-color: #222;
    border-radius: 100%;
}

.form_row{
    color: #5e5e5e;
    -webkit-text-size-adjust: none;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    font-size: 12px;
    margin: 0;
    padding: 0;
    position: relative;
    clear: both;
    width: 100%;
    height: 34px;
    line-height: 20px;
}
.form_row:after{
	isplay: block;
    clear: both;
    content: '';
}
.col_cont{
    font-weight: 400;
    font-size: 12px;
    line-height: 20px;
    margin: 0;
    padding: 0;
    position: relative;
    width: 192px;
    padding-right: 10px;
    color: #1a1a1a;
    display: inline-block;
    float: left;
}
.col_cont:after{
	isplay: block;
    clear: both;
    content: '';
}
.next_button_active{
    margin: 0;
    padding: 0;
    cursor: pointer;
    margin-right: 0;
    overflow: hidden;
    display: inline-block;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    text-align: center;
    border: none;
    width: 158px;
    height: 35px;
    border-radius: 3px;
    background: #207bba;
}
.next_button_inactive{
    margin: 0;
    padding: 0;
    cursor: pointer;
    margin-right: 0;
    overflow: hidden;
    display: inline-block;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    text-align: center;
    border: none;
    opacity: 0.15;
    width: 158px;
    height: 35px;
    border-radius: 3px;
    background: #207bba;
}
input::placeholder{
	color: rgba(134,134,134,.5);
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
$(function(){
	$.ajax({
		type:"POST",
		url:"<%=cp%>/cardList",
		success:function(args){
			$("#cardList").html(args);
		},
		error:function(e){
			alert(e.responseText);
		}
	})
})
$(function(){
	
	$('.cardNum').on('input', check_insertData);
	$('#jumin').on('input', check_insertData);
	$('#month').on('input', check_insertData);
	$('#year').on('input', check_insertData);
	$('#choice_bank').on('input', check_insertData);
	
}) 
function addModal1_open(){
	$('.hiddencheck').attr('value','no')
	$('.image_check').attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_default.png')
	$('#addModal1_next').attr('class','next_button_inactive')
}

function check(mode){
	if(mode=='total'){
		if(document.getElementById('check_total').value=='yes'){
			$('.hiddencheck').attr('value','no')
			$('.image_check').attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_default.png')
		}else{
			$('.hiddencheck').attr('value','yes')
			$('.image_check').attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_checked_blue.png')
		}		
	}else{
		if(document.getElementById('check'+mode).value=='yes'){
			$('#check'+mode).attr('value','no')
			$('#image_check'+mode).attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_default.png')
		}else{
			$('#check'+mode).attr('value','yes')
			$('#image_check'+mode).attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_checked_blue.png')
		}
	}
	check_all()
}

function check_all(){
	
	var ch1 = document.getElementById('check1').value
	var ch2 = document.getElementById('check2').value
	var ch3 = document.getElementById('check3').value
	var ch4 = document.getElementById('check4').value
	
	if(ch1=='yes'&&ch2=='yes'&&ch3=='yes'&&ch4=='yes'){
		$('.hiddencheck').attr('value','yes')
		$('.image_check').attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_checked_blue.png')
		$('#addModal1_next').attr('class','next_button_active')
		
	}else{
		$('#check_total').attr('value','no')
		$('#image_check_total').attr('src','https://spay.kcp.co.kr/img/chk/ico_chk_default.png')
		$('#addModal1_next').attr('class','next_button_inactive')
		
	}
}

function nextModal(){
	var active = $('#addModal1_next').attr('class')
	if(active=='next_button_active'){
		$('#addModal1').modal('hide')
		document.getElementById('card1').value=''
		document.getElementById('card2').value=''
		document.getElementById('card3').value=''
		document.getElementById('card4').value=''
		document.getElementById('jumin').value=''
		$('#month').val('').prop("selected",true)
		$('#year').val('').prop("selected",true)
		$('#choice_bank').val('').prop("selected",true)
		$('#addModal2_next').attr('class','next_button_inactive')
		$('#addModal2').modal('show')
	}	
}
function check_insertData(){
	var card1=document.getElementById('card1').value
	var card2=document.getElementById('card2').value
	var card3=document.getElementById('card3').value
	var card4=document.getElementById('card4').value
	var jumin=document.getElementById('jumin').value
	var month=$('#month').val()
	var year=$('#year').val()
	var bank=$('#choice_bank').val()
	if(card1.length==4 && card2.length==4 && card3.length==4 && card4.length==4 && jumin.length==6 && month!='' && year!='' && bank!=''){
		$('#addModal2_next').attr('class','next_button_active')
	}else{
		$('#addModal2_next').attr('class','next_button_inactive')
	}
}

function add_card(){
	var active = $('#addModal2_next').attr('class')
	if(active=='next_button_active'){
		$('#addModal2').modal('hide')
		
		var card1=document.getElementById('card1').value
		var card2=document.getElementById('card2').value
		var card3=document.getElementById('card3').value
		var card4=document.getElementById('card4').value
		var jumin=document.getElementById('jumin').value
		var month=$('#month').val()
		var year=$('#year').val()
		var bank=$('#choice_bank').val()
		
		var url = "<%=cp%>/savePay";
		$.post(url,{card1:card1,card2:card2,card3:card3,card4:card4,jumin:jumin,month:month,year:year,bank:bank},function(args){
			$("#cardList").html(args);
		});
	}	
}


function changeBasicPay(){
	var payNum = document.getElementById('new_basic').value
	
	var url = "<%=cp%>/changeBasicPay";
	$.post(url,{payNum:payNum},function(args){
		$("#cardList").html(args);
	});
}
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
						<li class="menu" onclick="location.href='<%=cp%>/buying'">구매 내역</li>
						<li class="menu" onclick="location.href='<%=cp%>/selling'">판매 내역</li>
						<li class="menu" onclick="location.href='<%=cp%>/wish'">관심 상품</li>
					</ul>
				</div>
				<div style="margin-top: 30px;">
					<div class="content"><strong >내 정보</strong></div>
					<ul>
						<li class="menu" onclick="location.href='<%=cp%>/profile'">프로필 정보</li>
						<li class="menu" onclick="location.href='<%=cp%>/address'">주소록</li>
						<li class="menu" onclick="location.href='<%=cp%>/payment'"style="color: black; font-weight: bolder;">결제 정보</li>
						<li class="menu" onclick="location.href='<%=cp%>/account'">판매 정산 계좌</li>
					</ul>
				</div>
			</td>
			<td style="padding-left: 40px;width: 1000px;" align="center">
			<div style="padding-top:5px">
				<div style="color: #222; margin: 0px;  padding: 5px 0px 16px; border-bottom: 3px solid #222;">
					<div style="color: #222; margin: 0px; display: flex;">
						<div style="float: left; width: 500px;" align="left">
							<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">결제 정보</h3>
						</div>
						<div style="float: right;width: 500px;" align="right">
							<div style="width: 130px;height: 30px; padding: 5px 14px ;border-radius: 10px;cursor:pointer;
							border: 1px solid #222;font-size: 12px;" align="center" id="addAddr"  data-bs-toggle="modal" data-bs-target="#addModal1"
							onclick="addModal1_open();">
								<font style="letter-spacing: -.5px;">+ 새 카드 추가하기</font>
							</div>
						</div>
					</div>
					<div align="left">
					<p style="margin: 0px;font-size: 12px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
					수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</p>
					</div>
				</div>
				<div id="cardList"></div>
			</div>		
			</td>
		</tr>
		</table>
	
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="basicModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 444px; top:290px;background-color: #fff;
   		border-radius: 16px;box-shadow: 0 4px 10px 0 rgba(0,0,0,.1);width: 360px;" >
   			<div style="color: #222;text-align: center;box-sizing: border-box;margin: 0;padding: 0;">
   				<h2 style="margin: 0;font-size: 18px;letter-spacing: -.27px;font-weight: 700;color: #000;text-align: center;padding: 32px 16px 0;
    			min-height: 46px;">기본 결제로<br/>변경하시겠습니까?</h2>
   			</div> 	
			<div style="text-align: center;">
				<div style="padding: 8px 32px 0;">
					<p style="margin: 0;padding: 0;font-size: 14px;letter-spacing: -.21px;color: rgba(34,34,34,.8);">
					이미 진행 중인 거래를 포함하여 앞으로<br>모든 거래의 결제가 해당카드로 변경됩니다.</p>
				</div>
				<div style="padding: 24px 32px 32px;display: flex;-webkit-box-pack: center;justify-content: center;">
					<button style="outline: none;background: none;appearance: none;display: inline-block;cursor: pointer;vertical-align: middle;
				    text-align: center;background-color: #fff;padding: 0 18px;height: 42px;line-height: 40px;border-radius: 12px;font-size: 14px;
				    letter-spacing: -.14px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);width: 120px;"data-bs-dismiss="modal">취소</button>
					<button style="border: 0;outline: none;background: none;appearance: none;display: inline-block;cursor: pointer;
				    vertical-align: middle;text-align: center;padding: 0 18px;height: 42px;line-height: 40px;border-radius: 12px;
				    font-size: 14px;letter-spacing: -.14px;background-color: #222;color: #fff;width: 120px;margin-left: 8px;"
				    data-bs-dismiss="modal" onclick="changeBasicPay();">계속 변경</button>
				</div>
			</div>
		</div>
	</div>
</div>
    
    

    



<!-- Modal -->
<div class="modal fade" data-bs-backdrop="static" id="addModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 760px;height: 560px; top:190px; left:-100px;border-radius: 4px;background: #fff;margin: 0;padding: 0; border: 0;" >
			<div style="height: 25px;border-radius: 4px 4px 0 0;font-size: 12px;line-height: 17px;color: #fff;padding: 4px 25px 2px;
		    position: relative;box-sizing: border-box;background: #207bba;">
		    	<span style="font-size: 12px;line-height: 17px;color: #fff;margin: 0;padding: 0;">MA KCP - 결제의 중심!</span>
		    	<div style="position: absolute;right: 25px;top: 5px;">
		    		<a style="font-size: 12px;line-height: 17px;color: #fff;text-decoration: none;">웹접근성안내</a>
		    	</div>
		    </div>
		    <div style="padding: 0;margin: 10px 25px 0;position: relative;height: 36px;line-height: 36px;font-size: 12px;font-weight: 700;color: #1a1a1a;">
		    	<span style="line-height: 36px;font-size: 12px;font-weight: 700;color: #1a1a1a;margin: 0;padding: 0;width: 180px;display: inline-block;
    			text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">KREAMY</span>
    			<div style="line-height: 36px;font-size: 12px;height: 20px;position: absolute;right: 0px;top: 0px;">
    				<div style="line-height: 36px;font-size: 12px;padding-left: 10px;color: #207bba;font-weight: bold;">배치결제</div>
    			</div>
		    </div>
		    <div style="padding: 0 25px;width: 760px;height: 434px;position: relative;">
		    	<div style="border: 1px solid #ebeaea;max-height: 50px;margin-top: 10px;position: relative;font-size: 12px;line-height: 17px;overflow: hidden;">
		    		<div style="width: 310px;float: left;padding: 6px 0 4px;">
		    			<span class="form_row">
		    				<span style="font-weight: 400;font-size: 12px;line-height: 20px;padding: 0;float: left;color: #5e5e5e;margin: 0 5px 0 20px;
    						width: 83px;">제공기간</span>
    						<span class="col_cont">[ 자동결제 ]</span>
		    			</span>
		    		</div>
		    	</div>
		    	<div style="position: relative;margin-top: 15px;">
		    		<div style="position: relative;clear: both;border: 1px solid #ebeaea;height: 54px;width: 710px;margin-top: -5px;margin-bottom: 15px;">
		    			<h1 style="margin: 0;padding: 0;color: #000000;padding-bottom: 13px;display: block;font-weight: 700;font-size: 13px;margin-left: 18px;
					    height: 8px;padding-top: 8px;float: left;letter-spacing: 0px;position: relative;z-index: 5;">약관 및 이용동의</h1>
					    <div style="position: absolute;top: 8px;left: 18px;right: 10px;z-index: 3;">
					    	<div style="float: left;width: 245px;position: relative;margin-left: 210px;margin-right: 5px;">
					    		<input type="checkbox" style="max-width: 100%;border-radius: 0;position: absolute;width: 0;height: 0;overflow: hidden;
    							margin: 0;padding: 0;border: 0;outline: 0;opacity: 0;z-index: 5;">
					    		<label style="color: #1a1a1a;font-weight: 700;font-size: 11px;display: inline-block;padding-left: 18px;line-height: 18px;
					    		cursor: pointer ;"onclick="check('total');">
					    			<span style="display: inline-block;position: absolute;left: 0;top: 2px;width: 16px;height: 15px;vertical-align: middle;
    								color: #5e5e5e;z-index: -1;"><img src="https://spay.kcp.co.kr/img/chk/ico_chk_default.png" id="image_check_total"
    								class="image_check"></span>
    								전체동의
					    		</label>
					    	</div>
					    	<div style="padding-top: 2px;float: left;position: relative;min-width: 205px;margin-right: 5px;">
					    		<input type="checkbox" style="max-width: 100%;border-radius: 0;position: absolute;width: 0;height: 0;overflow: hidden;
    							margin: 0;padding: 0;border: 0;outline: 0;opacity: 0;z-index: 5;">
					    		<label style="color: #707070;font-weight: normal;font-size: 11px;display: inline-block;padding-left: 18px;line-height: 18px;
					    		cursor: pointer ;"onclick="check('1');">
					    			<span style="display: inline-block;position: absolute;left: 0;top: 2px;width: 16px;height: 15px;vertical-align: middle;
    								color: #5e5e5e;z-index: -1;"><img src="https://spay.kcp.co.kr/img/chk/ico_chk_default.png"id="image_check1"
    								class="image_check"></span>
    								전자금융거래 이용약관
					    		</label>
					    	</div>
					    	<div style="padding-top: 2px;float: left;position: relative;min-width: 205px;margin-right: 5px;">
					    		<input type="checkbox" style="max-width: 100%;border-radius: 0;position: absolute;width: 0;height: 0;overflow: hidden;
    							margin: 0;padding: 0;border: 0;outline: 0;opacity: 0;z-index: 5;">
					    		<label style="color: #707070;font-weight: normal;font-size: 11px;display: inline-block;padding-left: 18px;line-height: 18px;
					    		cursor: pointer ;"onclick="check('2');">
					    			<span style="display: inline-block;position: absolute;left: 0;top: 2px;width: 16px;height: 15px;vertical-align: middle;
    								color: #5e5e5e;z-index: -1;"><img src="https://spay.kcp.co.kr/img/chk/ico_chk_default.png" id="image_check2"
    								class="image_check"></span>
    								자동승인 약관
					    		</label>
					    	</div>
					    	<div style="padding-top: 2px;float: left;position: relative;min-width: 245px;margin-right: 5px;">
					    		<input type="checkbox" style="max-width: 100%;border-radius: 0;position: absolute;width: 0;height: 0;overflow: hidden;
    							margin: 0;padding: 0;border: 0;outline: 0;opacity: 0;z-index: 5;">
					    		<label style="color: #707070;font-weight: normal;font-size: 11px;display: inline-block;padding-left: 18px;line-height: 18px;
					    		cursor: pointer ;"onclick="check('3');">
					    			<span style="display: inline-block;position: absolute;left: 0;top: 2px;width: 16px;height: 15px;vertical-align: middle;
    								color: #5e5e5e;z-index: -1;"><img src="https://spay.kcp.co.kr/img/chk/ico_chk_default.png" id="image_check3"
    								class="image_check"></span>
    								고유식별정보 수집 및 이용동의
					    		</label>
					    	</div>
					    	<div style="padding-top: 2px;float: left;position: relative;min-width: 205px;margin-right: 5px;">
					    		<input type="checkbox" style="max-width: 100%;border-radius: 0;position: absolute;width: 0;height: 0;overflow: hidden;
    							margin: 0;padding: 0;border: 0;outline: 0;opacity: 0;z-index: 5;">
					    		<label style="color: #707070;font-weight: normal;font-size: 11px;display: inline-block;padding-left: 18px;line-height: 18px;
					    		cursor: pointer ;"onclick="check('4');">
					    			<span style="display: inline-block;position: absolute;left: 0;top: 2px;width: 16px;height: 15px;vertical-align: middle;
    								color: #5e5e5e;z-index: -1;"><img src="https://spay.kcp.co.kr/img/chk/ico_chk_default.png" id="image_check4"
    								class="image_check"></span>
    								개인정보 수집 및 이용동의
					    		</label>
					    	</div>	
					    </div>
		    		</div>
		    		<div style="margin-top: 120px;text-align: center;">
		    			<img src="https://spay.kcp.co.kr/img/ic_phone.png" aria-hidden="true">약관 및 이용동의 후 
		    			<em style="font-size: 15px;text-align: center;font-style: normal;color: #eb2525 !important;font-weight: 500;">[다음] 버튼 클릭 시 </em> 
		    			 카드등록이 진행됩니다.
		    		</div>
		    	</div>
		    </div>
		    <div style="width: 100%;min-height: 55px;position: relative;background: #f3f3f4;border-radius: 0 0 4px 4px;text-align: center;">
		    	<div style="position: absolute;top: 0px;right: 0px;padding: 10px 25px 11px 0;width: 351px;height: 35px;text-align: right;">
		    		<button type="button" style="margin: 0;padding: 0;cursor: pointer;margin-right: 5px !important;overflow: hidden;display: inline-block;
    				color: #fff;font-size: 15px;font-weight: 700;text-align: center;border: none;background: #8f8f8f;width: 158px;
  					height: 35px; border-radius: 3px;"data-bs-dismiss="modal">취소</button>
		    		<button type="button" class="next_button_inactive" id="addModal1_next" onclick="nextModal()">다음</button>
		    	</div>
		    </div>
		</div>
	</div>
</div>
    

<!-- Modal -->
<div class="modal fade" data-bs-backdrop="static" id="addModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 760px;height: 560px; top:190px;left:-100px;border-radius: 4px;background: #fff;margin: 0;padding: 0; border: 0;" >
			<div style="height: 25px;border-radius: 4px 4px 0 0;font-size: 12px;line-height: 17px;color: #fff;padding: 4px 25px 2px;
		    position: relative;box-sizing: border-box;background: #207bba;">
		    	<span style="font-size: 12px;line-height: 17px;color: #fff;margin: 0;padding: 0;">MA KCP - 결제의 중심!</span>
		    	<div style="position: absolute;right: 25px;top: 5px;">
		    		<a style="font-size: 12px;line-height: 17px;color: #fff;text-decoration: none;">웹접근성안내</a>
		    	</div>
		    </div>
		    <div style="padding: 0;margin: 10px 25px 0;position: relative;height: 36px;line-height: 36px;font-size: 12px;font-weight: 700;color: #1a1a1a;">
		    	<span style="line-height: 36px;font-size: 12px;font-weight: 700;color: #1a1a1a;margin: 0;padding: 0;width: 180px;display: inline-block;
    			text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">KREAMY</span>
    			<div style="line-height: 36px;font-size: 12px;height: 20px;position: absolute;right: 0px;top: 0px;">
    				<div style="line-height: 36px;font-size: 12px;padding-left: 10px;color: #207bba;font-weight: bold;">배치결제</div>
    			</div>
		    </div>
		    <div style="padding: 0 25px;width: 760px;height: 434px;position: relative;">
		    	<div style="border: 1px solid #ebeaea;max-height: 50px;margin-top: 10px;position: relative;font-size: 12px;line-height: 17px;overflow: hidden;">
		    		<div style="width: 310px;float: left;padding: 6px 0 4px;">
		    			<span class="form_row">
		    				<span style="font-weight: 400;font-size: 12px;line-height: 20px;padding: 0;float: left;color: #5e5e5e;margin: 0 5px 0 20px;
    						width: 83px;">제공기간</span>
    						<span class="col_cont">[ 자동결제 ]</span>
		    			</span>
		    		</div>
		    	</div>
		    	<div style="position: relative;margin-top: 15px;">
		    	<div class="form_row" style="margin-top: 10px !important;">
	    				<label style="font-weight: 400;min-width: 120px;color: #1a1a1a;font-size: 13px;float: left;margin: 7px 0px 5px;height: 15px;">
			    			은행 명
			    			<span style="font-weight: 400;color: #1a1a1a;font-size: 13px;padding: 0;overflow: hidden;display: inline-block;line-height: 200px;
						    text-indent: -9999em;background: url(https://spay.kcp.co.kr/img/sp.png) no-repeat;width: 5px;height: 5px;background-position: -59px -17px;
						    vertical-align: middle;margin: -3px 3px 0;">필수입력</span>
						    <span style="font-weight: 400;color: #1a1a1a;margin: 0;padding: 0;overflow: hidden;position: absolute;top: 0;left: 0;width: 1px;
	    					height: 1px;font-size: 0;line-height: 100px;white-space: nowrap;">은행 선택</span>
    					</label>
    					<div>
    						<select id="choice_bank" style="margin: 0;max-width: 100%;padding: 2px 10px;border-radius: 0;appearance: none;
   							background: url(https://spay.kcp.co.kr/img/sel_arrow_off.gif) no-repeat 95% 50%;background-color: #fff;width: 170px;
   							height: 34px;border: 1px solid #b2b1b1;color: #707070;font-size: 12px;margin-right: 7px;float: left;"class="choice_bank">
                        		<option value="">은행 선택</option>
                                <option value="국민">국민</option>
                                <option value="신한">신한</option>
                                <option value="우리">우리</option>
                                <option value="하나">하나</option>
                                <option value="기업">기업</option>
                                <option value="농협">농협</option>
                                <option value="산업">산업</option>
                                <option value="부산">부산</option>
                                <option value="대구">대구</option>
                                <option value="광주">광주</option>
                                <option value="전북">전북</option>
                                <option value="경남">경남</option>  
                                <option value="제주">제주</option>  
                       		</select>
    					</div>
	    			</div>
		    		<div class="form_row" style="margin-top: 10px !important;" >
		    			<label style="font-weight: 400;min-width: 120px;color: #1a1a1a;font-size: 13px;float: left;margin: 7px 0px 5px;height: 15px;">
			    			카드번호
			    			<span style="font-weight: 400;color: #1a1a1a;font-size: 13px;padding: 0;overflow: hidden;display: inline-block;line-height: 200px;
						    text-indent: -9999em;background: url(https://spay.kcp.co.kr/img/sp.png) no-repeat;width: 5px;height: 5px;background-position: -59px -17px;
						    vertical-align: middle;margin: -3px 3px 0;">필수입력</span>
						    <span style="font-weight: 400;color: #1a1a1a;margin: 0;padding: 0;overflow: hidden;position: absolute;top: 0;left: 0;width: 1px;
	    					height: 1px;font-size: 0;line-height: 100px;white-space: nowrap;">첫번째자리</span>
		    			</label>
		    			<div>
		    				<span style="position: relative;display: block;float: left;width: 115px;">
		    					<input type="text" maxlength="4" title="카드번호 필수입력 첫번째자리" style="margin: 0;overflow: hidden;width: 100%;
    							max-width: 100%;margin-right: 0;border: 1px solid #b2b1b1;border-radius: 0;font-size: 12px;font-weight: 500;
    							vertical-align: top;background: #fff;color: #5e5e5e;padding: 0;text-align: center;height: 34px;letter-spacing: 5px;"
    							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="card1" class="cardNum">
		    				</span>
		    				<span style="position: relative;display: block;float: left;width: 115px;">
		    					<span style="width: 11px;height: 11px;position: absolute;top: 9px;right: 6px;">
		    						<img src="https://spay.kcp.co.kr/img/ic_slock.png" alt="보안키패드" aria-hidden="true">
		    					</span>
		    					<input type="password" maxlength="4" title="카드번호 필수입력 두번째자리" style="margin: 0;overflow: hidden;width: 100%;
    							max-width: 100%;margin-right: 0;border: 1px solid #b2b1b1;border-radius: 0;font-size: 12px;font-weight: 500;
    							vertical-align: top;background: #fff;color: #5e5e5e;padding: 0;text-align: center;height: 34px;letter-spacing: 5px;"
    							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"id="card2" class="cardNum">
		    				</span>
		    				<span style="position: relative;display: block;float: left;width: 115px;">
		    					<span style="width: 11px;height: 11px;position: absolute;top: 9px;right: 6px;">
		    						<img src="https://spay.kcp.co.kr/img/ic_slock.png" alt="보안키패드" aria-hidden="true">
		    					</span>
		    					<input type="password" maxlength="4" title="카드번호 필수입력 세번째자리" style="margin: 0;overflow: hidden;width: 100%;
    							max-width: 100%;margin-right: 0;border: 1px solid #b2b1b1;border-radius: 0;font-size: 12px;font-weight: 500;
    							vertical-align: top;background: #fff;color: #5e5e5e;padding: 0;text-align: center;height: 34px;letter-spacing: 5px;"
    							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"id="card3" class="cardNum">
		    				</span>
		    				<span style="position: relative;display: block;float: left;width: 115px;">
		    					<input type="text" maxlength="4" title="카드번호 필수입력 네번째자리" style="margin: 0;overflow: hidden;width: 100%;
    							max-width: 100%;margin-right: 0;border: 1px solid #b2b1b1;border-radius: 0;font-size: 12px;font-weight: 500;
    							vertical-align: top;background: #fff;color: #5e5e5e;padding: 0;text-align: center;height: 34px;letter-spacing: 5px;"
    							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"id="card4" class="cardNum">
		    				</span>
		    			</div>
		    		</div>
	    			<div class="form_row" style="margin-top: 10px !important;">
	    				<label style="font-weight: 400;min-width: 120px;color: #1a1a1a;font-size: 13px;float: left;margin: 7px 0px 5px;height: 15px;">
			    			유효기간
			    			<span style="font-weight: 400;color: #1a1a1a;font-size: 13px;padding: 0;overflow: hidden;display: inline-block;line-height: 200px;
						    text-indent: -9999em;background: url(https://spay.kcp.co.kr/img/sp.png) no-repeat;width: 5px;height: 5px;background-position: -59px -17px;
						    vertical-align: middle;margin: -3px 3px 0;">필수입력</span>
						    <span style="font-weight: 400;color: #1a1a1a;margin: 0;padding: 0;overflow: hidden;position: absolute;top: 0;left: 0;width: 1px;
	    					height: 1px;font-size: 0;line-height: 100px;white-space: nowrap;">월 선택</span>
    					</label>
    					<div>
    						<select id="month" style="margin: 0;max-width: 100%;padding: 2px 10px;border-radius: 0;appearance: none;
   							background: url(https://spay.kcp.co.kr/img/sel_arrow_off.gif) no-repeat 95% 50%;background-color: #fff;width: 170px;
   							height: 34px;border: 1px solid #b2b1b1;color: #707070;font-size: 12px;margin-right: 7px;float: left;"class="month">
                        		<option value="">월 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>  
                       		</select>
                       		<label style="overflow: hidden;position: absolute;top: 0;left: 0;width: 1px;height: 1px;font-size: 0;
   							line-height: 100px;white-space: nowrap;">년 선택</label>
   							<select id="year" style="margin: 0;max-width: 100%;padding: 2px 10px;border-radius: 0;appearance: none;
   							background: url(https://spay.kcp.co.kr/img/sel_arrow_off.gif) no-repeat 95% 50%;background-color: #fff;width: 170px;
   							height: 34px;border: 1px solid #b2b1b1;color: #707070;font-size: 12px;margin-right: 7px;float: left;" class="year">
                        		<option value="">년 선택</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                                <option value="2028">2028</option>
                                <option value="2029">2029</option>
                                <option value="2030">2030</option>
                                <option value="2031">2031</option>
                                <option value="2032">2032</option>
                                <option value="2033">2033</option>
                                <option value="2034">2034</option>
                                <option value="2035">2035</option>
                                <option value="2036">2036</option>
                                <option value="2037">2037</option>
                                <option value="2038">2038</option>
                                <option value="2039">2039</option>
                                <option value="2040">2040</option>
                                <option value="2041">2041</option>
                                <option value="2042">2042</option>
                                <option value="2043">2043</option>
                                <option value="2044">2044</option>
                                <option value="2045">2045</option>
                                <option value="2046">2046</option>
                                <option value="2047">2047</option>
                                <option value="2048">2048</option>
                                <option value="2049">2049</option>
                                <option value="2050">2050</option>
                                <option value="2051">2051</option>
                       		</select>
    					</div>
	    			</div>
	    			<div class="form_row" style="margin-top: 10px !important;">
	    				<div style="display: block;">
	    					<label style="font-weight: 400;min-width: 120px;color: #1a1a1a;font-size: 13px;float: left;margin: 7px 0px 5px;height: 15px;">
		    					생년월일
		    					<span style="font-weight: 400;color: #1a1a1a;font-size: 13px;padding: 0;overflow: hidden;display: inline-block;
							    line-height: 200px;text-indent: -9999em;background: url(https://spay.kcp.co.kr/img/sp.png) no-repeat;width: 5px;height: 5px;
							    background-position: -59px -17px;vertical-align: middle;margin: -3px 3px 0;">필수입력</span>
		    					<span style="font-weight: 400;color: #1a1a1a;margin: 0;padding: 0;overflow: hidden;position: absolute;
    							top: 0;left: 0;width: 1px;height: 1px;font-size: 0;line-height: 100px;white-space: nowrap;">앞자리</span>
	    					</label>
	    					<div>
	    						<span style="margin: 0;padding: 0;position: relative;display: block;width: 347px;float: left;">
	    							<input type="text" id="jumin" class="jumin" maxlength="6" placeholder="YYMMDD" title="생년월일 필수입력 6자리"
	    							style="margin: 0;overflow: hidden;width: 100%;max-width: 100%;padding: 2px 10px;margin-right: 0;height: 34px;
								    border: 1px solid #b2b1b1;border-radius: 0;font-size: 12px;font-weight: 500;vertical-align: top;background: #fff;
								    color: #5e5e5e;letter-spacing: 5px;"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	    						</span>
	    					</div>
	    				</div>
	    			</div>
	    			<div style="font-weight: 400;padding: 0;border-top: 1px solid #ebeaea;margin: 15px 0 15px;padding-top: 15px;font-size: 13px;
   					color: #5e5e5e;">
   					결제조건에 동의하시면&nbsp;<em style="color: #eb2525 !important;font-weight: 500;">'다음' 버튼</em>을 클릭해 주세요.</div>
	    		</div>
	    	</div>
		    <div style="width: 100%;min-height: 55px;position: relative;background: #f3f3f4;border-radius: 0 0 4px 4px;text-align: center;">
		    	<div style="position: absolute;top: 0px;right: 0px;padding: 10px 25px 11px 0;width: 351px;height: 35px;text-align: right;">
		    		<button type="button" style="margin: 0;padding: 0;cursor: pointer;margin-right: 5px !important;overflow: hidden;display: inline-block;
    				color: #fff;font-size: 15px;font-weight: 700;text-align: center;border: none;background: #8f8f8f;width: 158px;
  					height: 35px; border-radius: 3px;"data-bs-dismiss="modal">취소</button>
		    		<button type="button" class="next_button_inactive" id="addModal2_next" onclick="add_card()">다음</button>
		    	</div>
		    </div>
		</div>
	</div>
</div>


<input type="hidden" id="check_total" class="hiddencheck" value="no">    
<input type="hidden" id="check1" class="hiddencheck" value="no">    
<input type="hidden" id="check2" class="hiddencheck" value="no">    
<input type="hidden" id="check3" class="hiddencheck" value="no">    
<input type="hidden" id="check4" class="hiddencheck" value="no">    
<input type="hidden" id="new_basic" class="hiddencheck" value="">    

			
			
			
				
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