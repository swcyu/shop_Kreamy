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
</head>
<body>
<c:if test="${mode=='bid' }">
	<c:if test="${buyLists.size()==0 }">
	<div style="width: 1000px; margin-top: 80px; margin-bottom: 80px" align="center">
		<font style="font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">구매 입찰 내역이 없습니다.</font>
		<div style="width: 112px;height: 34px;margin-top: 12px; padding: 7px 14px ;border-radius: 10px;cursor: pointer;
			border: 1px solid #d3d3d3;font-size: 12px;" align="center" id="addAddr" onclick="location.href='<%=cp%>/shop.action'">
				<font style="letter-spacing: -.5px;color: rgba(34,34,34,.8); ">SHOP 바로가기</font>
		</div>
	</div>
	</c:if>
	<c:if test="${buyLists.size()>0 }">
	<c:forEach var="buyDTO" items="${buyLists }">
	<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
		<table cellpadding="0" style="border-spacing: 0px;">
		<tr style="cursor: pointer;" onclick="location.href='<%=cp%>/bidBuyDetail?buyNum=${buyDTO.BASNum}'">
			<td align="left" style="width: 80px;">
				<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
				border-radius: 12px;">
					<img src="/img/${buyDTO.imageName}" style="width: 65px; height: 65px;">
				</div>
			</td>			
			<td align="left" style="width:620px; padding-left: 16px;">
				<div style="font-size: 14px; color: #222">${buyDTO.engProduct }</div>
				<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
				font-size: 14px; color: rgba(34,34,34,.5);">${buyDTO.size }</div>						
			</td>
			<c:if test="${sort=='priceAsc'||sort=='priceDesc' }">
			<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;font-weight: 700;">${buyDTO.wishPrice }</td>
			</c:if>
			<c:if test="${sort!='priceAsc'&&sort!='priceDesc' }">
			<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;">${buyDTO.wishPrice }</td>
			</c:if>
			<c:if test="${sort=='validAsc'||sort=='validDesc' }">
				<c:if test="${buyDTO.state=='기한만료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;
					color: #f15746;"id="validDate">${buyDTO.state }</td>	
				</c:if>
				<c:if test="${buyDTO.state!='기한만료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;">${buyDTO.validDate }</td>		
				</c:if>
			</c:if>				
			<c:if test="${sort!='validAsc'&&sort!='validDesc' }">
				<c:if test="${buyDTO.state=='기한만료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;
					color: #f15746;"id="validDate">${buyDTO.state }</td>	
				</c:if>
				<c:if test="${buyDTO.state!='기한만료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;">${buyDTO.validDate }</td>		
				</c:if>
			</c:if>				
		</tr>
		</table>
	</div>
	</c:forEach>	
	</c:if>
</c:if>

<c:if test="${mode=='trade' }">
	<c:if test="${tradeBuyLists.size()==0 }">
	<div style="width: 1000px; margin-top: 80px; margin-bottom: 80px" align="center">
		<font style="font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">거래 내역이 없습니다.</font>
	</div>
	</c:if>
	<c:if test="${tradeBuyLists.size()>0 }">
	<c:forEach var="buyDTO" items="${tradeBuyLists }">
	<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
		<table cellpadding="0" style="border-spacing: 0px;">
		<tr style="cursor: pointer;" onclick="location.href='<%=cp%>/tradeBuyDetail?buyNum=${buyDTO.tradeNum}'">
			<td align="left" style="width: 80px;">
				<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
				border-radius: 12px;">
					<img src="/img/${buyDTO.imageName}" style="width: 65px; height: 65px;">
				</div>
			</td>			
			<td align="left" style="width:620px; padding-left: 16px;">
				<div style="font-size: 14px; color: #222">${buyDTO.engProduct }</div>
				<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
				font-size: 14px; color: rgba(34,34,34,.5);">${buyDTO.userSize }</div>						
			</td>
			
			<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;font-weight: 700;"></td>
			
			<c:if test="${sort=='tradeStateAsc'||sort=='tradeStateDesc' }">
				<c:if test="${buyDTO.tradeBuyState=='검수보류' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;
					color: #ff7500;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState=='거래실패' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;
					color: #f15746;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState!='검수보류'&& buyDTO.tradeBuyState!='거래실패'}">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;">${buyDTO.tradeBuyState }</td>		
				</c:if>
			</c:if>				
			<c:if test="${sort!='tradeStateAsc'&&sort!='tradeStateDesc' }">
				<c:if test="${buyDTO.tradeBuyState=='검수보류' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;
					color: #ff7500;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState=='거래실패' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;
					color: #f15746;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState!='검수보류'&& buyDTO.tradeBuyState!='거래실패'}">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;">${buyDTO.tradeBuyState }</td>		
				</c:if>
			</c:if>				
		</tr>
		</table>
	</div>
	</c:forEach>	
	</c:if>
</c:if>


<c:if test="${mode=='end' }">
	<c:if test="${tradeBuyLists.size()==0 }">
	<div style="width: 1000px; margin-top: 80px; margin-bottom: 80px" align="center">
		<font style="font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">거래 내역이 없습니다.</font>
	</div>
	</c:if>
	<c:if test="${tradeBuyLists.size()>0 }">
	<c:forEach var="buyDTO" items="${tradeBuyLists }">
	<div style="width: 1000px; padding:12px; border-bottom: 1px solid #ebebeb;">
		<table cellpadding="0" style="border-spacing: 0px;">
		<tr style="cursor: pointer;" onclick="location.href='<%=cp%>/endBuyDetail?buyNum=${buyDTO.tradeNum}'">
			<td align="left" style="width: 80px;">
				<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
				border-radius: 12px;">
					<img src="/img/${buyDTO.imageName}" style="width: 65px; height: 65px;">
				</div>
			</td>			
			<td align="left" style="width:620px; padding-left: 16px;">
				<div style="font-size: 14px; color: #222">${buyDTO.engProduct }</div>
				<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
				font-size: 14px; color: rgba(34,34,34,.5);">${buyDTO.userSize }</div>						
			</td>
			<c:if test="${sort=='tradeDateAsc'||sort=='tradeDateDesc' }">
			<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;font-weight: 700;">${buyDTO.tradeDate }</td>
			</c:if>
			<c:if test="${sort!='tradeDateAsc'&&sort!='tradeDateDesc' }">
			<td align="right" style="width: 200px;font-size: 14px;letter-spacing: -.21px;padding-right: 46px;">${buyDTO.tradeDate }</td>
			</c:if>
			<c:if test="${sort=='endStateAsc'||sort=='endStateDesc' }">
				<c:if test="${buyDTO.tradeBuyState=='취소완료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;
					color: #f15746;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState!='취소완료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;font-weight:700;">${buyDTO.tradeBuyState }</td>		
				</c:if>
			</c:if>				
			<c:if test="${sort!='endStateAsc'&&sort!='endStateDesc' }">
				<c:if test="${buyDTO.tradeBuyState=='취소완료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;
					color: #f15746;"id="validDate">${buyDTO.tradeBuyState }</td>	
				</c:if>
				<c:if test="${buyDTO.tradeBuyState!='취소완료' }">
					<td align="right" style="width:100px;font-size: 14px;letter-spacing: -.21px;">${buyDTO.tradeBuyState }</td>		
				</c:if>
			</c:if>				
		</tr>
		</table>
	</div>
	</c:forEach>	
	</c:if>
</c:if>
</body>
</html>