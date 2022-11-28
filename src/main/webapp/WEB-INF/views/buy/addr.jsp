<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KREAMY | 한정판 거래의 FLEX</title>
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/buysell.css"/>
<script type="text/javascript" src="/kreamy/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
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
				
			</div>												
		
		</c:otherwise>
	</c:choose>
</div>


<div id="di1" class="delivery_info">
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

</body>
</html>