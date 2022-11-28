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
<script src="<%=cp%>/resources/js/jquery-3.6.0.js"></script>

<style type="text/css">
input::placeholder{
	color: rgba(134,134,134,.5);
}

.focusOut{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 7px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 1px solid #ebebeb;
}
.focusIn{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 7px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 2px solid #222222;
}
.error{
	box-sizing: border-box; 
	margin: 0; 
	color: #222; 
	outline: 0;
    border: 0;
    resize: none;
    padding: 8px 0;
    font-size: 15px; 
    width:480px;
	letter-spacing: -.15px;
	line-height: 22px;
	border-bottom: 1px solid #f15746;
}

.error_on{
	display: block;
	position: absolute; 
	display: block;
	line-height: 16px;
	font-size: 11px;
	color: #f15746;
	left: 0px; 
	bottom: -1px;
}
.error_off{
	display: none;
	position: absolute; 
	display: none;
	line-height: 16px;
	font-size: 11px;
	color: #f15746;
	left: 0px; 
	bottom: -1px;
}

.title_black{
	color: #222; 
	box-sizing: border-box;
	margin: 0; 
	padding: 0;
	font-size: 13px;
	letter-spacing: -.07px; 
	line-height: 18px;
	font-weight: 700;
}
.title_red{
	color: #f15746; 
	box-sizing: border-box;
	margin: 0; 
	padding: 0;
	font-size: 13px;
	letter-spacing: -.07px; 
	line-height: 18px;
	font-weight: 700;
}


.save_on{

    background-color: #222;
    color: #fff;
    cursor: pointer; 
	padding: 0px 18px;
	width: 105px;				
	height: 42px; 
	line-height: 40px;
	border-radius: 12px; 
	font-size: 14px; 
	letter-spacing: -.14px;
}

.save_off{
	background-color: #ebebeb; 
	color: #fff; 
	padding: 0px 18px;
	width: 105px;				
	height: 42px; 
	line-height: 40px;
	border-radius: 12px; 
	font-size: 14px; 
	letter-spacing: -.14px;
	cursor: default;
}

.save_cancel{
	border: 1px solid #d3d3d3;
    color: rgba(34,34,34,.8);
    background-color: #fff;
	padding: 0 18px;
	width: 102px;				
	height: 42px; 
	line-height: 40px;
	border-radius: 12px; 
	font-size: 14px; 
	letter-spacing: -.14px;
	cursor: pointer;
}

.sizeContainer{
    overflow-x: hidden;
    overflow-y: auto;
    padding: 6px 28px 0;
    height: 270px;
    margin: 0;
    box-sizing: border-box;
    display: block;
    color: #222;
}

.size_choice{
	float: left;
    display: table;
    margin: 4px;
    width: calc(33.33333% - 8px);
    height: 52px;
    padding: 0;
}
.size_on{
	
	
    width: 100%;
    height: 100%;
    border: 1px solid #d3d3d3;
   
    text-align: center;
    background-color: #fff;
    color: rgba(34,34,34,.8);
    padding: 5px 18px;
    line-height: 40px;
    font-size: 14px;
    letter-spacing: -.14px;
    cursor: pointer;
    vertical-align: middle;
    text-decoration: none;
    border-color: #333;
    font-weight: 700;
    border-radius: 12px;
}

.size_off{
	
    width: 100%;
    height: 100%;
    border: 1px solid #d3d3d3;
    
    text-align: center;
    background-color: #fff;
    color: rgba(34,34,34,.8);
    padding: 5px 18px;
    line-height: 40px;
    font-size: 14px;
    letter-spacing: -.14px;  
    cursor: pointer;
    vertical-align: middle;
    text-decoration: none;
    border-radius: 12px;
}

</style>
<script type="text/javascript">

$(function(){
	
	$('#oldPwd').on('input', oldPwdCheck);
	$('#newPwd').on('input', newPwdCheck);
	$('#newName').on('input', nameCheck);
	$('#newPhone').on('input', phoneCheck);
	
	var size = '#'+'${myPageDTO.shoesSize}'
	$(size).attr('class','size_on');
})

function pwdChange(){	
	document.getElementById("pwd_default").style.display = 'none'
	document.getElementById("changePwd").style.display = 'block'
}
function nameChange(){	
	document.getElementById("name_default").style.display = 'none'
	document.getElementById("changeName").style.display = 'block'
}
function phoneChange(){	
	document.getElementById("phone_default").style.display = 'none'
	document.getElementById("changePhone").style.display = 'block'
}

function isValidPassword(str){
	
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(pw.length < 8 || pw.length > 16){
		return false;
	}
	
	if(pw.search(/₩s/) != -1){
		return false;
	}
	
	if(num < 0 || eng < 0 || spe < 0 ){
		return false;
	}

	return true;
}

function oldPwdCheck(){
	
	var oldPwd = document.getElementById("oldPwd").value
	var newPwd = document.getElementById("newPwd").value
	
	if(!isValidPassword(oldPwd)&&oldPwd.length>0) {
		document.getElementById("oldPwd").className="error";
		document.getElementById("oldPwd_error").className="error_on";	
		document.getElementById("oldPwd_title").className="title_red";		
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("oldPwd").className="focusIn";
		document.getElementById("oldPwd_error").className="error_off";	
		document.getElementById("oldPwd_title").className="title_black";	
		if(isValidPassword(newPwd)){			
			document.getElementById("save").className="save_on";
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}

function newPwdCheck(){
	
	var oldPwd = document.getElementById("oldPwd").value
	var newPwd = document.getElementById("newPwd").value
	

	if(!isValidPassword(newPwd)&&newPwd.length>0) {
		document.getElementById("newPwd").className="error";
		document.getElementById("newPwd_error").className="error_on";	
		document.getElementById("newPwd_title").className="title_red";		
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("newPwd").className="focusIn";
		document.getElementById("newPwd_error").className="error_off";	
		document.getElementById("newPwd_title").className="title_black";	
		if(isValidPassword(oldPwd)){			
			document.getElementById("save").className="save_on";
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}
function nameCheck(){
	
	var newName = document.getElementById("newName").value

	if(newName.length==1) {
		document.getElementById("newName").className="error";
		document.getElementById("name_error").className="error_on";	
		document.getElementById("name_title").className="title_red";		
		document.getElementById("saveName").className="save_off";
	}else{
		document.getElementById("newName").className="focusIn";
		document.getElementById("name_error").className="error_off";	
		document.getElementById("name_title").className="title_black";	
		if(newName.length>1){
			document.getElementById("saveName").className="save_on";
		}else{
			document.getElementById("saveName").className="save_off";
		}
		
	}
}
function phoneCheck(){
	var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
	var newPhone = document.getElementById("newPhone").value

	if(!check.test(newPhone)&&newPhone.length!=0){
		document.getElementById("newPhone").className="error";
		document.getElementById("phone_error").className="error_on";	
		document.getElementById("phone_title").className="title_red";		
		document.getElementById("savePhone").className="save_off";
	}else{
		document.getElementById("newPhone").className="focusIn";
		document.getElementById("phone_error").className="error_off";	
		document.getElementById("phone_title").className="title_black";	
		if(newPhone.length>0){
			document.getElementById("savePhone").className="save_on";
		}else{
			document.getElementById("savePhone").className="save_off";
		}
		
	}
}

function saveData(){
	if(document.getElementById("save").className=="save_on"){

		var oldPwd = (String)(document.getElementById("oldPwd").value);
		var newPwd = (String)(document.getElementById("newPwd").value);
		
		var url = "<%=cp%>/checkPwd";
		$.post(url,{oldPwd:oldPwd},function(args){
			$("#pwd_check_back").html(args);
			if(document.getElementById("check_original_pwd").value=='yes'){
				var url = "<%=cp%>/savePwd";
				$.post(url,{newPwd:newPwd},function(args){
					cancelPwdChange()
					$("#originalPwd").html(newPwd);
				});
			}else{
				alert("기존 비밀번호가 일치하지 않습니다.")
			}
		});
	}
}

function saveName(){
	if(document.getElementById("saveName").className=="save_on"){
		var newName = document.getElementById("newName").value
		
		var url = "<%=cp%>/saveName";
		$.post(url,{newName:newName},function(args){
			cancelNameChange()
			$("#name_top").html(newName);
			$("#name_middle").html(newName);
			
		});
	}
}
function savePhone(){
	if(document.getElementById("savePhone").className=="save_on"){
		var newPhone = document.getElementById("newPhone").value
		
		var url = "<%=cp%>/savePhone";
		$.post(url,{newPhone:newPhone},function(args){
			$("#phone_check_back").html(args);
			if(document.getElementById("save_phone").value=='yes'){
				cancelPhoneChange()
				if(newPhone.length==10){
					newPhone = newPhone.substring(0,3)+'-'+newPhone.substring(3,6)+'-'+newPhone.substring(6) 
				}else{
					newPhone = newPhone.substring(0,3)+'-'+newPhone.substring(3,7)+'-'+newPhone.substring(7) 
				}
				$("#phone_middle").html(newPhone);
			}else{
				alert("이미 가입되어있는 휴대폰 번호입니다.")
			}
		});
	}
}
function oldPwdFocusIn(){
	
	var oldPwd = (String)(document.getElementById("oldPwd").value);
	if(isValidPassword(oldPwd)||oldPwd.length==0) {
		document.getElementById("oldPwd").className="focusIn";
		document.getElementById("oldPwd").placeholder="";
	}
}

function oldPwdFocusOut(){
	var oldPwd = (String)(document.getElementById("oldPwd").value);
	if(isValidPassword(oldPwd)||oldPwd.length==0) {
		document.getElementById("oldPwd").className="focusOut";
		document.getElementById("oldPwd").placeholder="영문,숫자,특수문자 조합 조합 8-16자";
	}
}
function newPwdFocusIn(){
	
	var newPwd = (String)(document.getElementById("newPwd").value);
	if(isValidPassword(newPwd)||newPwd.length==0) {
		document.getElementById("newPwd").className="focusIn";
		document.getElementById("newPwd").placeholder="";
	}
}

function newPwdFocusOut(){
	
	var newPwd = (String)(document.getElementById("newPwd").value);
	if(isValidPassword(newPwd)||newPwd.length==0) {
		document.getElementById("newPwd").className="focusOut";
		document.getElementById("newPwd").placeholder="영문,숫자,특수문자 조합 조합 8-16자";
	}
}
function nameFocusIn(){
	
	var newName = (String)(document.getElementById("newName").value);
	if(newName.length!=1) {
		document.getElementById("newName").className="focusIn";
		document.getElementById("newName").placeholder="";
	}
}

function nameFocusOut(){
	
	var newName = (String)(document.getElementById("newName").value);
	if(newName.length!=1) {
		document.getElementById("newName").className="focusOut";
		document.getElementById("newName").placeholder="고객님의 이름";
	}
}
function phoneFocusIn(){
	
	var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
	var newPhone = (String)(document.getElementById("newPhone").value);
	if(check.test(newPhone)||newPhone.length==0){
		document.getElementById("newPhone").className="focusIn";
		document.getElementById("newPhone").placeholder="";
	}
}

function phoneFocusOut(){
	
	var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
	var newPhone = (String)(document.getElementById("newPhone").value);
	if(check.test(newPhone)||newPhone.length==0){
		document.getElementById("newPhone").className="focusOut";
		document.getElementById("newPhone").placeholder="-없이 입력해주세요";
	}
}
function profileDefault(){
	
	var url = "<%=cp%>/profileDefault"
	$.post(url,{data:'default'},function(args){
		$("#profileContent").html(args)
	})
}

function sms_on(adData){
	document.getElementById("sms_on").checked="checked";
	var url = "<%=cp%>/adUpdate";
	$.post(url,{adData:adData},function(args){
	});
}
function sms_off(adData){
	document.getElementById("sms_off").checked="checked";
	var url = "<%=cp%>/adUpdate";
	$.post(url,{adData:adData},function(args){
	});
}
function email_on(adData){
	document.getElementById("email_on").checked="checked";
	var url = "<%=cp%>/adUpdate";
	$.post(url,{adData:adData},function(args){
	});
}
function email_off(adData){
	document.getElementById("email_off").checked="checked";
	var url = "<%=cp%>/adUpdate";
	$.post(url,{adData:adData},function(args){
	});
}

function imageUpload() {
    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
    jQuery("#imageFile").click();
}

function imageChange() {
    // 파일이 선택되면 업로드를 진행한다.
    imageTransmit();
}

function imageTransmit() {

    var form = jQuery("ajaxFrom")[0];
    var formData = new FormData(form);
    formData.append("message", "파일 확인 창 숨기기");
    formData.append("file", jQuery("#imageFile")[0].files[0]);

    	
    jQuery.ajax({
          url : "<%=cp%>/imageUpload"
        , type : "POST"
        , processData : false
        , contentType : false
        , data : formData
        , success:function(args) {
        	$("#profileContent").html(args);
        }
    });
}

function cancelPwdChange(){
	
	document.getElementById("pwd_default").style.display = 'block'
	document.getElementById("changePwd").style.display = 'none'
	document.getElementById("oldPwd").value =''
	document.getElementById("newPwd").value =''
	newPwdCheck()
	document.getElementById("oldPwd_error").className="error_off";	
	document.getElementById("oldPwd_title").className="title_black";	
	oldPwdFocusOut()
	document.getElementById("newPwd_error").className="error_off";	
	document.getElementById("newPwd_title").className="title_black";	
	newPwdFocusOut()
	
	
}
function cancelNameChange(){
	
	document.getElementById("name_default").style.display = 'block'
	document.getElementById("changeName").style.display = 'none'
	document.getElementById("newName").value =''
	nameCheck()
	document.getElementById("name_error").className="error_off";	
	document.getElementById("name_title").className="title_black";	
	nameFocusOut()
	
	
}
function cancelPhoneChange(){
	
	document.getElementById("phone_default").style.display = 'block'
	document.getElementById("changePhone").style.display = 'none'
	document.getElementById("newPhone").value =''
	phoneCheck()
	document.getElementById("phone_error").className="error_off";	
	document.getElementById("phone_title").className="title_black";	
	phoneFocusOut()
	
	
}

function sizeChange(size){
	var size_id = '#'+size
	$(".size_on").attr('class','size_off')
	$(size_id).attr('class','size_on')
	document.getElementById("hidden_size").value = size
}

function saveSize(){
	var size = document.getElementById("hidden_size").value
	var url = "<%=cp%>/saveSize";
	$.post(url,{size:size},function(args){
		$("#size_middle").html(size);
	});
}

function size_default(){
	var size = document.getElementById('size_middle').innerText
	var size_id = '#'+size
	$(".size_on").attr('class','size_off')
	$(size_id).attr('class','size_on')
	document.getElementById("hidden_size").value = size
}

</script>
</head>
<body>
<input type="file" id="imageFile" onChange="imageChange();" style="display:none;"/>
<div style="padding: 50px 0px 38px;border-bottom: 1px solid #ebebeb; display: flex;">
	<div style="float: left; width: 115px;" align="left">
		<img src="/img/${myPageDTO.profileImage }" style="width: 100px; height: 100px;border-radius: 100%;">
	</div>
	<div style="float: left; width: 800px;" align="left">
		<div align="left" style="padding-top: 15px;">
			<h3 style="font-size: 24px; font-weight: 700;" id="name_top">${myPageDTO.id }</h3>
		</div>
		<div style="display: flex; margin-top: 12px;">
			<div style="float: left; width: 92.63px; height: 34px; border: 1px solid #d3d3d3; color: rgba(34,34,34,.8);
			    font-size: 12px;letter-spacing: -.36px; padding: 0 14px;line-height: 32px;border-radius: 10px;cursor: pointer;"onClick="imageUpload();">
			이미지 변경</div>
			<div style="float: left; width: 53.89px; height: 34px; border: 1px solid #d3d3d3; color: rgba(34,34,34,.8);
			    font-size: 12px;letter-spacing: -.06px; padding: 0 14px;line-height: 32px;border-radius: 10px;
			    margin-left: 8px;cursor: pointer;" onclick="profileDefault()">
			삭제</div>
		</div>
	</div>
</div>


<div style="padding-top: 38px; " align="left">
	<div style="width: 480px;" align="left">
		<div>
			<h4 style="font-size: 18px; font-weight: 600;">로그인 정보</h4>
		</div>
		<div style="padding: 25px 60px 18px 0px;border-bottom: 1px solid #ebebeb;">
			<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
			이메일 주소</div>
			<div style="padding-top: 6px; font-size: 16px;letter-spacing: -.16px;color: rgba(34,34,34,.5);">
			${myPageDTO.email }</div>
		</div>
		<div style="padding: 23px 0px 18px;border-bottom: 1px solid #ebebeb; position: relative;display: block;" id="pwd_default">
			<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);height: 17px;">
			비밀번호</div>
			<div style="padding-top: 6px; color: #222;height: 25px;">
				<input style="border: 0px;font-size: 22px;letter-spacing: -.5px;height:15px; padding: 0px 0px" 
				type="password" value="*********" readonly="readonly" id="originalPwd"/>
			</div>
	
			<div style="width:48.89px;height:34px; margin-top: 8px;padding: 0px 12px 0px 11px;border: 1px solid #d3d3d3;
			color: rgba(34,34,34,.8);font-size: 12px;letter-spacing: -.06px;line-height: 32px; border-radius: 10px;
			position: absolute; right: 0px; bottom: 15px;cursor: pointer;"onclick="pwdChange();">
			변경</div>
		</div>	
		
		<div style="padding-top: 23px; margin: 0px; display: none;" id="changePwd" >			
			<div style="width:480px;height:39.6px;padding-bottom: 22px;color: #222; font-size: 13px;letter-spacing: -.07px;"
			class="pwd_title_black" > 
				비밀번호 변경
			</div>
			

			<div style="width: 480px; padding:10px 0px 14px; position: relative;">
				<h3 class="title_black" id="oldPwd_title">이전 비밀번호</h3>
				<div>
					<input type="password" placeholder="영문,숫자,특수문자 조합 조합 8-16자" id="oldPwd" class="focusOut"
 						onfocus="oldPwdFocusIn();" onblur="oldPwdFocusOut();"/>
				</div>
				<div class="error_off" id="oldPwd_error">영문,숫자,특수문자를 조합해서 입력해주세요. (8-16자)</div>					
			</div>
			
			<div style="width: 480px; padding:10px 0px 14px; position: relative;">
				<h3 class="title_black" id="newPwd_title">새 비밀번호</h3>
				<div>
					<input type="password" placeholder="영문,숫자,특수문자 조합 조합 8-16자" id="newPwd" class="focusOut"
 						onfocus="newPwdFocusIn();" onblur="newPwdFocusOut();"/>
				</div>
				<div class="error_off" id="newPwd_error">영문,숫자,특수문자를 조합해서 입력해주세요. (8-16자)</div>					
			</div>
			
			<div align="center" style="display:flex; ">
				<div style="width: 105px; padding-top:20px;margin-right :2px;margin-left:129px;display: inline-block;" align="center">
					<div class="save_cancel"  onclick="cancelPwdChange();">취소</div>
				</div>
	
				<div style="width: 105px; padding-top:20px;margin-left :8px;display: inline-block;" align="center" id="saveButton">
					<div class="save_off" id="save" onclick="saveData();">저장</div>
				</div>
			</div>
		</div>
		
		<div style="padding-top: 58px;">
			<div>
				<h4 style="font-size: 18px; font-weight: 600;">개인 정보</h4>
			</div>
			<div style="padding: 17px 60px 18px 0px;border-bottom: 1px solid #ebebeb; position: relative;" id="name_default">
				<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
				이름</div>
				<div style="padding-top: 6px; font-size: 16px;letter-spacing: .6px;color: #222;" id="name_middle">
				${myPageDTO.id }</div>
				<div style="width:48.89px;height:34px; margin-top: 8px;padding: 0px 12px 0px 11px;border: 1px solid #d3d3d3;
				color: rgba(34,34,34,.8);font-size: 12px;letter-spacing: -.06px;line-height: 32px; border-radius: 10px;
				position: absolute; right: 0px; bottom: 15px;cursor: pointer;"onclick="nameChange();">
				변경</div>
			</div>
			
			<div style="padding-top: 17px; margin: 0px; display: none;" id="changeName" >			
				<div style="width:480px;height:39.6px;padding-bottom: 22px;color: #222; font-size: 13px;letter-spacing: -.07px;"
				class="title_black" > 
					이름
				</div>
				
				<div style="width: 480px; padding:10px 0px 14px; position: relative;">
					<h3 class="title_black" id="name_title">새로운 이름</h3>
					<div>
						<input type="text" placeholder="고객님의 이름" id="newName" class="focusOut"
	 						onfocus="nameFocusIn();" onblur="nameFocusOut();"/>
					</div>
					<div class="error_off" id="name_error">올바른 이름을 입력해주세요. (2-50자)</div>					
				</div>
				
				<div align="center" style="display:flex; ">
					<div style="width: 105px; padding-top:20px;margin-right :2px;margin-left:129px;display: inline-block;" align="center">
						<div class="save_cancel"  onclick="cancelNameChange();">취소</div>
					</div>
		
					<div style="width: 105px; padding-top:20px;margin-left :8px;display: inline-block;" align="center" id="saveNameButton">
						<div class="save_off" id="saveName" onclick="saveName();">저장</div>
					</div>
				</div>
			</div>
			
				
			<div style="padding: 25px 60px 18px 0px;border-bottom: 1px solid #ebebeb; position: relative;"id="phone_default">
				<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
				휴대폰 번호</div>
				<div style="padding-top: 6px; font-size: 16px;letter-spacing: .6px;color: #222;" id="phone_middle">
				${myPageDTO.phone }</div>
				<div style="width:48.89px;height:34px; margin-top: 8px;padding: 0px 12px 0px 11px;border: 1px solid #d3d3d3;
				color: rgba(34,34,34,.8);font-size: 12px;letter-spacing: -.06px;line-height: 32px; border-radius: 10px;
				position: absolute; right: 0px; bottom: 15px;cursor: pointer;"onclick="phoneChange();">
				변경</div>
			</div>
				
				
			<div style="padding-top: 25px; margin: 0px; display: none;" id="changePhone" >			
				<div style="width:480px;height:39.6px;padding-bottom: 22px;color: #222; font-size: 13px;letter-spacing: -.07px;"
				class="title_black" > 
					휴대폰 번호
				</div>
				
				<div style="width: 480px; padding:10px 0px 14px; position: relative;">
					<h3 class="title_black" id="phone_title">새로운 휴대폰 번호</h3>
					<div>
						<input type="text" placeholder="-없이 입력하세요" id="newPhone" class="focusOut"
	 						onfocus="phoneFocusIn();" onblur="phoneFocusOut();"
	 						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
					<div class="error_off" id="phone_error">정확한 휴대폰 번호를 입력해 주세요.</div>					
				</div>
				
				<div align="center" style="display:flex; ">
					<div style="width: 105px; padding-top:20px;margin-right :2px;margin-left:129px;display: inline-block;" align="center">
						<div class="save_cancel"  onclick="cancelPhoneChange();">취소</div>
					</div>
		
					<div style="width: 105px; padding-top:20px;margin-left :8px;display: inline-block;" align="center" id="savePhoneButton">
						<div class="save_off" id="savePhone" onclick="savePhone();">저장</div>
					</div>
				</div>
			</div>	
				
				
			<div style="padding: 23px 60px 18px 0px;border-bottom: 1px solid #ebebeb; position: relative;">
				<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);">
				사이즈</div>
				<div style="padding-top: 6px; font-size: 16px;letter-spacing: .6px;color: #222;" id="size_middle">
				${myPageDTO.shoesSize }</div>
				<div style="width:48.89px;height:34px; margin-top: 8px;padding: 0px 12px 0px 11px;border: 1px solid #d3d3d3;
				color: rgba(34,34,34,.8);font-size: 12px;letter-spacing: -.06px;line-height: 32px; border-radius: 10px;
				position: absolute; right: 0px; bottom: 15px;cursor: pointer;"data-bs-toggle="modal" data-bs-target="#sizeModal"
				onclick="size_default();">
				변경</div>
			</div>
		</div>
		<div style="padding-top: 58px;">
			<div>
				<h4 style="font-size: 18px; font-weight: 600;">광고성 정보 수신</h4>
			</div>
			<div style="padding: 25px 200px 20px 0px;border-bottom: 1px solid #ebebeb; position: relative;">
				
				<div style="padding-top: 6px; font-size: 15px;letter-spacing: .6px;color: #222;">
				문자 메세지</div>
				
				<div style="position: absolute;bottom: 20px; right: 100px; display: flex;cursor: pointer;"
				onclick="sms_on('sms_on');">
					<div style="width: 60px;height: 19px;font-size: 14px; letter-spacing: -.21px;color: rgba(34,34,34,.8); 
					float: right; margin: 2px 4px 0px 0px">수신 동의</div>
					<div style="width: 20px;height: 20px;border: 1px solid black;border-radius: 100%;float: right; 
					position: relative; margin-top:2px; ">
						<c:if test="${myPageDTO.adSms=='yes' }">
							<input type="radio" name="sms" id="sms_on" checked="checked" style="position: absolute;
							top: 3px;left: 3px; cursor: pointer;">
						</c:if>
						<c:if test="${myPageDTO.adSms=='no' }">
							<input type="radio" name="sms" id="sms_on" style="position: absolute;
							top: 3px;left: 3px; cursor: pointer;">
						</c:if>
					</div>
				</div>
				<div style="position: absolute;bottom: 20px; right: 0px; display: flex;cursor: pointer;"
				onclick="sms_off('sms_off');">
					<div style="width: 60px;height: 19px;font-size: 14px; letter-spacing: -.21px;color: rgba(34,34,34,.8); 
					float: right; margin: 2px 4px 0px 0px">수신 거부</div>
					<div style="width: 20px;height: 20px;border: 1px solid black;border-radius: 100%;float: right; 
					position: relative; margin-top:2px; ">
						<c:if test="${myPageDTO.adSms=='yes' }">
							<input type="radio" name="sms" id="sms_off" style="position: absolute;top: 3px;left: 3px;
							cursor: pointer;">
						</c:if>	
						<c:if test="${myPageDTO.adSms=='no' }">
							<input type="radio" name="sms" id="sms_off" style="position: absolute;top: 3px;left: 3px;
							cursor: pointer;"checked="checked" >
						</c:if>	
					</div>
					
				</div>
			</div>
			<div style="padding: 23px 200px 20px 0px;border-bottom: 1px solid #ebebeb; position: relative;">
				
				<div style="padding-top: 6px; font-size: 15px;letter-spacing: .6px;color: #222;">
				이메일</div>
				
				<div style="position: absolute;bottom: 20px; right: 100px; display: flex;cursor: pointer;"
				onclick="email_on('email_on');">
					<div style="width: 60px;height: 19px;font-size: 14px; letter-spacing: -.21px;color: rgba(34,34,34,.8); 
					float: right; margin: 2px 4px 0px 0px">수신 동의</div>
					<div style="width: 20px;height: 20px;border: 1px solid black;border-radius: 100%;float: right; 
					position: relative; margin-top:2px; ">
						<c:if test="${myPageDTO.adEmail=='yes' }">
							<input type="radio" name="email" id="email_on" checked="checked" style="position: absolute;
							top: 3px;left: 3px; cursor: pointer;">
						</c:if>
						<c:if test="${myPageDTO.adEmail=='no' }">
							<input type="radio" name="email" id="email_on" style="position: absolute;
							top: 3px;left: 3px; cursor: pointer;">
						</c:if>
					</div>
				</div>
				<div style="position: absolute;bottom: 20px; right: 0px; display: flex;cursor: pointer;"
				onclick="email_off('email_off');">
					<div style="width: 60px;height: 19px;font-size: 14px; letter-spacing: -.21px;color: rgba(34,34,34,.8); 
					float: right; margin: 2px 4px 0px 0px">수신 거부</div>
					<div style="width: 20px;height: 20px;border: 1px solid black;border-radius: 100%;float: right; 
					position: relative; margin-top:2px; ">
						<c:if test="${myPageDTO.adEmail=='yes' }">
							<input type="radio" name="email" id="email_off" style="position: absolute;top: 3px;left: 3px;
							cursor: pointer;">
						</c:if>
						<c:if test="${myPageDTO.adEmail=='no' }">
							<input type="radio" name="email" id="email_off" style="position:absolute;top: 3px;left: 3px;
							cursor: pointer;"checked="checked">
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
		<div style="margin-top: 55px;padding: 5px 0;display: inline-block;font-size: 13px;letter-spacing: -.07px;
					 color: rgba(34,34,34,.5);">
			<u style="cursor: pointer;" onclick="location.href='<%=cp%>/withdrawal'">회원 탈퇴</u>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="sizeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 448px; height:346x; top:280px; left:30px; border-radius: 12px; ">
			<div style="width:448px;height:57px; padding: 18px 16px 0;min-height: 46px;position: relative;" align="center" >
				<h2 style="font-size: 18px;font-weight: 700;letter-spacing: -.27px;color: #000;">사이즈 선택</h2>	
			</div>
			<div class="sizeContainer">
				<div class="size_choice">	
					<div onclick="sizeChange('220')" class="size_off" id="220">220</div>
				</div>
				<div class="size_choice">
					<div onclick="sizeChange('225')" class="size_off" id="225">225</div>
				</div >
				<div class="size_choice">	
					<div onclick="sizeChange('230')" class="size_off" id="230">230</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('235')" class="size_off" id="235">235</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('240')" class="size_off" id="240">240</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('245')" class="size_off" id="245">245</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('250')" class="size_off" id="250">250</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('255')" class="size_off" id="255">255</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('260')" class="size_off" id="260">260</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('265')" class="size_off" id="265">265</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('270')" class="size_off" id="270">270</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('275')" class="size_off" id="275">275</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('280')" class="size_off" id="280">280</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('285')" class="size_off" id="285">285</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('290')" class="size_off" id="290">290</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('295')" class="size_off" id="295">295</div>
				</div>
				<div class="size_choice">	
					<div onclick="sizeChange('300')" class="size_off" id="300">300</div>
				</div>
			</div>
			
			<div style="height: 98px;padding: 24px 32px 32px;" align="center">
				<div style="width: 120px;height: 42px; padding: 10px 18px; border-radius: 10px; font-size: 14px;
				background-color: #222; color: #fff;cursor: pointer;"data-bs-dismiss="modal" onclick="saveSize();">
					확인
				</div>
			</div>

		</div>
	</div>
</div>
<input type="hidden" id="hidden_size" value="${myPageDTO.shoesSize}">
<div id="phone_check_back" style="display:none;"></div>
<div id="pwd_check_back" style="display:none;"></div>
</body>
</html>