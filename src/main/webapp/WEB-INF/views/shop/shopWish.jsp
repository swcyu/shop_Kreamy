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
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/wishModal2.css"/>



<script type="text/javascript">

function exit() {	
	
	 $("#wishlist").hide();
	
}


function wishSave(prodNum,sorting,category,price,brandName,mode) {
	if(mode=='mainPage'){
	var url = "<%=cp%>/wishSave.action"
		$.post(url,{category:category,brandName:brandName,price:price,prodNum:prodNum,sorting:sorting,mode:mode},function(args){
			$(location).attr('href','<%=cp%>/mainPage');
		})
	}else{
		$('#wishlist').hide()
		var url = "<%=cp%>/wishSave.action"
		$.post(url,{category:category,brandName:brandName,price:price,prodNum:prodNum,sorting:sorting,mode:mode},function(args){
			$('#productList').html(args)
		})
	}
	
	
}


</script>





</head>
<body>

<form action="" name="wishForm" method="get">




<!-- 관심 상품 추가 -->

	<div id="wishlist" class="layer_container">	
	
		<div class="layer_header"><h2 class="title">관심 상품 추가</h2></div>
		
				
		
		<div class="layer_content">
		
		
		
		
			<div class="suggest_list lg">
				<div class="suggest_item">
					<span class="suggest_link">
						<div class="suggest_thumb"> 
							<img src="/img/${wishProductLists[0].imageName }" alt="${wishProductLists[0].korProduct }" class="thumb_img">
						</div>
		
			
						<div class="suggest_info">
							<p class="model_title">${wishProductLists[0].engProduct }</p>
							<p class="model_sub_info">${wishProductLists[0].korProduct }</p>
						</div>
					</span>
				</div>
			</div>	
			
			
			
					
			<div class="lg interest_list column_double">
				
				<c:forEach var="dto" items="${wishProductLists}">
				<div class="interest_btn_box" >
					<a onclick="wishSave('${dto.prodNum }','${sorting}','${category}','${price}','${brandName}','${mode}')" class="btn outlinegrey medium btn_interest" style="height: 52px;">
					<p class="info_txt" >${dto.userSize }</p>	
					<%-- <input type="hidden" name="userSize" value="${dto.userSize }"/> --%>			
					
					<c:if test="${dto.wishCheckNum==-1 }">	
						<img src="/img/bookmark_w16.png" style="width: 16px; height: 16px;">
					
					</c:if>
					
					<c:if test="${dto.wishCheckNum==1 }">	
						<img src="/img/bookmark_b16.png" style="width: 16px; height: 16px;">
					
					</c:if>					
					
				
					</a>
					
					
				</div>
				</c:forEach>
			
			</div>
			
			
			
			
		</div>
		
		
		
		<a href="#" class="btn_layer_close">
			<img onclick="exit();" src="/img/x_mark.png" class="pop_x_btn">
		</a>
		
		
		
	</div>

<%-- <input type="hidden" name="engProduct" value="${wishProductLists[0].engProduct }"/> --%>



</form>
</body>
</html>