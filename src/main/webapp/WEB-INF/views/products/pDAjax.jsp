<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int tiLength = (Integer)request.getAttribute("tiLength");
	int bbLength = (Integer)request.getAttribute("bbLength");
	int bsLength = (Integer)request.getAttribute("bsLength");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/productDetail.css"/>
</head>
<body>

<div class="wrap_sales">
	<c:choose>
		<c:when test="${empty tisizeLists }">
			<div class="empty_content lg">
				<div class="empty_bg"><span class="blind">빈 데이터 이미지</span></div>
				<p class="empty_text">체결된 거래가 아직 없습니다</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="table_wrap lg">
				<table>
					<caption><span class="blind">데이터 테이블</span></caption>
					<colgroup>
						<col style="width:29.76%;">
						<col style="width:36.52%;">
						<col style="width:33.72%;">
					</colgroup>
					<thead>
					<tr>
						<th class="table_th"> 사이즈 </th>
						<th class="table_th align_right"> 거래가 </th>
						<th class="table_th align_right"> 거래일 </th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${tisizeLists.size()<4 }">
							<c:forEach var="tiDTO" items="${tisizeLists }">
								<tr>
									<td class="table_td"> ${tiDTO.prodSize } </td>
									<td class="table_td align_right"> <fmt:formatNumber value="${tiDTO.tradePrice }" type="number"/>원 </td>
									<td class="table_td align_right"> ${tiDTO.tradeDate } </td>
								</tr>
							</c:forEach>
							
							<%for(int i=0;i<(4-tiLength);i++){ %>
								<tr>
									<td class="table_td"> - </td>
									<td class="table_td align_right"> - </td>
									<td class="table_td align_right"> - </td>
								</tr>
							<%}%>
						</c:when>
						<c:otherwise>
							<c:forEach var="tiDTO" items="${tisizeLists }" end="3">
								<tr>
									<td class="table_td"> ${tiDTO.prodSize } </td>
									<td class="table_td align_right"> <fmt:formatNumber value="${tiDTO.tradePrice }" type="number"/>원 </td>
									<td class="table_td align_right"> ${tiDTO.tradeDate } </td>
								</tr>
							</c:forEach>						
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>				
				
			</div>
	<a type="button" class="btn outlinegrey full medium"> 거래 내역 더보기 </a>
		
		</c:otherwise>	
	</c:choose>
</div>

<div id="bidBuy">
<div id="panel2" class="tab_content show">
	<c:choose>
		<c:when test="${empty bidbuyLists }">
			<div class="empty_content lg">
				<div class="empty_bg"><span class="blind">빈 데이터 이미지</span></div>
				<p class="empty_text">입찰된 거래가 아직 없습니다</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="table_wrap lg">
				<table>
					<caption><span class="blind">데이터 테이블</span></caption>
					<colgroup>
						<col style="width:29.76%;">
						<col style="width:36.52%;">
						<col style="width:33.72%;">
					</colgroup>
					<thead>
						<tr>
							<th class="table_th"> 사이즈 </th>
							<th class="table_th align_right"> 구매 희망가 </th>
							<th class="table_th align_right"> 수량 </th>
						</tr>
					</thead>
					<tbody>				
						<c:choose>
								<c:when test="${bidbuyLists.size()<4 }">
									<c:forEach var="bbDTO" items="${bidbuyLists }">
										<tr>
											<td class="table_td"> ${bbDTO.prodSize } </td>
											<td class="table_td align_right"> <fmt:formatNumber value="${bbDTO.price }" type="number"/>원 </td>
											<td class="table_td align_right"> ${bbDTO.quantity } </td>
										</tr>
									</c:forEach>
									
									<%for(int i=0;i<(4-bbLength);i++){ %>
										<tr>
											<td class="table_td"> - </td>
											<td class="table_td align_right"> - </td>
											<td class="table_td align_right"> - </td>
										</tr>
									<%}%>
								</c:when>
								<c:otherwise>
									<c:forEach var="bbDTO" items="${bidbuyLists }" end="3">
										<tr>
											<td class="table_td"> ${bbDTO.prodSize } </td>
											<td class="table_td align_right"> <fmt:formatNumber value="${bbDTO.price }" type="number"/>원 </td>
											<td class="table_td align_right"> ${bbDTO.quantity } </td>
										</tr>
									</c:forEach>						
								</c:otherwise>
							</c:choose>			 										
					</tbody>
				</table>
			</div>
			<a type="button" class="btn outlinegrey full medium"> 입찰 내역 더보기 </a>
		</c:otherwise>
	</c:choose>		
</div>
</div>

<div id="bidSell">
<div id="panel1" class="tab_content">
	<c:choose>
		<c:when test="${empty bidsellLists }">
			<div class="empty_content lg">
				<div class="empty_bg"><span class="blind">빈 데이터 이미지</span></div>
				<p class="empty_text">입찰된 거래가 아직 없습니다</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="table_wrap lg">
				<table>
					<caption><span class="blind">데이터 테이블</span></caption>
					<colgroup>
						<col style="width:29.76%;">
						<col style="width:36.52%;">
						<col style="width:33.72%;">
					</colgroup>
					<thead>
						<tr>
							<th class="table_th"> 사이즈 </th>
							<th class="table_th align_right"> 판매 희망가 </th>
							<th class="table_th align_right"> 수량 </th>
						</tr>
					</thead>
					<tbody>				
						<c:choose>
								<c:when test="${bidsellLists.size()<4 }">
									<c:forEach var="bsDTO" items="${bidsellLists }">
										<tr>
											<td class="table_td"> ${bsDTO.prodSize } </td>
											<td class="table_td align_right"> <fmt:formatNumber value="${bsDTO.price }" type="number"/>원 </td>
											<td class="table_td align_right"> ${bsDTO.quantity } </td>
										</tr>
									</c:forEach>
									
									<%for(int i=0;i<(4-bsLength);i++){ %>
										<tr>
											<td class="table_td"> - </td>
											<td class="table_td align_right"> - </td>
											<td class="table_td align_right"> - </td>
										</tr>
									<%}%>
								</c:when>
								<c:otherwise>
									<c:forEach var="bsDTO" items="${bidsellLists }" end="3">
										<tr>
											<td class="table_td"> ${bsDTO.prodSize } </td>
											<td class="table_td align_right"> <fmt:formatNumber value="${bsDTO.price }" type="number"/>원 </td>
											<td class="table_td align_right"> ${bsDTO.quantity } </td>
										</tr>
									</c:forEach>						
								</c:otherwise>
							</c:choose>			 										
					</tbody>
				</table>
			</div>
			<a type="button" class="btn outlinegrey full medium"> 입찰 내역 더보기 </a>
		</c:otherwise>
	</c:choose>		
</div>
</div>

<div id="mp">
	<div id="panel1" class="tab_content">
	<c:choose>
		<c:when test="${empty tisizeLists }">
			<div class="price_table">
							<div class="market_price_table" style="display: none;">
								<div class="price_head">
									<div class="head_box">
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">사이즈</span>
											</a>
										</div>
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">거래가</span>
											</a>
										</div>
										<div class="head_sort is_active descending">
											<a class="sort_link sort">
												<span class="sort_txt">거래일</span>
											</a>
										</div>
									</div>
								</div>
								<div class="price_body">
								</div>
							</div>
							<div class="empty_content lg" style="">
								<div class="empty_bg">
									<span class="blind">빈 데이터 이미지</span>
								</div>
								<p class="empty_text">체결된 거래가 아직 없습니다</p>
							</div>
						</div>
		</c:when>
		<c:otherwise>
			
				<div class="price_table">
					<div class="market_price_table" style="">
						<div class="price_head">
							<div class="head_box">
								<div class="head_sort">
									<a class="sort_link sort"><span class="sort_txt">사이즈</span></a>
								</div>
								<div class="head_sort">
									<a class="sort_link sort"><span class="sort_txt">거래가</span></a>
								</div>
								<div class="head_sort is_active descending">
									<a class="sort_link sort"><span class="sort_txt">거래일</span></a>
								</div>
							</div>
						</div>
						<div class="price_body">
							<c:forEach var="dto" items="${tisizeLists }">
								<div class="body_list">
									<div class="list_txt"> ${dto.prodSize } </div>
									<div class="list_txt"> <fmt:formatNumber value="${dto.tradePrice }" type="number"/>원 </div>
									<div class="list_txt is_active"> ${dto.tradeDate } </div>
								</div>	
							</c:forEach>	
						</div>
					</div>
				</div><!---->
			
		</c:otherwise>
	</c:choose>
	</div>
	
	
	<div id="panel2" class="tab_content">
	<c:choose>
		<c:when test="${empty bidsellLists }">
			<div class="price_table">
							<div class="market_price_table" style="display: none;">
								<div class="price_head">
									<div class="head_box">
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">사이즈</span>
											</a>
										</div>
										<div class="head_sort">
											<a class="sort_link sort is_active ascending">
												<span class="sort_txt">판매 희망가</span>
											</a>
										</div>
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">수량</span>
											</a>
										</div>
									</div>
								</div>
								<div class="price_body">
								</div>
							</div>
							<div class="empty_content lg" style="">
								<div class="empty_bg">
									<span class="blind">빈 데이터 이미지</span>
								</div>
								<p class="empty_text">입찰된 거래가 아직 없습니다</p>
							</div>
						</div>
		</c:when>
		<c:otherwise>
			
				<div class="price_table">
					<div class="market_price_table" style="">
						<div class="price_head">
							<div class="head_box">
								<div class="head_sort">
									<a class="sort_link sort"><span class="sort_txt">사이즈</span></a>
								</div>
								<div class="head_sort is_active ascending">
									<a class="sort_link sort"><span class="sort_txt">판매 희망가</span></a>
								</div>
								<div class="head_sort">
									<a class="sort_link"><span class="sort_txt">수량</span></a>
								</div>
							</div>
						</div>
						<div class="price_body">
							<c:forEach var="dto" items="${bidsellLists }">
								<div class="body_list">
									<div class="list_txt"> ${dto.prodSize } </div>
									<div class="list_txt is_active"> <fmt:formatNumber value="${dto.price }" type="number"/>원 </div>
									<div class="list_txt"> ${dto.quantity } </div>
								</div>	
							</c:forEach>
						</div>
					</div>
	
				</div><!---->
			
		</c:otherwise>
	</c:choose>
	</div>
	
	
	<div id="panel3" class="tab_content">
	<c:choose>
		<c:when test="${empty bidbuyLists }">
			<div class="price_table">
							<div class="market_price_table" style="display: none;">
								<div class="price_head">
									<div class="head_box">
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">사이즈</span>
											</a>
										</div>
										<div class="head_sort">
											<a class="sort_link sort is_active descending">
												<span class="sort_txt">구매 희망가</span>
											</a>
										</div>
										<div class="head_sort">
											<a class="sort_link sort">
												<span class="sort_txt">수량</span>
											</a>
										</div>
									</div>
								</div>
								<div class="price_body">
								</div>
							</div>
							<div class="empty_content lg" style="">
								<div class="empty_bg">
									<span class="blind">빈 데이터 이미지</span>
								</div>
								<p class="empty_text">입찰된 거래가 아직 없습니다</p>
							</div>
						</div>
		</c:when>
		<c:otherwise>
			
				<div class="price_table">
					<div class="market_price_table" style="">
						<div class="price_head">
							<div class="head_box">
								<div class="head_sort">
									<a class="sort_link sort"><span class="sort_txt">사이즈</span></a>
								</div>
								<div class="head_sort is_active descending">
									<a class="sort_link sort"><span class="sort_txt">구매 희망가</span></a>
								</div>
								<div class="head_sort">
									<a class="sort_link"><span class="sort_txt">수량</span></a>
								</div>
							</div>
						</div>
						<div class="price_body">
							<c:forEach var="dto" items="${bidbuyLists }">
								<div class="body_list">
									<div class="list_txt"> ${dto.prodSize } </div>
									<div class="list_txt is_active"> <fmt:formatNumber value="${dto.price }" type="number"/>원 </div>
									<div class="list_txt"> ${dto.quantity } </div>
								</div>	
							</c:forEach>
						</div>
					</div>
	
				</div><!---->
			
		</c:otherwise>
	</c:choose>
	</div>
	

</div><!-- mp끝 -->






</body>
</html>
