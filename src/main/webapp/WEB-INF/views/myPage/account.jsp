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

input::placeholder{
	color: rgba(134,134,134,.5);
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
.focusOut{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 8px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 1px solid #ebebeb;
}
.focusIn{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 7.5px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 2px solid #222222;
	
}
.account_error{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 8px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 1px solid #f15746;
}

.account_error_on{
	display: block;
	position: absolute; 
	display: block;
	line-height: 16px;
	font-size: 11px;
	color: #f15746;
	left: 0px; 
	bottom: -1px;
}
.account_error_off{
	display: none;
	position: absolute; 
	display: none;
	line-height: 16px;
	font-size: 11px;
	color: #f15746;
	left: 0px; 
	bottom: -1px;
}

.account_title_black{
	color: #222; 
	box-sizing: border-box;
	margin: 0; 
	padding: 0;
	font-size: 13px;
	letter-spacing: -.07px; 
	line-height: 18px;
	font-weight: 700;
}
.account_title_red{
	color: #f15746; 
	box-sizing: border-box;
	margin: 0; 
	padding: 0;
	font-size: 13px;
	letter-spacing: -.07px; 
	line-height: 18px;
	font-weight: 700;
}

.save_on{

    background-color: #222;
    color: #fff;
    cursor: pointer; 
	padding: 0 18px;
	width: 120px;				
	height: 42px; 
	line-height: 40px;
	border-radius: 12px; 
	font-size: 14px; 
	letter-spacing: -.14px;
}

.save_off{
	background-color: #ebebeb; 
	color: #fff; 
	padding: 0 18px;
	width: 120px;				
	height: 42px; 
	line-height: 40px;
	border-radius: 12px; 
	font-size: 14px; 
	letter-spacing: -.14px;
	cursor: default;
}

.bank-list-close{
	width: 480px; 
	height: 240px; 
	overflow-y: scroll; 
	position: absolute;
	left: 0px; top: 66px;
	z-index: 100; 
	background-color: #fff; 
	border: 1px solid #ebebeb;
	display: none
}
.bank-list-open{
	width: 480px; 
	height: 240px; 
	overflow-y: scroll; 
	position: absolute;
	left: 0px; top: 66px;
	z-index: 100; 
	background-color: #fff; 
	border: 1px solid #ebebeb;
	display: block;
	cursor: pointer;
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
.bank_choice:hover{
	background-color: #ebebeb;
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
	
	$('#account').on('input', accountCheck);
	$('#holder').on('input', holderCheck);
	
})

function accountFocusIn(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("account").className="focusIn";
		document.getElementById("account").placeholder="";
	}
}

function accountFocusOut(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("account").className="focusOut";
		document.getElementById("account").placeholder="- 없이 입력하세요";
	}
}
function holderFocusIn(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("holder").className="focusIn";
		document.getElementById("holder").placeholder="";
	}
}

function holderFocusOut(){
	
	var account = (String)(document.getElementById("holder").value);
	if(account.length!=1){
		document.getElementById("holder").className="focusOut";
		document.getElementById("holder").placeholder="예금주명을 정확히 입력하세요";
	}
}

function accountCheck(){
	
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var bank = (String)(document.getElementById("bank").value)
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	
	if(account.length==1){
		document.getElementById("account").className="account_error";
		document.getElementById("account_error").className="account_error_on";	
		document.getElementById("account_title").className="account_title_red";		
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("account").className="focusIn";
		document.getElementById("account_error").className="account_error_off";	
		document.getElementById("account_title").className="account_title_black";	
		if(bank.length>0&&account.length>1&&holder.length>1){			
			if(originBank==bank && originAccount==account && originHolder==holder){
				document.getElementById("save").className="save_off";
			}else{
				if(originBank!=""){
					$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
				}
				document.getElementById("save").className="save_on";
			}
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}

function holderCheck(){
	
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var bank = (String)(document.getElementById("bank").value)
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	if(holder.length==1){
		document.getElementById("holder").className="account_error";
		document.getElementById("holder_error").className="account_error_on";	
		document.getElementById("holder_title").className="account_title_red";	
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("holder").className="focusIn";
		document.getElementById("holder_error").className="account_error_off";	
		document.getElementById("holder_title").className="account_title_black";
		if(bank.length>0&&account.length>1&&holder.length>1){			
			if(originBank==bank && originAccount==account && originHolder==holder){
				document.getElementById("save").className="save_off";
			}else{
				if(originBank!=""){
					$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
				}
				document.getElementById("save").className="save_on";
			}
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}

function bankList(){
	var check = document.getElementById("bank-list").className;
	if(check == 'bank-list-open'){
		document.getElementById("bank-list").className="bank-list-close";
	}else{
		document.getElementById("bank-list").scrollTop=0;
		document.getElementById("bank-list").className="bank-list-open";
	}
	
}

function bank(bank){
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	
	document.getElementById("bank").value=bank;
	document.getElementById("bank-list").className="bank-list-close";
	
	if(bank.length>0&&account.length>1&&holder.length>1){			
		if(originBank==bank && originAccount==account && originHolder==holder){
			document.getElementById("save").className="save_off";
		}else{
			if(originBank!=""){
				$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
			}
			document.getElementById("save").className="save_on";
		}
	}else{
		document.getElementById("save").className="save_off";
	}
}

function saveData(){
	if(document.getElementById("save").className=="save_on"){
		var originBank = document.getElementById("originBank").value

		var bank = document.getElementById("bank").value
		var holder = document.getElementById("holder").value
		var account = document.getElementById("account").value
		
		document.getElementById("originBank").value=bank
		document.getElementById("originAccount").value=account
		document.getElementById("originHolder").value=holder
		
		if(originBank == ""){
			var url = "<%=cp%>/saveAccount";
			$("#title").html("<h3 style='font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;'>정산 계좌 변경</h3>")
		}
		var url = "<%=cp%>/saveAccount";
		$.post(url,{bank:bank,holder:holder,account:account},function(args){
		});
	}
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
						<li class="menu" onclick="location.href='<%=cp%>/payment'">결제 정보</li>
						<li class="menu" onclick="location.href='<%=cp%>/account'"style="color: black; font-weight: bolder;">판매 정산 계좌</li>
					</ul>
				</div>
			</td>
			<td style="padding-left: 40px;width: 1000px;" align="center">
			<div style="padding-top: 5px;">
				<div style="color: #222; margin: 0px;  padding: 5px 0px;">
					<div style="color: #222; margin: 0px; display: flex;">
						<div style="float: left; width: 500px;" align="left" id="title">
						<c:if test="${myPageDTO.bank==null }">
							<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">정산 계좌 등록</h3>
						</c:if>
						<c:if test="${myPageDTO.bank!=null }">	
							<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">정산 계좌 변경</h3>
						</c:if>	
						</div>
					</div>
				</div>
				
				<div style="width: 1000px; height: 16px;"></div>
				<div align="left">
					<div style="width: 480px; padding:10px 0px 14px; margin-top: 8px; position: relative;">
						<h3 style="color: #222; box-sizing: border-box;margin: 0; padding: 0;font-size: 13px;
    					letter-spacing: -.07px; line-height: 18px;font-weight: 700;">은행명</h3>
						<div style="position: relative; cursor: pointer;" onclick="bankList();">
							<input type="text" placeholder="선택하세요" id="bank" class="focusOut" value="${myPageDTO.bank }"
    						readonly="readonly" style="cursor: pointer;"/>
							<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
								<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
								<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
							</svg>
						</div>	
						<div class="bank-list-close" id="bank-list">
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('국민은행');">국민은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('신한은행');">신한은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('우리은행');">우리은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('하나은행');">하나은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('기업은행');">기업은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('농협은행');">농협은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('SC은행');">SC은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('한국씨티은행');">한국씨티은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('우체국');">우체국</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('산업은행');">산업은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('부산은행');">부산은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('카카오뱅크');">카카오뱅크</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('대구은행');">대구은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('케이뱅크');">케이뱅크</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('광주은행');">광주은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('제주은행');">제주은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('수협중앙회');">수협중앙회</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('전북은행');">전북은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('지역농축협');">지역농축협</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('경남은행');">경남은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('새마을금고연합회');">새마을금고연합회</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('신협');">신협</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('저축은행');">저축은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('HSBC은행');">HSBC은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('도이치은행');">도이치은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('제이피모간체이스은행');">제이피모간체이스은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('BOA은행');">BOA은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('비엔피파리바은행');">비엔피파리바은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('중국공상은행');">중국공상은행</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('산림조합');">산림조합</div>
							<div class="bank_choice" style="padding: 11px 50px 10px 16px; font-size: 13px; color: #222;"align="left" onclick="bank('중국건설은행');">중국건설은행</div>
						</div>		
					</div>
					
					<div style="width: 480px; padding:10px 0px 14px; margin-top: 8px; position: relative;">
						<h3 class="account_title_black" id="account_title">계좌번호</h3>
						<div>
							<input type="text" placeholder="- 없이 입력하세요" id="account" class="focusOut"
    						onfocus="accountFocusIn();" onblur="accountFocusOut();" value="${myPageDTO.account}"
    						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							/>
						</div>
						<div class="account_error_off" id="account_error">올바른 계좌번호를 입력해주세요.</div>					
					</div>
					<div style="width: 480px; padding:10px 0px 14px; margin-top: 8px; position: relative;">
						<h3 class="account_title_black" id="holder_title">예금주</h3>
						<div>
							<input type="text" placeholder="예금주명을 정확히 입력하세요" id="holder" class="focusOut"
							onfocus="holderFocusIn();" onblur="holderFocusOut();"value="${myPageDTO.holder}"
							/>
						</div>
						<div class="account_error_off" id="holder_error">올바른 이름을 입력해주세요. (2-50자)</div>						
					</div>
					<div style="width: 480px; padding-top:20px;" align="center" id="saveButton">
						<c:if test="${myPageDTO.bank!=null }">
							<div class="save_off" id="save">
							저장하기</div>
						</c:if>
						<c:if test="${myPageDTO.bank==null }">
							<div class="save_off" id="save" onclick="saveData();">
							저장하기</div>
						</c:if>
					</div>
				</div>
			</div>	

			</td>
		</tr>
		</table>
	
	</div>
</div>
<input type="hidden" id="originBank" value="${myPageDTO.bank }">
<input type="hidden" id="originAccount" value="${myPageDTO.account }">
<input type="hidden" id="originHolder" value="${myPageDTO.holder }">


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 360px; height:201px; top:300px; left:50px; border-radius: 12px; " >
			<div style="width:360px;height:57px; padding: 32px 16px 0;min-height: 46px;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">정산 계좌 변경</h2>	
			</div>
			<div style="width:360px;height:46px; padding: 8px 32px 0;min-height: 46px;" align="center" >
				<font style="font-size: 14px;letter-spacing: -.21px;color: rgba(34,34,34,.8)">
				이미 진행 중인 거래를 포함하여 앞으로 모든 거래의 대금 정산이 해당 계좌로 변경됩니다.</font>	
			</div>
			
			<div style="height: 98px;padding: 24px 32px 32px; display: flex;" align="center" >
				<div style="width: 120px;height: 42px; padding: 10px 18px; border-radius: 12px; font-size: 14px;letter-spacing: -.14px;
				border: 1px solid #d3d3d3;background-color: #fff;color: rgba(34,34,34,.8);cursor: pointer; float: left;margin-left: 22px;
				"data-bs-dismiss="modal">
					취소
				</div>
				<div style="width: 120px;height: 42px; padding: 10px 18px; border-radius: 12px; font-size: 14px;letter-spacing: -.14px;
				border: 1px solid #222;background-color: #222;color: #fff;cursor: pointer; float: left;margin-left: 8px;"
				data-bs-dismiss="modal" onclick="saveData();">
					확인
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