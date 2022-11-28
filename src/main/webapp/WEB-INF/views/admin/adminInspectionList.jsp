<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.page_button{
	cursor: pointer;
	display: inline-block;
	padding: 0 8px;
	margin: 0 6px;
    font-size: 16px;
    color: rgba(34,34,34,.5);
 
}
#prev{
	cursor: pointer;
	display: inline-block;
	padding: 0 8px;
	margin-right: 15px;
}
#first{
	cursor: pointer;
	display: inline-block;
	padding: 0 8px;
	margin-right: -12px;
}
#next{
	cursor: pointer;
	display: inline-block;
	padding: 0 8px;
	margin-left: 15px;
}
#last{
	cursor: pointer;
	display: inline-block;
	padding: 0 8px;
	margin-left: -12px;
}
.page_button:hover{
	text-decoration: underline;
}
.current_page{
	display: inline-block;
	padding: 0 8px;
	margin: 0 6px;
    font-size: 16px;
    color: #222;
	font-weight: 700;
}
.layer_btn{
	color: #222;
    box-sizing: border-box;
    margin: 0;
    padding: 24px 32px 32px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    padding-top: 32px;
}
.cancel_button{
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    vertical-align: middle;
    text-align: center;
    background-color: #fff;
    padding: 0 18px;
    height: 42px;
    line-height: 40px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
    border: 1px solid #d3d3d3;
    color: rgba(34,34,34,.8);
    width: 120px;
}
.save_button_inactive{
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    text-decoration: none;
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    padding: 0 18px;
    height: 42px;
    line-height: 40px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
    background-color: #ebebeb;
    color: #fff;
    cursor: default;
    width: 120px;
    margin-left: 8px;
}
.save_button_active{
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-block;
    cursor: pointer;
    vertical-align: middle;
    text-align: center;
    padding: 0 18px;
    height: 42px;
    line-height: 40px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
    background-color: #222;
    color: #fff;
    text-decoration: none;
    width: 120px;
    margin-left: 8px;
}

.buy_state_choice, .sell_state_choice{
	margin: 6px;
	display: inline-block; 
	width: calc(33.33333% - 12px);
	height: 52px;
	text-align: center;
	padding: 15px 14px; 
	background-color: #ebebeb;
	border: 1px solid #222;
	border-radius: 12px;
	cursor:pointer;
    font-size: 14px;
    line-height: 20px; 
    white-space: nowrap;
    font-weight: 700;
}
.buy_state, .sell_state{
	margin: 6px;
	display: inline-block; 
	width: calc(33.33333% - 12px);
	height: 52px;
	text-align: center;
	padding: 15px 14px; 
	background-color: #fff;
	border: 1px solid #ebebeb;
	border-radius: 12px;
	cursor:pointer;
    font-size: 14px;
    line-height: 20px; 
    white-space: nowrap;
}

</style>
<script type="text/javascript">
$(function(){
	$('#first').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-arr-page-first" fill="none" viewBox="0 0 19 18" style="width:18px;height:22px;">'
	+'<path stroke="#222" d="M9.5 13.5L5 9l4.5-4.5"></path><path stroke="#222" d="M13.25 13.5L8.75 9l4.5-4.5"></path></svg>')
	$('#prev').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-arr-page-prev" fill="none" viewBox="0 0 17 18" style="width:18px;height:22px;">'
	+'<path stroke="#222" d="M10.5 13.5L6.5 9l4-4.5"></path></svg>')
	$('#next').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-arr-page-next" fill="none" viewBox="0 0 19 18" style="width:18px;height:22px;">'
	+'<path stroke="#222" d="M7.25 4.5l4.5 4.5-4.5 4.5"></path></svg>')
	$('#last').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-arr-page-last" fill="none" viewBox="0 0 19 18" style="width:18px;height:22px;">'
	+'<path stroke="#222" d="M9.5 4.5L14 9l-4.5 4.5"></path><path stroke="#222" d="M5.75 4.5l4.5 4.5-4.5 4.5"></path></svg>')
})
function move_page(pageNum){
	var searchKey = document.getElementById('hidden_searchKey').value
	var searchValue = document.getElementById('hidden_searchValue').value
	var url = "<%=cp%>/adminInspectionList"
	$.post(url,{pageNum:pageNum,searchKey:searchKey,searchValue:searchValue},function(args){
		$('#inspectionList').html(args)
	})
}

function buyStateOpen(tradeNum){
	document.getElementById('hidden_tradeNum').value=tradeNum
	var state=$('#buy'+tradeNum).html().trim()
	document.getElementById('hidden_tradeState').value=state
	$('.buy_state_choice').attr('class','buy_state')
	if(state=='대기 중'){
		$('#buy_tradeWait').attr('class','buy_state_choice')
	}else if(state=='발송완료'){
		$('#buy_tradeSend_ok').attr('class','buy_state_choice')
	}else if(state=='입고대기'){
		$('#buy_tradeReceiving_wait').attr('class','buy_state_choice')
	}else if(state=='입고완료'){
		$('#buy_tradeReceiving_ok').attr('class','buy_state_choice')
	}else if(state=='검수 중'){
		$('#buy_tradeInspection').attr('class','buy_state_choice')
	}else if(state=='검수보류'){
		$('#buy_tradeInspection_hold').attr('class','buy_state_choice')
	}else if(state=='검수합격'){
		$('#buy_tradeInspection_ok').attr('class','buy_state_choice')
	}else if(state=='배송 중'){
		$('#buy_tradeDelivery').attr('class','buy_state_choice')
	}else if(state=='거래실패'){
		$('#buy_tradeFail').attr('class','buy_state_choice')
	}else{
		alert("종료된 거래는 변경할 수 없습니다.")
		return
	}		
	$('#buy_save').attr('class','save_button_inactive')
	$('#tradeBuyStateModal').modal('show')
}

function sellStateOpen(tradeNum){
	document.getElementById('hidden_tradeNum').value=tradeNum
	var state = $('#sell'+tradeNum).html().trim()
	document.getElementById('hidden_tradeState').value=state
	$('.sell_state_choice').attr('class','sell_state')
	if(state=='발송요청'){
		$('#sell_tradeSend_request').attr('class','sell_state_choice')
	}else if(state=='발송완료'){
		$('#sell_tradeSend_ok').attr('class','sell_state_choice')
	}else if(state=='입고대기'){
		$('#sell_tradeReceiving_wait').attr('class','sell_state_choice')
	}else if(state=='입고완료'){
		$('#sell_tradeReceiving_ok').attr('class','sell_state_choice')
	}else if(state=='검수 중'){
		$('#sell_tradeInspection').attr('class','sell_state_choice')
	}else if(state=='검수보류'){
		$('#sell_tradeInspection_hold').attr('class','sell_state_choice')
	}else if(state=='검수합격'){
		$('#sell_tradeInspection_ok').attr('class','sell_state_choice')
	}else if(state=='보류'){
		$('#sell_tradeHold').attr('class','sell_state_choice')
	}else if(state=='거래실패'){
		$('#sell_tradeFail').attr('class','sell_state_choice')
	}else{
		alert("종료된 거래는 변경할 수 없습니다.")
		return
	}	
	$('#sell_save').attr('class','save_button_inactive')
	$('#tradeSellStateModal').modal('show')
}
function choiceBuy(id){
	var state = $('#'+id).html().trim()
	document.getElementById('hidden_newState').value = state
	$('.buy_state_choice').attr('class','buy_state')
	$('#'+id).attr('class','buy_state_choice')
	
	if(state!=document.getElementById('hidden_tradeState').value){
		$('#buy_save').attr('class','save_button_active')
	}else{
		$('#buy_save').attr('class','save_button_inactive')
	}
}

function choiceSell(id){
	var state = $('#'+id).html().trim()
	document.getElementById('hidden_newState').value = state
	$('.sell_state_choice').attr('class','sell_state')
	$('#'+id).attr('class','sell_state_choice')
	if(state!=document.getElementById('hidden_tradeState').value){
		$('#sell_save').attr('class','save_button_active')
	}else{
		$('#sell_save').attr('class','save_button_inactive')
	}
}

function updateBuyState(){
	if(document.getElementById('buy_save').className=='save_button_active'){
		$('#tradeBuyStateModal').modal('hide')
		var tradeNum = document.getElementById('hidden_tradeNum').value
		var newState = document.getElementById('hidden_newState').value
		$('#buy'+tradeNum).html(newState)
		if(newState=='검수보류'){
			$('#buy'+tradeNum).css("color","#ff7500");
		}else if(newState=='거래실패'){
			$('#buy'+tradeNum).css("color","#f15746");
		}else{
			$('#buy'+tradeNum).css("color","#222");
		}
		var url = "<%=cp%>/adminInspectionUpdate";
		$.post(url,{mode:"buy",state:newState,tradeNum:tradeNum},function(args){
			
		});
		
		
	}
}

function updateSellState(){
	if(document.getElementById('sell_save').className=='save_button_active'){
		$('#tradeSellStateModal').modal('hide')
		var tradeNum = document.getElementById('hidden_tradeNum').value
		var newState = document.getElementById('hidden_newState').value
		$('#sell'+tradeNum).html(newState)
		if(newState=='보류'||newState=='검수보류'){
			$('#sell'+tradeNum).css("color","#ff7500");
		}else if(newState=='거래실패'){
			$('#sell'+tradeNum).css("color","#f15746");
		}else{
			$('#sell'+tradeNum).css("color","#222");
		}
		var url = "<%=cp%>/adminInspectionUpdate";
		$.post(url,{mode:"sell",state:newState,tradeNum:tradeNum},function(args){
		
		});
		
	}
}

</script>
</head>
<body>

<c:if test="${inspectLists.size()==0 }">
	<div style="width: 1000px; height: 16px;"></div>
	<div style="width: 1000px; padding: 160px 0px; background-color: #fafafa;" align="center">
		<div>
			<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
			조회 정보가 없습니다.</p>
		</div>
	</div>
</c:if>
<c:if test="${inspectLists.size()!=0 }">
<c:forEach var="inspectDTO" items="${inspectLists }">
<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
	<table cellpadding="0" style="border-spacing: 0px;">
	<tr>
		<td align="center" style="width: 80px;">
			<div style="width: 80px;">T-${inspectDTO.threeTradeNum }</div>
		</td>				
		<td align="center" style="width: 80px;">
			<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
			border-radius: 12px;">
				<img src="/img/${inspectDTO.imageName }" style="width: 65px; height: 65px;">
			</div>
		</td>			
		<td align="left" style="width:300px; padding-left: 16px;">
			<div style="font-size: 14px; color: #222">${inspectDTO.engProduct }</div>
			<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
			font-size: 14px; color: rgba(34,34,34,.5);">${inspectDTO.userSize }</div>						
		</td>		
		<td align="center" style="width: 150px;font-size: 14px;letter-spacing: -.21px;">
			<div style="font-size: 14px; color: #222;margin-bottom: 8px;">${inspectDTO.buyer }</div>
			<c:if test="${inspectDTO.tradeBuyState=='검수보류' }">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #ff7500;" id="buy${inspectDTO.tradeNum }">
			${inspectDTO.tradeBuyState }</div>
			</c:if>
			<c:if test="${inspectDTO.tradeBuyState=='거래취소'||inspectDTO.tradeBuyState=='취소완료' }">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #f15746;"id="buy${inspectDTO.tradeNum }">
			${inspectDTO.tradeBuyState }</div>
			</c:if>
			<c:if test="${inspectDTO.tradeBuyState!='검수보류'&& inspectDTO.tradeBuyState!='거래취소'&&inspectDTO.tradeBuyState!='취소완료'}">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #222;"id="buy${inspectDTO.tradeNum }">
			${inspectDTO.tradeBuyState }</div>
			</c:if>
		</td>
		<td align="center" style="width: 150px;font-size: 14px;letter-spacing: -.21px;">
			<div style="font-size: 14px; color: #222;margin-bottom: 8px;">${inspectDTO.seller }</div>
			<c:if test="${inspectDTO.tradeSellState=='검수보류'|| inspectDTO.tradeSellState=='보류'}">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #ff7500;"id="sell${inspectDTO.tradeNum }">
			${inspectDTO.tradeSellState }</div>
			</c:if>
			<c:if test="${inspectDTO.tradeSellState=='거래실패'||inspectDTO.tradeSellState=='취소완료' }">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #f15746;"id="sell${inspectDTO.tradeNum }">
			${inspectDTO.tradeSellState }</div>
			</c:if>
			<c:if test="${inspectDTO.tradeSellState!='검수보류'&&inspectDTO.tradeSellState!='보류'&& inspectDTO.tradeSellState!='거래실패'&&inspectDTO.tradeSellState!='취소완료'}">
			<div style="letter-spacing: -.21px; font-weight: 700;font-size: 14px; color: #222;"id="sell${inspectDTO.tradeNum }">
			${inspectDTO.tradeSellState }</div>
			</c:if>	
		</td>
		<td align="center" style="width:106px;font-size: 14px;letter-spacing: -.21px;">${inspectDTO.tradeDate }</td>
		<td align="center" style="width:110px;font-size: 14px;letter-spacing: -.21px;">
			<div style="display: inline-flex;">
				<div style="width: 55px;height: 55px; padding: 7px 14px ;border-radius: 10px 0px 0px 10px;cursor: pointer;color:#fff; 
				border: 1px solid #ef6253;font-size: 12px;display: inline-block; background-color: #ef6253" align="center" id="addAddr"
				onclick="buyStateOpen('${inspectDTO.tradeNum}')"class="button">
					<font style="letter-spacing: -.6px; ">구매<br>수정</font>
				</div>
				<div style="width: 55px;height: 55px; padding: 7px 14px ;border-radius: 0px 10px 10px 0px;cursor: pointer;color:#fff;
				border: 1px solid #41b979;font-size: 12px;display: inline-block; background-color: #41b979" align="center" id="addAddr"
				onclick="sellStateOpen('${inspectDTO.tradeNum}')"class="button">
					<font style="letter-spacing: -.6px; ">판매<br>수정</font>
				</div>
			</div>
		</td>				
	</tr>
	</table>
</div>
</c:forEach>
<div style="display: inline-flex ;padding: 28px 0;" align="center">${pageIndexList }</div>
</c:if>

<!-- Modal -->
<div class="modal fade" id="tradeBuyStateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:346x; top:250px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">구매자의 검수정보를 변경합니다</h2>	
				<div style="position: absolute; right: 15px; top: 15px; width: 24px; height: 24px; cursor: pointer;"
				 data-bs-dismiss="modal">
					<div class="lnr lnr-cross" style="font-size: 24px;"></div>
				</div>	
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				<div onclick="choiceBuy('buy_tradeWait')" class="buy_state"id="buy_tradeWait">대기 중</div>
				<div onclick="choiceBuy('buy_tradeSend_ok')" class="buy_state"id="buy_tradeSend_ok">발송완료</div>	
    			<div onclick="choiceBuy('buy_tradeReceiving_wait')" class="buy_state"id="buy_tradeReceiving_wait">입고대기</div>		
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				
				<div onclick="choiceBuy('buy_tradeReceiving_ok')" class="buy_state"id="buy_tradeReceiving_ok">입고완료</div>
				<div onclick="choiceBuy('buy_tradeInspection')" class="buy_state"id="buy_tradeInspection">검수 중</div>	
    			<div style="color: #ff7500;"onclick="choiceBuy('buy_tradeInspection_hold')"class="buy_state"id="buy_tradeInspection_hold">검수보류</div>		
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				
				<div onclick="choiceBuy('buy_tradeInspection_ok')"class="buy_state"id="buy_tradeInspection_ok">검수합격</div>
				<div onclick="choiceBuy('buy_tradeDelivery')"class="buy_state"id="buy_tradeDelivery">배송 중</div>
    			<div style="color:#f15746;"onclick="choiceBuy('buy_tradeFail')" class="buy_state"id="buy_tradeFail">거래실패</div>			
			</div>
			<div class="layer_btn">
				<div class="cancel_button" data-bs-dismiss="modal">취소</div>
				<div class="save_button_inactive" onclick="updateBuyState();" id="buy_save">변경하기</div>
			</div>
		</div>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="tradeSellStateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:346x; top:250px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">판매자의 검수정보를 변경합니다</h2>	
				<div style="position: absolute; right: 15px; top: 15px; width: 24px; height: 24px; cursor: pointer;"
				 data-bs-dismiss="modal">
					<div class="lnr lnr-cross" style="font-size: 24px;"></div>
				</div>	
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				<div onclick="choiceSell('sell_tradeSend_request')"class="sell_state"id="sell_tradeSend_request">발송요청</div>
				<div onclick="choiceSell('sell_tradeSend_ok')"class="sell_state"id="sell_tradeSend_ok">발송완료</div>	
    			<div onclick="choiceSell('sell_tradeReceiving_wait')"class="sell_state"id="sell_tradeReceiving_wait">입고대기</div>		
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				
				<div onclick="choiceSell('sell_tradeReceiving_ok')"class="sell_state"id="sell_tradeReceiving_ok">입고완료</div>
				<div onclick="choiceSell('sell_tradeInspection')"class="sell_state"id="sell_tradeInspection">검수 중</div>
    			<div style="color: #ff7500;" onclick="choiceSell('tradeInspection_hold')"class="sell_state"id="tradeInspection_hold">검수보류</div>			
			</div>
			<div style="height: 64px;padding: 0px 26px 0px; display: flex;" align="center" >
				
				<div onclick="choiceSell('sell_tradeInspection_ok')"class="sell_state"id="sell_tradeInspection_ok">검수합격</div>
				<div style="color: #ff7500;" onclick="choiceSell('sell_tradeHold')"class="sell_state"id="sell_tradeHold">보류</div>
    			<div style="color:#f15746;" onclick="choiceSell('sell_tradeFail')"class="sell_state"id="sell_tradeFail">거래실패</div>			
			</div>
			<div class="layer_btn">
				<div class="cancel_button" data-bs-dismiss="modal">취소</div>
				<div class="save_button_inactive" onclick="updateSellState();" id="sell_save">변경하기</div>
			</div>
		</div>
	</div>
</div>



<input type="hidden" id="hidden_newState" value="">
<input type="hidden" id="hidden_tradeState" value="">
<input type="hidden" id="hidden_tradeNum" value="">
<input type="hidden" id="hidden_searchKey" value="${searchKey }">
<input type="hidden" id="hidden_searchValue" value="${searchValue }">
</body>
</html>