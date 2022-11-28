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
<!-- 관심 상품이 없는 경우 -->
<c:if test="${wishLists.size()==0 }">
<div style="width: 1000px; height: 16px;"></div>
<div style="width: 1000px; padding: 80px 0px;" align="center">
	<div>
		<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">추가하신 관심 상품이 없습니다.</p>
	</div>
	<div style="width: 112px;height: 34px;margin-top: 12px; padding: 7px 14px ;border-radius: 10px;cursor: pointer;
		border: 1px solid #d3d3d3;font-size: 12px;" align="center" id="addAddr" onclick="location.href='<%=cp%>/shop.action'">
			<font style="letter-spacing: -.5px;color: rgba(34,34,34,.8); ">SHOP 바로가기</font>
	</div>
</div>
</c:if>


<!-- 관심 상품이 있는 경우 -->
<c:if test="${wishLists.size()>0 }">
<c:forEach var="wishDTO" items="${wishLists }">
<div style="width: 1000px; margin: 0px;padding:20px 0px 19px; border-bottom: 1px solid #ebebeb; cursor: pointer;" >
	<table cellpadding="0" style="border-spacing: 0px;"onclick="detailPageOpen('${wishDTO.productNum }');">
	<tr>
		<td align="left" style="width: 80px;">
			<div style="width: 80px;height: 80px; padding-left: 7.5px; padding-top: 7.5px; background-color: #f6f6f6;
			border-radius: 12px;">
				<img src="/img/${wishDTO.imageName}" style="width: 65px; height: 65px;">
			</div>
		</td>			
		<td align="left" style="width:620px; padding-left: 16px;">
			<div style="font-size: 14px; font-weight: 700; letter-spacing: -.08px; color: #333;">
				<c:if test="${wishDTO.brandImage==null }">
				${wishDTO.brandName }
				</c:if>
				<c:if test="${wishDTO.brandImage!=null }">
				<img src="/img/${wishDTO.brandImage}" style="height: 20px">
				</c:if>
			</div>
			<div style="font-size: 13px; color: #222222;margin-top: 2px;">${wishDTO.engProduct }</div>
			<div style="margin-top: 8px;letter-spacing: -.21px; font-weight: 700;
			font-size: 13px; color: #222222;margin-top: 24px;">${wishDTO.userSize }</div>						
		</td>
		<td align="right" style="width:300px;">
			<div style="background-color: #ef6253; width:164px; height: 60px; border-radius: 12px; color: white;">
				<div style="width: 55px; float: left;font-size: 18px;padding-top: 15px;" align="center">
					<strong>구매</strong>
				</div>
				<div style="width: 107px;height: 60px; border-left: 2px solid #da5b4e; float: right;padding-left: 7px;
				padding-top: 10px;" align="left">
					<div style="font-size: 15px;">
						<font style="font-weight: 700;">${wishDTO.minPrice }</font>
					</div>
					<div style="font-size: 11px;">즉시 구매가</div>
				</div>
			</div>
			<div align="right" style="margin-top:6px; padding-right: 3px;">
				<font style="font-size: 12px; color: #222222;"><u style="cursor: pointer;" onclick="deleteWishList('${wishDTO.wishNum}');">삭제</u></font>
			</div>
		
		</td>		
	</tr>
	</table>
</div>

</c:forEach>
</c:if>


</body>
</html>