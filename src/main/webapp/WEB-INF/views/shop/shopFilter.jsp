<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int col = 1;
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">


  $(document).ready(function() {
	

	var sor = '${sorting}';	
	
	for(var i=0; i<5; i++){
		
	if(document.myForm1["sorting"][i].value==sor){
			
			document.myForm1["sorting"][i].checked=true;
			
			}
		
		
	}
	
	if(sor=="releasedate"){
		
		//alert("정렬방법:" + sor);
		
		const imgDefault = document.querySelector(".imgDefault");
		const imgReleasedate = document.querySelector(".imgReleasedate");

		$(".imgDefault").css('display', 'none');
		$(".imgReleasedate").css('display', 'block');
		
		//sorting_title 버튼 제목 바꾸기
		$('#sorting_title').html('<b>발매일순</b>');
		
	}
	
	if(sor=="lowShopPrice"){
		
		//sorting_title 버튼 제목 바꾸기
		$('#sorting_title').html('<b>낮은 즉시 구매가순</b>');
		
	}
	
	if(sor=="highShopPrice"){
		
		//sorting_title 버튼 제목 바꾸기
		$('#sorting_title').html('<b>높은 즉시 구매가순</b>');
		
	}
	
	if(sor=="brand"){
		
		//sorting_title 버튼 제목 바꾸기
		$('#sorting_title').html('<b>브랜드순</b>');
		
	}

	if(sor=="popular"){
		
		//sorting_title 버튼 제목 바꾸기
		$('#sorting_title').html('<b>인기순</b>');
		
	}
	
	

})   

function wish(engProduct) {
	
	//listdata 안보이게..
	
	
	var engProduct = engProduct;
	//alert(engProduct);	

	//alert('${category}');
	
	var aa = "engProduct=" + engProduct;
	
	
	
	
	aa += "&category=" + '${category}';

	aa += "&brandName=" + '${brandName}';

	aa +="&sorting=" + '${sorting}';

	aa += "&price=" + '${price}';
	
	/* aa += "&brandNameList=" + '${brandNameList}'; */
	

	
	
	
	
	
	
	//alert(aa);	
	
	$.ajax({
		
		type:"POST",
		url : "wishProdcut.action",
		data:aa,
		success:function(args){
			$("#wishProduct").html(args);
			
			
		},error:function(e){
			alert(e.responseText);
		}
		
		
	});
	
	
}
</script>




</head>
<body>	

<form name="myForm1">		
			
<table class="search_option" style="width: 980px; height: 64px;">
			<tr valign="middle">
			  <!-- 총 상품 수 -->
			  <td class="filter_result" align="left"
			  	style="width: 80px; height: 20px; padding-left: 5px; font-size: 15px;">
			    상품 <b>${maxNum }</b>
			  </td>

			    <!-- 정렬방법 -->
			  <td class="filter_sorting" align="right" 
			  	style="width: 80px; height: 20px; position: relative; top: 1px; right: 1px; font-size: 15px;">
			  	<button type="button" onclick="showSortingList();" id="sorting_title" style="border: none; background: none;">
			  		<b>정렬하기</b>
			  	</button>
				<i class="fas fa-sort"></i>

			  </td>
			</tr>
			</table>
			  
			<div class="content" style="padding: 0px; position: absolute; top: 70px; left: 1000px; z-index: 3000;">
			<table id="sorting_list" class="hide" style="width: 280px; height: 330px; border: solid 1px #dbdbdb; z-index: 9999;">
					
					<tr>
					<td>
					<ul class="menu_list" type="none" style="padding: 0px; z-index: 9999;">
			      	  
			      	   <li class="menu" style="height: 60px; padding: 1px 2px;" onmouseover="this.style.backgroundColor='#ededed'" onmouseout="this.style.backgroundColor=''"
			      	   onclick="sort_choice('popular')">			      	  
						
						<label style="color: #222; font-weight: 700; font-size: 14px; letter-spacing: -.21px;">						 
						 인기순	
						</label>
						<br/>						 						
			      	    <label id="cb2"  style="padding-top: 4px; font-size: 12px; letter-spacing: -.06px; color: rgba(34,34,34,.5);">
			      	   	  거래가 많은 순서대로 정렬합니다.
			      	    </label> 
			      	    
			      	    
		      	     	<input type="radio" id="popular" name="sorting" value="popular" onclick="check();">	
		      	     	<label></label>
		      	     	
		      	     	
			      	    
			      	   
			      	  </li>
			      	 
			      	  
			      	   <li class="menu" style="height: 60px; padding: 1px 2px;" onmouseover="this.style.backgroundColor='#ededed'" onmouseout="this.style.backgroundColor=''"
			      	   onclick="sort_choice('brand')">			      	  
						
						<label style="color: #222; font-weight: 700; font-size: 14px; letter-spacing: -.21px;">						 
						 브랜드순	
						</label>
						<br/>						 						
			      	    <label id="cb2"  style="padding-top: 4px; font-size: 12px; letter-spacing: -.06px; color: rgba(34,34,34,.5);">
			      	   	   상품의 브랜드명을 알파벳 순서대로 정렬합니다.	 
			      	    </label> 
			      	    
			      	    
		      	     	<input type="radio" id="brand" name="sorting" value="brand" onclick="check();">	
		      	     	<label></label>
			      	   
			      	  </li>
			      	 
			      	  
			      	   <li class="menu" style="height: 60px; padding: 1px 2px;" onmouseover="this.style.backgroundColor='#ededed'" onmouseout="this.style.backgroundColor=''"
			      	   onclick="sort_choice('lowShopPrice')">			      	  
						<label style="color: #222; font-weight: 700; font-size: 14px; letter-spacing: -.21px;">
						   낮은 즉시 구매가순			
						</label>
						<br/>
						
			      	    <label id="cb2" style="padding-top: 4px; font-size: 12px; letter-spacing: -.06px; color: rgba(34,34,34,.5);">
			      	   	  즉시 구매가가 낮은 순서대로 정렬합니다. 			      	   	
			      	    </label> 
			      	    
		      	     	<input type="radio" id="lowShopPrice" name="sorting" value="lowShopPrice" onclick="check();">	
		      	     	<label></label>
		      	     	
			      	  </li>
			      	
			      	   <li class="menu" style="height: 60px; padding: 1px 2px;" onmouseover="this.style.backgroundColor='#ededed'" onmouseout="this.style.backgroundColor=''"
			      	   onclick="sort_choice('highShopPrice')">			      	  
						<label style="color: #222; font-weight: 700; font-size: 14px; letter-spacing: -.21px;">
							 높은 즉시 구매가순			
						</label>
						<br/>
						
			      	    <label id="cb2" style="padding-top: 4px; font-size: 12px; letter-spacing: -.06px; color: rgba(34,34,34,.5);" >
			      	   	    즉시 구매가가 높은 순서대로 정렬합니다.  
			      	    </label> 
			      	    
		      	     	<input type="radio" id="highShopPrice" name="sorting" value="highShopPrice" onclick="check();">	
		      	     	<label></label>
		      	     	
			      	   		
			      	  </li>
			      
			      	  <li class="menu" style="height: 60px; padding: 1px 2px;" onmouseover="this.style.backgroundColor='#ededed'" onmouseout="this.style.backgroundColor=''"
			      	  onclick="sort_choice('releasedate')">			      	  
						
						<label style="color: #222; font-weight: 700; font-size: 14px; letter-spacing: -.21px;">
						발매일순
						</label>
						<br/>
			      	    <label  style="padding-top: 4px; font-size: 12px; letter-spacing: -.06px; color: rgba(34,34,34,.5);">
			      	   	  최신 상품 순서대로 정렬합니다. 아직<br/>발매전인 상품이 노출될 수 있습니다.  
			      	    </label> 
			      	    
		      	     	<input type="radio" id="releasedate" name="sorting" value="releasedate" onclick="check();">	
		      	     	<label></label>
		      	     	
		      	     		      	  	
			      	  	  
			      	  </li>

			      	  
			      	  
			      	 </ul>	
			</td></tr>
			</table>
					
			</div>	


			<div class="search_result lg" style="width: 980px;">
				<div class="search_result_list">
					<!-- 상품 사진과 설명 -->
					<div class="product_item">
						
						<!-- 상품 사진 -->
					<table><tr>
					<c:forEach var="dto" items="${prodImagelists}">		
					
						<td><table style="margin-left: 6px; margin-right: 6px; margin-bottom: 50px;">
				
						<tr class="product" style="border-radius: 30px;">
							<td>
							
							
							
							<div class="imgDefault" style="display: block; z-index: -1000;">
							<a href="mainToProducts?engProduct=${dto.engProduct }">
								<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
									src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
							</a>
							</div>

							<div class="imgReleasedate" style="display: none; z-index: -1000;">
							
								<c:if test="${dto.releasedate!=null }">
	
									<div style="position: relative;">
										<a href="mainToProducts?engProduct=${dto.engProduct }">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										</a>	
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<fmt:parseDate value="${dto.releasedate }" var="releasedateFmt" pattern="yyyy-mm-dd"/>
										<b>발매 <fmt:formatDate value="${releasedateFmt }" pattern="yy/mm/dd"/></b>
										</div>
									</div>
								
								
								</c:if>
								
								<c:if test="${dto.releasedate==null }">
								
									<div style="position: relative;">
										<a href="mainToProducts?engProduct=${dto.engProduct }">
										<img style="width: 236px; height: 236px; border: 1px; border-radius: 10px; background-color: #f6f6f6; z-index: -1000;" 
											src="/img/${dto.imageName }" alt="${dto.engProduct }" class="product_img">
										</a>
										<div style="position: absolute; top: 10px; right: 10px; font-size: 12px;">
										<b>-</b>
										</div>
									</div>
								
								
								</c:if>
								
							</div>
							
							
								
							
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr class="info_box" style="width: 236px; height: 36px;">
							
							<td class="brand" style="float: left; position: relative; z-index: -1;" >
		 
								<c:if test="${dto.brandImage!=null }">
								<img style="height:25px; width: auto;" src="/img/${dto.brandImage}" name="${dto.brandName }" alt="brand_${dto.brandName }" class="${dto.brandName }">
								</c:if>
								<c:if test="${dto.brandImage==null }">
								<p class=".brand-text " style="height: 20px;max-height: 20px;"><b>${dto.brandName }</b></p>
								</c:if>
							</td>
							
							<td style="float: right;">
							<c:if test="${empty sessionScope.userNum }">
								<img src="/img/bookmark_w.png" onclick="location.href='<%=cp %>/login'" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
							</c:if>
							<c:if test="${!empty sessionScope.userNum }">
								<c:if test="${dto.checkNum==-1 }">	
								<img src="/img/bookmark_w.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
								
								<c:if test="${dto.checkNum==1 }">	
								<img src="/img/bookmark_b.png" onclick="wish('${dto.engProduct}')" style="cursor:pointer; width: 24px; height: 24px; float: right;"/>
								<%-- <div onclick="wish('${dto.engProduct}');">테스트용</div> --%>
								</c:if>
							</c:if>	
							</td>
							
						</tr>
							
						<tr class="name" id="engProduct" style="height: 40px; font-size: 10pt; ">
							<td style="width: 236px;">${dto.engProduct }</td>	
						</tr>		
							
						<tr style="height: 10px;"></tr>
							
							
						<tr class="price" style="height: 34px;">
							<c:if test="${dto.shopPrice!=null}">
							<td id="shopPrice"><b><fmt:formatNumber value="${dto.shopPrice }" type="number" maxFractionDigits="3"/> 원</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
							<c:if test="${dto.shopPrice==null}">
							<td id="shopPrice"><b>-</b></td> <!-- {dto.retailPrice}원 --> <!-- 가장 낮은 구매입찰가격 -->
							</c:if>
						</tr>
							
						<tr>
							<td style="font-size: 9pt;">즉시 구매가</td>
						</tr>
							
						
						</table></td>
						<%if(col%4==0) {%>
						</tr>
						<tr>
						<%} col++;%>
						</c:forEach>
						</tr>
						</table>

<c:if test="${maxNum==0 }">
	
	<div align="center">
	<br/><br/><br/><br/>
	<p style="font-size: 16px; letter-spacing: -.16px; color: rgba(34,34,34,.8);">검색하신 결과가 없습니다.</p>
	<p style="padding-top: 6px; font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">상품 등록 요청은 1:1 문의하기로 요청해주세요.</p>
	</div>
	
</c:if>	

</form>
</body>
</html>