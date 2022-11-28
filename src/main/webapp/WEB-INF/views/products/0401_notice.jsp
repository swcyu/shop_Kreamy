<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko"><head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>판매 유의사항</title>
  <style>
  @charset "UTF-8";
* {
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
}

html {
  -webkit-text-size-adjust:none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, p, table, th, td, form, fieldset, legend, textarea, input, select, textarea, button {
  margin: 0;
  padding: 0;
}

body, input, select, textarea, button {
  color: #222;
  font-family: 'AppleSDGothicNeo-Regular', BlinkMacSystemFont, arial, sans-serif;
  font-size: 14px;
  line-height: 1.2;
  -webkit-appearance: none;
  appearance: none;
}

img {
  border: 0;
  vertical-align: top;
}

ul, ol, li {
  list-style: none;
}

em, address {
  font-style: normal;
}

a {
  color: inherit;
  text-decoration: none;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1);
  -webkit-tap-highlight-color: transparent;
  outline: none;
}

a:hover, a:active, a:focus {
  text-decoration: none;
}

button {
  border: none;
  background: none;
  cursor: pointer;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1);
  -webkit-tap-highlight-color: transparent;
  outline: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  table-layout: fixed;
}

.blind {
  overflow: hidden;
  position: absolute !important;
  width: 1px;
  height: 1px;
  border: 0;
  padding: 0;
  clip: rect(0px, 0px, 0px, 0px);
}

body,html {
  height:100%;
  min-height:100%;
  background-color:#fff;
}

.wrap {
  min-width:320px;
  min-height:100%;
}



/* 쇼룸 - showroom_wrap */


.showroom_info_wrap .inner {
  padding:20px 16px 0 16px;
  word-break:break-word;
}

.showroom_info_wrap .info_box {
  line-height:20px;
}

.showroom_info_wrap .info_box .term {

  font-weight:600;
}

.showroom_info_wrap .info_box .term_text_location {
padding-bottom:20px;
  margin-bottom:20px;
  font-weight:800;
  font-size:25px;
  line-height:32px;
  letter-spacing:-1.2px;
  border-bottom: 2px solid #222;
}

.showroom_info_wrap .info_box .term_text_location span {
  font-family:-apple-system;
  font-weight:600;
}

.showroom_info_wrap .info_box .button01 {
	margin-bottom: 10px;
    padding: 0 15px;
    background-color: #222;
    width: 100%;
    height: 48px;    
    color: #fff;
    font-size:13px;
    text-align:left;
    
}

.showroom_info_wrap .info_box .button02 {

	margin-bottom:8px;
    padding: 0 15px;
    background-color: #fff;
    border: 1px solid #E0E0E0;
    width: 100%;
    height: 38px;    
    color: #222;
    font-size:12px;
    text-align:left;
    
}

.showroom_info_wrap .info_box .term_text {
  font-family:-apple-system;
  letter-spacing:-.3px;
  word-break:keep-all;
  margin-bottom:20px;
}

.showroom_info_wrap .info_box .term_text + .term_text {
  margin-top:20px;
}

.showroom_info_wrap .info_box .link {
margin-top:12px;
margin-bottom:20px;
font-family: SF Pro Text;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;
color: #828282;

}





@media screen and (max-width: 320px) {
  br {
    display:none;
  }

  table thead th br {
    display:block;
  }
}

@media screen and (min-width: 768px) {
  br {
    display:none;
  }
}


  
  </style>
</head>
<body>
  <div class="wrap">
    <div class="contnet">

        <div class="showroom_info_wrap">
          <div class="inner">
            <dl class="info_box">
              <dt class="blind">보유상품</dt>
              <dd class="term_text_location">
                반드시 보유하신 상품만<br>
                판매하세요.
             </dd>
              <dt class="blind">내용</dt>
              <dd class="term_text">
                <b>모든 판매는 보유하신 상품으로만 거래하시는 것이 원칙입니다.</b>
              </dd>
                <dd class="term_text">
                KREAM은 판매거래 체결 후, 48시간 이내(일,공휴일 제외)에 상품을 발송하여야 합니다. 온라인 주문 후 상품을 배송 받지 못하여 운송장번호를 입력하지 못하는 사례가 발생하고 있습니다.
              </dd>          
                <dd class="term_text">
                보유하신 상품이 아니거나, 즉시 발송이 불가능한 경우의 거래 체결은 발송지연, 미입고 등으로 <font color="#F15746">페널티 15%</font>가 부과됩니다.
              </dd>
            </dl>
          </div>
        </div>
    


      </div>
    </div>
  

</body></html>