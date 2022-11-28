
function accountFocusIn(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("account").className="focusIn";
		document.getElementById("account").placeholder="";
	}
}

function accountFocusOut(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("account").className="focusOut";
		document.getElementById("account").placeholder="- 없이 입력하세요";
	}
}
function holderFocusIn(){
	
	var account = (String)(document.getElementById("account").value);
	if(account.length!=1){
		document.getElementById("holder").className="focusIn";
		document.getElementById("holder").placeholder="";
	}
}

function holderFocusOut(){
	
	var account = (String)(document.getElementById("holder").value);
	if(account.length!=1){
		document.getElementById("holder").className="focusOut";
		document.getElementById("holder").placeholder="예금주명을 정확히 입력하세요";
	}
}

function accountCheck(){
	
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var bank = (String)(document.getElementById("bank").value)
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	
	if(account.length==1){
		document.getElementById("account").className="account_error";
		document.getElementById("account_error").className="account_error_on";	
		document.getElementById("account_title").className="account_title_red";		
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("account").className="focusIn";
		document.getElementById("account_error").className="account_error_off";	
		document.getElementById("account_title").className="account_title_black";	
		if(bank.length>0&&account.length>1&&holder.length>1){			
			if(originBank==bank && originAccount==account && originHolder==holder){
				document.getElementById("save").className="save_off";
			}else{
				if(originBank!=""){
					$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
				}
				document.getElementById("save").className="save_on";
			}
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}

function holderCheck(){
	
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var bank = (String)(document.getElementById("bank").value)
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	if(holder.length==1){
		document.getElementById("holder").className="account_error";
		document.getElementById("holder_error").className="account_error_on";	
		document.getElementById("holder_title").className="account_title_red";	
		document.getElementById("save").className="save_off";
	}else{
		document.getElementById("holder").className="focusIn";
		document.getElementById("holder_error").className="account_error_off";	
		document.getElementById("holder_title").className="account_title_black";
		if(bank.length>0&&account.length>1&&holder.length>1){			
			if(originBank==bank && originAccount==account && originHolder==holder){
				document.getElementById("save").className="save_off";
			}else{
				if(originBank!=""){
					$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
				}
				document.getElementById("save").className="save_on";
			}
		}else{
			document.getElementById("save").className="save_off";
		}
	}
}

function bankList(){
	var check = document.getElementById("bank-list").className;
	if(check == 'bank-list-open'){
		document.getElementById("bank-list").className="bank-list-close";
	}else{
		document.getElementById("bank-list").scrollTop=0;
		document.getElementById("bank-list").className="bank-list-open";
	}
	
}

function bank(bank){
	var originBank = document.getElementById("originBank").value
	var originAccount = document.getElementById("originAccount").value
	var originHolder = document.getElementById("originHolder").value
	
	var holder = (String)(document.getElementById("holder").value);
	var account = (String)(document.getElementById("account").value);
	
	document.getElementById("bank").value=bank;
	document.getElementById("bank-list").className="bank-list-close";
	
	if(bank.length>0&&account.length>1&&holder.length>1){			
		if(originBank==bank && originAccount==account && originHolder==holder){
			document.getElementById("save").className="save_off";
		}else{
			if(originBank!=""){
				$("#saveButton").html("<div class='save_off' id='save' data-bs-toggle='modal' data-bs-target='#exampleModal'>저장하기</div>")
			}
			document.getElementById("save").className="save_on";
		}
	}else{
		document.getElementById("save").className="save_off";
	}
}

function saveData(){
	if(document.getElementById("save").className=="save_on"){
		var originBank = document.getElementById("originBank").value

		var bank = document.getElementById("bank").value
		var holder = document.getElementById("holder").value
		var account = document.getElementById("account").value
		
		document.getElementById("originBank").value=bank
		document.getElementById("originAccount").value=account
		document.getElementById("originHolder").value=holder
		
		if(originBank == ""){
			var url = "<%=cp%>/saveAccount";
			$("#title").html("<h3 style='font-size: 28px;letter-spacing: -.36px;margin: 0px;font-weight: 700;'>정산 계좌 변경</h3>")
		}
		var url = "<%=cp%>/saveAccount";
		$.post(url,{bank:bank,holder:holder,account:account},function(args){
		});
	}
}