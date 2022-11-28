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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
<section id="section3">
	<div class="section_title">
		<h3 class="title_txt sst">결제 방법</h3>
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
		<c:choose>
			<c:when test="${tp eq 'b'}">
				<div class="method_desc">
					<p class="desc_txt"> 구매 입찰은 일시불만 지원하며, 카드사 홈페이지나 앱에서 분할 납부로 변경 가능합니다. 단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다. </p>
				</div>			
			</c:when>
			<c:otherwise>
				<div class="method_desc">
					<p class="desc_txt"> - 페널티는 일시불만 지원하며, 카드사 홈페이지나 앱에서 분할납부로 변경 가능합니다. 단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다. </p>
					<p class="desc_txt"> - 수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고시 없이 해당 금액을 결제 시도 할 수 있습니다. </p>
				</div>
			</c:otherwise>
		</c:choose>		
	</div>
	
</section>


</body>
</html>