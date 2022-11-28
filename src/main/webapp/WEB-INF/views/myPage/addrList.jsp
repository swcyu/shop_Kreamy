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
function updateAddr(addrNum,name,phone,zip,addr1,addr2,basic){

	document.getElementById('name_title').className='input_title_black'
	document.getElementById('receiverName').className='input_txt'
	document.getElementById('name_error').className='input_error_off'	
	document.getElementById('phone_title').className='input_title_black'
	document.getElementById('receiverPhone').className='input_txt'
	document.getElementById('phone_error').className='input_error_off'
	document.getElementById('addrDetail').className='input_txt'
	document.getElementById("mode").value = 'insert';
	$('#modal_title').html('배송지 수정')
	document.getElementById("receiverName").value = name;
	document.getElementById("receiverPhone").value = phone;
	document.getElementById("zipcode").value = zip;
	document.getElementById("addr").value = addr1;
	document.getElementById("addrDetail").value = addr2;	
	
	if(basic=='yes'){
		document.getElementById('hidden_basic').value = 'yes'
		document.getElementById('hidden_state').value = 'basic'
		$('#check_button').html("<svg xmlns='http://www.w3.org/2000/svg' id='i-ico-check-active' fill='none' viewBox='0 0 24 24'style='width: 24px; height: 24px;'>"+
		"<path fill='#000' d='M0 0h24v24H0z'></path><path stroke='#fff' stroke-width='1.5' d='M18.4 7.2L9.6 16l-4-4'></path></svg>")
	}else{
		
		document.getElementById('hidden_basic').value = 'no'
		document.getElementById('hidden_state').value = 'normal'
		$('#check_button').html("<svg xmlns='http://www.w3.org/2000/svg' id='i-ico-check-inactive' fill='none' viewBox='0 0 24 24'style='width: 24px; height: 24px;'>"+
		"<path stroke='#D3D3D3' d='M.5.5h23v23H.5z'></path><path stroke='#EBEBEB' stroke-width='1.5' d='M18.4 7.2L9.6 16l-4-4'></path></svg>")	
	}
	document.getElementById("mode").value = 'update';
	document.getElementById("hidden_addrNum").value = addrNum;
	check_data_filled()
	setTimeout(name_focus,500)
}

function deleteAddr(addrNum,using){
	
	if(using=='yes'){
		alert('진행 중인 입찰에 사용된 주소는 삭제할 수 없습니다.')
		return
	}
	var url = "<%=cp%>/deleteAddr";
	$.post(url,{addrNum:addrNum},function(args){
		$("#addrList").html(args);
	});
}
function deleteNotAddr(){
	alert('다른 주소를 기본 배송지로 변경 후, 삭제할 수 있습니다.')
}

function changeBasic(addrNum){
	var url = "<%=cp%>/changeBasicAddr";
	$.post(url,{addrNum:addrNum},function(args){
		$("#addrList").html(args);
	});
}


</script>


</head>
<body>
<c:if test="${addrLists.size()==0 }">
<div style="width: 1000px; height: 16px;"></div>
<div style="width: 1000px; padding: 80px 0px;" align="center">
	<div>
		<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">배송지 정보가 없습니다.</p>
		<p style="margin: 0px;font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">새 배송지를 등록해주세요.</p>
	</div>
	<div style="width: 108px;height: 34px;margin-top: 12px; padding: 7px 14px ;border-radius: 10px;cursor: pointer;
	border: 1px solid #d3d3d3;font-size: 12px;" align="center" id="addAddr" data-bs-toggle="modal" data-bs-target="#addrModal"
	onclick="open_focus();">
	<font style="letter-spacing: -.5px;color: rgba(34,34,34,.8); ">새 배송지 추가</font>
</div>
</div>
</c:if>
<c:if test="${addrLists.size()>0 }">
<c:forEach var="addrDTO" items="${addrLists }">

<c:if test="${addrDTO.addrBasic=='yes' }">
<div style="padding: 30px 0 29px; border-bottom: 1px solid #222;">
	<div style="position: relative;display: flex;-webkit-box-align: center;align-items: center;">
		<div style="margin-right: 24px;" align="left">
			<div>
				<span style="font-size: 12px;letter-spacing: -.06px;font-weight: 700;color: #000;">기본 배송지</span>
			</div>
			<div style="padding-top: 12px;">
				<div>
					<span style="color: #222;display: inline-block;font-weight: 700;vertical-align: top;font-size: 16px;
	    			letter-spacing: -.16px;">${addrDTO.recvName }</span>
				</div>
				<div style="padding-top: 4px;">
					<span style="color: rgba(34,34,34,.8);font-size: 15px;letter-spacing: -.15px;">(${addrDTO.postNum })</span>
					<span style="color: rgba(34,34,34,.8);font-size: 15px;letter-spacing: -.15px;">${addrDTO.addr1 } ${addrDTO.addr2 }
					</span>
				</div>
				<p style="color: rgba(34,34,34,.8);padding-top: 2px;margin:0px;font-size: 15px;">${addrDTO.recvPhone }</p>
			</div>
		</div>
		<div style="margin-left: auto;flex-shrink: 0;font-size: 0;">
			<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);text-decoration: none;display: inline-block;cursor: pointer;
	    	vertical-align: middle;text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
	    	font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;padding-right: 12px;"
	    	data-bs-toggle="modal" data-bs-target="#addrModal" 
	    	onclick="updateAddr('${addrDTO.addrNum}','${addrDTO.recvName}','${addrDTO.recvPhone}','${addrDTO.postNum}','${addrDTO.addr1}','${addrDTO.addr2}','${addrDTO.addrBasic}')">수정</div>
			<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);text-decoration: none;display: inline-block;cursor: pointer;
	   		vertical-align: middle;text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
		    font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;padding-right: 12px;
		    margin-left: 8px;" onclick="deleteNotAddr();">삭제</div>	
		</div>
	</div>
</div>
</c:if>
<c:if test="${addrDTO.addrBasic=='no' }">
<div style="padding-top: 16px;">
	<div style="position: relative;display: flex;-webkit-box-align: center;align-items: center;padding: 17px 0 14px;border-bottom: 1px solid #ebebeb;">
		<div style="margin-right: 24px;"align="left">
			<div>
				<span style="font-size: 15px;letter-spacing: -.15px;display: inline-block;vertical-align: top;font-weight: 400;">${addrDTO.recvName }
				</span>
			</div>
			<div style="padding-top: 4px;">
				<span style="color: rgba(34,34,34,.8);font-size: 14px;letter-spacing: -.21px;">(${addrDTO.postNum })</span>
				<span style="color: rgba(34,34,34,.8);font-size: 14px;letter-spacing: -.21px;">${addrDTO.addr1 } ${addrDTO.addr2 }</span>								
			</div>
			<p style="padding-top: 2px;margin:0px;font-size: 14px;color: rgba(34,34,34,.8);">${addrDTO.recvPhone }</p>
		</div>
		<div style="margin-left: auto;flex-shrink: 0;font-size: 0;">
			<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);text-decoration: none;display: inline-block;cursor: pointer;
		    vertical-align: middle;text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
		    font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px; padding-right: 12px;"
		    onclick="changeBasic('${addrDTO.addrNum}')">기본 배송지</div>		
			<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);text-decoration: none;display: inline-block;cursor: pointer;
	    	vertical-align: middle;text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
	    	font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;padding-right: 12px;
	    	margin-left: 8px;" data-bs-toggle="modal" data-bs-target="#addrModal"
	    	onclick="updateAddr('${addrDTO.addrNum}','${addrDTO.recvName}','${addrDTO.recvPhone}','${addrDTO.postNum}','${addrDTO.addr1}','${addrDTO.addr2}','${addrDTO.addrBasic}')">수정</div>
			<div style="-webkit-tap-highlight-color: rgba(0,0,0,.1);text-decoration: none;display: inline-block;cursor: pointer;
	   		vertical-align: middle;text-align: center;background-color: #fff;padding: 0 14px;height: 34px;line-height: 32px;border-radius: 10px;
		    font-size: 12px;letter-spacing: -.06px;border: 1px solid #d3d3d3;color: rgba(34,34,34,.8);padding-left: 11px;padding-right: 12px;
		    margin-left: 8px;" onclick="deleteAddr('${addrDTO.addrNum}','${addrDTO.using}')">삭제</div>	
		</div>
	</div>
</div>
</c:if>
</c:forEach>
</c:if>
    
<input type="hidden" id="mode" value="normal">
<input type="hidden" id="hidden_addrNum" value="normal">
<input type="hidden" id="hidden_state" value="normal">

</body>
</html>