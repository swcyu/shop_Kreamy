<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<section id="section5">
	<div class="section_title">
		<h3 class="title_txt" style="font-size: 14px; letter-spacing: -.21px; color: #222; font-weight: 700;">판매 정산 계좌</h3>
	</div>
	<div class="section_content">
		<div class="settlement_account">
		<c:choose>
			<c:when test="${empty bankdto }">											
				<div class="account_box">											
					<div class="card_info">												
						<span class="card_name"></span>
						<div class="card_num">
							<span class="num_bind">
								<span class="last_num">카드를 등록하세요.</span>
							</span>
						</div>													
					</div>											
					<!-- 이거원래 판매계속다음에 -->
					<dl class="account_holder hide">
						<dt class="holder">예금주</dt>
						<dd class="name">${bankdto.holder }</dd>
					</dl>
				</div>
				<button id="acb" type="button" class="btn2 btn_edit outlinegrey small"> 등록 </button>																					
			</c:when>
			<c:otherwise>											
				<div class="account_box">											
					<div class="card_info">												
						<span class="card_name">${bankdto.bank }</span>
						<div class="card_num">
							<span class="num_bind">
								<c:set var="acc" value="${bankdto.account }"/>
								<c:set var="aclen" value="${fn:length(acc) }"/>
								<span class="last_num">***********${fn:substring(acc,aclen-3,aclen) }</span>								
							</span>
						</div>													
					</div>											
					<!-- 이거원래 판매계속다음에 -->
					<dl class="account_holder hide">
						<dt class="holder">예금주</dt>
						<dd class="name">${bankdto.holder }</dd>
					</dl>
				</div>
				<button id="acb" type="button" class="btn2 btn_edit outlinegrey small"> 변경 </button>											
			</c:otherwise>
		</c:choose>
		</div>	
		<div class="layer_account_registration layer lg" style="display: none;">
			<div class="layer_container">
				<div class="layer_header">
				<c:choose>
					<c:when test="${empty bankdto }">
						<h2 class="title"> 정산 계좌 등록 </h2>
					</c:when>
					<c:otherwise>
						<h2 class="title"> 정산 계좌 변경 </h2>
					</c:otherwise>
				</c:choose>	
				</div>
				<div class="layer_content">
					<div class="account_registration">
						<div class="input_logistics_companies input_box">
							<h3 class="input_title" style="font-weight: 700;">은행명</h3>
							<div class="input_item">
								<input id="dropgo" type="text" placeholder="선택하세요" readonly="readonly" autocomplete="off" class="input_txt text_fill" value="${bankdto.bank }">
								<button type="button" class="btn2 btn_dropdown">
									<svg style="width: 24px; height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-arr-dir-down-circle" fill="none" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9.5" stroke="#EBEBEB"></circle><path fill="#000" d="M17 10l-5 5-5-5h10z"></path></svg>
								</button>
								<div class="layer_dropdown layer lg" style="display: none;">
									<div class="layer_container">
										<div class="layer_content">
											<ul class="drop_list">
												<li class="drop_item item_on"><a class="drop_link"> 국민은행 </a></li><li class="drop_item"><a class="drop_link"> 신한은행 </a></li><li class="drop_item"><a class="drop_link"> 우리은행 </a></li><li class="drop_item"><a class="drop_link"> 하나은행 </a></li><li class="drop_item"><a class="drop_link"> 기업은행 </a></li><li class="drop_item"><a class="drop_link"> 농협은행 </a></li><li class="drop_item"><a class="drop_link"> SC은행 </a></li><li class="drop_item"><a class="drop_link"> 한국씨티은행 </a></li><li class="drop_item"><a class="drop_link"> 우체국 </a></li><li class="drop_item"><a class="drop_link"> 산업은행 </a></li><li class="drop_item"><a class="drop_link"> 부산은행 </a></li><li class="drop_item"><a class="drop_link"> 카카오뱅크 </a></li><li class="drop_item"><a class="drop_link"> 대구은행 </a></li><li class="drop_item"><a class="drop_link"> 케이뱅크 </a></li><li class="drop_item"><a class="drop_link"> 광주은행 </a></li><li class="drop_item"><a class="drop_link"> 제주은행 </a></li><li class="drop_item"><a class="drop_link"> 수협중앙회 </a></li><li class="drop_item"><a class="drop_link"> 전북은행 </a></li><li class="drop_item"><a class="drop_link"> 지역농축협 </a></li><li class="drop_item"><a class="drop_link"> 경남은행 </a></li><li class="drop_item"><a class="drop_link"> 새마을금고연합회 </a></li><li class="drop_item"><a class="drop_link"> 신협 </a></li><li class="drop_item"><a class="drop_link"> 저축은행 </a></li><li class="drop_item"><a class="drop_link"> HSBC은행 </a></li><li class="drop_item"><a class="drop_link"> 도이치은행 </a></li><li class="drop_item"><a class="drop_link"> 제이피모간체이스은행 </a></li><li class="drop_item"><a class="drop_link"> BOA은행 </a></li><li class="drop_item"><a class="drop_link"> 비엔피파리바은행 </a></li><li class="drop_item"><a class="drop_link"> 중국공상은행 </a></li><li class="drop_item"><a class="drop_link"> 산림조합 </a></li><li class="drop_item"><a class="drop_link"> 중국건설은행 </a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="input_box">
							<h3 class="input_title" style="font-weight: 700;">계좌번호</h3>
							<div class="input_item">
								<input id="dropgo2" type="text" placeholder="- 없이 입력하세요" maxlength="20" autocomplete="off" class="input_txt text_fill" value="${bankdto.account }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<p class="input_error">올바른 계좌번호를 입력해주세요.</p>
						</div>
						<div class="input_box">
							<h3 class="input_title" style="font-weight: 700;">예금주</h3>
							<div class="input_item">
								<input id="dropgo3" type="text" placeholder="예금주명을 정확히 입력하세요." maxlength="10" autocomplete="off" class="input_txt text_fill" value="${bankdto.holder }">
							</div>
							<p class="input_error">올바른 이름을 입력해주세요. (2-50자)</p>
						</div>
					</div>
					<div class="layer_btn">
						<a id="savebtn" disabled="disabled" type="button" class="btn2 solid medium disabled"> 저장하기 </a>
					</div>
				</div>
				<a class="btn_layer_close">
					<svg style="width: 24px;height: 24px;" xmlns="http://www.w3.org/2000/svg" id="i-ico-close" fill="none" viewBox="0 0 24 24"><path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"></path></svg>	
				</a>
			</div>										
		</div>										
	</div>
	<input id="dgo1" type="hidden" value="${bankdto.bank }">
	<input id="dgo2" type="hidden" value="${bankdto.account }">
	<input id="dgo3" type="hidden" value="${bankdto.holder }">
										
</section>
</body>
</html>