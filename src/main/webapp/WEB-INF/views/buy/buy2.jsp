<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/buysell.css"/>
<script type="text/javascript" src="/kreamy/resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	var d = new Date();		
	d.setDate(d.getDate()+30);
	var year = d.getFullYear();
	var month = d.getMonth()+1;
	var day = d.getDate();
	$('.deadline_txt').html("30일 ("+year+"/"+ month+"/"+ day +" 마감)");	
	$('#addrB').val("no");
		
	if(${addrLists.size()}==0){
		$('#di1').hide();		
	}else{
		$('#di2').hide();
	}
	//즉시구매가 없을시
	if(${empty pbsdto.immeBuyPrice }){
		$('.tab_area.buy_tab .item').attr('class','item');
		$('#bb').addClass('on');//로드할떈여기디스바꺼 #bb
		$('.price_now').attr('class','price_now active_input');
		$('.price_now_title').html(" 구매 희망가 ");
		$('.input_amount').attr('class','input_amount');
		$('.price_now_box .amount').attr('class','amount hide');		
		$('.input_amount').val('');		
		$('.price_box .price').attr('class','price empty_price');
		$('.price_box .amount').html('-');
		$('.price_box .unit').html('');
		$('#section1').attr('class','');
		$('#bi .item_link').attr('class','item_link2');		
		$('#lbtn').attr('class','btn full solid false disabled');
		$('#ig2 .price .unit').html('원');//추가할할
		
	}
	
	
	if(${empty addrLists}){
		$('#lbtn').attr('class','btn full solid false disabled');
	}
	
	
	//update시
	if(${not empty bidBuyNum}&&${not empty wishPrice}){		
		
		$('.tab_area.buy_tab .item').attr('class','item');
		$('#bb').addClass('on');//로드할떈여기디스바꺼 #bb
		$('.price_now').attr('class','price_now active_input');
		$('.price_now_title').html(" 구매 희망가 ");
		$('.input_amount').attr('class','input_amount');
		$('.price_now_box .amount').attr('class','amount hide');		
		$('.input_amount').val('');		
		$('.price_box .price').attr('class','price empty_price');
		$('.price_box .amount').html('-');
		$('.price_box .unit').html('');
		$('#section1').attr('class','');
		$('#bi .item_link').attr('class','item_link2');	
		$('#ig2 .price .unit').html('원');//추가할할		
		$('#bidinput').val('${wishPrice}');
		$('#bidinput').focusout();
		$('#lbtn').attr('class','btn full solid update');
		$('#lbtn').html('변경 하기');
	}
	//카드 있으면 $('.btn_card_add').show(); $('.regist_link').hide() $('.clickable_card').css('display','flex');
});

$(document).on('click','.btn.full.solid.update', function(){
	var wp = $('#bidinput').val().replace(/[^0-9]/g,'');
	var vd = $('#d_t').text().substring(0,2).replace(/[^0-9]/g,'');
	alert(wp)
	alert(vd)
	
	//location.href='<%=cp%>/bidBuyUpdate'
});

function isMobile(phoneNum) { 
	var regExp =/01[016789]{1}[0-9]{7,8}/ 	
	if(regExp.test(phoneNum)){ 		
		return true; 
	}else{ 
		return false; 
	} 
}

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
	$('#addModal1').modal('show')
	
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
		
		var url = "<%=cp%>/buy/card";		
		$.ajax({
			url : url,
			data : {card1:card1,card2:card2,card3:card3,card4:card4,jumin:jumin,month:month,year:year,bank:bank,tp:'b'},
			success : function(result) {
				var refine = $("#section3").html(result).find('#section3').children();
	     		$('#section3').html(refine);      
			}
		});	
		if($('.cb3.hide').length==$('.cb3').length){
	 		$('#lbtn').attr('class','btn full solid buy');		
		}else{
			$('#lbtn').attr('class','btn full solid false disabled');
		}
	}	
}

	function inputNumberFormat(obj) {
	   obj.value = comma(uncomma(obj.value));
	  
	}
	
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}	
		
	
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	function find_Postcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = '';
	            var extraAddr = '';

	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { 
	                addr = data.jibunAddress;
	            }

	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	       
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            } 

	            document.getElementById('postNum').value = data.zonecode;
	            document.getElementById("addr1").value = addr + extraAddr;
	            document.getElementById("addr2").value=''
	            document.getElementById("addr2").focus();
	        }
	    }).open();
	}

	function nameCheck(){
		var name = document.getElementById('recvName').value
		if(name==1){
			document.getElementById('name_title').className='input_title_red'
			document.getElementById('receiverName').className='input_txt_error'
			document.getElementById('name_error').className='input_error_on'		
			document.getElementById('save').className='save_button_inactive'		
		}else{
			document.getElementById('name_title').className='input_title_black'
			document.getElementById('receiverName').className='input_txt_focus'
			document.getElementById('name_error').className='input_error_off'
			check_data_filled()
		}
	}
	function phoneCheck(){
		var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
		var phone = document.getElementById('receiverPhone').value
		if(!check.test(phone)&&phone.length!=0){
			document.getElementById('phone_title').className='input_title_red'
			document.getElementById('receiverPhone').className='input_txt_error'
			document.getElementById('phone_error').className='input_error_on'		
			document.getElementById('save').className='save_button_inactive'
		}else{
			document.getElementById('phone_title').className='input_title_black'
			document.getElementById('receiverPhone').className='input_txt_focus'
			document.getElementById('phone_error').className='input_error_off'
			check_data_filled()
		}
	}

	function check_data_filled(){
		var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
		var name = document.getElementById('receiverName').value
		var phone = document.getElementById('receiverPhone').value
		var zipcode = document.getElementById('zipcode').value
		var addr = document.getElementById('addr').value
		var detail = document.getElementById('addrDetail').value
		
		if(check.test(phone) && name.length>1 && zipcode.length>0 && addr.length>0 && detail.length>0){
			document.getElementById('save').className='save_button_active'
		}else{
			document.getElementById('save').className='save_button_inactive'
		}
		
	}
</script>	
<style type="text/css">
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
.modal{
	overflow-y: hidden;
	height: 100%;
}

a, .btn{
	outline:0px !important;    
   box-shadow: none !important;
}
a:checked, .btn:checked, button:checked{
	outline:0px !important;    
   box-shadow: none !important;
}
a:focus, .btn:focus, button:focus{
	outline:0px !important;    
   box-shadow: none !important;
}
</style>

</head>
<body>

<div id="nuxt" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block; font-size: 14px; font-weight: 400;
	line-height: 21px; text-align: left;">
	<!--  -->
	<div id="layout" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block;">
	
		<div class="wrap win_os lg" style="position: relative; padding-top: 100px;">
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); position: fixed; top: 0; left: 0; right: 0;
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
									<a href="mainPage" class="logo" >									
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
	<div class="container buy lg" style="max-width: none;">
		<div class="content">
			<div class="column_area">
				<div class="column_bind step-1">
					<div class="column">
						<div class="spread"></div>
						<div class="column_box" style="max-width: 500px">
							<div class="buy_product">
								<div class="product" style="background-color: #f6f6f6">
									<img src="/img/${repImage}" class="product_img">
								</div>
								<div class="buy_info">
									<div class="model_info">
										<strong class="model_number">${pIdto.styleNum }</strong>
										<p class="model_title">${pIdto.engProduct }</p>
										<p class="model_ko">${pIdto.korProduct }</p>
										<p class="size_txt">${prodSize }</p>
									</div>
								</div>
							</div><!-- buy_product 끝 -->
						</div><!-- 칼럼박스 끝 -->						
					</div><!-- 첫번쨰 컬럼끝 -->
					<div class="column">
						<div class="column_box">
							<div class="buy_immediate">
								<div id="c_top" class="column_top">
									<div class="price_descision_box">
										<ul class="price_list">
											<li class="list_item">
												<p class="title">즉시 구매가</p>
												<c:choose>
													<c:when test="${empty pbsdto.immeBuyPrice }">
														<span class="price">-</span>
														<span class="unit"></span>													
													</c:when>
													<c:otherwise>
														<span class="price"><fmt:formatNumber value="${pbsdto.immeBuyPrice }" type="number"/></span>
														<span class="unit">원</span>
													</c:otherwise>
												</c:choose>
											</li>
											<li class="list_item">
												<p class="title">즉시 판매가</p>													
												<c:choose>
													<c:when test="${empty pbsdto.immeSellPrice }">
														<span class="price">-</span>
														<span class="unit"></span>													
													</c:when>
													<c:otherwise>
														<span class="price"><fmt:formatNumber value="${pbsdto.immeSellPrice }" type="number"/></span>
														<span class="unit">원</span>
													</c:otherwise>
												</c:choose>
											</li>
										</ul>
										<div class="instant_group">
											<div id="ig1" class="tab_area buy_tab">
												<ul class="tab_list">
													<li id="bb" aria-controls="panel1" class="item">
														<a class="item_link">구매 입찰</a>
													</li>
													<li id="bi" aria-controls="panel2" class="item on">
														<a class="item_link">즉시 구매</a>
													</li>
												</ul>
												<!----><!---->
											</div><!-- 탭구역 바이탭끝 -->
											<div id="ig2" class="price_now">
												<dl class="price_now_box">
													<dt class="price_now_title"> 즉시 구매가 </dt>
													<dd class="price">													
														
														<input id="bidinput" type="text" pattern="([0-9]+.{0,1}[0-9]*,{0,1})*[0-9]" required="required" placeholder="희망가 입력" autocomplete="off" onkeyup="inputNumberFormat(this)" class="input_amount hide" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
														
													<c:choose>
														<c:when test="${empty pbsdto.immeBuyPrice }">
															<span class="amount">-</span>
															<span class="unit"></span>													
														</c:when>
														<c:otherwise>
															<span class="amount"><fmt:formatNumber value="${pbsdto.immeBuyPrice }" type="number"/></span>															
															<span class="unit">원</span>
														</c:otherwise>
													</c:choose>
													</dd>
												</dl>
												<span class="price_warning hide">
													 3만원 부터 천원단위로 입력하세요.
												</span>
											</div>
											<div id="ig3" class="price_bind">
												<dl class="price_point">
													<dt class="price_point_title">
														<span>포인트</span>
														<button class="btn_question">
															<svg class="qus" xmlns="http://www.w3.org/2000/svg" id="i-info-circle" fill="none" viewBox="0 0 20 20"><path fill="#BBB" fill-rule="evenodd" d="M18.333 10A8.333 8.333 0 0110 18.333 8.333 8.333 0 011.667 10 8.333 8.333 0 0110 1.667 8.333 8.333 0 0118.333 10zm-8.48 3.438A.781.781 0 109.852 15h.113a.78.78 0 000-1.562h-.113zm-2.71-5.235c-.069.388.26.71.653.71s.696-.325.789-.707c.06-.249.155-.463.286-.644.25-.341.633-.512 1.15-.512a1.259 1.259 0 01.775.312c.125.109.23.255.312.438.092.175.138.387.138.637 0 .209-.03.388-.088.538-.05.15-.125.287-.225.412-.091.117-.2.225-.325.325l-.375.325a3.684 3.684 0 00-.437.438 2.073 2.073 0 00-.3.5 2.863 2.863 0 00-.214.925c-.03.372.279.675.651.675.373 0 .66-.306.73-.672l.02-.09c.059-.209.138-.388.238-.538.1-.158.217-.3.35-.425.133-.125.28-.254.437-.387l.4-.35c.134-.126.25-.263.35-.413.109-.158.192-.342.25-.55.067-.217.1-.47.1-.763 0-.4-.07-.758-.212-1.075a2.156 2.156 0 00-.588-.787 2.359 2.359 0 00-.862-.488 3.144 3.144 0 00-1.063-.175 3.34 3.34 0 00-1.25.225 2.714 2.714 0 00-.95.613 2.782 2.782 0 00-.74 1.503z" clip-rule="evenodd"></path></svg>
														</button>
													</dt>
													<dd class="price_text">
														<div class="default_point">
															<span class="default_text">결제 시점에 최대 사용</span>
															<button class="btn solid xsmall" style="cursor: pointer;"> 사용하기 </button>
														</div>
													</dd>
												</dl>
												<dl class="price_addition">
													<dt class="price_title">
														<span style="color: rgba(34,34,34,.5);">검수비</span><!---->
													</dt>
													<dd class="price_text"> 무료 </dd>
												</dl>
											</div>
											<div class="price_total">
												<dl class="price_box">
													<dt class="price_title"> 총 결제금액 </dt>
													<c:choose>
														<c:when test="${empty pbsdto.immeBuyPrice }">
															<dd class="price empty_price">
																<span id="totP1" class="amount">-</span>
																<span class="unit"></span>
															</dd>														
														</c:when>
														<c:otherwise>
															<dd class="price">
																<span id="totP1" class="amount"><fmt:formatNumber value="${pbsdto.immeBuyPrice }" type="number"/></span>
																<span class="unit">원</span>
															</dd>	
														</c:otherwise>													
													</c:choose>
												</dl>
												<span class="price_warning" style="display: none;">
													<em>주의! </em>
												</span>
											</div>											
										</div><!-- instant_group끝 -->
									</div><!-- 프라이스디씨전끝 -->
								</div><!-- 칼럼탑끝 -->
								<section id="section0" class="hide">	
									<div class="section_title">
										<h3 class="title_txt" style="font-weight: 700;color: #222;">최종 주문정보</h3>
									</div>
									<div class="section_content">
										<div class="instant_group">
											<div class="price_total" style="padding-top: 10px;">
												<dl class="price_box">
													<dt class="price_title" style="font-weight: 700;"> 총 결제금액 </dt>
													<dd class="price">
														<span id="totP2" class="amount">30,000</span>
														<span class="unit">원</span>
													</dd>
												</dl>
											</div>
											<div id="ign1" class="price_bind"">
												<dl class="price_addition is_dark">
													<dt class="price_title">
														<span id="pppp" style="font-weight: 400; color: rgba(34,34,34,.5)">구매 희망가</span>
														<!---->
													</dt>
													<dd id="wP" class="price_text"> 30,000원 </dd>
												</dl>
												<dl class="price_addition">
													<dt class="price_title">
														<span style="font-weight: 400; color: rgba(34,34,34,.5)">검수비</span>
														<!---->
													</dt>
													<dd class="price_text"> 무료 </dd>
												</dl>
											</div>										
											<div id="ign2" class="price_bind"">
												<dl class="price_addition">
													<dt class="price_title dark">
														<span>입찰 마감 기한</span><!---->
													</dt>
													<dd id="bdd" class="price_text"> 3일 - 2021/07/01까지 </dd>
												</dl>
											</div>
										</div>
									</div>
								</section>
								<section id="section1" class="hide">
									<div class="section_title">
										<h3 class="title_txt">입찰 마감기한</h3>
									</div>
									<div class="section_content">
										<div class="bid_deadline">
											<p id="d_t" class="deadline_txt"> 60일 (2021/08/26 마감) </p>
											<div class="deadline_tab">
												<a type="button" class="btn outlinegrey medium"> 1일 </a>
												<a type="button" class="btn outlinegrey medium"> 3일 </a>
												<a type="button" class="btn outlinegrey medium"> 7일 </a>
												<a type="button" class="btn outlinegrey medium is_active"> 30일 </a>
												<a type="button" class="btn outlinegrey medium"> 60일 </a>
											</div>
										</div>
									</div>
								</section>
								
								<section id="section2">
									<div class="section_title">
										<h3 id="s2t" class="title_txt">배송 주소</h3>
									</div>
									<div class="section_content">
										<div id="di1" class="delivery_info"><!-- 이걸하이드 -->
											<div class="address_info">
												<div class="name_box">
													<span class="name">${addrLists[0].recvName }</span>
													 <span class="mark">기본 배송지</span>													
												</div>
												<div class="address_box">
													<span class="zipcode">(${addrLists[0].postNum })</span>
													<span class="address">${addrLists[0].addr1 } ${addrLists[0].addr2 }</span>
												</div>
												<p class="phone">${addrLists[0].recvPhone }</p>
											</div>
											<a type="button" class="btn btn_edit outlinegrey small"> 변경 </a>
										</div>
										<div id="di2" class="tab_area delivery_tab"><!-- 이걸하이드 -->
											<ul id="datab" class="tab_list">
												<li id="dali1" class="item">
													<a id="da1" class="item_link">내 주소록</a>
												</li>
												<li id="dali2" class="item on">
													<a id="da2" class="item_link">새로 입력</a>
												</li>
											</ul>
											<div id="p1" class="tab_content">
												<c:choose>
													<c:when test="${empty addrLists}">
														<div class="empty_area">
															<p class="desc">새 주소를 추가해주세요.</p>
															<a id="ana" type="button" class="btn outlinegrey small"> + 새 배송지 추가 </a>
														</div>
													</c:when>
													<c:otherwise>
														<div class="address_book">
															<div class="address_list_wrap">
															<c:forEach var="dto" items="${addrLists }" varStatus='i'>
																<c:choose>
																<c:when test="${i.first }">
																<div class="address_list is_active">
																</c:when>
																<c:otherwise>
																<div class="address_list">
																</c:otherwise>																			
																</c:choose>		
																	<div class="address_info">
																		<div class="name_box">
																			<span class="name">${dto.recvName }</span>
																			 <c:if test="${i.first }"><span class="mark">기본 배송지</span></c:if> 
																			
																		</div>
																		<div class="address_box">
																			<span class="zipcode">(${dto.postNum })</span>
																			<span class="address">${dto.addr1 } ${dto.addr2 }</span>
																		</div>
																		<p class="phone">${dto.recvPhone }</p>
																	</div>
																	<div class="radio_item type_check">
																		<label class="radio_label">
																		<c:choose>
																			<c:when test="${i.first }">
																				<svg class="chkk" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																			</c:when>
																			<c:otherwise>
																				<svg class="chkk hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																			</c:otherwise>																			
																		</c:choose>	
																		</label>
																	</div>																	
																</div>
															</c:forEach>
																
															</div>
															<!---->
														</div>
													</c:otherwise>
												</c:choose>
											</div>
											<div id="p2" class="tab_content show">
												<div class="register_address_wrap">
													<div class="delivery_input">
														<div class="input_box">
															<h4 class="input_title" style="font-weight: 700;">이름</h4>
															<div class="input_item">
																<input id="recvName" type="text" placeholder="수령인의 이름" maxlength="10" autocomplete="off" class="input_txt prominent_placeholder_30">
															</div>
															<p class="input_error">올바른 이름을 입력해주세요. (2 - 50자)</p>
														</div>
														<div class="input_box">
															<h4 class="input_title" style="font-weight: 700;">휴대폰 번호</h4>
															<div class="input_item">
																<input id="recvPhone" type="text" placeholder="- 없이 입력" maxlength="11" autocomplete="off" class="input_txt prominent_placeholder_30" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
															</div>
																<p class="input_error">정확한 휴대폰 번호를 입력해주세요.</p>
														</div>
														<div class="input_box">
															<h4 class="input_title" style="font-weight: 700;">우편번호</h4>
															<div class="input_item">
																<input id="postNum" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt prominent_placeholder_30">
																<!-- <input id="postNum" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt prominent_placeholder_30"> -->
																<a type="button" class="btn btn_zipcode outline small" onclick="find_Postcode()"> 우편번호 </a>
															</div>
														</div>
														<div class="input_box">
															<h4 class="input_title" style="font-weight: 700;">주소</h4>
															<div class="input_item">
																<input id="addr1" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt prominent_placeholder_30">
																<!-- <input id="addr1" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt prominent_placeholder_30"> -->
															</div>
														</div>
														<div class="input_box">
															<h4 class="input_title" style="font-weight: 700;">상세 주소</h4>
															<div class="input_item">
																<input id="addr2" type="text" placeholder="건물, 아파트, 동/호수 입력" maxlength="30" autocomplete="off" class="input_txt prominent_placeholder_30">
																<input id="addrB" name="addrBasic" type="hidden" value="no">
															</div>
														</div>
													</div>
													<div class="delivery_check">
														<div class="checkbox_item">
															
															<label for="check2" class="check_label">
																<svg class="cb" xmlns="http://www.w3.org/2000/svg" id="ici" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																<svg class="cb2 hide" xmlns="http://www.w3.org/2000/svg" id="ica" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																<span class="label_txt">기본 배송지로 설정</span>
															</label>
															
														</div>														
													</div>
													<a id="raddr"  class="btn btn_zipcode small rr" style="bottom: -15px; right:5px; color: white;"> 등록 </a>
												</div>
											</div><!-- 패널2끝 -->
										</div>
									
									</div><!-- 섹션_컨텐트끝 -->		
									
									
									<div id="s2su" class="section_unit" style="margin-top: 13px; padding-top: 13px; border-top: 1px solid #ebebeb; display: none;">
										<div class="section_title">
											<h3 class="title_txt" style="font-weight: 700; color: #222;">배송 방법</h3>
										</div>
										<div class="section_content">
											<div class="delivery_service">
												<div class="company_wrap">
													<div class="company_ci">
														<p>택배</p>
													</div>
													<div class="info_text">
														<p class="company">일반 택배</p>
														<p class="sub_text">검수 합격 시 배송됩니다.</p>
													</div>
												</div>
												<div class="notice">
													<p class="notice_text">검수센터에 도착 후, 입고 &gt; 검수대기 &gt; 검수 과정을 거쳐 합격한 경우에 배송을 시작합니다.<br>따라서 일반 쇼핑몰의 구매과정보다 더 많은 시일이 소요됩니다.</p>
												</div>
											</div>
										</div>
									</div>
									
															
								</section>
								
								<section id="section3" class="hide">
									<div class="section_title">
										<h3 class="title_txt sst" style="font-weight: 700; color: #222;">결제 방법</h3>
									</div>
									<div class="section_content">
										<div class="simple_payment">
											<h4 class="method_title">
												<div class="main_title">간편 결제 <span class="sub_title">일시불</span></div>
												<c:if test="${not empty cardLists }"><a class="btn_card_add">+새 카드 추가</a></c:if> 
											</h4>
											<div class="card_list">
												<div class="main_card selected">
												<c:choose>
													<c:when test="${empty cardLists }">
														<a class="regist_link"> 카드를 등록해주세요 
															<svg class="card_r" xmlns="http://www.w3.org/2000/svg" id="i-ico-arr-right-gray-thick" fill="none" viewBox="0 0 18 18"><path stroke="#BBB" stroke-width="1.5" d="M6.75 4.5l4.5 4.5-4.5 4.5"></path></svg>
														</a>
													</c:when>
													<c:otherwise>													
														<div class="clickable_card">
															<div class="card_info">
																<span class="card_name"> ${cardLists[0].bank }</span>
																<div class="card_num">
																	<span class="num_bind">
																		<span class="dot"><span class="dot"></span></span>
																		<span class="hyphen"></span>
																		<span class="dot"><span class="dot"></span></span>
																		<span class="hyphen"></span>
																		<span class="dot"><span class="dot"></span></span>
																		<span class="hyphen"></span>
																		<c:set var="Bcard" value="${cardLists[0].cardNum }"/>
																		<c:set var="Blen" value="${fn:length(Bcard) }"/>																		
																		<span class="last_num">${fn:substring(Bcard,Blen-4,Blen) }</span>
																	</span>
																</div>
															</div>
															<svg class="ccc" xmlns="http://www.w3.org/2000/svg" id="i-ico-arr-down" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18 9l-6 6-6-6"></path></svg>
														</div>
													</div>
													<div class="other_card" style="display: none;">
														<ul class="other_card_list">
															<c:forEach var="dto" items="${cardLists }" varStatus='i'>
																<c:choose>
																	<c:when test="${i.first }">
																		<li class="other_card_item card_on">
																	</c:when>
																	<c:otherwise>
																		<li class="other_card_item">
																	</c:otherwise>								
																</c:choose>																
																	<div class="card_info">
																		<span class="card_name"> ${dto.bank }</span>
																		<div class="card_num">
																			<span class="num_bind">
																				<span class="dot"><span class="dot"></span></span><span class="hyphen"></span>
																				<span class="dot"><span class="dot"></span></span><span class="hyphen"></span>
																				<span class="dot"><span class="dot"></span></span><span class="hyphen"></span>
																				<c:set var="cd" value="${dto.cardNum }"/>
																				<c:set var="len" value="${fn:length(cd) }"/>
																				<span class="last_num">${fn:substring(cd,len-4,len) }</span>
																			</span>
																			<c:if test="${i.first }"><span class="mark">기본 결제</span></c:if>
																		</div>
																	</div>
																	<c:choose>
																		<c:when test="${i.first }">
																			<svg class="card_ch" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																		</c:when>
																		<c:otherwise>
																			<svg class="card_ch hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-s" fill="none" viewBox="0 0 24 24"><path stroke="#222" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
																		</c:otherwise>								
																	</c:choose>																		
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</c:otherwise>
										</c:choose>	
										</div>
										
										<div class="method_desc">
											<p class="desc_txt"> 구매 입찰은 일시불만 지원하며, 카드사 홈페이지나 앱에서 분할 납부로 변경 가능합니다. 단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다. </p>
										</div>
									</div>
									
								</section>
								<div id="bcl" class="buy_check hide">
									<div type="buy">
										<ul class="check_list lg">
											<li class="check_item">
												<a class="check_area">
													<div class="notice_group">
														<p class="notice_maintext">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.</p>
														<!----><!---->
													</div>
													<div class="checkbox_item">
														<label for="undefined" class="check_label">
															<svg class="cb3" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<svg class="cb4 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<!---->
														</label>
													</div>
												</a>
											</li>
											<li class="check_item">
												<a class="check_area">
													<div class="notice_group">
														<p class="notice_maintext">즉시 구매  및 입찰 거래가 체결되면, 단순 변심이나 실수에 의한 취소가 불가능합니다.</p><p data-v-3fab0e9a="" class="notice_subtext">본 거래는 개인간 거래로 전자상거래법(제17조)에 따른 청약철회(환불, 교환) 규정이 적용되지 않습니다.</p>
														<!---->
													</div>
													<div class="checkbox_item">
														<label for="undefined" class="check_label">
															<svg class="cb3" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<svg class="cb4 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<!---->
														</label>
													</div>
												</a>
											</li>
											<li class="check_item">
												<a class="check_area">
													<div class="notice_group">
														<p class="notice_maintext">구매 조건을 모두 확인하였으며, 구매 진행에 동의합니다.</p>
														<!----><!---->
													</div>
													<div class="checkbox_item">
														<label for="undefined" class="check_label">
															<svg class="cb3" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-inactive" fill="none" viewBox="0 0 24 24"><path stroke="#D3D3D3" d="M.5.5h23v23H.5z"></path><path stroke="#EBEBEB" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<svg class="cb4 hide" xmlns="http://www.w3.org/2000/svg" id="i-ico-check-active" fill="none" viewBox="0 0 24 24"><path fill="#000" d="M0 0h24v24H0z"></path><path stroke="#fff" stroke-width="1.5" d="M18.4 7.2L9.6 16l-4-4"></path></svg>
															<!---->
														</label>
													</div>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div id="bc2" class="buy_check2" type="buy" style="border-top: 8px solid #f4f4f4;">
									<div id="bc2pt" class="price_total hide" style="padding: 20px 32px; border-top: 1px solid #ebebeb;">
										<dl class="price_box">
											<dt class="price_title" style="font-size: 15px; letter-spacing: -.15px; font-weight: 700;"> 총 결제금액 </dt>
											<dd class="price">
												<span id="totP3" class="amount" style="font-style: normal; line-height: 26px; font-size: 24px; font-weight: 600; letter-spacing: normal;">30,000</span>
												<span class="unit">원</span>
											</dd>
										</dl>
									</div>
									<div class="btn_confirm">
										<a id="lbtn" disabled="disabled" type="button" class="btn full solid false ok"> 구매 계속 </a>
									</div>
								</div>
								
								
							</div><!-- buy_immediate끝 -->					
						</div><!-- 두번쨰 칼럼박스끝 -->
					</div><!-- 두번쨰 컬럼끝 -->
				</div><!-- column_bind step-1 끝 -->
			</div><!-- column_area 끝 -->
			<div class="buy_complete lg hide">
				<div class="complete_box">
					<div class="product" style="background-color: #f6f6f6;">
						<img src="/img/${repImage}" class="product_img">
					</div>
					<div class="complete_detail">
						<div class="complete_info">
							<div class="complete_title">
								<p class="main_title" style="display: block;">구매 입찰이 완료되었습니다.</p>
								<p class="sub_title" style="padding-left: 0px;">거래가 체결되는 시점에<br>등록하신 결제 정보로 자동 처리 됩니다.</p>
							</div>
							<div class="complete_btn_box">
								
								<a id="zxcv" type="button" class="btn outlinegrey medium"> 내역 상세보기 </a>
								<a href="<%=cp %>/shop.action" type="button" class="btn outlinegrey medium"> 다른 상품 둘러보기 </a>
							</div>
							<p class="complete_desc"> '구매내역 &gt; 입찰 중' 상태일 때는 입찰 지우기가 가능합니다. </p>
						</div>
						<div class="complete_price">
							<div class="price_total">
								<dl class="price_box">
									<dt class="price_title" style="color: #222;"> 총 결제금액 </dt>
									<dd class="price">
										<span id="cTPl" class="amount">30,000</span>
										<span class="unit">원</span>
									</dd>
								</dl>								
							</div>
							<div class="price_bind">
								<dl class="price_addition is_dark">
									<dt class="price_title">
										<span style="color: rgba(34,34,34,.5);">구매 희망가</span>
									</dt>
									<dd id="cWPl" class="price_text"> 30,000원 </dd>
								</dl>
								<dl class="price_addition">
									<dt class="price_title">
										<span style="color: rgba(34,34,34,.5);">검수비</span>
									</dt>
									<dd class="price_text"> 무료 </dd>
								</dl>
							</div>
							<div id="bddl" class="price_bind">
								<dl class="price_addition">
									<dt class="price_title dark">
										<span style="color: rgba(34,34,34,.5);">입찰 마감 기한</span>
									</dt>
									<dd id="ddtext" class="price_text"> 3일 - 2021/07/02까지 </dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div><!-- buy_complete -->			
		</div><!-- content 끝 -->
	</div><!-- container buy lg 끝 -->
	
	
</div><!-- wrap lg win_os 끝 -->
</div><!-- layout 끝 -->	
</div><!-- nuxt 끝 -->
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
<div id="qwer">
<p id="abcd">${bidNum }</p>
</div>
<script type="text/javascript">



//x버튼
$('.pop_x_btn').click(function() {
	$('body').attr('class','');
	$('#__nuxt').attr('class','');
	$('.model_info .layer_detail_size_select').addClass('hide');

});
//즉시구매탭 클릭
$(document).on('click','#bi .item_link', function(){
	$('.tab_area.buy_tab .item').attr('class','item');
	$('#bi').addClass('on');
	$('.price_now').attr('class','price_now');
	$('.price_now_title').html(" 즉시 구매가 ");
	$('.input_amount').attr('class','input_amount hide');
	$('.price_now_box .amount').attr('class','amount');
	$('span.price_warning').attr('class','price_warning hide');
	$('#section1').attr('class','hide');	
	if(${empty pbsdto.immeBuyPrice}){
		$('.price_box .price').attr('class','price empty_price');
		$('.price_box .amount').html('-');
		$('.price_box .unit').html('');
		
	}else{		
		$('.price_box .price').attr('class','price');				
		$('.price_box .amount').html("<fmt:formatNumber value='${pbsdto.immeBuyPrice }' type='number'/>");				
		$('.price_box .unit').html('원');
		
	}
	
	if($('#di1 .name').text()!=""){
		$('#lbtn').attr('class','btn full solid false ok');
	}else{
		$('#lbtn').attr('class','btn full solid false disabled');
	}
	
	
	

});
//구매입찰탭 클릭
$(document).on('click','#bb .item_link', function(){
	$('.tab_area.buy_tab .item').attr('class','item');
	$('#bb').addClass('on');//로드할떈여기디스바꺼 #bb
	$('.price_now').attr('class','price_now active_input');
	$('.price_now_title').html(" 구매 희망가 ");
	$('.input_amount').attr('class','input_amount');
	$('.price_now_box .amount').attr('class','amount hide');
	
	$('.input_amount').val('');
	if($('.price_now').hasClass('has_warning')){
		$('span.price_warning').attr('class','price_warning hide');
	}
	$('.price_box .price').attr('class','price empty_price');
	$('.price_box .amount').html('-');
	$('.price_box .unit').html('');
	$('#section1').attr('class','');
	$('#section1').show();
	$('#lbtn').attr('class','btn full solid false disabled');
	
});

$(document).on('focus','.input_amount', function(){
	$('.price_now').addClass('on_focus')
});
$(document).on('focusout','.input_amount', function(){
	$('.price_now').removeClass('on_focus')			

	var price=parseInt($('.input_amount').val().replace(/,/g,""));
		
		
	if(price>='${pbsdto.immeBuyPrice}'&&${not empty pbsdto.immeBuyPrice}){		
		$('.tab_area.buy_tab .item').attr('class','item');
		$('#bi').addClass('on');
		$('.price_now').attr('class','price_now');
		$('.price_now_title').html(" 즉시 구매가 ");
		$('.input_amount').attr('class','input_amount hide');
		$('.price_now_box .amount').attr('class','amount');
		$('.input_amount').val("");
		$('.price_now').attr('class','price_now');
		$('span.price_warning').attr('class','price_warning hide');
		$('.price_box .price').attr('class','price');
		$('.price_box .amount').html("<fmt:formatNumber value='${pbsdto.immeBuyPrice }' type='number'/>");
		$('.price_box .unit').html('원');
		$('#section1').attr('class','hide');	
			
	}else if(price>=30000){
		
		price=Math.floor(price/1000) * 1000;		
		price=String(price).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");		
		$('.input_amount').val(price);
		$('.price_now').attr('class','price_now');
		$('span.price_warning').attr('class','price_warning hide');
		$('.price_box .price').attr('class','price');
		$('.price_box .amount').html(price);
		$('.price_box .unit').html('원');			
		
	}else{		
		
		$('.price_now').addClass('has_danger');
		$('.price_now').addClass('has_warning');
		$('span.price_warning').attr('class','price_warning');
		$('.input_amount').val("");
		$('.price_box .price').attr('class','price empty_price');
		$('.price_box .amount').html('-');
		$('.price_box .unit').html('');
		
	}
	//추가할할	
	if(($('#totP1').text()=="-")||$('#di1 .address_info .name').text()==""){
		$('#lbtn').attr('class','btn full solid false disabled');	
	}else{
		$('#lbtn').attr('class','btn full solid false ok');
	}
	
	if(${not empty bidBuyNum}&&${not empty wishPrice}){
		
		$('#lbtn').attr('class','btn full solid update');
		$('#lbtn').html('변경 하기');
	}
	
});

//----------배송주소----
//내 주소록
$(document).on('click','#da1', function(){
	$('#datab .item').attr('class','item');
	$('#dali1').addClass('on');	
	$('#p2').attr('class','tab_content');
	$('#p1').attr('class','tab_content show');
	
});
//새로 입력
$(document).on('click','#da2, #ana', function(){
	$('#datab .item').attr('class','item');
	$('#dali2').addClass('on');
	$('#p1').attr('class','tab_content');
	$('#p2').attr('class','tab_content show');
	$('#recvName').val("");
	$('#recvPhone').val("");
	$('#postNum').val("");
	$('#addr1').val("");
	$('#addr2').val("");
	$('.cb').attr('class','cb');
	$('.cb2').attr('class','cb2 hide');
	$('#raddr').attr('class','btn btn_zipcode small rr');
});
//데드라인탭클릭
$(document).on('click','.deadline_tab .btn', function(){
	$('.deadline_tab .btn').attr('class','btn outlinegrey medium')
	$(this).addClass('is_active');
	var d = new Date();
	var dd = parseInt($(this).text().trim().replace(/[^0-9]/g,''));
	d.setDate(d.getDate()+dd);
	var year = d.getFullYear();
	var month = d.getMonth()+1;
	var day = d.getDate();
	$('.deadline_txt').html($(this).text().trim()+" ("+year+"/"+ month+"/"+ day +" 마감)");
});




//체크박스클릭
$(document).on('click','.checkbox_item', function(){
	
	if($('.cb').hasClass('hide')){	
		$('.cb').removeClass('hide');
		
	}else{		
		$('.cb').addClass('hide');		
	}
	if($('.cb2').hasClass('hide')){	
		$('.cb2').removeClass('hide');
		
	}else{		
		$('.cb2').addClass('hide');		
	}
	
});

//주소입력공통적용input_txt
function check_regInfo(){
	var t="y";	
	var et=!$('#p2 .input_box').hasClass('has_error');	
	$('#p2 .input_txt').each( function(){	
		if($(this).val()==""){			
			t="n";
		}
	})	
	if(t=="y"&&et){
		$('#raddr').attr('class','btn btn_zipcode small rok');
	}else{
		$('#raddr').attr('class','btn btn_zipcode small rr');
	}
		
}
$(document).on('input','.input_txt', function(){
	check_regInfo()
});
//prominent_placeholder_30 밑줄
$(document).on('focus','#recvName ,#recvPhone, #addr2', function(){	
	$(this).css('border-bottom','1px solid #222'); //2px so
});
$(document).on('focusout','.prominent_placeholder_30', function(){	
	$(this).css('border-bottom','1px solid #ebebeb');
});
$(document).on('input','#recvName', function(){	
	if($(this).val().length<2){
		$(this).closest('.input_box').attr('class','input_box has_error');
		$(this).closest('.input_box').find('.input_error').show();
	}else{
		$(this).closest('.input_box').attr('class','input_box');
		$(this).closest('.input_box').find('.input_error').hide();
	}	
});
$(document).on('input','#recvName', function(){	
	if($(this).val().length<2){
		$(this).closest('.input_box').attr('class','input_box has_error');
		$(this).closest('.input_box').find('.input_error').show();
	}else{
		$(this).closest('.input_box').attr('class','input_box');
		$(this).closest('.input_box').find('.input_error').hide();
	}	
	check_regInfo()
});
$(document).on('input','#recvPhone', function(){	
	if(!isMobile($(this).val())){
		$(this).closest('.input_box').attr('class','input_box has_error');
		$(this).closest('.input_box').find('.input_error').show();
	}else{
		$(this).closest('.input_box').attr('class','input_box');
		$(this).closest('.input_box').find('.input_error').hide();
	}	
	check_regInfo()
});

//등록시
$(document).on('click','.btn.btn_zipcode.small.rok', function(){
	var url = "<%=cp%>/buy/addr";	
	if($('.cb').hasClass('hide')){//기본체크시		
		$.ajax({
			url : url,
			data : {recvName:$('#recvName').val(),recvPhone:$('#recvPhone').val(),postNum:$('#postNum').val()
				,addr1:$('#addr1').val(),addr2:$('#addr2').val(),basic:'yes'},
			success : function(result) {//('#addAddr')
			 	var refine = $("#p1").html(result).find('#p1').children();
	         $('#p1').html(refine);
	         var refine2 = $("#di1").html(result).find('#di1').children();
	         $('#di1').html(refine2);
			}
		});	
	}else{//안체크시
		$.ajax({
			url : url,
			data : {recvName:$('#recvName').val(),recvPhone:$('#recvPhone').val(),postNum:$('#postNum').val()
				,addr1:$('#addr1').val(),addr2:$('#addr2').val(),basic:'no'},
			success : function(result) {//('#addAddr')
				var refine = $("#p1").html(result).find('#p1').children();
		      $('#p1').html(refine);	
		      var refine2 = $("#di1").html(result).find('#di1').children();
	         $('#di1').html(refine2);
			}
		});
		
	}		
	
	//추가할할	
	if(($('#totP1').text()=="-")){
		$('#lbtn').attr('class','btn full solid false disabled');	
	}else{
		$('#lbtn').attr('class','btn full solid false ok');
	}
	
	$('#datab .item').attr('class','item');
	$('#dali1').addClass('on');	
	$('#p2').attr('class','tab_content');
	$('#p1').attr('class','tab_content show');
	
	
});
//변경클릭
$(document).on('click','.btn.btn_edit', function(){
	
	$('#datab .item').attr('class','item');
  	$('#dali1').addClass('on');	
  	$('#p2').attr('class','tab_content');
  	$('#p1').attr('class','tab_content show');
  	$('#di1').hide();
	$('#di2').show();
	$('#ign2').show();
	if($('#bb').hasClass('on')) {
		$('#section1').show();		
	}
	$('#c_top').show();
	$('#section0').hide();
	$('#s2su').hide();
	$('#section3').hide();
	$('#bcl').hide();
	$('#bc2pt').hide();
	$('#s2t').attr('class','title_txt');
	$('#lbtn').html(" 구매 계속 ");
	if($('#di1 .name').text()!=""&&$('#totP1').text().trim()!="-"){
		$('#lbtn').attr('class','btn full solid false ok');
	}else{
		$('#lbtn').attr('class','btn full solid false disabled');
	}
});
//주소클릭
$(document).on('click','.address_list .address_info', function(){	
	$('#di1').show();
	$('#di2').hide();
	$('#di1 .address_info').html($(this).children().clone());
	$('.chkk').attr('class','chkk hide');
	$(this).closest('.address_list').find('.chkk').attr('class','chkk');
	$('.address_list').attr('class','address_list')
	$(this).closest('.address_list').attr('class','address_list is_active')
});
//1btn (구매계속 클릭)
$(document).on('click','.btn.ok', function(){	
	$('#section1').hide();
	$('#c_top').hide();
	$('#section0').show();
	$('#s2su').show();
	$('#section3').show();
	$('#bcl').show();
	$('#bc2pt').show();
	$('#s2t').addClass('sst');
	$('#lbtn').attr('class','btn full solid false disabled');
	$('#lbtn').html(" 구매 입찰하기 ");
	$('#totP2').html($('#totP1').text());
	$('#totP3').html($('#totP1').text());
	$('#wP').html($('.input_amount').val()+"원");// 일단이걸로 나중에 인풋val 바까야하는데
	$('#bdd').html($('#d_t').text());
	if($('#bi').hasClass('on')){
		$('#ign2').hide();
		$('#wP').html($('#totP1').text()+"원");
		$('#lbtn').html(" 결제하기 ");
		$('#pppp').html("즉시 구매가");
	}else{
		$('#pppp').html("구매 희망가");
	}
	$('#di1').show();
	$('#di2').hide();
	$('.cb3').attr('class','cb3');
	$('.cb4').attr('class','cb4 hide');
});
//카드등록할떄 regist_link
$(document).on('click','.regist_link, .btn_card_add', function(){		
	addModal1_open();
});
//안에 클리커블카드 클릭
$(document).on('click','.clickable_card', function(){
	
	if($('.other_card').css('display')=='none'){		
		$('.other_card').show();
	}else{
		$('.other_card').hide();
	}
	
});
//check_area마지막체크클릭
$(document).on('click','.check_area', function(){
	if($(this).find('.cb3').hasClass('hide')){
		$(this).find('.cb3').removeClass('hide');
		$(this).find('.cb4').addClass('hide');
	}else{
		$(this).find('.cb4').removeClass('hide');
		$(this).find('.cb3').addClass('hide');
	}
	//나중에 카드등록된것도 추가  입찰이랑즉구 구분할것
	if($('.clickable_card .card_name').text().trim()!=""){
		if($('.cb3.hide').length==$('.cb3').length){
	 		$('#lbtn').attr('class','btn full solid buy');		
		}else{
			$('#lbtn').attr('class','btn full solid false disabled');
		}
		
	}
	
 	
});
$(document).on('click','.other_card_item', function(){
	$('.other_card_item').attr('class','other_card_item');
	$('.card_ch').attr('class','card_ch hide');
	$(this).addClass('card_on')
	$(this).find('.card_ch').attr('class','card_ch')
	$('.clickable_card .card_name').html(" "+$(this).find('.card_name').text().trim())
	$('.clickable_card .last_num').html($(this).find('.last_num').text().trim())
	$('.other_card').hide()
});

//마지막결제버튼클릭시
$(document).on('click','.btn.full.solid.buy', function(){
	$('#cTPl').html($('#totP2').text().trim())     //3,000 
	$('#cWPl').html($('#wP').text().trim())    //3,000원
	if($('#bb').hasClass('on')){//입찰
		$('#ddtext').html($('#bdd').text().trim())
		var url = "<%=cp%>/buy/bidbuy";			
		
		var wp = $('#wP').text().replace(/[^0-9]/g,'');
		var vd = $('#bdd').text().substring(0,2).replace(/[^0-9]/g,'');
		var totP = $('#totP2').text().replace(/[^0-9]/g,'');			
		//여기기기
		 $.ajax({
			url : url,
			data : {productNum:'${pIdto.prodNum}' ,wishPrice:wp ,vd:vd ,
				recvName:$('.address_list.is_active .name').text() ,recvPhone:$('.address_list.is_active .phone').text() ,
				postNum:$('.address_list.is_active .zipcode').text().replace(/[^0-9]/g,'') ,totPayment:totP },
				success : function(result) {
					var refine = $('#qwer').html(result).find('#qwer').children();
		         $('#qwer').html(refine);    
				}
		
		}); 			
		
	}else{//즉시
		$('.complete_title .main_title').html("결제가 완료되었습니다.")
		$('.complete_info .complete_desc').html("즉시 구매 시 결제를 취소하실 수 없습니다.")
		$('#bddl').hide()
		
		var url = "<%=cp%>/buy/buyI";			
		
		 $.ajax({
			url : url,
			data : {productNum:'${pIdto.prodNum}' ,
				recvName:$('.address_list.is_active .name').text() ,recvPhone:$('.address_list.is_active .phone').text() ,
				postNum:$('.address_list.is_active .zipcode').text().replace(/[^0-9]/g,'')}	
		
		}); 
				
	}
	$('.column_area').hide()
	$('.buy_complete').show()
	$(window).scrollTop(0);
});
$(document).on('click','#zxcv', function(){
	location.href='<%=cp %>/bidBuyDetail?buyNum='+$('#abcd').text();			
});
//숫자만
//$('.input_amonut').on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"([0-9]+.{0,1}[0-9]*,{0,1})*[0-9]") );})

</script>

</body>
</html>