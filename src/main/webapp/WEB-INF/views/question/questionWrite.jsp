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
<link rel="stylesheet" href="<%=cp %>/resources/css/datepicker.css">
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
<script src="https://kit.fontawesome.com/cd5dd810df.js" crossorigin="anonymous"></script>
<script src="<%=cp%>/resources/js/jquery-3.6.0.js"></script>
<script src="<%=cp%>/resources/js/datepicker.js"></script>
<script src="<%=cp%>/resources/js/datepicker.ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>



<style type="text/css">

*{
	font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,"나눔고딕",
	"Segoe UI",Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	margin: 0px;
	padding: 0px;
}

tr{
	
	height: 57px;
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

.questionListContent {
    padding: 17px 0 19px;
    align-items: center;
    border-bottom: 1px solid #ebebeb;
    cursor: pointer;
    height: 57px;
}

input::placeholder{
	color: rgba(134,134,134,.5);
}

textarea::placeholder{
	color: rgba(134,134,134,.5);
}

textarea {
	width: 680px; 
	height: 300px; 
	padding: 10px 5px 10px 0px; 
	border: none; 
	outline: none; 
	resize: none; 
	color: #222222; 
	font-size: 15px; 
	letter-spacing: -.15px; 
	line-height: 22px;

}

.searchKey{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 8px 0;
    font-size: 15px; 
    width:100px;
	letter-spacing: -.15px;
	line-height: 22px;
}




.check_list_close{
	width: 400px; 
	height: 90px; 
	position: absolute;
	left: 0px; top: 35px;
	z-index: 100; 
	background-color: #fff; 
	border: 1px solid #ebebeb;
	display: none;
	
}
.check_list_open{
	width: 400px; 
	height: 90px; 
	position: absolute;
	left: 0px; top: 35px;
	z-index: 100; 
	background-color: #fff; 
	border: 1px solid #ebebeb;
	display: block;
	cursor: pointer;
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
	var tab = '${tab}'
	if(tab=='bid'){
		choiceBid();
	}
	if(tab=='trade'){
		choiceTrade();
	}
	if(tab=='end'){
		choiceEnd();
	}
	
	datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

})



function sort(sort){
	var state;
	var mode = document.getElementById("hiddenMode").value;
	var startDate = document.getElementById("datepicker1").value;
	var endDate = document.getElementById("datepicker2").value;
	if(sort=='priceAsc'||sort=='priceDesc'||sort=='validAsc'||sort=='validDesc'){
		state = document.getElementById("hiddenBidState").value;
	}
	if(sort=='tradeStateAsc'||sort=='tradeStateDesc'){
		state = document.getElementById("hiddenTradeState").value;
	}
	if(sort=='tradeDateAsc'||sort=='tradeDateDesc'||sort=='endStateAsc'||sort=='endStateDesc'){
		state = document.getElementById("hiddenEndState").value;
	}	
	var url = "<%=cp%>/buyList";
	$.post(url,{sort:sort,mode:mode,state:state,startDate:startDate,endDate:endDate},function(args){
		$("#buyList").html(args);
	});
	
}

function question_choice(a){
	$('#questionType1').html(a)
}

/**/
//드랍다운 리스트 열기
function checkList(button){
	
	//1. 문의유형1
	if(button == 'dropdownMenuButton1'){
		
		var check = document.getElementById("check_list1").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list1").className="check_list_close";
		}else{
			document.getElementById("check_list1").scrollTop=0;
			document.getElementById("check_list1").className="check_list_open";
		}
		
	}
	
	//2. 문의유형2 - 구매 문의 유형
	if(button == 'dropdownMenuButton2'){
		
		var check = document.getElementById("check_list2").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list2").className="check_list_close";
		}else{
			document.getElementById("check_list2").scrollTop=0;
			document.getElementById("check_list2").className="check_list_open";
		}
		
	}
	
	//3. 문의유형2 - 판매 문의 유형
	if(button == 'dropdownMenuButton3'){
		
		var check = document.getElementById("check_list3").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list3").className="check_list_close";
		}else{
			document.getElementById("check_list3").scrollTop=0;
			document.getElementById("check_list3").className="check_list_open";
		}
		
	}
	
	//4. 문의유형2 - 일반 문의 유형
	if(button == 'dropdownMenuButton4'){
		
		var check = document.getElementById("check_list4").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list4").className="check_list_close";
		}else{
			document.getElementById("check_list4").scrollTop=0;
			document.getElementById("check_list4").className="check_list_open";
		}
		
	}

	//5. 브랜드명
	if(button == 'dropdownMenuButton5'){
		
		var check = document.getElementById("check_list5").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list5").className="check_list_close";
		}else{
			document.getElementById("check_list5").scrollTop=0;
			document.getElementById("check_list5").className="check_list_open";
		}
		
	}
	
	//6. 구매경로
	if(button == 'dropdownMenuButton6'){
		
		var check = document.getElementById("check_list6").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list6").className="check_list_close";
		}else{
			document.getElementById("check_list6").scrollTop=0;
			document.getElementById("check_list6").className="check_list_open";
		}
		
	}
	
	//7. 구매주문번호
	if(button == 'dropdownMenuButton7'){
		
		var check = document.getElementById("check_list7").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list7").className="check_list_close";
		}else{
			document.getElementById("check_list7").scrollTop=0;
			document.getElementById("check_list7").className="check_list_open";
		}
		
	}

	//8. 판매주문번호
	if(button == 'dropdownMenuButton8'){
		
		var check = document.getElementById("check_list8").className;
		if(check == 'check_list_open'){
			document.getElementById("check_list8").className="check_list_close";
		}else{
			document.getElementById("check_list8").scrollTop=0;
			document.getElementById("check_list8").className="check_list_open";
		}
		
	}


	
	
}

//드랍다운 선택 후 띄워주기1 - 문의유형1
function searchKey_setting1(key){
	document.getElementById("check_list1").className="check_list_close";
	document.getElementById("searchKey1").value=key
	
	if(key == '구매'){
		document.getElementById("questionType2_buy").style.display="";
		document.getElementById("questionType2_sell").style.display="none";
		document.getElementById("questionType2_general").style.display="none";
		
		document.getElementById("searchKey2").setAttribute("name","questionType2");
		document.getElementById("searchKey3").setAttribute("name","");
		document.getElementById("searchKey4").setAttribute("name","");
		
		document.getElementById("buyTradeNum").style.display="";
		document.getElementById("sellTradeNum").style.display="none";
		
	
	}else if(key =='판매'){
		document.getElementById("questionType2_buy").style.display="none";
		document.getElementById("questionType2_sell").style.display="";
		document.getElementById("questionType2_general").style.display="none";
		
		document.getElementById("searchKey2").setAttribute("name","");
		document.getElementById("searchKey3").setAttribute("name","questionType2");
		document.getElementById("searchKey4").setAttribute("name","");
		
		document.getElementById("buyTradeNum").style.display="none";
		document.getElementById("sellTradeNum").style.display="";
		
	}else if(key =='일반'){
		document.getElementById("questionType2_buy").style.display="none";
		document.getElementById("questionType2_sell").style.display="none";
		document.getElementById("questionType2_general").style.display="";
		
		document.getElementById("searchKey2").setAttribute("name","");
		document.getElementById("searchKey3").setAttribute("name","");
		document.getElementById("searchKey4").setAttribute("name","questionType2");
		
		document.getElementById("buyTradeNum").style.display="none";
		document.getElementById("sellTradeNum").style.display="none";
	}
	
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";
	
}

//드랍다운 선택 후 띄워주기2 - 문의유형2 - 구매
function searchKey_setting2(key){
	document.getElementById("check_list2").className="check_list_close";
	document.getElementById("searchKey2").value=key;

	//문의내용 기본상태
	document.getElementById("questionContent").value="";

}

//드랍다운 선택 후 띄워주기3 - 문의유형2 - 판매
function searchKey_setting3(key){
	document.getElementById("check_list3").className="check_list_close";
	document.getElementById("searchKey3").value=key;
	
	if(key == '소명자료'){
		document.getElementById("buyRoute").style.display="";
		document.getElementById("buyRouteDetail").style.display="";
		document.getElementById("buyReason").style.display="";
		document.getElementById("sellPrice").style.display="";
		document.getElementById("sellPriceDetail").style.display="";
		document.getElementById("questionContent").setAttribute("placeholder","가품·중고품으로 검수 불합격 받으신 경우, 각 항목을 작성하신 후 구매 경로에 따른 소명자료를 모두 첨부하신 경우에 한하여 내부 검토를 진행하고 있습니다.");
	}else{
		document.getElementById("buyRoute").style.display="none";
		document.getElementById("buyRouteDetail").style.display="none";
		document.getElementById("buyReason").style.display="none";
		document.getElementById("sellPrice").style.display="none";
		document.getElementById("sellPriceDetail").style.display="none";
		document.getElementById("questionContent").setAttribute("placeholder","문의하실 내용을 입력해주세요.");
	}
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";
	
	
}

//드랍다운 선택 후 띄워주기4 - 문의유형2 - 일반
function searchKey_setting4(key){
	document.getElementById("check_list4").className="check_list_close";
	document.getElementById("searchKey4").value=key;
	
	if(key == '상품등록'){
		document.getElementById("brandName").style.display="";
	}else{
		document.getElementById("brandName").style.display="none";
	}
	
	if(key == '가입 이메일 변경'){
		document.getElementById("questionContent").value="이메일 변경은 이메일 가입과 네이버 로그인만 가능합니다. \n(네이버로그인 가입자는 네이버>내 정보 >연락처 이메일도 변경해주세요.)\n\n- 변경 전 가입 이메일: \n- 변경 후 이메일 주소: \n";
	}else if(key == '스타일 신고'){
		document.getElementById("questionContent").value="커뮤니티 가이드라인을 위반하는 스타일탭의 게시물을 신고합니다.\n\n- 신고할 프로필 이름: \n- 내용: \n- 첨부) 해당 게시물의 캡쳐 이미지\n- 첨부) 본인 사진의 도용인 경우 신분증\n";
	}else if(key == '상품등록'){
		document.getElementById("questionContent").value="현재 KREAMY에서 거래 중인 브랜드만 상품 등록 신청이 가능합니다. \n상품 등록은 요청 순서에 따라 등록이 진행되며, 정확한 정보로 요청이 되지 않았을 시 등록이 되지 않습니다.\n\n- 모델번호: \n- 상품명: \n- 첨부)스니커즈 박스의 라벨 스티커 사진";
	}else if(key == '상품문의'){	//플레이스 홀더
		document.getElementById("questionContent").setAttribute("placeholder","상품 등록 요청을 제외한 상품과 관련된 궁금하신 점을 작성해주시기 바랍니다.\n\n사이즈 추천 문의는 착용시 개인차가 있어 관련 안내가 어렵습니다. 또한 거래시 정확한 사이즈는 박스/패키지의 라벨 사이즈와 내부사이즈 택을 참고해 주시기 바랍니다.");
	}else if(key == '장애/오류'){
		document.getElementById("questionContent").value="아래 내용을 보내주시면 문의 확인에 도움이 됩니다. \n\n- 문제발생일시: \n- 상세 내용: \n";
	}else if(key == '이벤트'){
		document.getElementById("questionContent").value="아래 내용을 보내주시면 문의 확인에 도움이 됩니다. \n\n- 이벤트명: \n- 상세 내용: \n";
	}else{
		document.getElementById("questionContent").value="";
		document.getElementById("questionContent").setAttribute("placeholder","문의하실 내용을 입력해주세요.");
	}
	


}

//드랍다운 선택 후 띄워주기5 - 브랜드명
function searchKey_setting5(key){
	document.getElementById("check_list5").className="check_list_close";
	document.getElementById("searchKey5").value=key;
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";

}

//드랍다운 선택 후 띄워주기6 - 구매경로
function searchKey_setting6(key){
	document.getElementById("check_list6").className="check_list_close";
	document.getElementById("searchKey6").value=key;
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";

}

//드랍다운 선택 후 띄워주기7 - 구매주문번호
function searchKey_setting7(key){
	document.getElementById("check_list7").className="check_list_close";
	document.getElementById("searchKey7").value=key;
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";

}

//드랍다운 선택 후 띄워주기8 - 판매주문번호
function searchKey_setting8(key){
	document.getElementById("check_list8").className="check_list_close";
	document.getElementById("searchKey8").value=key;
	
	//문의내용 기본상태
	document.getElementById("questionContent").value="";

}


//userNum 기준 판매주문번호 불러오기
function checkSellTradeNum(userNum){
	
	var sellUserNum = "sellUserNum=" + userNum;
	
	$.ajax({
		
		type: "POST",
		url : "<%=cp%>/questionSellTradeNum",
		data: sellUserNum,
		success: function(args){
			
			$(".sellTradeNum").html(args);
			
		},error:function(e){
			alert(e.responseText);
		}
		
	});


}



//userNum 기준 구매주문번호 불러오기
function checkBuyTradeNum(userNum){
	
	var buyUserNum = "buyUserNum=" + userNum;
	
	$.ajax({
		
		type:"POST",
		url : "<%=cp%>/questionBuyTradeNum",
		data: buyUserNum,
		success:function(args){
			
			$(".buyTradeNum").html(args);
			
		},error:function(e){
			alert(e.responseText);
		}
		
	});
	
}

function sendData(){
	
	
	
	
	f = document.myForm;
	
	 
	
	//userNum
	
	str = f.tradeNum.value;
	
	 if(!str) {

		str = str.trim();
		str = 0;
		
		f.tradeNum.value = str;

	}  
	//입력체크 - userNum, questionType1, questionType2, questionSubject, questionContent / (questionType1 == '구매'||questionType1=='판매' - tradeNum) (questionType2=='상품등록' - brandName)
	qt1 = f.questionType1.value;
	qt1 = qt1.trim();
	if(!qt1) {
		alert("문의 유형을 선택하세요.");
		f.questionType1.focus();
		return;
	}
	f.questionType1.value = qt1;

	qt2 = f.questionType2.value;
	qt2 = qt2.trim();
	if(!qt2) {
		alert("구매 / 판매 / 일반 문의 유형을 선택하세요.");
		f.questionType2.focus();
		return;
	}
	f.questionType2.value = qt2;

	qs = f.questionSubject.value;
	qs = qs.trim();
	if(!qs) {
		alert("문의 제목을 입력하세요.");
		f.questionSubject.focus();
		return;
	}
	f.questionSubject.value = qs;
	 	
	qc = f.questionContent.value;
	qc = qc.trim();
	if(!qc) {
		alert("문의 내용을 입력하세요.");
		f.questionContent.focus();
		return;
	}
	f.questionContent.value = qc;
	
	
	qt1 = f.questionType1.value;
	qt1 = qt1.trim();
	if(qt1=='구매'){//tradeNum
		
		tn = f.tradeNum.value;
		tn = tn.trim();
		if(!tn) {
			alert("주문번호를 선택하세요.");
			f.tradeNum.focus();
			return;
		}
		f.tradeNum.value = tn;
		
	}else if(qt1=='판매'){//tradeNum
		
		tn = f.tradeNum.value;
		tn = tn.trim();
		if(!tn) {
			alert("주문번호를 선택하세요.");
			f.tradeNum.focus();
			return;
		}
		f.tradeNum.value = tn;
		
		qt2 = f.questionType2.value;
		qt2 = qt2.trim();
		if(qt2=='소명자료'){

			br = f.buyRoute.value;
			br = br.trim();
			if(!br) {
				alert("구매경로를 선택하세요.");
				f.buyRoute.focus();
				return;
			}
			f.buyRoute.value = br;
			
			brd = f.buyRouteDetail.value;
			brd = brd.trim();
			if(!brd) {
				alert("구매경로 상세내용을 입력하세요.");
				f.buyRouteDetail.focus();
				return;
			}
			f.buyRouteDetail.value = brd;
			
			bre = f.buyReason.value;
			bre = bre.trim();
			if(!bre) {
				alert("구매사유를 입력하세요.");
				f.buyReason.focus();
				return;
			}
			f.buyReason.value = bre;
			
			sp = f.sellPrice.value;
			sp = sp.trim();
			if(!sp) {
				alert("판매가를 입력하세요.");
				f.sellPrice.focus();
				return;
			}
			f.sellPrice.value = sp;

			spd = f.sellPriceDetail.value;
			spd = spd.trim();
			if(!spd) {
				alert("판매가 책정 사유를 입력하세요.");
				f.sellPriceDetail.focus();
				return;
			}
			f.sellPriceDetail.value = spd;

			
			
		}	
		
		
	}else if(qt1=='일반'){//brandName questionType2
		
		
		str = f.questionType2.value;
		str = str.trim();
		if(str=='상품등록'){

			str = f.brandName.value;
			str = str.trim();
			if(!str) {
				alert("브랜드를 선택하세요.");
				f.brandName.focus();
				return;
			}
			f.brandName.value = str;
			
		}
		
	}
	
	
	qc = f.questionContent.value;
	qc = qc.trim();
	if(!qc) {
		alert("문의 내용을 입력하세요.");
		f.questionContent.focus();
		return;
	}
	f.questionContent.value = qc;
	
	
	
	f.action = "<%=cp%>/questionWrite_ok";
	f.submit();
	
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
	<div align="center" style="width: 1300px; height:auto; padding: 40px;">
		<table cellpadding="0" cellspacing="0" >
		<tr valign="top">
			<td style="width: 250px;">
				<h2 style="margin: 0px;padding-bottom:25px; cursor: pointer;font-weight: 700;width: 250px;height: 63px;" 
				onclick="location.href='<%=cp%>/notice'">고객센터</h2>
				<div>
					<ul>
						<!-- 세션에 userNum 있으면 1:1문의 보이고, 없으면 안 보이게 -->
						<li class="menu" onclick="location.href='<%=cp%>/noticeList'">공지사항</li>
						<li class="menu" onclick="location.href='<%=cp%>/FAQList'">자주 묻는 질문</li>
						<li class="menu" onclick="location.href='<%=cp%>/questionList'" style="color: black; font-weight: bolder;">1 : 1 문의</li>
						<li class="menu" onclick="location.href='<%=cp%>/authPolicy'">검수 기준</li>
					</ul>
				</div>
			</td>
			<td style="padding-left: 40px;width: 1000px;" align="center">
			<div style="padding-top:5px">
				<div style="color: #222; margin: 0px; display: flex; padding: 5px 0px 16px; border-bottom: 3px solid #222;">
					<div style="float: left; width: 500px; padding-left: 5px;" align="left">
						<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">문의하기</h3>
					</div>
					
				
				
					<div style="float: right;width: 500px;" align="right">
						<div style="width: 108px;height: 34px; padding: 7px 14px ;border-radius: 10px;cursor: pointer;
						border: 1px solid #222;font-size: 12px;" align="center" id="addAddr" data-bs-toggle="modal" data-bs-target="#addrModal"
						onclick="location.href='<%=cp%>/questionList'">
							<font style="letter-spacing: -.6px;">1 : 1 문의목록</font>
						</div>
					</div>
					

				
					
				
				</div>
				
				<form action="" name="myForm" method="post">
				<table style="width: 1000px; font-size: 13px;">
				
				<tr style="height: 10px;"></tr>
				
				<tr>
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>문의 유형</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton1');"
							id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="선택하세요." id="searchKey1" class="searchKey" name="questionType1"
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list1">
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting1('구매');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">구매</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting1('판매');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">판매</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting1('일반');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">일반</div>
							</div>		
						</div>
					
 					</td>

				</tr>
				
			
				
				<tr id="questionType2_buy" style="display: none;">
				
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>구매 문의 유형</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton2');"
							id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="선택하세요." id="searchKey2" class="searchKey"
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list2" style="height: 150px;">
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting2('진행상황');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">진행상황</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting2('결제');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">결제</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting2('배송');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">배송</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting2('검수');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">검수</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting2('기타');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">기타</div>
							</div>		
						</div>
					
 					</td>

				</tr>
				
				
				<tr id="questionType2_sell" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>판매 문의 유형</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton3');"
							id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="선택하세요." id="searchKey3" class="searchKey"
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list3" style="height: 180px;">
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('진행상황');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">진행상황</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('페널티');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">페널티</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('발송/접수');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">발송/접수</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('검수');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">검수</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('소명자료');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">소명자료</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting3('기타');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">기타</div>
							</div>		
						</div>
					
 					</td>

				</tr>

				<tr id="questionType2_general" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>일반 문의 유형</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton4');"
							id="dropdownMenuButton4" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="선택하세요." id="searchKey4" class="searchKey"
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 200px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list4" style="height: 270px;">
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('회원정보');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">회원정보</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('가입 이메일 변경');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">가입 이메일 변경</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('스타일 신고');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">스타일 신고</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('상품등록');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">상품등록</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('상품문의');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">상품문의</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('장애/오류');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">장애/오류</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('이벤트');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">이벤트</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('탈퇴');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">탈퇴</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting4('기타');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">기타</div>
							</div>		
						</div>
					
 					</td>

				</tr>
				
				
				
				<tr id="buyTradeNum" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>구매주문번호</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >


							<c:if test="${sellTradeNumListsSize>0 }">
								<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton7');"
								id="dropdownMenuButton7" data-bs-toggle="dropdown" aria-expanded="false">
									<input type="text" placeholder="선택하세요." id="searchKey7" class="searchKey" name="tradeNum"
		    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 200px;"/>
									<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
									style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
										<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
										<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
									</svg>
								</div>
								
								<div class="check_list_close" id="check_list7" style="height: auto; overflow: hidden;">
									<c:forEach var="dto" items="${sellTradeNumLists }">
									<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222; background-color: #ffffff"align="left" onclick="searchKey_setting7('${dto.tradeNum }');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">${dto.tradeNum }</div>
									</c:forEach>
								</div>
								
								
							</c:if>
							
							<c:if test="${sellTradeNumListsSize==0 }">

								<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton7');"
								id="dropdownMenuButton7" data-bs-toggle="dropdown" aria-expanded="false">
									<input type="text" placeholder="해당하는 구매 주문번호가 없습니다." id="searchKey7" class="searchKey"
		    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 300px;"/>

 								</div>
						
							</c:if>
										
						</div>
					
 					</td>

				</tr>
				
				
				<tr id="sellTradeNum" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>판매주문번호</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >


							<c:if test="${buyTradeNumListsSize>0 }">
								<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton8');"
								id="dropdownMenuButton8" data-bs-toggle="dropdown" aria-expanded="false">
									<input type="text" placeholder="선택하세요." id="searchKey8" class="searchKey" name="tradeNum"
		    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 200px;"/>
									<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
									style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
										<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
										<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
									</svg>
								</div>
								
								<div class="check_list_close" id="check_list8" style="height: auto; overflow: hidden;">
									<c:forEach var="dto" items="${buyTradeNumLists }">
									<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222; background-color: #ffffff"align="left" onclick="searchKey_setting8('${dto.tradeNum }');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">${dto.tradeNum }</div>
									</c:forEach>
								</div>
								
								
							</c:if>
							
							<c:if test="${buyTradeNumListsSize==0 }">

								<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton8');"
								id="dropdownMenuButton7" data-bs-toggle="dropdown" aria-expanded="false">
									<input type="text" placeholder="해당하는 판매 주문번호가 없습니다." id="searchKey8" class="searchKey"
		    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 300px;"/>
									
								</div>
						
							</c:if>
										
						</div>
					
 					</td>

				</tr>
				
				
				
				<tr id="brandName" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>브랜드 선택</b></td>

					<td align="left">
						<div style="width: 400px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton5');"
							id="dropdownMenuButton5" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="브랜드를 선택하세요." id="searchKey5" class="searchKey"  name="brandName" 
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 200px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list5" style="height: 300px;; overflow: auto;">
								<!-- 브랜드 리스트 불러와서 하나씩 뿌려주기 -->
								<c:forEach var="dto" items="${brandLists }">
									<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting5('${dto.brandName}');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">${dto.brandName}</div>
								</c:forEach>
							</div>		
						</div>
					
 					</td>

				</tr>

				<tr id="buyRoute" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>구매 경로</b></td>

					<td align="left">
						<div style="width: 700px;position: relative; border: solid 1px #ebebeb; border-radius: 10px;" align="left" >
							<div style="position: relative; cursor: pointer; border-radius: 10px;" onclick="checkList('dropdownMenuButton6');"
							id="dropdownMenuButton6" data-bs-toggle="dropdown" aria-expanded="false">
								<input type="text" placeholder="선택하세요." id="searchKey6" class="searchKey"  name="buyRoute"
	    						readonly="readonly" style="cursor: pointer; margin-left: 10px; height: 35px; width: 200px;"/>
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
								style="position: absolute;top: 50%;right: 0; margin-top: -12px;">
									<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
									<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
								</svg>
							</div>	
							<div class="check_list_close" id="check_list6" style="height: 150px; width: 700px;">
								<!-- 브랜드 리스트 불러와서 하나씩 뿌려주기 -->
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting6('해외 온라인 구매');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">해외 온라인 구매</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting6('국내 온라인 구매');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">국내 온라인 구매</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting6('직거래');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">직거래</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting6('지인 거래');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">지인 거래</div>
								<div style="padding: 4px 0px 4px 10px; font-size: 15px; color: #222;"align="left" onclick="searchKey_setting6('기타');" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">기타</div>
							</div>		
						</div>
					
 					</td>

				</tr>


				<tr id="buyRouteDetail" style="height: 350px; display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"></td>

					<td align="left">
						<div align="left" 
						style="width: 700px; height:330px; text-align: left; padding-left: 10px; font-size: 14px; border: solid 1px #ebebeb; border-radius: 10px;" >
							<textarea placeholder="사이트 또는 서비스명 등 구매처에 대한 정보를 상세히 작성해주세요." name="buyRouteDetail"></textarea>
						
						</div>
 					</td>

				</tr>




				<tr>
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>문의내용</b></td>

					<td align="left">
						<div align="left" 
						style="width: 700px; height:38px; padding-left: 10px; font-size: 14px; position: relative; 
						border: solid 1px #ebebeb; border-radius: 10px;" >
							<input name="questionSubject" type="text" placeholder="제목을 입력하세요. (최대 80자)"
							style="width: 680px; height: 33px; color: #222; outline: 0; border: 0; resize: none; font-size: 15px; letter-spacing: -.15px; line-height: 22px;"/>

 						</div>
 					</td>

				</tr>

				
				<tr style="height: 350px;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"></td>

					<td align="left">
						<div align="left" 
						style="width: 700px; height:330px; text-align: left; padding-left: 10px; font-size: 14px; border: solid 1px #ebebeb; border-radius: 10px;" >
							<textarea placeholder="문의하실 내용을 입력해주세요." id="questionContent" name="questionContent"></textarea>
						</div>
 					</td>

				</tr>






				<tr id="buyReason" style="height: 350px; display: none;">
					<td valign="top" style="width: 150px; font-size: 15px; padding-left: 20px; padding-top: 20px;"><b>구매 사유</b></td>

					<td align="left">
						<div align="left" 
						style="width: 700px; height:330px; text-align: left; padding-left: 10px; font-size: 14px; border: solid 1px #ebebeb; border-radius: 10px;" >
							<textarea placeholder="해당 상품을 정품 또는 새상품임을 확신하고 구매하신 사유에 대해서 설명해주세요." name="buyReason"></textarea>
						
						</div>
 					</td>

				</tr>




				<tr id="sellPrice" style="display: none;">
					<td style="width: 150px; font-size: 15px; padding-left: 20px;"><b>판매가 책정 사유</b></td>

					<td align="left">
						<div align="left" 
						style="width: 200px; height:38px; padding-left: 10px; font-size: 14px; position: relative; border: solid 1px #ebebeb; border-radius: 10px;" >
							<input name="sellPrice" type="text" placeholder="판매가 (ex) 10000원)"
							style="width: 180px; height: 33px;
							color: #222; outline: 0; border: 0; resize: none; font-size: 15px; letter-spacing: -.15px; line-height: 22px;">
						</div>
 					</td>

				</tr>


				<tr id="sellPriceDetail" style="height: 350px; display: none;">
					<td valign="top" style="width: 150px; font-size: 15px; padding-left: 20px; padding-top: 20px;"></td>

					<td align="left">
						<div align="left" 
						style="width: 700px; height:330px; text-align: left; padding-left: 10px; font-size: 14px; border: solid 1px #ebebeb; border-radius: 10px;" >
							<textarea placeholder="판매가를 책정한 사유에 대해서 상세히 설명해주세요." name="sellPriceDetail"></textarea>
						
						</div>
 					</td>

				</tr>
				
	
				<!-- 버튼 자리 -->
				<tr style="height: 200px;" align="center">
					<td colspan="2" valign="top" align="center" style="width: 150px; font-size: 15px; padding-left: 20px; padding-top: 20px;">

						<div style="width: 1000px;">
							<span style="width: 108px;height: 34px; padding: 7px 14px ; margin-right: 10px; border-radius: 10px;cursor: pointer;
							border: 1px solid #222;font-size: 12px;" align="center" id="addAddr" data-bs-toggle="modal" data-bs-target="#addrModal"
							onclick="sendData();" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
							<%-- <input type="hidden" name="userNum" value="${userNum }"/> --%>
								<font style="letter-spacing: -.6px;">저장하기</font>
							</span>

							<span style="width: 108px;height: 34px; padding: 7px 14px ; margin-right: 10px; border-radius: 10px;cursor: pointer;
							border: 1px solid #222;font-size: 12px;" align="center" id="addAddr" data-bs-toggle="modal" data-bs-target="#addrModal"
							onclick="location.href='<%=cp%>/questionList'" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
								<font style="letter-spacing: -.6px;">문의취소</font>
							</span>


						</div>
						
					</td>
				</tr>










				
				</table>
				</form>
				
				
<%-- ajax 결과 출력부분				
				<div id="buyList">
					<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
						<table cellpadding="0" style="border-spacing: 0px;">
						<tr style="cursor: pointer;" onclick="location.href='<%=cp%>/tradeBuyDetail?buyNum=${buyDTO.tradeNum}'">
							<td align="left" style="width: 80px;">
								<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
								border-radius: 12px;">
									<img src="<%=cp%>/resources/image/product/${buyDTO.imageName}" style="width: 65px; height: 65px;">
								</div>
							</td>			
							<td align="left" style="width:620px; padding-left: 16px;">
								<div style="font-size: 14px; color: #222">${buyDTO.engProduct }</div>
								<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
								font-size: 14px; color: rgba(34,34,34,.5);">${buyDTO.userSize }</div>						
							</td>		
							<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;font-weight: 700;"></td>
							<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;">${buyDTO.tradeBuyState }</td>				
						</tr>
						</table>
					</div>
								
				</div>
				
 --%>				
				
				
			</div>		
			</td>
		</tr>
		</table>
	</div>
</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					
				
			
			
			
				
			<!-- contain -->
			</div>
			
			
			
			
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