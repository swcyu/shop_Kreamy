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

function delete_data(count,engProduct){
	
	if(count>0){
		alert('입찰 또는 거래가 이루어진 상품은 삭제할 수 없습니다.')
	}else{
 		var url = "<%=cp%>/adminProductDelete";
		$.post(url,{engProduct:engProduct},function(args){
			$("#productList").html(args);
			$('#searchValue').val('')
		});
	}
}

function move_page(pageNum){
	
	var searchValue = document.getElementById('hidden_search').value
	var url = "<%=cp%>/adminProductList"
	$.post(url,{pageNum:pageNum,searchValue:searchValue},function(args){
		$('#productList').html(args)
	})
}

</script>
</head>
<body>
<c:if test="${prodLists.size()==0 }">
	<div style="width: 1000px; height: 16px;"></div>
	<div style="width: 1000px; padding: 160px 0px; background-color: #fafafa;" align="center">
		<div>
			<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
			조회 정보가 없습니다.</p>
		</div>
	</div>
</c:if>
<c:if test="${prodLists.size()!=0 }">
<c:forEach var="prodDTO" items="${prodLists }">
<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
	<table cellpadding="0" style="border-spacing: 0px;">
	<tr style="height: 90px;">			
		<td align="left" style="width: 80px;">
			<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
			border-radius: 12px;">
				<img src="/img/${prodDTO.imageName}" style="width: 65px; height: 65px;">
			</div>
		</td>			
		<td align="left" style="width:320px; padding-left: 16px;">
			<div style="font-size: 14px; color: rgba(34,34,34,.5);font-weight: 700;">
			<c:if test="${prodDTO.brandImage==null }">${prodDTO.brandName }</c:if>
			<c:if test="${prodDTO.brandImage!=null }"><img src="/img/${prodDTO.brandImage}" style="height: 21px;"></c:if>
			</div>
			<div style="margin-top: 0;letter-spacing: -.21px; font-size: 14px; color: #222;">${prodDTO.styleNum==null ? '-' : prodDTO.styleNum}</div>						
			<div style="margin-top: 0px;letter-spacing: -.21px; font-size: 14px; color: #222;">${prodDTO.engProduct }</div>						
		</td>		
		<td align="center" style="width: 158px;font-size: 14px;letter-spacing: -.21px;font-weight: 700;">
			<div style="font-size: 14px;color: #222; ">구매입찰 수</div>
			<div style="margin-top: 8px;letter-spacing: -.21px; font-size: 14px; color: #f15746;font-weight: 700;">
			${prodDTO.bidBuyCount }</div>
		</td>
		<td align="center" style="width: 158px;font-size: 14px;letter-spacing: -.21px;font-weight: 700;" >
			<div style="font-size: 14px;color: #222; ">판매입찰 수</div>
			<div style="margin-top: 8px;letter-spacing: -.21px; font-size: 14px; color: #31b46e;font-weight: 700;">
			${prodDTO.bidSellCount }</div>
		</td>
		<td align="center" style="width: 158px;font-size: 14px;letter-spacing: -.21px;font-weight: 700;">
			<div style="font-size: 14px;color: #222; ">거래 수</div>
			<div style="margin-top: 8px;letter-spacing: -.21px; font-size: 14px; color: #8977ad;font-weight: 700;">
			${prodDTO.tradeCount }</div>
		</td>
		<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;">
			<div style="width: 80px;height: 34px; padding: 7px 14px ;border-radius: 10px;cursor: pointer; 
			border: 1px solid #222;font-size: 12px;" align="center" id="addAddr"
			onclick="delete_data('${prodDTO.bidBuyCount+prodDTO.bidSellCount+prodDTO.tradeCount}','${prodDTO.engProduct }')" class="button">
				<font style="letter-spacing: -.6px; ">삭제하기</font>
			</div>
		</td>				
	</tr>
	</table>
</div>
</c:forEach>
</c:if>
<div style="display: inline-flex ;padding: 28px 0;" align="center">${pageIndexList }</div>
<input type="hidden" id="hidden_search" value="${searchValue }">
</body>
</html>