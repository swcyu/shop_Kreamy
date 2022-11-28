<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function deleteBasic(){
	alert("다른 카드를 기본 결제로 변경 후, 삭제할 수 있습니다.")
}

function change_hidden(payNum){
	document.getElementById('new_basic').value = payNum
}

function deletePay(payNum){
	var url = "<%=cp%>/deletePay";
	$.post(url,{payNum:payNum},function(args){
		$("#cardList").html(args);
	});
}
</script>
</head>
<body>

<c:if test="${countPay==0 }">
	<div style="width: 1000px; height: 16px;"></div>
	<div style="width: 1000px; padding: 160px 0px; background-color: #fafafa;" align="center">
		<div>
			<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
			추가하신 결제 정보가 없습니다.</p>
		</div>
	</div>
</c:if>


<c:if test="${countPay>0 }">
<!-- 카드정보 있는 경우 -->
<div style="color: #222;box-sizing: border-box;margin: 0;padding: 0;" align="left">
	<div style="border-bottom: 1px solid #222;padding: 22px 0 29px;">
		<div style="position: relative;display: flex;-webkit-box-align: center;align-items: center;">
			<div style="margin-right: 24px;">
				<span style="font-size: 12px;letter-spacing: -.06px;font-weight: 700;color: #000;margin-top: 2px;">
				기본 결제</span>
				<div style="margin: 0;display: flex;-webkit-box-align: center;align-items: center;padding: 13px 0 1px;">
					<span style="color: #222;font-size: 15px;letter-spacing: -.15px;display: inline-block;padding: 9px;
				    min-width: 52px;border-radius: 8px;border: 1px solid #ebebeb;background-color: #fff;text-align: center;">
				    ${basicDTO.bank }</span>
				    <div style="color: #222;margin: 0;padding: 0;margin-left: 17px;font-size: 0;">
				    	<span style="display: flex;-webkit-box-align: center;align-items: center;flex-wrap: wrap;">
				    		<span class="dot">
				    		<span class="dot"></span>
				    			</span>
				    		<span class="hyphen"></span>
				    		<span class="dot">
				    			<span class="dot"></span>
				    		</span>
				    		<span class="hyphen"></span>
				    		<span class="dot">
				    			<span class="dot"></span>
				    		</span>
				    		<span class="hyphen"></span>
				    		<span style="color: #222;display: inline-flex;margin-left: 2px;font-size: 14px;letter-spacing: -.07px;">
				    		${fn:substring(basicDTO.cardNum,15,19)}</span>
				    	</span>
				    	<span style="padding: 0 6px;display: inline-block;height: 18px;line-height: 18px;font-size: 11px;font-weight: 700;
					    color: #fff;border-radius: 10px;background-color: #bbb;vertical-align: top;margin-top: 2px;">기본 결제</span>
				    </div>
				</div>
			</div>
			<div style="margin-left: auto;flex-shrink: 0;font-size: 0;margin-top: 30px;">
				<div style="display: inline-block;cursor: pointer;vertical-align: middle;text-align: center;background-color: #fff;
			    padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;font-size: 12px;letter-spacing: -.06px;
			    border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;padding-right: 12px;"onclick="deleteBasic();">삭제</div>
			</div>
		</div>
	</div>
	
	<c:forEach var="payDTO" items="${payLists }">
	<div style="padding-top: 16px;">
		<div style="position: relative;display: flex;-webkit-box-align: center;align-items: center;padding: 17px 0 14px;
		border-bottom: 1px solid #ebebeb;">
			<div style="margin-right: 24px;">
				<span style="font-size: 12px;letter-spacing: -.06px;font-weight: 700;color: #000;margin-top: 2px;"></span>
				<div style="display: flex;-webkit-box-align: center;align-items: center;padding: 4px 0;">
					<span style="color: #222;font-size: 15px;letter-spacing: -.15px;display: inline-block;padding: 9px;
				    min-width: 52px;border-radius: 8px;border: 1px solid #ebebeb;background-color: #fff;text-align: center;">
				    ${payDTO.bank }
				    </span>
				    <div style="margin-left: 17px;font-size: 0;">
				    	<span style="color: #222;font-size: 0;box-sizing: border-box;display: flex;-webkit-box-align: center;
						align-items: center;flex-wrap: wrap;">
							<span class="dot">
					    		<span class="dot"></span>
			    			</span>
				    		<span class="hyphen"></span>
				    		<span class="dot">
				    			<span class="dot"></span>
				    		</span>
				    		<span class="hyphen"></span>
				    		<span class="dot">
				    			<span class="dot"></span>
				    		</span>
				    		<span class="hyphen"></span>
				    		<span style="color: #222;display: inline-flex;margin-left: 2px;font-size: 14px;letter-spacing: -.07px;">
				    		${fn:substring(payDTO.cardNum,15,19) }</span>
						</span>
				    </div>
				</div>
			</div>
			<div style="margin-left: auto;flex-shrink: 0;font-size: 0;">
				<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);display: inline-block;cursor: pointer;vertical-align: middle;
			    text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
			    font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;
			    padding-right: 12px;"data-bs-toggle="modal" data-bs-target="#basicModal" onclick="change_hidden('${payDTO.payNum}')">기본 결제</div>
				<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);display: inline-block;cursor: pointer;vertical-align: middle;
				text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
			    font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;
			    padding-right: 12px;margin-left: 8px;" onclick="deletePay('${payDTO.payNum}');">삭제</div>    						
			</div>
		</div>
	</div>
	</c:forEach>
	
</div>
</c:if>

</body>
</html>