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

<script type="text/javascript">

function detailPageOpen(prodNum) {
	location.href='<%=cp%>/products?prodNum='+prodNum
}

</script>
</head>
<body>


<c:if test="${wishLists.size()==0 }">
<div style="width: 1000px; padding-top:80px;padding-bottom:80px; background-color: #fafafa; border-radius: 12px;">
	<div style="font-size: 14px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">추가하신 관심 상품이 없습니다.</div>
	<div style="font-size: 12px; border: 1px solid #ebebeb ; border-radius: 10px; padding-top: 8px;
	margin-top: 12px; width: 112px; height: 34px; cursor: pointer;"								
 	align="center" onclick="location.href='<%=cp%>/shop.action'">SHOP 바로가기</div>
</div>
</c:if>
<c:if test="${wishLists.size()>0 }">
<div style="width: 1000px;">
	<table cellpadding="0" style="border-spacing: 0px;">
	<tr>
		<c:forEach var="wishDTO" items="${wishLists }" begin="0" end="${wishLists.size()>4?3:wishLists.size()-1 }" step="1">
		<td onclick="detailPageOpen('${wishDTO.productNum }');" style="cursor: pointer;padding-right:20px;">
		<div style="background-color: rgb(244, 244, 244); width:235px; height:235px; border-radius: 12px; 
		padding-left: 21.5px; padding-top:21.5px;">
			<img src="/img/${wishDTO.imageName}"
			style="width: 192px; height: 192px"><br/>
		</div>
		<div style="width: 235px">
			<div style="float: left; width: 130px; padding-top: 12px;font-size: 14px; font-weight: 700; letter-spacing: -.08px; color: #333;" align="left">
				<c:if test="${wishDTO.brandImage==null }">
				${wishDTO.brandName }
				</c:if>
				<c:if test="${wishDTO.brandImage!=null }">
				<img src="/img/${wishDTO.brandImage}" style="height: 20px">
				</c:if>
			</div>
			<div style="float: right; width: 100px; padding-top: 12px;padding-right: 5px;" align="right">
			<i class="fas fa-bookmark" style="width: 14px;" id="wish" onclick="deleteWish('${wishDTO.wishNum}')"></i></div>
		</div>	
		<div style="display:inline-block; width: 235px;height: 41px;line-height:15px;display: -webkit-box;">
			<font style="font-size: 13px;">${wishDTO.engProduct }</font>
		</div>
		<div style="padding-top: 8px;">
			<font style="font-size: 15px;letter-spacing: -.04px;font-weight: 700;">${wishDTO.minPrice}</font>
		</div>
		<div>
			<font style="font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">즉시 구매가</font>
		</div>
		</td>
		</c:forEach>
		
	</tr>
	<tr style="height: 0px;">
		<td style="width:250px; padding-right:20px;""></td>
		<td style="width:250px; padding-right:20px;""></td>
		<td style="width:250px; padding-right:20px;""></td>
		<td style="width:250px; padding-right:20px;""></td>						
	</tr>
	</table>
</div>
</c:if>


</body>
</html>