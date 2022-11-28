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
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/join.css"/>
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/imagecheck.css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>


<style type="text/css">

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
$(function() {
	$('.e_input_box').on('input', checkEInput);
	$('.p_input_box').on('input', checkPInput);
	$('.name_input_box').on('input', checkName);
	$('.phone_input_box').on('input', checkPhone);
	
	// 이메일, 비밀번호, 약관체크 확인 후 가입버튼 활성화
	$('.e_input_box').on('input', function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true && isValidPassword(pwd)==true && $("input:checkbox[id='group_check_1']").is(':checked')==true){
			$(".btn_join_disabled").attr('class','btn_join');
		}else{
			$(".btn_join").attr('class','btn_join_disabled');
		}
	});
	
	$('.p_input_box').on('input', function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true && isValidPassword(pwd)==true && $("input:checkbox[id='group_check_1']").is(':checked')==true){
			$(".btn_join_disabled").attr('class','btn_join');
		}else{
			$(".btn_join").attr('class','btn_join_disabled');
		}
	});
	
	// 이름, 핸드폰 번호 유효성 검사 후 최종 가입 버튼 활성화
	$('.name_input_box').on('input', function(){
		
		var name = $('input[name=id]').val();
		var phone = $('input[name=phone]').val();
		
		if(isValidPhone(phone) && name.length>=2){
			$("#join_submit").attr('class','btn solid medium');
		}else{
			$("#join_submit").attr('class','btn solid disabled medium');
		}
	});
	
	$('.phone_input_box').on('input', function(){
	
		var name = $('input[name=id]').val();
		var phone = $('input[name=phone]').val();
		
		if(isValidPhone(phone)==true && name.length>=2){
			$("#join_submit").attr('class','btn solid medium');
		}else{
			$("#join_submit").attr('class','btn solid disabled medium');
		}
	});
	
	$('input[name=email]').focus(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(!"${naverId}"){
			if(email.length == 0){
				$('.e_input_txt').attr('class','eunder_input_txt');
			}else if(isValidEmail(email)==true){
				$('.e_input_txt').attr('class','eunder_input_txt');
			}else{
				$('.eunder_input_txt').attr('class','e_input_txt_has_error');
			}
		}
		
	});

	$('input[name=email]').blur(function(){

		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true){
			$('.e_input_title_has_error').attr('class','eunder_input_txt');
		}else if(email.length != 0){
			$('.eunder_input_txt').attr('class','e_input_title_has_error');
		}else{
			$('.eunder_input_txt').attr('class','e_input_txt');
		}
		
	});
	
	$('input[name=pwd]').focus(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(pwd.length == 0){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else if(isValidPassword(pwd)==true){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt_has_error');
		}
		
	});

	$('input[name=pwd]').blur(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidPassword(pwd)==true){
			$('.p_input_title_has_error').attr('class','punder_input_txt');
		}else if(pwd.length != 0){
			$('.punder_input_txt').attr('class','p_input_title_has_error');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt');
		}
		
	});

	$('input[name=id]').focus(function(){
		
		var name = $('input[name=id]').val();
		
		if(name.length == 0){
			$('.name_input_txt').attr('class','name_under_input_txt');
		}else if(name.length>=2){
			$('.name__input_txt').attr('class','name_under_input_txt');
		}else{
			$('.name_under_input_txt').attr('class','name_input_txt_has_error');
		}
		
	});

	$('input[name=id]').blur(function(){

		var name = $('input[name=id]').val();
		
		if(name.length>=2){
			$('.name_input_title_has_error').attr('class','name_under_input_txt');
		}else if(name.length != 0){
			$('.name_under_input_txt').attr('class','name_input_title_has_error');
		}else{
			$('.name_under_input_txt').attr('class','name_input_txt');
		}
		
	});
	
	$('input[name=phone]').focus(function(){
		
		var phone = $('input[name=phone]').val();
		
		if(phone.length == 0){
			$('.phone_input_txt').attr('class','phone_under_input_txt');
		}else if(isValidPhone(phone)==true){
			$('.phone_input_txt').attr('class','phone_under_input_txt');
		}else{
			$('.phone_under_input_txt').attr('class','phone_input_txt_has_error');
		}
		
	});

	$('input[name=phone]').blur(function(){

		var phone = $('input[name=phone]').val();
		
		if(isValidPhone(phone)==true){
			$('.phone_input_title_has_error').attr('class','phone_eunder_input_txt');
		}else if(phone.length != 0){
			$('.phone_under_input_txt').attr('class','phone_input_title_has_error');
		}else{
			$('.phone_under_input_txt').attr('class','phone_input_txt');
		}
		
	});
	
	// 스니커즈 사이즈 선택 클릭시
	$('.input_item').click(function() {
		
		$('body').attr('class','fixed');
		$('#size_container').attr('style','');
	});
	
	$('#agreement_view').click(function() {
		
		$('body').attr('class','fixed');
		$('.layer.lg.layer_agreement').attr('style','');
	});
	
	$('#privacy_view').click(function() {
	
		$('body').attr('class','fixed');
		$('.layer.lg.layer_privacy').attr('style','');
	});
	

	
	// 팝업창 내 사이즈 클릭
	$('.btn.outlinegrey.medium').click(function() {		

		$('.btn.outlinegrey.medium.on').removeClass('on');
		$(this).addClass('on');
		$(".btn.solid.disabled.medium").attr('class','btn solid medium');
		$("#join_submit").attr('class','btn solid disabled medium');
	}); 
	
	//선택버튼 클릭
	$('#size_select').click(function() {
		
		$('body').attr('class','');
		$('#size_container').attr('style','display: none;');
		$('input[name=shoesSize]').attr('class', 'input_txt hover text_fill');
		$('input[name=shoesSize]').val($('.btn.outlinegrey.medium.on').find('.info_txt').text());
		
	});
	
	$('input[type=checkbox]').click(function() {
		
		if($('#agreement').prop('checked') && $('#privacy').prop('checked')){
			$("input:checkbox[id='group_check_1']").prop('checked', true)
		}else{
			$("input:checkbox[id='group_check_1']").prop('checked', false)
		}
		
		if($('#allow_marketing').prop('checked') && $('#allow_marketing_sms').prop('checked') && $('#allow_marketing_email').prop('checked')){
			$("input:checkbox[id='group_check_2']").prop('checked', true)
		}else{
			$("input:checkbox[id='group_check_2']").prop('checked', false)
		}
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true && isValidPassword(pwd)==true && $("input:checkbox[id='group_check_1']").is(':checked')==true){
			$(".btn_join_disabled").attr('class','btn_join');
		}else{
			$(".btn_join").attr('class','btn_join_disabled');
		}
		
		//광고성 정보수신
		if($('#allow_marketing_sms').is(':checked')){
			$('input[name=adSms]').val('yes');
		}else{
			$('input[name=adSms]').val('no');
		}
		
		if($('#allow_marketing_email').is(':checked')){
			$('input[name=adEmail]').val('yes');
		}else{
			$('input[name=adEmail]').val('no');
		}
	});
	
	//검은화면(+확인버튼)과 x클릭 
	$('.btn_layer_close').click(function() {
		
		$('body').attr('class','');
		$('#size_container').attr('style','display: none;');
		$('.layer.lg.layer_agreement').attr('style','display:none;');
		$('.layer.lg.layer_privacy').attr('style','display:none;');
		$('.layer.phone').attr('style','display:none;');
		
	}); 
	
});

//약관 전체 체크, 체크해제
function cAll1(){
	
	if($("input:checkbox[id='group_check_1']").is(':checked')) {

    	$("input:checkbox[id='agreement']").prop('checked', false)
    	$("input:checkbox[id='privacy']").prop('checked', false)
    	
    }else if($("input:checkbox[id='group_check_1']").is(':checked')==false) {
    	
    	$("input:checkbox[id='agreement']").prop('checked', true)
    	$("input:checkbox[id='privacy']").prop('checked', true)
    	
    }
}

function cAll2(){
	
	if($("input:checkbox[id='group_check_2']").is(':checked')) {

    	$("input:checkbox[id='allow_marketing']").prop('checked', false)
    	$("input:checkbox[id='allow_marketing_sms']").prop('checked', false)
    	$("input:checkbox[id='allow_marketing_email']").prop('checked', false)
    	
    }else if($("input:checkbox[id='group_check_2']").is(':checked')==false) {

    	$("input:checkbox[id='allow_marketing']").prop('checked', true)
    	$("input:checkbox[id='allow_marketing_sms']").prop('checked', true)
    	$("input:checkbox[id='allow_marketing_email']").prop('checked', true)
    }

}

function checkEInput() {
	
	var email = $('input[name=email]').val();
	var pwd = $('input[name=pwd]').val();

	if(!isValidEmail(email)) {
		jQuery('.e_input_error').show();
		$(".e_input_title").attr('class','e_input_title_has_error');
		$(".eunder_input_txt").attr('class','e_input_txt_has_error');
		$(".e_input_error").attr('class','e_input_error_has_error');
	} else{
		$(".e_input_title_has_error").attr('class','e_input_title');
		$(".e_input_txt_has_error").attr('class','eunder_input_txt');
		$(".e_input_error_has_error").attr('class','e_input_error');
		jQuery('.e_input_error').hide();
	}
}

function checkPInput() {
	
	var email = $('input[name=email]').val();
	var pwd = $('input[name=pwd]').val();
	
	if(!isValidPassword(pwd)) {
		jQuery('.p_input_error').show();
		$(".p_input_title").attr('class','p_input_title_has_error');
		$(".punder_input_txt").attr('class','p_input_txt_has_error');
		$(".p_input_error").attr('class','p_input_error_has_error');
	} else{
		$(".p_input_title_has_error").attr('class','p_input_title');
		$(".p_input_txt_has_error").attr('class','punder_input_txt');
		$(".p_input_error_has_error").attr('class','p_input_error');
		jQuery('.p_input_error').hide();
	}
	
}

function checkName(){
	
	var name = $('input[name=id]').val();
	
	if(name.length<2){
		jQuery('.name_input_error').show();
		$(".name_input_title").attr('class','name_input_title_has_error');
		$(".name_under_input_txt").attr('class','name_input_txt_has_error');
		$(".name_input_error").attr('class','name_input_error_has_error');
	} else{
		$(".name_input_title_has_error").attr('class','name_input_title');
		$(".name_input_txt_has_error").attr('class','name_under_input_txt');
		$(".name_input_error_has_error").attr('class','name_input_error');
		jQuery('.name_input_error').hide();
	}
}

function checkPhone(){
	
	var phone = $('input[name=phone]').val();
	
	if(!isValidPhone(phone)){
		jQuery('.phone_input_error').show();
		$(".phone_input_title").attr('class','phone_input_title_has_error');
		$(".phone_under_input_txt").attr('class','phone_input_txt_has_error');
		$(".phone_input_error").attr('class','phone_input_error_has_error');
	} else{
		$(".phone_input_title_has_error").attr('class','phone_input_title');
		$(".phone_input_txt_has_error").attr('class','phone_under_input_txt');
		$(".phone_input_error_has_error").attr('class','phone_input_error');
		jQuery('.phone_input_error').hide();
	}
	
}

function emailCheck(){
	
	var email = $('input[name=email]').val();
	
	var data = {email : email}
	
	$.ajax({
		type : "post",
		url : "<%=cp%>/emailChk",
		data : data,
		success : function(result){
			if(result=="fail"){
				alert("이미 가입된 이메일 입니다.");
				document.getElementById('join_form').email.focus();
				return;
			}else{
				$('body').attr('class','fixed');
				$('.layer.phone').attr('style','');
			}
		}
	});
	
}

function phoneCheck(){
	
	var phone = $('input[name=phone]').val();

	var data = {phone : phone}
	
	$.ajax({
		type : "post",
		url : "<%=cp%>/phoneChk",
		data : data,
		success : function(result){
			if(result=="fail"){
				alert("이미 가입된 전화번호 입니다.");
				document.getElementById('join_form').phone.focus();
				return;
			}else{
				if(!$('input[name=shoesSize]').val())
					$('input[name=shoesSize]').val(0);
				document.getElementById('join_form').submit();
			}
		}
	});
	
	
}

//약관 펼치기 접기 이미지 변경
function clickBtn1(){
	
	if($('#terms_box1').hasClass('open')){
		$('#terms_box1').attr('class','terms_box');
		document.getElementById("click1").src = "/img/plus.svg";
	}else{
		$('#terms_box1').attr('class','terms_box open');
		document.getElementById("click1").src = "/img/minus.svg";
	}
}

function clickBtn2(){
	
	if($('#terms_box2').hasClass('open')){
		$('#terms_box2').attr('class','terms_box');
		document.getElementById("click2").src = "/img/plus.svg";
	}else{
		$('#terms_box2').attr('class','terms_box open');
		document.getElementById("click2").src = "/img/minus.svg";
	}
	
}

function init(){
	jQuery('.e_input_error').hide();
	jQuery('.p_input_error').hide();
	jQuery('.name_input_error').hide();
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
			//alert("ddd");
			alert(args);
			
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
<body onload="init();"> 

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
						<hr style="    margin-top: 1rem; margin-bottom: -1rem; height:1px;color:#222 ; opacity: 30%">
						
						<div class="header_main" style="" >
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 75px; min-width: 320px; align-items: center;" >
								<h1 style="margin-top: 7px;" >
									<a href="mainPage" class="logo" >									
										<img src="/img/Kreamy.png" style="width: 167px; height: 41px;">
									</a>
								</h1>
								
								<div class="gnb_area" style="display: flex; align-items: center; margin-left: auto;" >
									<div class="gnb" style="" >
										<ul class="gnb_list" style="display: flex; align-items: center; list-style: none;margin-top: 0;margin-bottom: -1rem;" >											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -3px;" >
											<a href="shop.action" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> SHOP </a>
											</li>
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -3px;" >
											<a href="authPolicy" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> POLICY </a>
											</li>											
											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -3px; " >
											<a href="noticeList" target="_blank" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> NOTICE </a>
											</li>		
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -3px;" >
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
			
	<form id="join_form" method="post" action="<%=cp %>/join_ok">

<div class="join_area">
	<h2 class="join_title">회원가입</h2>
	
	<c:if test="${empty naverId }">
	<div class="e_input_box">
		<h3 class="e_input_title ess">
			이메일 주소
		</h3>
		<div class="e_input_item">
			<input type="text" name="email" placeholder="예) kream@kream.co.kr" autocomplete="off" class="e_input_txt">
		</div>
		<p class="e_input_error"> 이메일 주소를 정확히 입력해주세요. </p>
	</div>
	</c:if>
	
	<c:if test="${!empty naverId }">
	<div class="e_input_box">
		<h3 class="e_input_title ess">
			네이버로 연결됨
		</h3>
		<div class="e_input_item">
			<input type="text" name="email" value="${naverId }" style="color: rgba(34,34,34,.5); cursor: default;" readonly="readonly" autocomplete="off" class="e_input_txt">
		</div>
		<p class="e_input_error"> 네이버>내정보>연락처 이메일로 가입됩니다. </p>
	</div>
	</c:if>
	
	<div class="p_input_box">
		<h3 class="p_input_title ess">
			비밀번호
		</h3>
		<div class="p_input_item">
			<input type="password" name="pwd" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="p_input_txt"/>
		</div>
		<p class="p_input_error"> 영문, 숫자, 특수문자를 조합하여 입력해주세요.(8-16자) </p>
	</div>
	
	<div class="input_box">
		<h3 class="input_title">
			스니커즈 사이즈 (선택)
		</h3>
		<div class="input_item">
			<input type="text" name="shoesSize" value placeholder="선택하세요" readonly="readonly" autocomplete="off" class="input_txt hover"/>
			<button type="button" class="btn btn_size_select">
				<img src="/img/lnr-chevron-right.svg" width="15px" height="15px" style="float: right; padding-right: 2px;">
			</button>
		</div>
	</div>
	
	<div class="join_terms">
		<div class="terms_box" id="terms_box1">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_1" type="checkbox" class="blind">
					<label for="group_check_1" class="check_label" onclick="cAll1();">
						<span class="label_txt">[필수] 만 14세 이상이며 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn" onclick="clickBtn1();">
					<img id="click1" src="/img/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="agreement" type="checkbox" class="blind">
					<label for="agreement" class="check_label">
						<span class="label_txt">이용약관</span>
					</label>
					<a href="#" class="btn_view" id="agreement_view"> 내용보기 </a>	
				</div>
				
				<div class="checkbox_item">
					<input id="privacy" type="checkbox" class="blind">
					<label for="privacy" class="check_label">
						<span class="label_txt">개인정보처리방침</span>
					</label>
					<a href="#" class="btn_view" id="privacy_view"> 내용보기 </a>
				</div>
			</div>
		</div>
		
		<div class="terms_box" id="terms_box2">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_2" type="checkbox" class="blind">
					<label for="group_check_2" class="check_label" onclick="cAll2();">
						<span class="label_txt">[선택] 광고성 정보 수신에 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn" onclick="clickBtn2();">
					<img id="click2" src="/img/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="allow_marketing" type="checkbox" class="blind">
					<label for="allow_marketing" class="check_label">
						<span class="label_txt">앱 푸시</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_sms" type="checkbox" class="blind">
					<label for="allow_marketing_sms" class="check_label">
						<span class="label_txt">문자 메시지</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_email" type="checkbox" class="blind">
					<label for="allow_marketing_email" class="check_label">
						<span class="label_txt">이메일</span>
					</label>
				</div>
			</div>
		</div>
		
	</div>
	
	<a href="#" onclick="emailCheck();" type="button" id="join_button" class="btn_join_disabled"> 가입하기 </a>

</div>

<div class="layer phone" style="display: none">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">개인정보</h2>
		</div>

		<div class="layer_content">
			<div class="personal_info_area">
				<div class="name_input_box">
					<h3 class="name_input_title ess">
						이름
					</h3>
					<div class="name_input_item">
						<input type="text" name="id" placeholder="이름" autocomplete="off" class="name_input_txt">
					</div>
					<p class="name_input_error"> 이름 2-50자 </p>
				</div>
			
				<div class="phone_input_box">
					<h3 class="phone_input_title ess">
						전화번호
					</h3>
					<div class="phone_input_item">
						<input type="text" name="phone" placeholder="'-'없이 숫자만 입력" autocomplete="off" class="phone_input_txt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
					
				</div>
			</div>
		</div>
		
		<input type="hidden" name="adSms" value>
		<input type="hidden" name="adEmail" value>
		
		<div class="layer_btn">
			<a href="#" type="button" onclick="phoneCheck();" id="join_submit" class="btn solid disabled medium"> 가입 </a>
		</div>
		
		<a class="btn_layer_close">
			<svg style="width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>
		</a>
		
	</div>
</div>

<div class="layer md" id="size_container" style="display: none">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">사이즈 선택</h2>
		</div>
		
		<div class="layer_content">
		
			<div class="size_list_area">
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">220</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">225</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">230</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">235</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">240</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">245</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">250</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">255</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">260</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">265</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">270</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">275</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">280</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">285</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">290</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">295</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">300</span>
					</a>
				</div>
			</div>
			
			
		</div>
		
		<div class="layer_btn">
			<a href="#" type="button" id="size_select" class="btn solid disabled medium"> 확인 </a>
		</div>
		
		<a class="btn_layer_close">
			<svg style="width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>
		</a>
	</div>
</div>


<div class="layer lg layer_agreement" style="display: none">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">이용약관</h2>
		</div>
		<div class="layer_content">
			<div class="agreement">
				<div class="agreement_list">
					<div class="agreement_title"> KREAMY 서비스 이용 약관 </div>
					<div class="agreement_title">
						<p>제 1 조 (목적)</p>
					</div>
					<div class="agreement_desc"> 이 약관은 “회원” 개인 상호 간에 상품을 매매하는 것을 중개하고, “상품”에 관한 정보를 상호 교환할 수 있도록 크리미 주식회사(이하 "회사"라 합니다)가 운영, 제공하는 KREAMY 서비스(이하 "서비스")에 대한 것으로 본 약관에서는 “서비스”의 이용과 관련하여 “회사”와 “회원”과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정합니다. </div>
					<div class="agreement_title">
						<p>제 2 조 (용어의 정의)</p>
					</div>
					<div class="agreement_desc"> 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계 법령 및 지침, 본 이용약관, 개인정보취급방침, 상관례 등에 의합니다. 
						<br><br>
						<li> "서비스"라 함은 회사가 PC 및/또는 모바일 환경에서 제공하는 KREAMY 서비스 및 관련 제반 서비스를 말합니다. </li>
						<li> "회원"이라 함은 “회사”의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다. </li>
						<li> "구매자" 또는 “구매회원”이라 함은 "서비스"에 등록된 재화 및 용역(이하"상품")을 구매하거나 또는 구매할 의사로 서비스를 이용하는 회원을 말합니다. </li>
						<li> "판매자" 또는 “판매회원”이라 함은 "서비스"에 “상품”을 등록하여 판매하거나 또는 제공할 의사로 서비스를 이용하는 회원을 말합니다. </li>
						<li> “입찰”이라 함은 “상품”을 구매하기 위하여 원하는 “상품”의 구매 가격을 제출하는 행위 또는 ”상품”을 판매하기 위하여 원하는 “상품”의 판매 가격을 제출하는 행위를 말합니다. </li>
						<li>“거래 체결”이라 함은 “입찰”에 의하여 상품의 거래가 성립되는 것을 말합니다.</li>
						<li> "게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스"상에 게시한 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글(댓글 포함), 사진(이미지), 동영상 및 각종 파일과 링크 등 일체를 의미합니다. </li>
						<li>"회원정보"라 함은 “서비스”를 이용하는 고객이 등록한 정보를 말합니다.</li>
						<li> “서비스수수료”라 함은 “회원”이 “서비스”를 이용하면서 발생할 수 있는 수수료입니다. “상품”의 판매/구매 및 제반 서비스를 이용함에 따라 부과되는 시스템이용료로서 거래완료수수료 또는 판매완료 수수료, 유료부가서비스수수료 등이 있으며, 관련내용은 제11조(서비스수수료)에 명시된 바에 따릅니다. </li>
						<li> "포인트"라 함은 "서비스"의 효율적 이용을 위해 “회사”가 임의로 책정 또는 지급, 조정할 수 있는 "서비스" 상의 가상 데이터를 의미합니다. “포인트”의 적립, 지급, 사용 등과 관련한 구체적인 정책에 대해서는 이용약관 및 공지사항 등으로 별도 고지하는 바에 따릅니다. </li>
					</div>
					<div class="agreement_title">
						<p>제 3 조 (약관의 명시, 효력 및 변경)</p>
					</div>
					<div class="agreement_desc"> 
						1. "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 “서비스” 초기 화면에 게시합니다. <br><br> 
						2. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 공지합니다. 다만, "회원"에게 불리한 내용으로 약관을 개정하는 경우에는 그 적용일자 30일 전부터 공지 외에 "회원정보"에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다. <br><br> 
						3. "회사"가 전항에 따라 "회원"에게 통지하면서 공지 기간 이내에 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 “회원”이 명시적으로 거부의사를 밝히지 않거나, "서비스"를 이용할 경우에는 "회원"이 개정약관에 동의한 것으로 봅니다. <br><br> 
						4. "회원"이 개정약관에 동의하지 않는 경우 "회사"는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 제8조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 4 조 (약관의 해석)</p>
					</div>
					<div class="agreement_desc"> 
						"회사"는 개별 서비스에 대해서 별도의 이용약관 및 정책(이하 "개별 약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "개별 약관 등"이 우선하여 적용됩니다. <br><br> 
						이 약관에 명시되지 않은 사항은 '약관의 규제에 관한 법률'(이하 "약관법"), ‘전자상거래 등에서의 소비자보호에 관한 법률’(이하 "전자상거래법"), ‘정보통신망이용촉진및정보보호등에관한법률’(이하 “정보통신망법”), 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침(이하 “소비자보호지침”) 및 관계 법령 또는 상관례에 따릅니다. 
					</div>
					<div class="agreement_title">
						<p>제 5 조 (이용계약의 체결)</p>
					</div>
					<div class="agreement_desc"> 
						1. 이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 후 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다. "회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나, 사후에 이용계약을 해지할 수 있습니다. <br><br>
						<li>가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우</li>
						<li>타인의 명의를 도용하여 이용신청을 하는 경우</li>
						<li>허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우</li>
						<li>14세 미만 아동이 회원가입 시 법정대리인(부모 등)의 동의를 얻지 아니한 경우</li>
						<li> 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우 </li>
						<br> 2. "회사"는 “서비스” 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다. 
						<br><br> 3. 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 "가입신청자"에게 알리도록 합니다. 
						<br><br> 4. 이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다. 
						<br><br> 5. "회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 6 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</p>
					</div>
					<div class="agreement_desc"> 
						1. "회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다. 
						<br><br> 2. "회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 회사 및 회사의 운영자로 오인한 우려가 있는 경우 등 “회원” 및 “서비스” 보호에 필요한 경우 해당 "아이디"의 이용을 제한할 수 있습니다. 
						<br><br> 3. "회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다. 
						<br><br> 4. 제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다. 
					</div>
					<div class="agreement_title">
						<p>제 7 조 (이용제한 등)</p>
					</div>
					<div class="agreement_desc"> 
						1. "회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다. 
						<br><br> 2. "회사"는 전항에도 불구하고, “회원”의 의무 위반 행위나 “서비스” 운영 방해 행위에 대하여 사안의 중대성이나 긴급성 등을 토대로 “서비스”에 미치는 영향을 고려하여 경고 등의 단계적인 조치를 거치지 않고 곧바로 일시 정지나 영구이용정지를 할 수 있습니다. 
						<br> 특히, ‘주민등록법'을 위반한 명의도용 및 결제도용, '저작권법'을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반하여 서비스에 중대한 영향을 끼친 경우에는 즉시 영구이용정지를 할 수 있으며, 영구이용정지를 할 수 있는 위반행위는 이에 제한되지 않습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다. 
						<br><br> 3. "회사"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 본 약관 또는 운영 정책 및 개별 서비스 상의 이용약관이나 운영정책에서 정하는 바에 의합니다. 
						<br><br> 4. "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다. 
					</div>
					<div class="agreement_title">
						<p >제 8 조 (계약해제, 해지 등)</p>
					</div>
					<div class="agreement_desc"> 1. "회원"은 언제든지 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리 합니다. 다만, 서비스 수수료나 부과된 페널티 금액의 미납이 있는 경우, 제16조 제3항의 "마이너스(-) 포인트"가 남아 있는 경우, “회사”와 “회원” 사이에 분쟁 계속 중인 경우 등과 같이 이용계약을 해지하는 것이 적절하지 않은 경우에는 해당하는 사유가 완전히 해소될 때까지 해지(탈퇴) 처리가 제한될 수 있습니다. 
						<br><br> 2. "회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다. 
						<br><br> 3. "회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 피드, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다. 
					</div>
					<div class="agreement_title">
						<p>제 9 조 ("서비스"의 이용)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제20조에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. 
						<br><br> 2. "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면 등에 공지한 바에 따릅니다. 
					</div>
					<div class="agreement_title">
						<p>제 10 조 ("서비스"의 내용)</p>
					</div>
					<div class="agreement_desc"> 1. “상품”의 중개 서비스 
						<br> “회원” 개인 상호간에 미사용 secondhand “상품”에 대한 거래가 이루어질 수 있도록 회사가 온라인으로 제공하는 “상품”에 대한 중개 서비스 및 관련 부가서비스 일체를 말합니다. “회원”의 “상품”에 대한 거래는 입찰에 의한 거래 체결 또는 “판매자” 및 “구매자”가 설정한 가격에 즉시 거래 체결되는 방식을 모두 제공할 수 있습니다. 
						<br><br> 2. 정보 서비스 
						<br> “회사”가 각 “회원”에 대한 판매정보, 구매정보, 거래실적, 신용도, 회원정보 등 “회원”의 거래 기록을 모아 “회원” 상호 간의 상품의 거래 및 중개서비스를 신속하고 편리하게 이용하도록 하기 위하여 제공하는 서비스를 말합니다. 
						<br><br> 3. 기타 정보 서비스 
						<br> “상품” 서비스 이외에 “회사”가 제공하는 서비스를 통하여 “회원”에게 온라인으로 제공하는 정보서비스, 커뮤니티 등의 인터넷 서비스를 말합니다. 
					</div>
					<div class="agreement_title">
						<p>제 11 조 ("서비스"의 변경 및 중지)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 제한, 변경하거나 중지할 수 있습니다. 
						<br><br> 2. "회사"는 제1항에 의한 서비스 중단의 경우에 인터넷 등에 사전 공지하거나 제20조("회원"에 대한 통지)에 정한 방법으로 "회원"에게 통지합니다. 
						<br><br> 3. "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 “서비스”의 내용 및 제공일자 등은 그 변경 전에 해당 “서비스” 초기화면에 게시 합니다. 
						<br><br> 4. "회사"는 무료로 제공되는 “서비스”의 일부 또는 전부를 “회사”의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다. 
					</div>
					<div class="agreement_title">
						<p>제 12 조 ("게시물"의 저작권)</p>
					</div>
					<div class="agreement_desc"> 1. "회원"은 저작권 관련 규정을 준수하기 위해 충분한 주의를 기울여야만 합니다. 만약 “회원”이 등록한 게시물이 제 3자의 저작권을 침해한 경우, 민형사상 모든 책임은 “회원” 당사자에게 있으며, 이와 관련해서 회사는 어떠한 책임도 지지 않습니다. 
						<br><br> 2. “회원”는 "서비스"를 이용함으로써 얻은 정보 중 "회사"에게 지적재산권이 귀속된 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다. 
						<br><br> 3. "회사"는 "회원"이 작성한 각종 게시물을 판촉, 홍보 등의 목적으로 “서비스”에서 사용하는 것 외에도 “서비스” 제공에 필요한 범위에서 타 사이트에 복제, 배포, 전송, 전시할 수 있으며, 본질적인 내용에 변경을 가하지 않는 범위 내에서 수정, 편집될 수 있습니다. 
						<br><br> 4. "회원"이 공개한 "게시물"은 "서비스"를 통해 전체 “회원”, 관련 제반 서비스에 공유될 수 있으며, “회사”는 해당 “게시물”을 “서비스”의 홍보, 안내 등의 목적으로 사용할 수 있습니다. 
						<br><br> 5. "회사"가 작성한 저작물에 대한 저작권 및 기타 지적 재산권은 "회사"에 귀속합니다. 
					</div>
					<div class="agreement_title">
						<p>제 13 조 ("게시물"의 관리)</p>
					</div>
					<div class="agreement_desc"> 1. 자동화된 수단을 활용하는 등 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 서비스 이용에 불편을 초래하고 더 나아가 서비스의 원활한 제공을 방해하므로 역시 제한될 수 있습니다. 이용 제한의 대상이 될 수 있는 부적절한 게시물에 대한 상세한 내용은 본 약관 제24조의 규정 및 
						<b>정보통신에 관한 심의 규정</b>, 기타 운영 정책 등을 참고해 주시기 바랍니다. 
						<br><br> 2. "회원"은 자신의 "게시물"이 타인의 저작권이나 명예 등 제3자의 권리를 침해하지 않도록 주의하여야 합니다. “회사”는 이에 대한 문제를 해결하기 위해 "정보통신망법" 또는 "저작권법" 등을 근거로 권리 침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 
						<b>게시중단요청 서비스</b>를 운영하고 있습니다. 타인의 “게시물”로 인해 자신의 저작권이나 명예가 침해되었다고 생각하는 “회원”은 게시중단요청 서비스를 통해 해당 “게시글”의 게시중단 요청을 할 수 있습니다. 
						<br><br> 3. "회사"는 전항에 따른 권리자의 요청이 없는 경우라도 "전자상거래법", “정보통신망법”, “저작권법”, “정보통신에 관한 심의 규정”등 권리침해가 인정될 만한 사유가 있거나 기타 “회사” 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다. 
						<br><br> 4. 본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "회사"가 정한 "게시중단요청서비스"에 따르며, 부적절한 게시글을 게시한 “회원”에 대해서는 제7조 및 운영정책 등에서 정한 바에 따라 이용제한 조치를 취할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 14 조 (권리의 귀속)</p>
					</div>
					<div class="agreement_desc"> 1. "서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다. 
						<br><br> 2. "회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", "포인트" 등을 이용할 수 있는 이용권한만을 부여하며, "회원"은 이에 대한 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다. 
						<br><br> 3. “회사”가 "서비스"를 제공함에 사용되는 보안 기술이나 소프트웨어에 대해 “회원”은 회피 또는 변경하려 시도를 하여서는 안되며, “서비스” 및 이에 필요한 기술 또는 소프트웨어를 부정 사용 및 타인이 그렇게 하는 것을 조장하는 행위 등은 금지되어 있습니다. 만약 "회원"이 그와 같은 행위를 하는 경우 이에 대한 모든 책임은 "회원" 본인에게 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 15 조 ("회사"의 의무)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 관련법령 및 이 약관 등에서 금지한 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다. 
						<br><br> 2. "회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다. 
						<br><br> 3. "회사"는 서비스 이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. “회원”이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다. 
					</div>
					<div class="agreement_title">
						<p>제 16 조 ("포인트")</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 “포인트”에 대한 정책을 변경하거나 "포인트"의 일부 또는 전부를 조정할 수 있으며, "포인트"는 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.
						<br><br> 2. “회사”가 “회원”에게 “포인트”를 적립하였더라도 추후 “회원”의 거래취소, 반품, 이벤트 부정 응모 등 “포인트” 적립이 무효 또는 취소되거나 “포인트”가 부정한 방법으로 적립되었을 경우 그에 상응하는 “포인트”는 자동 차감될 수 있습니다.
						<br><br> 3. 전항에 따른 “포인트” 자동 차감 시 “회원”의 “포인트” 잔액이 “포인트” 차감 분 보다 적을 경우 “마이너스(-) 포인트”로 관리되며, 추후 “회원”이 적립하는 “포인트”와 상계됩니다.
						<br><br> 4. 1) “회원”이 “회사”와의 계약을 해지(탈회)하거나 기타 사유로 인하여 서비스 이용 자격을 박탈 당하는 등의 사유가 발생할 경우 또는 2) “회사”의 정책상 “마이너스(-) 포인트”에 대한 청구를 진행하거나 관리 방법을 변경하기로 결정한 경우에는 “회사”가 해당 “회원”에게 마이너스(-) 1포인트 당 한화(KRW) 1원으로 산정한 금액을 청구할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 17 조 ("대리행위의 부인")</p>
					</div>
					<div class="agreement_desc"> “회사"는 “상품” 거래의 당사자가 아닌 중개자로서 “회원” 상호 간의 거래에 대해서 효율적인 서비스를 위한 시스템 운영 및 관리 책임만을 부담하며, “상품”의 거래와 관련하여 “구매자” 또는 “판매자”를 대리하지 아니합니다. “회원” 사이에 성립된 거래 및 “회원”이 제공하고 등록한 정보에 대해서는 해당 “회원”이 그에 대한 모든 책임을 부담하여야 합니다. </div>
					<div class="agreement_title">
						<p>제 18 조 ("보증의 부인")</p>
					</div>
					<div class="agreement_desc"> 1. “회사”가 제공하는 시스템을 통하여 이루어지는 “구매자”와 “판매자” 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록 “상품”의 품질, 완전성, 안전성, 적법성, 및 타인의 권리에 대한 비침해성, “구매자” 또는 “판매자”가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 “회사”는 보증하지 아니하며, “판매자”가 “상품”의 정보를 고의적으로 속일 경우에는 모든 책임은 “판매자”에게 있습니다. 단, “회사”는 검수센터의 과실로 인한 검수 실책에 대한 내용에 대해서는 관련 법령 및 본 약관에 따른 책임을 부담합니다. 
						<br><br> 2. “판매자”는 “상품”의 판매로 인하여 관세법 등에서 정한 내용에 위반되지 않도록 세금 납부 등 판매에 필요한 절차를 본인의 책임으로 이행하여야 하며, “회사”는 “판매자”의 “상품” 등록 또는 판매로 인한 법령 위반에 대해 책임을 부담하지 않습니다. 
					</div>
					<div class="agreement_title">
						<p>제 19 조 (개인정보보호 의무)</p>
					</div>
					<div class="agreement_desc"> "회사"는 이용계약 체결 과정에서 가입신청자의 이메일 주소 등의 정보를 수집할 수 있으며, “회사”는 "개인정보보호법” 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보보호정책이 적용됩니다. </div>
					<div class="agreement_title">
						<p>제 20 조 ("회원"에 대한 통지)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 "회원"이 지정한 전자우편주소, 서비스 내 전자메모 및 쪽지 등으로 할 수 있습니다. 
						<br><br> 2. "회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 21 조 (부적절 행위)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 본 약관에서 명시한 사항들과 관련법령 및 상거래의 일반 원칙을 위반하는 부적절 행위를 행한 “회원”에게 “서비스”의 이용에 대한 제재를 가할 수 있으며, 필요한 경우 관련 법령에 따라 민형사상의 책임 물을 수 있으니 “서비스” 이용에 주의 부탁드립니다. 
						<br><br> 2. "회원"이 다음의 사유에 해당하는 부적절 행위를 한 경우 "회사"는 사전 통보없이 해당 "회원" 이 등록한 내용을 삭제조치하고 "회원"의 “서비스” 이용을 제한하거나 “회원” 자격을 상실시킬 수 있습니다. 
						<br><br>
							<li>타인의 정보도용</li>
							<li> “서비스”에서 예정하고 있거나 “회사”가 허락한 범위를 벗어나 영리를 목적으로 서비스를 사용하는 행위 </li>
							<li>"서비스"에 허위정보 등록</li>
							<li>거래부적합 상품 등록</li>
							<li>과대, 과장 광고 (스팸성 홍보글, 도배행위 등)</li>
							<li>"회사"의 승인을 구하지 않은 상업성 광고 (개인사업자, 법인의 자사홍보등)</li>
							<li> 대가를 받고 게시물을 작성하였음에도 이러한 사실을 추천・보증 등에 관한 심사지침에서 정한 방식에 따라 밝히지 않은 게시물 </li>
							<li> 결제부정행위 (타인의 명의나 카드정보, 계좌정보 등을 도용하여 회사가 제공하는 구매 서비스를 이용하는 행위는 금지됩니다.) </li>
							<li> 시스템의 오류를 회사에 알리지않고 해당 오류를 이용해 이득을 취하는 행위(동일 전화번호로 인증을 반복하여 포인트를 취하는 행위 등) </li>
							<li> 타인의 전화번호 또는 이메일을 도용하거나 허위로 이메일을 기재하여 이득을 취하는 행위 </li>
							<li>"회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
							<li> 기타 관련법령, 본 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항을 위반한 행위 </li>
							<li>“회사”의 업무에 방해되거나 기타 "회사"가 필요하다고 판단하는 경우</li>
					</div>
					<div class="agreement_title">
						<p>제 22 조 (거래 적합 대상 품목 및 상품 등록)</p>
					</div>
					<div class="agreement_desc"> 1. “회원”은 신발, 의류, 액세서리 등 “회사”가 거래 적합 대상으로 정한 품목 및 목록에 대해서만 거래를 하여야 하며, “회사”는 거래적합대상 품목 및 목록에 대해서 공지사항으로 고지하거나 등록 가능 상품 지정(또는 제한) 등의 방법으로 “회원”이 알 수 있도록 합니다. 
						<br><br> 2. “서비스”에서는 “회사”가 등록 대상으로 삼은 “상품”만이 거래의 대상이 될 수 있습니다. “회원”은 거래적합대상 품목에 속하지 않은 상품(이하 ‘거래 부적합 상품’)에 대해서는 “서비스”를 통해 거래를 하여서는 안되며, "회사"는 “거래 부적합 상품”에 대해서는 서비스 또는 검수, 보증 의무를 부담하지 않습니다. 또한 "회원"이 “거래 부적합 상품”을 등록할 경우, "회사"는 사전 통보없이 해당 "회원"이 등록한 내용을 삭제조치하고 , "회원"의 “서비스” 이용을 제한하거나 “회원” 자격을 상실시킬 수 있습니다. 
						<br><br><b>3. “회원”은 “상품” 등록 시 “상품”을 구매한 영수증 또는 인보이스(이하 ‘영수증 등’)를 포함하는 것을 권장합니다. 그러나 미사용 Secondhand 제품을 거래 대상 “상품”으로 하는 “서비스”의 특성 상, 실제 제품 외에 “판매자”가 “상품”을 구매하였을 때 수령한 영수증 등을 등록하는 것을 필수로 요구하지는 않습니다. “구매자”는 “상품”에는 영수증 등이 포함되지 않을 수 있다는 점에 동의하며, 영수증 등이 포함되지 않아 “상품”의 제조사로부터 A/S를 받지 못하는 등의 불이익이 발생한 경우 “회사” 및 “판매자”는 책임을 부담하지 않습니다.</b>
					</div>
					<div class="agreement_title">
						<p>제 23 조 (거래 신청 및 계약의 성립 등)</p>
					</div>
					<div class="agreement_desc"> 1. "회사"는 "판매자"가 등록한 “상품”의 원활한 거래를 위하여 SNS(인스타그램, 페이스북, 트위터 등), 블로그, 커뮤니티 사이트 등 다양한 홍보 채널에 “상품”을 노출할 수 있습니다. 다만, "회원"은 ”상품”의 노출을 원치 않는 경우 “회사”에 홍보 채널에서의 노출 제외를 요청할 수 있습니다. 
						<br><br> 2. “구매자” 또는 “판매자”는 자신이 구매 또는 판매하고자 하는 “상품”의 가격을 자유롭게 정할 수 있으며, 판매 및 구매 등 거래신청에 대한 승낙의 표시가 “판매자”와 “구매자” 상호간 합의하에 이루어진 경우, “거래 체결”이 된 것으로 봅니다. 
						<br><br> 3. 미성년자가 법정대리인의 동의를 얻지 못하고 상품을 서비스에 등록해 파는 것이 확인된 경우 "회사“는 사전 통보없이 계약을 해지할 수 있습니다. 
						<br><br> 4. “회원” 은 자신이 “판매자”로 등록한 제품의 정보를 “거래 체결”이 이뤄지기 전에 삭제하거나 수정할 수 있습니다. 
						<br><br> 5. “회원”은 “상품” 판매를 위하여 “상품”가격을 등록할 수 있으며, 등록한 “상품”은 “거래체결” 전까지 철회하는 것이 가능합니다. “거래체결” 이후에는 “회사”가 정한 일정 취소 수수료를 부담해야 취소 가능하며, “회사”는 취소 수수료에 대해서 별도 공지 사항 등으로 고지합니다. 
						<br><br> 6. “회사”는 전자상거래법에서 정한 바에 따라 거래 당사자들에게 상대방에 관한 정보를 열람할 수 있도록 하며, “판매자” 또는 “구매자”가 상대방 당사자에 대한 성명, 전화번호 등 법에서 정한 정보를 요청하는 경우 이를 제공할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 24 조 ("서비스수수료")</p>
					</div>
					<div class="agreement_desc"> 1. “회사”가 부과하는 “서비스수수료”는 “상품”의 중개 및 검수 등 제반 “서비스”를 이용함에 따라 부과되는 이용료로서 거래 완료 시 또는 부가서비스 제공 시 등에 부과될 수 있습니다. “회사”는 서비스 제공 비용, 시장상황, 취급품목, 거래방식등을 고려하여 “판매자”에게 제공하는 “서비스”에 대한 서비스수수료를 정합니다. 
						<br><br> 2. “회사”는 각 “서비스” 및 서비스이용료의 구체적인 내용(서비스의 내용, 이용 방법, 실시 기간, 수수료율 등)을 KREAMY 사이트의 공지사항 또는 판매자 화면에 별도로 게시합니다. 
						<br><br> 가. 거래완료 수수료 및 페널티 등 
							<br> 1) 거래완료 수수료는 “회원”이 “회사”가 제공하는 시스템을 통하여 “상품” 판매를 완료한 경우 “판매자”에게 부과됩니다. 
							<br> 2) “판매자”의 귀책사유가 있는 경우에는 거래가 최종적으로 완료되었는지나 반품 여부에 관계없이 거래완료 수수료가 환불되지 않을 수 있습니다. 
							<br> 3) 입찰 방식을 제공하고, 정품을 보장하는 “서비스”의 특성에 따라 부득이하게 “판매자”의 배송 지연 또는 거부, 검수 불합격, “판매자”의 판매 취소 등 “판매자”의 귀책사유로 인해 거래가 취소되는 경우에는 “판매자”에게 취소수수료 또는 페널티가 추가로 부과될 수 있습니다. 또한 “판매자”의 귀책사유로 인한 거래 취소 시 해당 “상품” 판매를 위해 “회사”가 “구매자”에게 제공한 쿠폰, 적립금 등이 있는 경우에는 해당 금액에 대해서도 반환 청구될 수 있습니다. “판매자”의 경우 취소수수료 또는 페널티 수수료는 “판매자”가 등록한 카드에서 자동 결제됩니다. 
						<br><br> 나. “회원”이 페널티 결제 방법으로 카드를 등록한 경우 페널티 수수료는 “회원”이 동의한 다음 각 호의 규정에 따라 페널티 부과 요건 발생 시 “회원”이 등록한 카드에서 자동 결제됩니다. 
							<br> 1) “회원”은 “판매자”로서 “상품” 등록 시 동의한 ‘페널티 부과 규정’에 따라 페널티 수수료 발생 시 별도의 인증과정 없이 페널티 수수료가 결제될 수 있음을 이해하고 이에 동의합니다. 
							<br> 2) 자동결제 시점에 회원의 신용카드 등의 유효성, 한도 등의 문제로 결제 실패가 발생한 경우에 미수로 처리되며, 해당 미수 금액이 정상적으로 결제되기 전까지 해당 “회원”은 서비스 이용이 제한될 수 있습니다. 
							<br> 3) “회원”은 제2호에 따라 미수가 발생한 경우, “회사”가 (i) “회사”의 정책에 따라 “회원”에 대한 별도 고지 없이 “회원”이 등록한 결제수단으로 재결제 시도를 진행하거나 (ii) “회원”의 별건 신규 판매 거래 발생 시 해당 거래 대금 정산을 보류하거나 종래 발생한 페널티 수수료 금액을 차감한 후 정산할 수 있음을 이해하고 이에 동의합니다. 
							<br> 4) 결제 시점에 시스템 장애로 인하여 결제 실패가 된 경우에는, 시스템 정상화가 된 시점에 “회원”에 대한 별도 고지 없이 다시 결제를 진행합니다. 
						<br><br> 다. “회사”는 필요한 경우 서비스 수수료를 신설, 변경할 수 있으며, “회사”는 판매 활성화 등을 위하여 서비스이용료 범위 내에서 특정 ”상품”에 대한 서비스 수수료를 할인할 수 있습니다. 또한 “회사”는 특정 판매자에 대한 서비스 수수료를 판매실적, “회원”의 특성 등 “회사”가 정하는 일정한 기준과 절차에 따라 조정 또는 면제할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 25 조 (대금결제)</p>
					</div>
					<div class="agreement_desc"> 1. “상품”의 매매계약은 “회원”이 “회사” 또는 “판매자”가 제시한 “상품”의 판매 조건에 응하여 “구매자”가 구매의 의사표시를 하거나 “구매자”의 구매 조건에 응하여 “판매자”가 판매 의사를 표시함으로써 체결됩니다. 
						<br><br> 2. “회사"는 “회원”이 현금, 카드 기타의 방법으로 매매 대금을 결제할 수 있는 방법을 제공합니다. 다만, “회원”의 신용도 조작, “상품”가격 교란 행위 방지 등을 위해 부득이 카드 결제 등 일정한 결제 방법만을 허용할 수 있으며, 이를 위해 “거래체결”에 앞서 사전에 카드정보를 등록하도록 할 수 있습니다. 매매 대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 “구매자”가 부담하여야 합니다. 
						<br><br> 3. 시세가 변동되는 “상품”을 입찰에 따라 거래하도록 하는 “서비스”의 특성 상 허위 거래 등을 방지하기 위해 입찰에 따른 거래체결 시 또는 즉시 구매 시 등록된 카드에서 결제가 진행되며, “상품”을 주문한 후 일정 기간 내에 매매대금이 결제되지 않을 경우 “회사”는 당해 주문을 회원의 동의 없이 취소할 수 있습니다. 
						<br><br> 4. “회사"는 “구매자”의 “상품” 매매계약 체결 내용을 구매 내역을 통해 확인할 수 있도록 조치하며, 매매계약의 취소 방법 및 절차를 안내합니다. 
						<br><br> 5. “회사"는 “구매자”가 매매대금 결제 시 사용한 결제 수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래 진행을 중지하거나, 확인이 불가한 해당 거래를 취소할 수 있습니다. 특히, 고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문 등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. 
						<br><br> 6. 체크카드 잔액부족, 유효기간이 지난 카드가 등록되어 상품 구매가 불발된 경우, 타인의 결제로 인한 “상품” 구매 실패는 당사가 책임지지 않습니다. 
					</div>
					<div class="agreement_title">
						<p>제 26 조 (거래체결 완료 "상품"의 처리)</p>
					</div>
					<div class="agreement_desc"> 1. 주문 처리에는 “구매자”의 신용카드 승인, 판매자의 배송, 당사의 “상품”판정 및 주문”상품”의 포장에 걸리는 시간이 소요됩니다. 주문 처리 이후에는 “회사”에서 귀하의 배송지로 “상품”이 배달됩니다. 
						<br><br> 2. 제공된 주문 처리시간에 맞추어 출고를 할 수 있도록 최선을 다함에도 불구하고, “상품”의 공급 가능 일정은 판매자의 “상품”배송 지연, “상품”판정 소요시간, 배송업체의 내부 상황, 기상악화로 인한 천재지변등에 의해 언제든지 변경될 수 있습니다. 
						<br><br> 3. “회원” 또는 “구매자”의 주문 관련 문의는 “회사” 고객센터 (1588-7813)로 연락하여 주시거나 "서비스" 내 1:1문의를 통해 문의 할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p >제 27 조 (검수 등)</p>
					</div>
					<div class="agreement_desc"> 1. “회사”는 별도의 검수센터를 운영하고 있습니다. “거래체결”이 되어 판매자로부터 배송된 “상품”에 대하여 “회사”가 운영하는 검수센터의 전문가 그룹을 통해 철저하게 검수함을 원칙으로 합니다. 검수과정에서 “상품”의 하자, 구성품의 누락, 사이즈 오류, 가품 판정 등의 사유에 의해 판매가 거절 될 수 있습니다. 
						<br><br> 2. 검수기준에 대해서는 “서비스”내 별도 고지하는 내용에 따릅니다. 단, "상품"의 정품 여부 이외의 사항 중 "회사"가 제공하는 검수 기준에 명시되어 있지 않거나 검수 기준 범위 내에 해당하는 사항(단순 불량, 경미한 오염 및 훼손, 원제조업체 공정상 오류 등)은 검수 합격에 따른 보장 대상에 포함되지 아니하고, "회사"는 이에 대하여 책임지지 아니합니다. 
						<br><br> 3. 미사용 Secondhand인 “상품”의 특성에 따라 “회사”는 “상품”에 영수증 등이 포함되지 않은 것은 “검수 불합격 상품”으로 판단하지 않으며, 원제조업자가 A/S를 위해서 영수증 등을 필수적으로 요구함에도 “판매자”가 영수증 등을 포함하지 않고 판매한 “상품”에 대해서는 “회사”는 이를 “검수 불합격 상품”으로 보지 않습니다. 
						<br><br> 4. 전문가 그룹의 종합적인 검수에 따라 검수 기준에 미달(가품판정, 이상”상품”, 구성품누락, 사이즈 오류 등, 이하 “검수 불합격 상품”이라 합니다)하는 것으로 확정 되면, 판매가 즉시 중단되며 거래가 취소됩니다. “검수 불합격 상품”은 판매자에게 즉시 반송처리 진행되며 사전 고지된 페널티 부과 규정에 따라 페널티 수수료 등이 부과됩니다. 또한 고의적으로 이상”상품” 또는 상표법 위반의 가품을 판매한다고 판단되는 판매자는 페널티 부과와 별도로 “회사”의 서비스 이용이 일시 또는 영구적으로 제한될 수 있습니다. 
						<br><br> 5. 판매 등록되어 배송된 “상품”이 “검수 불합격 상품”에 해당하여 반송되는 경우, “회사”는 “판매자”가 최초 등록한 주소로만 반송하며 “회원”이 “상품”과 함께 보낸 영수증이 반환되는 것을 보장하지 않습니다. 
						<br><br> 6. “검수 불합격 상품” 중 가품으로 판정된 상품에 대해서는 상표법 등 관계 법령 위반 혐의로 수사기관에 신고될 수 있으며, 가품으로 판정된 해당 상품은 수사기관에 제출, 압수 등으로 인해 “회원”에게 반환되지 않을 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 28 조 (배송 등)</p>
					</div>
					<div class="agreement_desc"> 1. “판매자”와 “구매자” 간 거래에 대해서 “판매자”는 “거래체결”의 확인 통지를 받은 후 "회사"가 공지사항 또는 별도 안내 사항 등으로 고지한 시간 이내에 배송에 필요한 조치를 취하여야 합니다. “상품” 발송을 지체한 경우 계약해지, 페널티 부과, 판매 자격 제한 등의 불이익을 받을 수 있습니다. 공휴일 및 기타 휴무일 또는 천재지변 등 불가항력적인 사유가 발생한 경우 그 해당기간은 배송 소요기간에서 제외됩니다. 또한 “판매자”의 배송비는 “판매자”가 부담하는 것을 원칙으로 하며, “상품” 발송 시 착불을 선택하는 경우 ”회사”는 거래대금에서 배송비를 공제하거나 제24조 페널티 수수료 부과를 위해 등록한 카드에서 결제할 수 있습니다. 
						<br><br> 2. “판매자”는 최선의 방법으로 배송을 진행해야 하며, 배송에 문제가 발생 시 지체 없이 “회사”에 알려 “회사” 및 “구매자”에게 손해가 발생하지 않도록 하여야 합니다. 통지를 지체하여 손해가 발생 했을 때에는 “판매자”의 귀책사유에 따라 배상 의무가 발생할 수 있습니다. 
						<br><br> 3. “회사”는 “회원” 상호 간 거래된 “상품”에 대해 “판매자”로부터 “상품”을 제공 받아 검수를 진행하며, “판매자”로부터 전달 받은 “상품”이 검수를 통과한 경우 해당 “상품”을 “구매자”에게 지체없이 배송합니다. 구매자의 배송비는 최초 “상품” 결제 시 청구되며, 예외적으로 구매실적, 이벤트 등에 의하여 면제될 수 있습니다. 
						<br><br> 4. 검수가 완료된 “상품”은 보통 검수 완료 후 2-5 영업일 이내에 배송됩니다. 해외 배송은 원칙적으로 불가하고, 대한민국 내의 주소지로만 배송이 가능합니다. 또한, 도서산간지역 배송의 경우 배송업체의 사정에 따라 늦어지는 경우도 있습니다. 
						<br><br> 5. “상품” 포장이 완료된 “상품”은 배송지를 변경하는 것이 불가능합니다. 배송 진행 과정에서의 정보 변경은 도움을 드리기 어려울 수 있으며, 배송완료와 동시에 “상품”의 분실에 대한 모든 권리와 책임은 “구매자” 및 대리 수취인에게 있습니다. 
						<br><br> 6. “회사”의 검수 과정에 합격하여 “구매자”에게 출고 완료된 “상품”이 배송 중 사고(훼손, 오염, 도난 등 포함)로 인하여 멸실 또는 훼손된 경우, "구매자"는 사고 배송업체의 보상 정책에 따라 보상 받게 됩니다. 보상 절차 진행에 필요한 경우 “회사” 또는 사고 배송업체는 “구매자”로부터 해당 “상품” 실물을 수령하여 멸실, 훼손 정도를 확인할 수 있습니다. 구체적인 보상의 범위는 사고 배송업체의 보상 정책에 따르되, 해당 “판매자”와 “구매자” 간 거래체결 금액을 초과하지 않습니다. 
						<br><br> 7. “회사”는 전항에 따라 해당 “상품” 실물을 수령한 날로부터 30일 이내에 “구매자”에게 보상 금액을 확정하여 지급합니다. 만약 “회사”가 30일 이내에 보상금 지급을 하지 못할 것으로 예상될 경우 “회사”는 지체 없이 “구매자”에게 그러한 사실과 함께 예상되는 처리 일정을 통지합니다. 
					</div>
					<div class="agreement_title">
						<p>제 29 조 (청약철회의 제한)</p>
					</div>
					<div class="agreement_desc">
						<b>“서비스”에서 “회원” 상호 간 이뤄진 “상품”의 매매는 개인 간에 이뤄지는 거래로 전자상거래법 제17조에서 정한 청약철회에 따른 환불, 교환이 적용되지 않기 때문에 “거래체결” 이후에는 다른 일반 전자 상거래와 달리 단순 변심에 따른 계약 철회, 취소 등이 불가능하고, “상품”에 하자가 있는 경우에만 계약 취소 및 환불 청구가 가능합니다.</b> 
						구매자는 구매 시에 이 점에 대해 반드시 유의하여 진행해 주시기 바랍니다. 
					</div>
					<div class="agreement_title">
						<p>제 30 조 (등록 상품에 대한 거래 계약의 해지 또는 취소)</p>
					</div>
					<div class="agreement_desc"> 1. 판매 및 구매 등 거래에 있어 해지 신청에 대한 승낙의 표시가 “회원” 상호간 합의 하에 이루어진 경우, 거래 계약이 해지된 것으로 봅니다. 
						<br><br> 2. “회사”는 판매자가 등록한 상품이 서비스 이용약관에 위배되는 제품이거나 “상품”이 “판매자”가 등록한 내용과 다를 경우에는 사전 통보 없이 계약을 해지 할 수 있습니다. 
						<br><br> 3. 또한 “판매자”가 “회사”가 지정한 배송날짜 안에 제품을 배송하지 않으면 계약이 해지될 수 있습니다. 
						<br><br> 4. “서비스”의 특성 상 “거래 체결”된 “상품”의 경우에도 “판매자”의 “상품”이 “회사”의 검수를 통과하지 못하거나 “판매자”가 “상품”의 배송 전에 판매를 취소하는 경우에는 “회원” 상호 간 체결된 계약은 해지 또는 취소될 수 있습니다. 
						<br><br> 5. “구매자” 역시 제한시간 이내 결제를 완료하지 않으면 계약이 해지될 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 31 조 (미성년자의 계약 취소 및 환불에 관한 사항)</p>
					</div>
					<div class="agreement_desc"> "회원"이 만 19세 미만의 미성년자인 경우, “상품”의 구매 또는 판매(각 입찰행위 포함), 유료 결제 서비스를 이용하고자 하는 경우에는 부모 등 법정대리인의 동의를 얻어야 하며, 그렇지 않은 경우에는 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다. </div>
					<div class="agreement_title">
						<p >제 32 조 ("이상 상품"에 대한 환불)</p>
					</div><div class="agreement_desc"> 1. 구입한 “상품”이 검수기준을 충족하지 못하는 “이상 상품”인 경우 “회사”의 환불 정책에 따라, 고객의 “상품” 수령일로부터 3일 이내(“상품” 수령 후 72시간, 주말 및 법정 공휴일 제외)에 교환 혹은 환불이 가능합니다. 
						<b>본 규정에 따른 교환 혹은 환불은 “회사”가 제공하는 검수 및 배송에 대한 책임이며, “상품”의 중개에 따른 책임에 해당하지 않습니다. 교환 혹은 환불은 필요한 경우 A/S로 대체될 수 있습니다.</b>
						<br><br> 2. “이상 상품”의 정의: “회사”에서 거래되는 “상품”은 미사용 secondhand “상품”이며 개별 브랜드의 제조 특성에 따른 퀄리티의 차이가 있을 수 있습니다. “회사”가 제공하는 검수 기준에 미달함에도 불구하고 검수 합격되어 출고된 경우 “이상 상품”으로 분류될 수 있습니다. 다만, 출고 이후 발생한 불량 등의 경우 “이상 상품”에 해당하지 아니하고, “회사”는 이에 대한 책임을 지지 아니 합니다. 
						<br><br> 3. “회사”가 제공하는 검수 기준은 “상품”의 원제조업체가 제공하는 제품별 보증 기준과 동일하지 아니하며, “회사”는 원제조업체의 보증 기준 등 “회사”의 검수 기준이 아닌 기준에 따른 보증 및 책임을 지지 아니합니다. 
						<br><br> 4. “이상 상품”에 해당하는 것으로 의심될 경우, 문제가 되는 부분에 대하여 “회사” 고객센터 (1588-7813) 로 연락주시거나 "서비스" 내 1:1문의로 문의하여 주시기 바랍니다. 
						<br><br> 5. 환불 시 반품 확인여부를 확인한 후 3영업일 이내에 결제 금액을 환불해 드립니다. 신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.(단, 신용카드 결제일에 맞춰 대금이 청구될 수 있으며 이 경우 익월 신용카드 대금청구시 카드사에서 환급 처리 됩니다) 
					</div>
					<div class="agreement_title">
						<p>제 33 조 (판매대금 지급 등)</p>
					</div>
					<div class="agreement_desc"> 1. “구매자”가 지급(결제)한 판매대금은 “회사”의 검수가 완료되면 “구매자”에게 “상품”이 배송되기 전이라도 등록된 판매대금에서 수수료를 제한 금액이 수취계좌로 입금될 수 있으며, “구매자”는 이러한 판매대금 지급에 대해 동의합니다. “이상 상품”에 해당하여 환불이 이뤄지는 경우, “회사”는 즉시 결제수단을 제공한 사업자로 하여금 대금 청구를 정지하거나 취소하도록 요청하며, 이미 “판매자”에게 판매대금이 지급된 경우에는 “회사”는 “판매자”와 연대하여 “구매자”에 대한 환불금 지급 의무를 부담합니다. 
						<br><br> 2. 구매자의 환불이 확정된 경우 곧바로 “회사”는 “판매자”가 회원가입 또는 “상품” 등록 시에 등록한 이메일 등의 연락처로 환불 사실을 알리며, “판매자”는 이러한 사실을 통지 받은 판매대금을 즉시 “회사”의 계좌로 반납하여야 합니다. 판매대금 반납이 지체되는 경우에는 연 10%의 지연이자가 발생할 수 있습니다. 자세한 정보는 고객센터로 문의 주시기 바랍니다. 
					</div>
					<div class="agreement_title">
						<p>제 34 조 (금지행위)</p>
					</div>
					<div class="agreement_desc"> “판매회원”은 다음 각 호에 해당하는 행위를 하여서는 아니 되며 이를 위반한 경우 “회사”는 다음 각 호에서 개별적으로 규정하고 있는 제재조치를 취할 수 있으며, 이로 인하여 삭제된 “상품”의 거래완료수수료 또는 부가서비스 수수료, 기본이용료 등 이용료는 환불되지 않습니다. 
						<br><br> 1. 허위체결 금지 
							<br> 1) 허위체결이란 “판매자”가 상품 노출순위 및 판매자 신용등급 조작, 상품평 조작 등 매출증대를 위해 본인 또는 타인의 ID를 사용하여 판매자 본인의 상품을 구매하는 체결 행위를 말하며, “회사”는 이를 금지하고 있습니다. 
							<br> 2) 허위체결 적발 시 “회사”는 회원 ID에 대하여 신용점수 차감, 이용제한, 계약해지, 정산금 지급보류(1개월 이내) 등 필요한 조치를 취할 수 있습니다. 
							<br> 3) 허위체결 적발 시 “회사”는 사안에 따라 “판매자”에게 부가적인 확인 요청 및 자진취소 또는 반품을 요구할 수 있으며, “판매자”는 이에 협조할 의무가 있습니다. 
						<br><br> 2. 입찰 조작 금지 
							<br> 1) 입찰 조작이란 “판매회원” 자신의 상품을 고가에 낙찰시키기 위하여 부정한 방법으로 상품에 대한 입찰 또는 응찰 하는 행위를 말하며, “회사”는 이를 금지하고 있습니다. 
							<br> 2) 입찰 조작행위 적발 시 “회사”는 허위체결의 경우에 준하여 로그인 제한, 거래 제한 등의 조치를 취할 수 있습니다. 
						<br><br> 3. 중복등록 및 카테고리 위반등록 금지 외 
							<br> 1) 중복등록이란 동일한 “상품”을 중복하여 등록하는 것으로서, “회사”는 중복등록 행위를 금지하고 있습니다. 
							<br> 2) 카테고리 위반이란 해당상품과 관계없는 카테고리에 상품을 등록하는 것으로서, 회사는 이를 금지하고 있습니다.  //&gt; 3) 기타 비정상적인 방법으로 상품을 노출하는 모든 행위를 금지합니다. 
							<br> 4) 중복등록 및 카테고리 위반등록 적발 시 회사는 적발 횟수에 따라 상품 판매 제한, 판매자 ID 중지, 이용제한 등의 조치를 취할 수 있습니다. 
					</div>
					<div class="agreement_title">
						<p>제 35 조 (회사의 면책 등)</p>
					</div>
					<div class="agreement_desc"> 1. “회사”는 “회원” 상호 간의 “상품” 매매에 대하여 “회원”들에게 온라인 거래 장소를 제공하고 기타 부가 서비스를 제공하는 것을 “서비스”의 내용으로 합니다. 이에 원칙적으로 “판매자”가 등록한 “상품”에 관한 정보 및 “구매자”와의 거래에 관하여 분쟁이 발생한 경우 회사는 그 분쟁에 개입하지 않으며 그 분쟁의 결과로 인한 모든 책임은 “판매자” 또는 “구매자”인 회원이 부담합니다. 특히, “거래 체결” 후에 “판매자”가 “상품”의 판매를 취소하는 경우, “상품”을 “회사”에 권고 기간 내에 배송하지 않거나 배송정보를 입력하지 않는 경우, “회사”의 검수에 불합격하는 등 “판매자”의 귀책으로 인하여 계약이 해지 또는 취소되는 경우에 “회사”는 이로 인한 “구매자”의 손해 발생에 대해 책임을 지지 않습니다. 
						<br><br> 2. 제1항에서 정한 내용에도 불구하고 “회사”의 귀책사유로 인해 검수센터의 검수 판정에 오류가 발생한 경우, 검수가 완료된 “상품”을 “구매회원”에게 배송하는 과정에서 “회사”의 귀책사유로 인해 발생한 손해에 대해서는 “회사”가 책임을 부담합니다. 단, 이 때 “회사”에서 “구매회원”의 손해 보상에 대해 별도로 정한 정책이 적용되지 않는 한 “구매회원”의 손해는 “상품”을 구매한 가격을 한도로 합니다. 
						<br><br> 3. “회사”는 천재지변 또는 이에 준하는 불가항력, 정보통신설비의 보수점검, 교체 또는 고장, 통신의 두절 등으로 인하여 일시적 또는 종국적으로 서비스를 제공할 수 없는 경우, “서비스” 제공에 관한 책임이 면제됩니다. 이 경우 “회사”는 “회사”가 제공하는 인터넷사이트 화면에 게시하거나 기타의 방법으로 회원들에게 통지합니다. 
						<br><br> 4. “회사”는 인터넷 이용자 또는 “회원”의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
						<br><br> 5. “회원”이 자신의 개인정보를 타인에게 유출 또는 제공함으로써, 발생하는 피해에 대해서 “회사”는 일체의 책임을 지지 않습니다. 
						<br><br> 6. “회사”는 다음과 같은 사항으로부터 발생하는 손해에 대해 책임을 지지 아니합니다. 
						<br><br>
							<li>“회원” 상태 정보의 허위 또는 부정확성에 기인하는 손해</li>
							<li> 그 성질과 경위를 불문하고 "서비스"에 대한 접속 및 "서비스"의 이용과정에서 발생하는 개인적인 손해 </li>
							<li> 서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해 </li>
							<li> 서버에 대한 전송 또는 서버로부터의 전송에 대한 제3자의 모든 불법적인 방해 또는 중단행위로부터 발생하는 손해 </li>
							<li> 제3자가 "서비스"를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해 </li>
							<li>전송된 데이터의 오류 및 생략, 누락, 파괴 등으로 발생되는 손해</li>
							<li> “회원” 간의 "회원" 상태 정보 등록 및 "서비스" 이용 과정에서 발생하는 명예훼손 기타 불법행위로 인한 각종 민형사상 책임 </li>
							<li> “회사”는 적법한 권리자의 요구가 있는 경우에는 당해 “상품”에 관한 정보를 삭제하거나 수정할 수 있으며, “판매자”는 이로 인한 손해배상을 회사에 청구할 수 없습니다. </li>
							<li> 기타 관련 법령 및 “회사”에서 제공한 이용약관 및 개별약관의 변경, 공지사항 등의 주시의무를 게을리하여 발생한 ”회원”의 피해에 대해서 “회사”는 책임을 지지 않습니다. </li>
					</div>
					<div class="agreement_title">
						<p>제 36 조 (기타)</p>
					</div>
					<div class="agreement_desc"> 1. 본 약관에 대해서는 대한민국법을 준거법으로 하고, 대한민국 법원이 관할권을 갖는 것으로 합니다. 
						<br><br> 2. “회사”와 “회원” 간 발생한 분쟁에 관한 소송은 제소 당시의 “회원”의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 “회원”의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다. 해외에 주소나 거소가 있는 고객의 경우 “회사”와 “회원”간 발생한 분쟁에 관한 소송은 대한민국 서울중앙지방법원을 관할 법원으로 합니다. 
						<br><br><br>
						<li>공고일자: 2021년 04월 15일</li>
						<li>시행일자: 2021년 05월 15일</li>
					</div>
				</div>
			</div>
		</div>
			
		<a class="btn_layer_close">
			<svg style="width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>
		</a>
	</div>
</div>

<div class="layer lg layer_privacy" style="display: none">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">개인정보처리방침</h2>
		</div>
		<div class="layer_content">
			<div class="privacy">
				<div class="agreement_list">
					<div class="agreement_subtitle"> 회사(이하 “KREAMY” 또는 “서비스”)는 서비스를 제공함에 있어 이용자의 개인정보보호를 중요하게 생각하며, 본 개인정보처리방침을 통하여 이용자의 개인정보 처리 현황을 알려드립니다. </div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">1. 수집하는 개인정보의 항목 및 수집 방법</div>
					<div class="agreement_subtitle"> “KREAMY”은 회원가입, 원할한 고객 상담, 각종 서비스의 제공을 위해 최초 이용시 필요한 개인정보를 수집하고 있습니다.
						<br><br> 회원가입 시점에 이용자로부터 수집하는 개인정보는 아래와 같습니다. 
					</div>
					<div class="privacy_desc"> 1) 회원 가입 시에 '이름, 휴대전화번호, 성별, 생년월일, CI/DI, 이메일 주소(로그인ID), 비밀번호를 필수 항목으로 수집하며, 선택항목으로 별명, 프로필 사진, 신발 사이즈, 배송 주소, 카드 정보, 거래은행 및 계좌번호를 수집합니다. 
						<br><br> 2) 네이버 아이디로 로그인 시에는 이용자 고유 식별자를 필수 항목으로 수집하고, 이메일 주소, 이름(별명), 프로필 사진을 선택 항목으로 수집합니다. 
						<br><br> 3) 서비스를 이용하면서 이용 문의를 하거나, 권리 침해 신고를 접수하는 경우에는 문의 접수 및 해결 과정에서 이메일, (휴대)전화번호를 수집할 수 있습니다. 
						<br><br> 4) 모바일 서비스 특성상 단말기에 관한 정보(단말기 모델, 이동통신사 정보, OS, 하드웨어 ID, ADID, 접속IP, 서비스 이용에 대한 기본 통계)가 자동으로 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다. 
						<br><br> 5) 이 외에도 추가적으로 로그 정보, 서비스 이용기록, 앱 설치 정보 등이 수집될 수 있으며, 회사는 14세 미만 이용자의 개인정보를 수집하지 않습니다. 
					</div>
					<br>
					<div class="agreement_subtitle"> 회사는 아래의 방법을 통해 개인정보를 수집합니다. </div>
					<div class="privacy_desc"> 1) 회원가입이나 서비스 이용 과정에서 이용자가 직접 제공하고 동의하는 경우, 해당 개인정보를 수집합니다. 
						<br><br> 2) 고객센터를 통한 상담 과정이나 이벤트 응모 과정 등에서 웹/앱 페이지, 메일, 팩스, 전화, 서면 등을 통해 이용자의 개인정보가 수집될 수 있습니다. 
						<br><br> 3) 기기정보와 같은 생성정보는 서비스 이용과정에서 자동으로 생성되어 수집될 수 있습니다. 
					</div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">2. 개인정보의 수집 및 이용 목적</div>
					<div class="agreement_subtitle">
						<p>회사는 수집한 개인정보를 다음과 같은 목적으로만 이용합니다.</p>
					</div>
					<div class="privacy_desc"> 1) 회원가입 의사의 확인, 이용자 본인확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위해 개인정보를 이용합니다. 
						<br><br> 2) 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 
						<br><br> 3) 법령 및 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정 도용 및 부정거래방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다. 
						<br><br> 4) 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다. 
						<br><br> 5) 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다. 
						<br><br> 6) 서비스 이용 기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공과 광고 게재 등에 개인정보를 이용합니다. 
						<br><br> 7) 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다. 
					</div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title"> 3. 개인정보의 처리 위탁 </div>
					<div class="agreement_subtitle"> 회사는 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.
					<br> 다만, 이용자들이 개인정보 제공에 사전에 동의한 경우, 관련 법령에 의해 개인정보 제출 의무가 발생한 경우에는 개인정보가 제공될 수 있습니다.
					<br><br> “KREAMY”은 회원님에게 서비스를 제공하는 데에 반드시 필요한 업무 중 일부를 외부 업체에 위탁하고 있습니다.
					<br><br> 외부 업체에 업무 위탁 시 계약서 등을 통해서 개인정보보호 관련 법규의 준수, 개인정보에 관한 비밀유지, 제3자 제공에 대한 금지, 사고 시의 책임 부담, 위탁 기간, 처리 종료 후의 개인정보의 파기 등을 규정하고, 이를 준수하도록 관리 감독하고 있습니다. 
					</div>
					<br>
					<div>
						<table>
							<caption><span class="blind">수탁업체/위탁업무 내용/개인정보 보유 및 이용기간 표</span></caption>
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 40%;">
								<col style="width: 30%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">수탁업체</th>
									<th scope="col">위탁업무 내용</th>
									<th scope="col">개인정보 보유<br>및 이용기간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scorp="row">네이버클라우드(주)<br>N Tech Service(주)</th>
									<td>서비스 제공을 위한 시스템 개발 및 운영</td>
									<td rowspan="10">회원 탈퇴 시 또는 위탁 계약 종료 시</td>
								</tr>
								<tr>
									<th scorp="row">(주)다날<br>네이버파이낸셜(주)<br>NHN한국사이버결제(주)</th>
									<td>이용자 결제 대행 및 간편 결제 서비스 제공</td>
								</tr>
								<tr>
									<th scorp="row">(주)아임포트</th>
									<td>간편 결제 연동</td>
								</tr>
								<tr>
									<th scorp="row">(주)케이지모빌리언스</th>
									<td>본인인증 및 실명확인</td>
								</tr>
								<tr>
									<th scorp="row">CJ대한통운(주)<br>로젠(주)</th>
									<td>상품 배송</td>
								</tr>
								<tr>
									<th scorp="row">(주)굿스플로</th>
									<td>택배 송장 출력 서비스</td>
								</tr>
								<tr>
									<th scorp="row">(주)써머스플랫폼</th>
									<td data-v-0f88600e="">알림톡 발송 및 배송조회</td>
								</tr>
								<tr>
									<th scorp="row">엔에이치엔(주)</th>
									<td>고객 상담</td>
								</tr>
								<tr><th scorp="row">(주)브리지텍</th><td>고객 상담 시스템 운영</td></tr>
								<tr><th scorp="row">페이머스스튜디오(주)</th><td>고객 상담 및 서비스 운영</td></tr>
							</tbody>
						</table>
					<ul class="more_info_list"></ul>
					</div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">4. 개인정보의 보유 및 이용기간</div>
					<div class="agreement_subtitle"> “KREAMY”은 회원님에게 서비스를 제공하는 데에 반드시 필요한 업무 중 일부를 외부 업체에게 위탁하여 수행하고 있습니다. </div>
					<div class="agreement_subtitle"> 회사는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 이용자의 개인정보를 지체없이 파기합니다.<br> 단, 회사 내부방침이나 관계법령의 규정에 의하여 보존할 필요가 있는 경우에는 아래와 같이 일정 기간 동안 개인정보를 보관할 수 있습니다 </div>
					<br>
					<div class="privacy_desc"> 1) 법령 기준에 따라 별도 보관하는 경우 
						<br><br> ① 전자상거래 등에서 소비자 보호에 관한 법률 
							<p class="privacy_li">· 계약 또는 청약철회 등에 관한 기록: 5년 보관</p>
							<p class="privacy_li">· 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관</p>
							<p class="privacy_li">· 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관</p>
						<br> ② 통신비밀보호법 
							<p class="privacy_li">· 접속 로그 기록: 3개월</p>
						<br> 2) 내부 기준에 따라 별도 보관하는 경우 
							<p class="privacy_li"> · 부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 </p>
					</div>
					<br>
					<div class="agreement_subtitle"> 회사의 개인정보 파기 절차 및 방법은 다음과 같습니다. </div>
					<div class="privacy_desc"> 1) 파기 절차 
						<p class="privacy_li"> · 이용자가 서비스 이용 등을 위해 입력한 정보는 이용 목적이 달성된 후, 내부 방침 및 관련 법령에 따라 일정 기간 저장된 후 파기됩니다. </p>
						<p class="privacy_li"> · 해당 개인정보는 법률에 의한 경우가 아니고서는 보관되는 목적 외로 이용되지 않습니다. </p>
						<br> 2) 파기 방법 
						<p class="privacy_li"> · 종이에 출력된 개인정보는 분쇄기로 분쇄하고, 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. </p>
					</div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">5. 이용자 및 법정대리인의 권리와 행사 방법</div>
					<div class="agreement_subtitle"> 이용자 및 법정대리인은 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 언제든지 계정 삭제를 요청할 수 있습니다. </div>
					<div class="agreement_subtitle"> 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.
					<br> 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다. </div>
					<div class="agreement_subtitle"> 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보를 아래 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. </div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">6. 개인정보의 기술적 관리적 보호조치</div>
					<div class="agreement_subtitle"> “KREAMY”는 이용자들의 개인정보를 처리함에 있어 개인 정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 다음과 같은 기술적·관리적 대책을 강구하고 있습니다. </div>
					<div class="privacy_desc"> 1) 이용자의 개인정보는 암호화하여 저장·관리되고 있으며, 암호화 통신(SSL) 등을 통하여 전송하고, 비밀번호는 복호화 불가능하도록 일방향 암호화하여 저장·관리되고 있습니다. 
					<br><br> 2) 해킹이나 컴퓨터 바이러스 등에 의해 이용자의 개인정보가 유출되거나 훼손되는 것을 막기 위해 외부로부터 접근이 통제된 구역에 시스템을 설치하고 있습니다. 
					<br><br> 3) 개인정보의 훼손에 대비해서 자료를 수시로 백업하고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신(SSL) 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 
					<br><br> 4) 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려고 노력하고 있습니다. 
					<br><br> 5) 개인정보를 처리하는 직원을 최소화 하여 개인정보 유출에 대한 위험을 줄이고 있습니다. 
					<br><br> 6) 개인정보를 보관하는 데이터베이스 시스템과 개인정보를 처리하는 시스템에 대한 비밀번호의 생성과 변경, 그리고 접근할 수 있는 권한에 대한 체계적인 기준을 마련하고 지속적인 감사를 실시하고 있습니다. 
					<br><br> 7) 개인정보를 처리하는 임직원들을 대상으로 개인정보보호 의무와 보안에 대한 정기적인 교육이나 캠페인을 실시하고 있습니다. </div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">7. 개인정보보호 책임자 및 연락처</div>
					<div class="agreement_subtitle">
						<p>개인정보보호 책임자</p>
					</div>
					<div class="privacy_desc">
						<p class="privacy_li">· 이름: 마진영<br>· 직위: 팀장 <br>· 메일: help@kreamy.co.kr</p>
					</div>
					<div class="agreement_subtitle">
						<p> 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. </p>
					</div>
					<div class="privacy_desc">
						<p class="privacy_li"> · 개인정보침해신고센터(http://privacy.kisa.or.kr / 국번없이 118)
						<br> · 대검찰청 사이버수사과(http://www.spo.go.kr / 국번없이 1301)
						<br> · 경찰청 사이버안전국(http://cyberbureau.police.go.kr / 국번없이 182) </p>
					</div>
				</div>
				<div class="divider"></div>
				<div class="agreement_list">
					<div class="agreement_title">8. 개인정보 처리방침의 개정</div>
					<div class="agreement_subtitle">
						<p> 본 개인정보처리방침의 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 ‘공지사항’을 통해 사전 공지하겠으며, 필요 시 이용자 동의를 다시 받을 수도 있습니다. </p>
					</div>
					<div class="agreement_subtitle">
						<p>2021년 04월 15일 공고<b>2021년 05월 15일 시행</p>
					</div>
				</div>
			</div>
		</div>
		
		<a class="btn_layer_close">
			<svg style="width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>
		</a>
	</div>
</div>



</form>
				
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