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
.choiceType{
	margin:0px;
	height: 68px;
	padding-top: 12px;
	border-bottom: 2px solid #222;
	float: left;
	cursor: pointer;
}

.unchoiceType{
	margin:0px;
	height: 68px;
	padding-top: 12px;
	border-bottom: 1px solid #d3d3d3;
	float: left;
	cursor: pointer;
}

.choiceCount{
	height: 24px;
	font-size: 20px; 
	color: #f15746; 
	font-weight: 700;
	line-height: 24px;
	letter-spacing: -.1px;
}

.unchoiceCount{
	height: 24px;
	font-size: 20px; 
	color: #222; 
	font-weight: 700;
	line-height: 24px;
	letter-spacing: -.1px;
}

.choiceTitle{
	height: 17px;
	font-size: 13px; 
	color: #222;
	letter-spacing: -.07px;
	font-weight: 700;
}
.unchoiceTitle{
	height: 17px;
	font-size: 13px; 
	color: rgba(34,34,34,.5);
	letter-spacing: -.07px;
}

.active_month{
	background-color: #222;
    border-color: #d3d3d3;
    color: #fff;
    display: flex;
    padding: 0 12px;
    min-width: 62px;
    height: 32px;
    line-height: 30px;
    border: 1px solid #ebebeb;
    font-size: 13px;
    letter-spacing: -.08px;
    justify-content: center;
    float: left;
    cursor: pointer;
}

.inactive_month{
	display: flex;
    padding: 0 12px;
    min-width: 62px;
    height: 32px;
    line-height: 30px;
    background-color: #fff;
    border: 1px solid #ebebeb;
    font-size: 13px;
    letter-spacing: -.08px;
    color: rgba(34,34,34,.8);
	justify-content: center;
	float: left;
	cursor: pointer;
}
.choiceDay{
    font-size: 13px;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
	position: relative;
    padding: 0 30px 0 12px;
    display: inline-block;
    width: 120px;
    height: 32px;
    line-height: 30px;
    vertical-align: top;
    border: 1px solid #ebebeb;
    background-color: #fff;
    cursor: pointer;
    float: left;
}

.active_search{
	padding: 0 16px;
	width: 59.88px;
    height: 32px;
    line-height: 30px;
    font-size: 13px;
    letter-spacing: -.07px;
    color: #fff;
    border: 1px solid #ebebeb;
    background-color: #222;
    cursor: pointer;
    float: left;
	margin-left: 4px;
}
.inactive_search{
	padding: 0 16px;
	width: 59.88px;
    height: 32px;
    line-height: 30px;
    font-size: 13px;
    letter-spacing: -.07px;
    color: rgba(34,34,34,.8);
    border: 1px solid #ebebeb;
    background-color: #fff;
    cursor: pointer;
    float: left;
	margin-left: 4px;
}

.dotMark{
content: "";
    position: absolute;
    top: 50%;
    left: 0;
    transform: translateY(-50%);
    width: 3px;
    height: 3px;
    background-color: rgba(34,34,34,.5);
    border-radius: 50%;
}
.stateFilter{
	position: relative;
	color: #222;
    padding: 5px 30px 5px 10px;
    display: inline-block;
    width: 120px;
    height: 36px;
    line-height: 24px;
    background-color: #fff;
    border: 1px solid #d3d3d3;
    border-radius: 12px;
    font-size: 13px;
    letter-spacing: -.07px;
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
function datePickerSet(sDate, eDate, flag) {

    //시작 ~ 종료 2개 짜리 달력 datepicker	
    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
        var sDay = sDate.val();
        var eDay = eDate.val();

        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) {		
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); 

            var edp = eDate.datepicker().data("datepicker");
            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  
        }

        if (!isValidStr(eDay)) {
        	var date = new Date();
        	var term = document.getElementById("hiddenMonth").value;
       
            sDate.datepicker({
                maxDate: date
            });
        }
        sDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });

        if (!isValidStr(sDay)) {
        	var date = new Date(sDay.replace(/-/g, "/"));
        	var term = document.getElementById("hiddenMonth").value;
     
            eDate.datepicker({
                minDate: date
            });
           
        }
        eDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });
    } else if (!isValidStr(sDate)) {
        var sDay = sDate.val();
        if (flag && !isValidStr(sDay)) { 		
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); 
        }

        sDate.datepicker({
            language: 'ko',
            autoClose: true
        });
    }


    function isValidStr(str) {
        if (str == null || str == undefined || str == "")
            return true;
        else
            return false;
    }
}

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
function filter(state){
	var mode = document.getElementById("hiddenMode").value;
	var startDate = document.getElementById("datepicker1").value;
	var endDate = document.getElementById("datepicker2").value;
	
	var start = new Date(startDate)
	var end = new Date(endDate)
	
	if(start>end){
		alert("종료일을 선택해 주세요")	
		return;
	}
	
	if(mode=='bid'){
		if(state=='total'){
			document.getElementById("bidTotal").style.borderColor="#222";
			document.getElementById("bidBid").style.borderColor="#ebebeb";
			document.getElementById("bidEnd").style.borderColor="#ebebeb";
			document.getElementById("bidTotal").style.fontWeight="700";
			document.getElementById("bidBid").style.fontWeight="normal";
			document.getElementById("bidEnd").style.fontWeight="normal";
			document.getElementById("hiddenBidState").value="total";
			$("#bidFilterTitle").html("전체")
			
		}
		if(state=='bid'){
			document.getElementById("bidTotal").style.borderColor="#ebebeb";
			document.getElementById("bidBid").style.borderColor="#222";
			document.getElementById("bidEnd").style.borderColor="#ebebeb";
			document.getElementById("bidTotal").style.fontWeight="normal";
			document.getElementById("bidBid").style.fontWeight="700";
			document.getElementById("bidEnd").style.fontWeight="normal";
			document.getElementById("hiddenBidState").value="bid";
			$("#bidFilterTitle").html("입찰 중")
		}
		if(state=='end'){
			document.getElementById("bidTotal").style.borderColor="#ebebeb";
			document.getElementById("bidBid").style.borderColor="#ebebeb";
			document.getElementById("bidEnd").style.borderColor="#222";
			document.getElementById("bidTotal").style.fontWeight="normal";
			document.getElementById("bidBid").style.fontWeight="normal";
			document.getElementById("bidEnd").style.fontWeight="700";
			document.getElementById("hiddenBidState").value="end";
			$("#bidFilterTitle").html("기한만료")
		}
		document.getElementById("wishPriceText").style.fontWeight="normal";
		document.getElementById("validDayText").style.fontWeight="normal";	
		document.getElementById("wishPrice").className="normal";
		document.getElementById("validDay").className='normal';
		
		$("#wishPrice").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
		$("#validDay").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
	}
	if(mode=='trade'){
		if(state=='total'){
			document.getElementById("tradeTotal").style.borderColor="#222";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="700";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="total";	
		
			$("#tradeFilterTitle").html("전체")
		}
		
		if(state=='wait'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#222";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="700";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="wait";
			$("#tradeFilterTitle").html("대기 중")
		}
		
		if(state=='send_ok'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#222";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="700";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="send_ok";
			$("#tradeFilterTitle").html("발송완료")
		}
		
		if(state=='receiving_wait'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#222";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="700";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="receiving_wait";
			$("#tradeFilterTitle").html("입고대기")
		}
		
		if(state=='receiving_ok'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#222";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="700";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="receiving_ok";
			$("#tradeFilterTitle").html("입고완료")
		}
		
		if(state=='inspection'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#222";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="700";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="inspection";
			$("#tradeFilterTitle").html("검수 중")
		}
		
		if(state=='inspection_hold'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#222";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="700";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="inspection_hold";
			$("#tradeFilterTitle").html("검수보류")
		}
		
		if(state=='inspection_ok'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#222";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="700";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="inspection_ok";
			$("#tradeFilterTitle").html("검수합격")
		}
		
		if(state=='delivery'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#222";
			document.getElementById("tradeFail").style.borderColor="#ebebeb";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="700";
			document.getElementById("tradeFail").style.fontWeight="normal";
			
			document.getElementById("hiddenTradeState").value="delivery";
			$("#tradeFilterTitle").html("배송 중")
		}
		
		if(state=='trade_fail'){
			document.getElementById("tradeTotal").style.borderColor="#ebebeb";
			document.getElementById("tradeWait").style.borderColor="#ebebeb";
			document.getElementById("tradeSend_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_wait").style.borderColor="#ebebeb";
			document.getElementById("tradeReceiving_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_hold").style.borderColor="#ebebeb";
			document.getElementById("tradeInspection_ok").style.borderColor="#ebebeb";
			document.getElementById("tradeDelivery").style.borderColor="#ebebeb";
			document.getElementById("tradeFail").style.borderColor="#222";
			
			document.getElementById("tradeTotal").style.fontWeight="normal";
			document.getElementById("tradeWait").style.fontWeight="normal";
			document.getElementById("tradeSend_ok").style.fontWeight="normal";
			document.getElementById("tradeReceiving_wait").style.fontWeight="normal";
			document.getElementById("tradeReceiving_ok").style.fontWeight="normal";
			document.getElementById("tradeInspection").style.fontWeight="normal";
			document.getElementById("tradeInspection_hold").style.fontWeight="normal";
			document.getElementById("tradeInspection_ok").style.fontWeight="normal";
			document.getElementById("tradeDelivery").style.fontWeight="normal";
			document.getElementById("tradeFail").style.fontWeight="700";
			
			document.getElementById("hiddenTradeState").value="trade_fail";
			$("#tradeFilterTitle").html("거래실패")
		}
		
		document.getElementById("tradeStateText").style.fontWeight="normal";
		document.getElementById("tradeState").className='normal'
		$("#tradeState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
	}
	if(mode=='end'){
		if(state=='total'){
			document.getElementById("endTotal").style.borderColor="#222";
			document.getElementById("endDelivery_ok").style.borderColor="#ebebeb";
			document.getElementById("endCancel").style.borderColor="#ebebeb";
			
			document.getElementById("endTotal").style.fontWeight="700";
			document.getElementById("endDelivery_ok").style.fontWeight="normal";
			document.getElementById("endCancel").style.fontWeight="normal";
			
			document.getElementById("hiddenEndState").value="total";
			$("#endFilterTitle").html("전체")
			
		}
		if(state=='delivery_ok'){
			document.getElementById("endTotal").style.borderColor="#ebebeb";
			document.getElementById("endDelivery_ok").style.borderColor="#222";
			document.getElementById("endCancel").style.borderColor="#ebebeb";
			
			document.getElementById("endTotal").style.fontWeight="normal";
			document.getElementById("endDelivery_ok").style.fontWeight="700";
			document.getElementById("endCancel").style.fontWeight="normal";
			
			document.getElementById("hiddenEndState").value="delivery_ok";
			$("#endFilterTitle").html("배송완료")
		}
		if(state=='cancel'){
			document.getElementById("endTotal").style.borderColor="#ebebeb";
			document.getElementById("endDelivery_ok").style.borderColor="#ebebeb";
			document.getElementById("endCancel").style.borderColor="#222";
			
			document.getElementById("endTotal").style.fontWeight="normal";
			document.getElementById("endDelivery_ok").style.fontWeight="normal";
			document.getElementById("endCancel").style.fontWeight="700";
			
			document.getElementById("hiddenEndState").value="cancel";
			$("#endFilterTitle").html("취소완료")
		}
		document.getElementById("buyDateText").style.fontWeight="normal";
		document.getElementById("endStateText").style.fontWeight="normal";
		document.getElementById("endState").className='normal'
		document.getElementById("buyDate").className='normal'
		$("#buyDate").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
		$("#endState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
	}
	var url = "<%=cp%>/buyList";
	$.post(url,{state:state,mode:mode,startDate:startDate,endDate:endDate},function(args){
		$("#buyList").html(args);
	});
	
}


function choiceBid(){
	document.getElementById("bidTab").className="choiceType";
	document.getElementById("bidCount").className="choiceCount";
	document.getElementById("bidTitle").className="choiceTitle";
	document.getElementById("tradeTab").className="unchoiceType";
	document.getElementById("tradeCount").className="unchoiceCount";
	document.getElementById("tradeTitle").className="unchoiceTitle";
	document.getElementById("endTab").className="unchoiceType";
	document.getElementById("endCount").className="unchoiceCount";
	document.getElementById("endTitle").className="unchoiceTitle";
	document.getElementById("bidFilter").style.display="block";
	document.getElementById("tradeFilter").style.display="none";
	document.getElementById("endFilter").style.display="none";
	document.getElementById("hiddenMode").value="bid";
	
	filter('total')
}
function choiceTrade(){
	document.getElementById("bidTab").className="unchoiceType";
	document.getElementById("bidCount").className="unchoiceCount";
	document.getElementById("bidTitle").className="unchoiceTitle";
	document.getElementById("tradeTab").className="choiceType";
	document.getElementById("tradeCount").className="choiceCount";
	document.getElementById("tradeTitle").className="choiceTitle";
	document.getElementById("endTab").className="unchoiceType";
	document.getElementById("endCount").className="unchoiceCount";
	document.getElementById("endTitle").className="unchoiceTitle";
	document.getElementById("bidFilter").style.display="none";
	document.getElementById("tradeFilter").style.display="block";
	document.getElementById("endFilter").style.display="none";
	document.getElementById("hiddenMode").value="trade";
	
	filter('total')
}
function choiceEnd(){
	document.getElementById("bidTab").className="unchoiceType";
	document.getElementById("bidCount").className="unchoiceCount";
	document.getElementById("bidTitle").className="unchoiceTitle";
	document.getElementById("tradeTab").className="unchoiceType";
	document.getElementById("tradeCount").className="unchoiceCount";
	document.getElementById("tradeTitle").className="unchoiceTitle";
	document.getElementById("endTab").className="choiceType";
	document.getElementById("endCount").className="choiceCount";
	document.getElementById("endTitle").className="choiceTitle";
	document.getElementById("bidFilter").style.display="none";
	document.getElementById("tradeFilter").style.display="none";
	document.getElementById("endFilter").style.display="block";
	document.getElementById("hiddenMode").value="end";
	
	filter('total')
}
function choice1month(){
	document.getElementById('datepicker1').value=document.getElementById('hidden1Month').value
	document.getElementById('datepicker2').value=document.getElementById('hiddenToday').value
	datePickerSet($("#datepicker1"), $("#datepicker2"), true);
	document.getElementById("1month").className="active_month";
	document.getElementById("3month").className="inactive_month";
	document.getElementById("6month").className="inactive_month";
	document.getElementById("searchButton").className="inactive_search";
	document.getElementById("hiddenMonth").value="1";
	filter('total')
}
function choice3month(){
	document.getElementById('datepicker1').value=document.getElementById('hidden3Month').value
	document.getElementById('datepicker2').value=document.getElementById('hiddenToday').value
	datePickerSet($("#datepicker1"), $("#datepicker2"), true);
	document.getElementById("1month").className="inactive_month";
	document.getElementById("3month").className="active_month";
	document.getElementById("6month").className="inactive_month";
	document.getElementById("searchButton").className="inactive_search";
	document.getElementById("hiddenMonth").value="3";
	filter('total')
}
function choice6month(){
	document.getElementById('datepicker1').value=document.getElementById('hidden6Month').value
	document.getElementById('datepicker2').value=document.getElementById('hiddenToday').value
	datePickerSet($("#datepicker1"), $("#datepicker2"), true);
	document.getElementById("1month").className="inactive_month";
	document.getElementById("3month").className="inactive_month";
	document.getElementById("6month").className="active_month";
	document.getElementById("searchButton").className="inactive_search";
	document.getElementById("hiddenMonth").value="6";
	filter('total')
}

function changeAlign(id){
	
	if(id=='wishPrice'){
		document.getElementById("wishPriceText").style.fontWeight="700";
		document.getElementById("validDayText").style.fontWeight="normal";
		if(document.getElementById("wishPrice").className=='asc'){
			document.getElementById("wishPrice").className='desc'
			document.getElementById("validDay").className='normal'
			$("#wishPrice").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8z'/><path fill='#222' d='M4 11l4-5 4 5H4z'/></svg>")			
			$("#validDay").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('priceAsc')
		}else{
			document.getElementById("wishPrice").className='asc'
			document.getElementById("validDay").className='normal'
			$("#wishPrice").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M4 11l4-5 4 5H4z'/><path fill='#222' d='M12 13l-4 5-4-5h8z'/></svg>")
			$("#validDay").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('priceDesc')
		}
	}
	if(id=='validDay'){
		document.getElementById("validDayText").style.fontWeight="700";
		document.getElementById("wishPriceText").style.fontWeight="normal";
		if(document.getElementById("validDay").className=='asc'){
			document.getElementById("validDay").className='desc'
			document.getElementById("wishPrice").className='normal'
			$("#validDay").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8z'/><path fill='#222' d='M4 11l4-5 4 5H4z'/></svg>")			
			$("#wishPrice").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('validAsc')
		}else{
			document.getElementById("validDay").className='asc'
			document.getElementById("wishPrice").className='normal'
			$("#validDay").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M4 11l4-5 4 5H4z'/><path fill='#222' d='M12 13l-4 5-4-5h8z'/></svg>")
			$("#wishPrice").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('validDesc')
		}
	}
	if(id=='tradeState'){
		document.getElementById("tradeStateText").style.fontWeight="700";
		if(document.getElementById("tradeState").className=='asc'){
			document.getElementById("tradeState").className='desc'
			$("#tradeState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8z'/><path fill='#222' d='M4 11l4-5 4 5H4z'/></svg>")			
			sort('tradeStateAsc')
		}else{
			document.getElementById("tradeState").className='asc'
			$("#tradeState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M4 11l4-5 4 5H4z'/><path fill='#222' d='M12 13l-4 5-4-5h8z'/></svg>")
			sort('tradeStateDesc')
		}
	}
	if(id=='buyDate'){
		document.getElementById("buyDateText").style.fontWeight="700";
		document.getElementById("endStateText").style.fontWeight="normal";
		if(document.getElementById("buyDate").className=='asc'){
			document.getElementById("buyDate").className='desc'
			document.getElementById("endState").className='normal'
			$("#buyDate").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8z'/><path fill='#222' d='M4 11l4-5 4 5H4z'/></svg>")			
			$("#endState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('tradeDateAsc')
		}else{
			document.getElementById("buyDate").className='asc'
			document.getElementById("endState").className='normal'
			$("#buyDate").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M4 11l4-5 4 5H4z'/><path fill='#222' d='M12 13l-4 5-4-5h8z'/></svg>")
			$("#endState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('tradeDateDesc')
		}
	}
	if(id=='endState'){
		document.getElementById("endStateText").style.fontWeight="700";
		document.getElementById("buyDateText").style.fontWeight="normal";
		if(document.getElementById("endState").className=='asc'){
			document.getElementById("endState").className='desc'
			document.getElementById("buyDate").className='normal'
			$("#endState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8z'/><path fill='#222' d='M4 11l4-5 4 5H4z'/></svg>")			
			$("#buyDate").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('endStateAsc')
		}else{
			document.getElementById("endState").className='asc'
			document.getElementById("buyDate").className='normal'
			$("#endState").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M4 11l4-5 4 5H4z'/><path fill='#222' d='M12 13l-4 5-4-5h8z'/></svg>")
			$("#buyDate").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='24' fill='none' viewBox='0 0 16 24'><path fill='#D3D3D3' d='M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z'/></svg>")			
			sort('endStateDesc')
		}
	}
	
}

function openCalendar1(){
	$("#datepicker1").focus()
}
function openCalendar2(){
	$("#datepicker2").focus()
}

function search(){
	
	document.getElementById("searchButton").className="active_search";
	document.getElementById("1month").className="inactive_month";
	document.getElementById("3month").className="inactive_month";
	document.getElementById("6month").className="inactive_month";
	
	filter('total')
	
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
			<td style="padding-left: 40px;width: 1000px;" align="center">
			<div style="padding-top:5px">
				<div style="color: #222; margin: 0px; display: flex; padding: 5px 0;">
					<div style="float: left; width: 1000px;" align="left">
						<h3 style="font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;">구매 내역</h3>
					</div> 
				</div>
				<div style="width: 1000px; height: 68px; margin-top: 20px;">
					<div style="width: 333.33px;" class="choiceType" align="center" id="bidTab" onclick="choiceBid();">
						<div class="choiceCount" id="bidCount">${bidBuyCount }</div>
						<div class="choiceTitle" id="bidTitle">구매 입찰</div>
					</div>
					<div style="width: 333.33px;" class="unchoiceType" align="center" id="tradeTab" onclick="choiceTrade();">
						<div class="unchoiceCount" id="tradeCount">${tradeBuyCount }</div>
						<div class="unchoiceTitle" id="tradeTitle">진행 중</div>
					</div>
					<div style="width: 333.34px;" class="unchoiceType" align="center" id="endTab" onclick="choiceEnd();">
						<div class="unchoiceCount" id="endCount">${endBuyCount }</div>
						<div class="unchoiceTitle" id="endTitle">종료</div>
					</div>
				</div>
				<div style="width: 1000px;height: 61px;padding: 14px;justify-content: center;display: flex;background-color: #fafafa;
				border-bottom: 1px solid #ebebeb;">
					<div style="margin-right: 20px; width: 220.14px;height: 32px;">
						<div class="active_month" style="width: 88.14px; height: 32px;"onclick="choice1month();"
						id="1month">최근 1개월</div>
						<div class="inactive_month" style="width: 62px; height: 32px;margin-left: 4px;"onclick="choice3month();"
						id="3month">3개월</div>
						<div class="inactive_month" style="width: 62px; height: 32px;margin-left: 4px;"onclick="choice6month();"
						id="6month">6개월</div>
					</div>
					<div style="width: 313.19px; height: 32px;">
						<div class="choiceDay" align="left"  onclick="openCalendar1();">
							<input type="text" readonly="readonly" value="${oneMonthAgo }" style="border: 0px; outline: none; width: 90px; cursor: pointer;"
							id="datepicker1">
							<svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 6px; right: 12px;cursor: pointer;">
							    <path fill="#8977ad" d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 
							    0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"/>
							</svg>
						</div>
						<div style="width: 9.31px;height: 32px;font-size: 14px;color: #222;float: left;padding-top: 4px;">~</div>
						<div class="choiceDay" align="left"  onclick="openCalendar2();">
							<input type="text" readonly="readonly" value=${today } style="border: 0px; outline: none; width: 90px; cursor: pointer;"
							id="datepicker2">
							<svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 6px; right: 12px;cursor: pointer;">
							    <path fill="#8977ad" d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 
							    0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"/>
							</svg>
							
						</div>
						<div class="inactive_search" onclick="search();" id="searchButton">조회</div>
					</div>
				</div>
				<ul style="width: 1000px; height: 56px; padding: 12px 0px;list-style: none;margin: 0;color: #222;box-sizing: border-box;">
					<li style=" padding-left: 7px;font-size: 12px;letter-spacing: -.06px;color: rgba(34,34,34,.5); position: relative;">
					<div class="dotMark"></div>
					<div align="left" style="height: 16px;">한 번에 조회 가능한 기간은 최대 6개월입니다.</div>
					</li>
					<li style=" padding-left: 7px;font-size: 12px;letter-spacing: -.06px;color: rgba(34,34,34,.5); position: relative;">
					<div class="dotMark"></div>
					<div align="left" style="height: 16px;">기간별 조회 결과는 입찰일 기준으로 노출됩니다.</div>
					</li>
				</ul>
				<div id="bidFilter" style="display: block;">
					<div style="width: 1000px; height: 60px;display: flex;padding: 12px;margin:0px;align-items: center;border-bottom: 1px solid #ebebeb;">
						<div class="stateFilter" align="left" data-bs-toggle="modal" data-bs-target="#bidStateModal"><div id="bidFilterTitle">전체</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 6px;right: 5px;">
								<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
								<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
							</svg>
						</div>
						<div style="width: 294px;height: 24px;margin-left: auto; align-items: center;text-align: right;display: flex;">
							<div style="width: 140px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" onclick="changeAlign('wishPrice');">
	    						<div id="wishPriceText">구매 희망가</div>
	    						<div style="width: 16px; height: 24px;position: absolute;top:0px ;right: -4px;"id="wishPrice" class="normal">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="none" viewBox="0 0 16 24">
								    	<path fill="#D3D3D3" d="M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z"/>
									</svg>
								</div>
	    					</div>
							<div style="width: 134px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" onclick="changeAlign('validDay');">
	    						<div id="validDayText">만료일</div>
	    						<div style="width: 16px; height: 24px;position: absolute; top:0px ;right: -4px;"id="validDay" class="normal">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="none" viewBox="0 0 16 24">
								    	<path fill="#D3D3D3" d="M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z"/>
									</svg>
								</div>    				
	    					</div>
						</div>
					</div>
				</div>
				<div id="tradeFilter" style="display: none;">
					<div style="width: 1000px; height: 60px;display: flex;padding: 12px;align-items: center;border-bottom: 1px solid #ebebeb;">
						<div class="stateFilter" align="left" data-bs-toggle="modal" data-bs-target="#tradeStateModal"><div id="tradeFilterTitle">전체</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 6px;right: 5px;">
								<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
								<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
							</svg>
						</div>
						<div style="width: 294px;height: 24px;margin-left: auto; align-items: center;text-align: right;display: flex;">
							<div style="width: 140px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" ></div>
							<div style="width: 134px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" onclick="changeAlign('tradeState');">
	    						<div id="tradeStateText">상태</div>
	    						<div style="width: 16px; height: 24px;position: absolute; top:0px ;right: -4px;"id="tradeState" class="normal">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="none" viewBox="0 0 16 24">
								    	<path fill="#D3D3D3" d="M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z"/>
									</svg>
								</div>    				
	    					</div>
						</div>
					</div>
				</div>
				<div id="endFilter" style="display: none;">
					<div style="width: 1000px; height: 60px;display: flex;padding: 12px;align-items: center;border-bottom: 1px solid #ebebeb;">
						<div class="stateFilter" align="left" data-bs-toggle="modal" data-bs-target="#endStateModal"><div id="endFilterTitle">전체</div>
							<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"
							style="position: absolute;top: 6px;right: 5px;">
								<circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle>
								<path fill="#000" d="M17 10l-5 5-5-5h10z"></path>
							</svg>
						</div>
						<div style="width: 294px;height: 24px;margin-left: auto; align-items: center;text-align: right;display: flex;">
							<div style="width: 140px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" onclick="changeAlign('buyDate');">
	    						<div id="buyDateText">구매일</div>
	    						<div style="width: 16px; height: 24px;position: absolute;top:0px ;right: -4px;"id="buyDate" class="normal">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="none" viewBox="0 0 16 24">
								    	<path fill="#D3D3D3" d="M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z"/>
									</svg>
								</div>
	    					</div>
							<div style="width: 134px;height: 24px;margin-left: 10px;font-size: 13px;letter-spacing: -.07px;cursor:pointer;
	    					line-height: 24px;color: #222;padding-right: 16px;position: relative;"align="right" onclick="changeAlign('endState');">
	    						<div id="endStateText">상태</div>
	    						<div style="width: 16px; height: 24px;position: absolute; top:0px ;right: -4px;"id="endState" class="normal">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="24" fill="none" viewBox="0 0 16 24">
								    	<path fill="#D3D3D3" d="M12 13l-4 5-4-5h8zM4 11l4-5 4 5H4z"/>
									</svg>
								</div>    				
	    					</div>
						</div>
					</div>
				</div>
				<div id="buyList"></div>
			</div>		
			</td>
		</tr>
		</table>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="bidStateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:154px; top:380px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">선택한 상태 보기</h2>	
				<div style="position: absolute; right: 15px; top: 15px; width: 24px; height: 24px; cursor: pointer;"
				 data-bs-dismiss="modal">
					<div class="lnr lnr-cross" style="font-size: 24px;"></div>
				</div>	
			</div>
			<div style="height: 98px;padding: 4px 26px 26px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #222;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('total')"
    			id="bidTotal">전체</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('bid')"
    			id="bidBid">입찰 중</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;color:#f15746; "data-bs-dismiss="modal" onclick="filter('end')"
    			id="bidEnd">기한만료</div>			
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="tradeStateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:346x; top:380px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">선택한 상태 보기</h2>	
				<div style="position: absolute; right: 15px; top: 15px; width: 24px; height: 24px; cursor: pointer;"
				 data-bs-dismiss="modal">
					<div class="lnr lnr-cross" style="font-size: 24px;"></div>
				</div>	
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #222;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('total')"
    			id="tradeTotal">전체</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('wait')"
    			id="tradeWait">대기 중</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('send_ok')"
    			id="tradeSend_ok">발송완료</div>			
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('receiving_wait')"
    			id="tradeReceiving_wait">입고대기</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('receiving_ok')"
    			id="tradeReceiving_ok">입고완료</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap; "data-bs-dismiss="modal" onclick="filter('inspection')"
    			id="tradeInspection">검수 중</div>			
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;color: #ff7500; "data-bs-dismiss="modal" onclick="filter('inspection_hold')"
    			id="tradeInspection_hold">검수보류</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('inspection_ok')"
    			id="tradeInspection_ok">검수합격</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('delivery')"
    			id="tradeDelivery">배송 중</div>			
			</div>
			<div style="height: 64px;padding: 0px 26px 0px;margin-bottom:26px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;color:#f15746; "data-bs-dismiss="modal" onclick="filter('trade_fail')"
    			id="tradeFail">거래실패</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px;font-size: 14px;line-height: 20px; white-space: nowrap;"></div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px;font-size: 14px;line-height: 20px; white-space: nowrap;"></div>				
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="endStateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:154px; top:380px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">선택한 상태 보기</h2>	
				<div style="position: absolute; right: 15px; top: 15px; width: 24px; height: 24px; cursor: pointer;"
				 data-bs-dismiss="modal">
					<div class="lnr lnr-cross" style="font-size: 24px;"></div>
				</div>	
			</div>
			<div style="height: 98px;padding: 4px 26px 26px; display: flex;" align="center" >
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 font-weight: 700;padding: 15px 14px; background-color: #fff;border: 1px solid #222;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('total')"
    			id="endTotal">전체</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;"data-bs-dismiss="modal" onclick="filter('delivery_ok')"
    			id="endDelivery_ok">배송완료</div>
				<div style="margin: 6px;display: inline-block; width: calc(33.33333% - 12px);height: 52px;text-align: center;
   				 padding: 15px 14px; background-color: #fff;border: 1px solid #ebebeb;border-radius: 12px;cursor:pointer;
    			font-size: 14px;line-height: 20px; white-space: nowrap;color:#f15746; "data-bs-dismiss="modal" onclick="filter('cancel')"
    			id="endCancel">취소완료</div>			
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="hiddenBidState" value="normal">
<input type="hidden" id="hiddenTradeState" value="normal">
<input type="hidden" id="hiddenEndState" value="normal">
<input type="hidden" id="hiddenMode" value="bid">
<input type="hidden" id="hiddenMonth" value="1">

<input type="hidden" id="hiddenToday" value="${today }">
<input type="hidden" id="hidden1Month" value="${oneMonthAgo }">
<input type="hidden" id="hidden3Month" value="${threeMonthAgo }">
<input type="hidden" id="hidden6Month" value="${sixMonthAgo }">
			
				
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