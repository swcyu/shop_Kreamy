<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/shop_popup.css"/>  
<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
<script src="https://kit.fontawesome.com/cd5dd810df.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="<%=cp%>/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">
*{
	font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,"나눔고딕",
	"Segoe UI",Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	margin: 0px;
	padding: 0px;
}
a {
	cursor: hand;
	color: #000000;
	text-decoration: none;
	font-size: 13pt;
	line-height: 150%;
}
dl{
    margin-top: 0;margin-bottom: -1rem;
}
.quick_filter:after{
    content: "";
    position: absolute;
    top: 100%;
    right: 0;
    top:19px;
    transform: translateY(-50%);
    width: 1px;
    height: 32px;
    background-color: #ebebeb;
}
.category_select_option:after, .brand_select_option:after, .cost_select_option:after{
	content: "";
    position: absolute;
    top: 3px;
    margin-left: 3px;
    width: 5px;
    height: 5px;
    border-radius: 100%;
    background-color: #f15746;
}
.unchoice_category{
	display: inline-block;
    padding: 10px 12px;
    height: 38px;
    background-color: #f4f4f4;
    border-radius: 12px;
    font-size: 15px;
    letter-spacing: -.15px;
    vertical-align: top;
}
.choice_category{
    display: inline-block;
    padding: 10px 12px;
    height: 38px;
    border-radius: 12px;
    font-size: 15px;
    letter-spacing: -.15px;
    vertical-align: top;
    text-decoration: none;
    background-color: #fef7f6;
    color: #f15746;
    font-weight: 700;
}
.sorting_title:after{
	content: "";
    margin-left: 2px;
    display: inline-flex;
    width: 24px;
    height: 24px;
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiMyMjIiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTYuNDcgMTkuNTNsLjUzLjUzLjUzLS41MyA0LTQtMS4wNi0xLjA2LTIuNzIgMi43MlY1aC0xLjV2MTIuMTlsLTIuNzItMi43Mi0xLjA2IDEuMDYgNCA0ek0xNy41MyA0LjQ3TDE3IDMuOTRsLS41My41My00IDQgMS4wNiAxLjA2IDIuNzItMi43MlYxOWgxLjVWNi44MWwyLjcyIDIuNzIgMS4wNi0xLjA2LTQtNHoiIGNsaXAtcnVsZT0iZXZlbm9kZCIvPgo8L3N2Zz4K) no-repeat;
}


.search_result_list:after{
	content: "";
    display: block;
    clear: both;
}

#radioCircle {
	border: 1px solid black; 
	background-color:white; 
	border-radius: 20px; 
	width: 13px; 
	height: 13px; 
	display: inline-flex; 
	align-items: center;"

}


div.radio-wrap {
  display: inline-flex;
  align-items: center;
}

div.checkbox-wrap {
  display: inline-flex;
  align-items: center;
}

}

input[type='radio'] + label {
	visibility: hidden;
	width: 0px;
	height: 0px;
	border: 0px;
	cursor: pointer;
}


input[type='radio'] {
	appearance:none;
	width:9px;
	height:11px;
	cursor: pointer;
}  

input[type='radio']:checked + label {
	float:right;
	width: 12px;
	height: 12px;
	z-index: 1;
	background-image: url("/img/arrow2.png");
	background-size: 11px 14px;
}


input[type='radio']:checked {
	display: none;
}




input[class="cb1"] {
	appearance:none;
	width:2px;
	height:11px;
	cursor: pointer;
}  

input[class="cb1"]:checked{
display: none;
}

input[class="cb1"]:checked + label {
	
	width: 16px;
	height: 12px;
	z-index: 1;
	background-image: url('/img/arrow2.png');
	background-size: 11px 14px;
}



input[id="cb2"] + label {
	
	
	width: 13px;
	height: 13px;
	border: 1px;
	cursor: pointer;
}


input[id="cb2"] {
	appearance:none;
	width:30px;
	height:15px;
	border: 0.5px;
	float:right;
	cursor: pointer;
}  


input[id="cb2"]:checked {
	display: none;
}

.menu{
cursor: pointer;
}

.tag{
	box-sizing: border-box;
    font-size: 12px;
    letter-spacing: -.06px;
}
input[id="cb2"]:checked + label {
	background-image: url('/img/arrow2.png');
	background-size: 13px 13px;
	float: right;
	  
}
label{
	cursor: pointer;
}
</style>


<script type="text/javascript">
$(function(){
	$('#filterCount').hide()
	
	
	
	if('${searchKey}'!=null){
		direct_search('${searchKey}')
	}else{
		send()
	}
	
	
})

function filter_open(filter){
	document.getElementById('open_'+filter+'_filter').style.display='block'
	document.getElementById('close_'+filter+'_filter').style.display='none'
}
function filter_close(filter){
	document.getElementById('open_'+filter+'_filter').style.display='none'
	document.getElementById('close_'+filter+'_filter').style.display='block'
}

function category_choice(category){
	if($('#'+category+'_checkBox').attr('class')=='category_checkBox_unchecked'){
		delete_category_tag()
		$('.category_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
		$('.category_checkBox_checked').attr('class','category_checkBox_unchecked')
		$('.choice_category').attr('class','unchoice_category')
		$('#'+category+'_tab').attr('class','choice_category')
		$('#'+category+'_checkBox').attr('class','category_checkBox_checked')
		$('#'+category+'_checkBox').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-active" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path fill="#000" d="M0 .5h16v16H0z"></path><path stroke="#fff" stroke-width="1.5" d="M12.267 5.3L6.4 11.166 3.733 8.5"></path></svg>')
		if(category=='sneakers'){
			$('#category_filter').text('스니커즈')
			insert_tag('category','스니커즈')
		}
		if(category=='apparel'){
			$('#category_filter').text('의류')
			insert_tag('category','의류')
		}
		if(category=='goods'){
			$('#category_filter').text('패션 잡화')
			insert_tag('category','패션 잡화')
		}
		if(category=='tech'){
			$('#category_filter').text('테크')
			insert_tag('category','테크')
		}
		if(category=='life'){
			$('#category_filter').text('라이프')
			insert_tag('category','라이프')
		}
	}else{
		$('.category_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
		$('.category_checkBox_checked').attr('class','category_checkBox_unchecked')
		$('.choice_category').attr('class','unchoice_category')
		$('#category_filter').text('모든 카테고리')
		if(category=='sneakers'){
			delete_tag('스니커즈')
		}
		if(category=='apparel'){
			delete_tag('의류')
		}
		if(category=='goods'){
			delete_tag('패션 잡화')
		}
		if(category=='tech'){
			delete_tag('테크')
		}
		if(category=='life'){
			delete_tag('라이프')
		}
	}
	if($('.category_checkBox_checked').length==0){
		$('.category_select_option').attr('class','category_select_option_off')
	}else{
		$('.category_select_option_off').attr('class','category_select_option')
	}
	if($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length==0){
		$('#filterCount').hide()
	}else{
		$('#filterCount').show()
		$('#filterCount').html($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length)
	}
	send()
}
function brand_choice(brand){
	var newBrand=$('#brand_filter').html().trim()
	if($('#'+brand+'_checkBox').attr('class')=='brand_checkBox_unchecked'){
		$('#'+brand+'_checkBox').attr('class','brand_checkBox_checked')
		$('#'+brand+'_checkBox').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-active" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path fill="#000" d="M0 .5h16v16H0z"></path><path stroke="#fff" stroke-width="1.5" d="M12.267 5.3L6.4 11.166 3.733 8.5"></path></svg>')
		brand=brand.replace(/_/gi,' ')
		insert_tag('brand',brand)
		if($('.brand_checkBox_checked').length==1){
			$('#brand_filter').text(brand)
		}else{
			$('#brand_filter').text(newBrand+", "+brand)
		}
	}else{
		$('#'+brand+'_checkBox').attr('class','brand_checkBox_unchecked')
		$('#'+brand+'_checkBox').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
		brand=brand.replace(/_/gi,' ')
		delete_tag(brand)
		if($('.brand_checkBox_checked').length==0){
			$('#brand_filter').text('모든 브랜드')
		}else if(newBrand.indexOf(brand)==0){
			newBrand=newBrand.replace(brand+', ','')
			$('#brand_filter').text(newBrand)
		}else{
			newBrand=newBrand.replace(', '+brand,'')
			$('#brand_filter').text(newBrand)
		}
	}
	if($('.brand_checkBox_checked').length==0){
		$('.brand_select_option').attr('class','brand_select_option_off')
	}else{
		$('.brand_select_option_off').attr('class','brand_select_option')
	}
	if($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length==0){
		$('#filterCount').hide()
	}else{
		$('#filterCount').show()
		$('#filterCount').html($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length)
	}
	send()
}
function cost_choice(cost){
	if($('#'+cost+'_checkBox').attr('class')=='cost_checkBox_unchecked'){
		$('.cost_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
		$('.cost_checkBox_checked').attr('class','cost_checkBox_unchecked')
		delete_cost_tag()
		$('#'+cost+'_checkBox').attr('class','cost_checkBox_checked')
		$('#'+cost+'_checkBox').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-active" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path fill="#000" d="M0 .5h16v16H0z"></path><path stroke="#fff" stroke-width="1.5" d="M12.267 5.3L6.4 11.166 3.733 8.5"></path></svg>')
		if(cost=='less_than_10'){
			cost='10만원 이하'
		}
		if(cost=='10-30'){
			cost='10만원 - 30만원 이하'
		}
		if(cost=='30-50'){
			cost='30만원 - 50만원 이하'
		}
		if(cost=='more_than_50'){
			cost='50만원 이상'
		}
		$('#cost_filter').text(cost)
		insert_tag('cost',cost)
		$('.cost_select_option_off').attr('class','cost_select_option')
		
	}else{
		$('#'+cost+'_checkBox').attr('class','cost_checkBox_unchecked')
		$('#'+cost+'_checkBox').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
		if(cost=='less_than_10'){
			delete_tag('10만원 이하')
		}
		if(cost=='10-30'){
			delete_tag('10만원 - 30만원 이하')
		}
		if(cost=='30-50'){
			delete_tag('30만원 - 50만원 이하')
		}
		if(cost=='more_than_50'){
			delete_tag('50만원 이상')
		}
		
		$('#cost_filter').text('모든 가격')
		$('.cost_select_option').attr('class','cost_select_option_off')
	}
	
	if($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length==0){
		$('#filterCount').hide()
	}else{
		$('#filterCount').show()
		$('#filterCount').html($('.category_checkBox_checked').length+$('.brand_checkBox_checked').length+$('.cost_checkBox_checked').length)
	}
	send()
}

function sort_choice(sort){
	document.getElementById(sort).checked=true;
	document.getElementById('hidden_sort').value = sort;
	send()
	
}
function delete_category_tag(){
	delete_tag('스니커즈')
	delete_tag('의류')
	delete_tag('패션 잡화')
	delete_tag('테크')
	delete_tag('라이프')
	
}
function delete_cost_tag(){
	delete_tag('10만원 이하')
	delete_tag('10만원 - 30만원 이하')
	delete_tag('30만원 - 50만원 이하')
	delete_tag('50만원 이상')
	
}
function filter_remove(){
	$('.category_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.category_checkBox_checked').attr('class','category_checkBox_unchecked')
	$('.brand_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.brand_checkBox_checked').attr('class','brand_checkBox_unchecked')
	$('.cost_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.cost_checkBox_checked').attr('class','cost_checkBox_unchecked')
	$('#category_filter').text('모든 카테고리')
	$('#brand_filter').text('모든 브랜드')
	$('#cost_filter').text('모든 가격')
	$('#filterCount').hide()
	filter_close('category')
	filter_close('brand')
	filter_close('cost')
	$('.category_select_option').attr('class','category_select_option_off')
	$('.brand_select_option').attr('class','brand_select_option_off')
	$('.cost_select_option').attr('class','cost_select_option_off')
	$('.choice_category').attr('class','unchoice_category')
	$('#filter_tag').html('')
	send()
}

function send(){
	var category = $('#category_filter').text().trim()
	var brand = $('#brand_filter').text().trim()
	var cost = $('#cost_filter').text().trim()
	var sorting = document.getElementById('hidden_sort').value
	
	var url = "<%=cp%>/filterSearch.action"
	$.post(url,{category:category,brand:brand,cost:cost,sorting:sorting},function(args){
		$('#productList').html(args)
	})
}
function wish(engProduct) {
	
	
	var engProduct = engProduct;
	var category = $('#category_filter').text().trim()
	var brand = $('#brand_filter').text().trim()
	var cost = $('#cost_filter').text().trim()

	
	var url = "<%=cp%>/wishProdcut.action"
	$.post(url,{category:category,brand:brand,cost:cost,engProduct:engProduct},function(args){
		$('#wishProduct').html(args)
	})

}

//정렬방법 보이기
function showSortingList() {
	
	const popup = document.querySelector('#sorting_list');
	
	popup.classList.remove('hide');
	
	$('#sorting_title').removeAttr('onclick');
	
	$('#sorting_title').attr('onclick','closeSortingList();');
	
}

//정렬방법 안 보이기
function closeSortingList() {
	
	const popup = document.querySelector('#sorting_list');
	
	popup.classList.add('hide');
	
	$('#sorting_title').removeAttr('onclick');
	
	$('#sorting_title').attr('onclick','showSortingList();');
	
}

function direct_search(searchKey){
	$('.category_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.category_checkBox_checked').attr('class','category_checkBox_unchecked')
	$('.brand_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.brand_checkBox_checked').attr('class','brand_checkBox_unchecked')
	$('.cost_checkBox_checked').html('<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; height: 16px;margin-right: 8px;"><path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>')
	$('.cost_checkBox_checked').attr('class','cost_checkBox_unchecked')
	$('#category_filter').text('모든 카테고리')
	$('#brand_filter').text('모든 브랜드')
	$('#cost_filter').text('모든 가격')
	$('#filterCount').hide()
	filter_close('category')
	filter_close('brand')
	filter_close('cost')
	$('.category_select_option').attr('class','category_select_option_off')
	$('.brand_select_option').attr('class','brand_select_option_off')
	$('.cost_select_option').attr('class','cost_select_option_off')
	$('.choice_category').attr('class','unchoice_category')
	var url = "<%=cp%>/shopSearch.action"
	
	$.post(url,{searchKey:searchKey},function(args){
		$('#productList').html(args)
	})
	
}
function delete_tag(id){
	id=id.replace(/ /gi,'_')
	if($('#'+id).length>0){
		document.getElementById(id).remove()
	}
}
function insert_tag(filter,id){
	if(id.indexOf(' ')!=-1){
	var newId = id.replace(/ /gi,'_')
	var tag = '<div style="display: inline-flex;align-items: center;margin: 6px 8px 0 0;padding: 4px 2px 4px 10px;'+
			'background-color: #f4f4f4;border-radius: 6px;" id="'+newId+'">'+
				'<span style="color: #222;box-sizing: border-box;font-size: 12px;letter-spacing: -.06px;">'+id+'</span>'+
				'<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-delete-gray" fill="none" viewBox="0 0 24 24" style="width: 24px;cursor:pointer;" onclick="remove_tag(\''+filter+'\',\''+newId+'\')">'+
				'<path fill="#BBB" fill-rule="evenodd" d="M10.94 12l-3.47 3.47 1.06 1.06L12 13.06l3.47 3.47'+
				 '1.06-1.06L13.06 12l3.47-3.47-1.06-1.06L12 10.94 8.53 7.47 7.47 8.53 10.94 12z" clip-rule="evenodd"></path></svg></div>'
	}else{
		var tag = '<div style="display: inline-flex;align-items: center;margin: 6px 8px 0 0;padding: 4px 2px 4px 10px;'+
		'background-color: #f4f4f4;border-radius: 6px;" id="'+id+'">'+
			'<span style="color: #222;box-sizing: border-box;font-size: 12px;letter-spacing: -.06px;">'+id+'</span>'+
			'<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-delete-gray" fill="none" viewBox="0 0 24 24" style="width: 24px;cursor:pointer;" onclick="remove_tag(\''+filter+'\',\''+id+'\')">'+
			'<path fill="#BBB" fill-rule="evenodd" d="M10.94 12l-3.47 3.47 1.06 1.06L12 13.06l3.47 3.47'+
			 '1.06-1.06L13.06 12l3.47-3.47-1.06-1.06L12 10.94 8.53 7.47 7.47 8.53 10.94 12z" clip-rule="evenodd"></path></svg></div>'	
	}
	$('#filter_tag').append(tag)
}

function remove_tag(filter,id){
	if(filter=='category'){
		if(id=='스니커즈'){
			category_choice('sneakers')
		}
		if(id=='의류'){
			category_choice('apparel')
		}
		if(id=='패션_잡화'){
			category_choice('goods')
		}
		if(id=='테크'){
			category_choice('tech')
		}
		if(id=='라이프'){
			category_choice('life')
		}
	}else if(filter=='cost'){
		if(id=='10만원_이하'){
			cost_choice('less_than_10')
		}
		if(id=='10만원_-_30만원_이하'){
			cost_choice('10-30')
		}
		if(id=='30만원_-_50만원_이하'){
			cost_choice('30-50')
		}
		if(id=='50만원_이상'){
			cost_choice('more_than_50')
		}
	}else{
		brand_choice(id)
	}
}
function searchBoxOn() {
	$("#searchBox").show();	
}
function closeSearch() {
	$("#searchBox").hide();	
}
function requestGet() {

	var bb = document.searchForm.searchKey.value;
		
	$("#searchContent").html(bb);
	$("#ajaxContent").show();	
	var aa = "searchKey=" + document.searchForm.searchKey.value;
		$.ajax({
		type:"POST",
		url : "searchPage",
		data:aa,
		success:function(args){
			
			$("#ajaxContent").html(args);
			
			
		},error:function(e){
			alert(e.responseText);
		}
		
	});
	$("#directSearch").hide();	

}
function searchBoxOn() {
	$("#main_searchKey").val('');
	$("#searchBox").hide();	
	$("#searchContent").val('');
	$("#ajaxContent").hide();	
	$("#directSearch").show();	
	$("#searchBox").show();	
}

function closeSearch() {

	$("#main_searchKey").val('');
	
	$("#searchBox").hide();	
	$("#searchContent").val('');
	$("#ajaxContent").hide();	
	$("#directSearch").show();	
}


function requestGet() {

	var bb = document.searchForm.searchKey.value;
		
	$("#searchContent").html(bb);
	$("#ajaxContent").show();	
	
	
	var aa = "searchKey=" + document.searchForm.searchKey.value;
	
	
		$.ajax({
		
		type:"POST",
		url : "searchPage",
		data:aa,
		success:function(args){
			
			$("#ajaxContent").html(args);
			
			
		},error:function(e){
			alert(e.responseText);
		}
		
		
	});
	$("#directSearch").hide();	

}
</script>

</head>
<body> 

<div id="nuxt" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block; font-size: 14px; font-weight: 400;
	line-height: 21px; text-align: left;">
	<!--  -->
	<div id="layout" style="box-sizing: border-box; color: rgb(34, 34, 34); display: block;">
	
		<div class="wrap win_os lg" style="position: relative; padding-top: 100px;">
			    
			<div class="header lg" style="box-shadow: 0 0 0 0 rgb(0 0 0 / 0%); min-height: 100px; position: fixed; top: 0; left: 0; right: 0;
			 z-index: 1000; background-color: #fff;" >
				<div>
					<div class="header_top" style="box-shadow: 0 1px 0 0 rgb(0 0 0 / 10%);">
						<div class="top_inner" style="display: flex; padding: 8px 40px;">
							
							
							
							<ul class="top_list" style="align-items: center; margin-left: auto; display: flex; list-style: none;margin-top: 0;margin-bottom: -1rem; ">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="noticeList" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">고객센터</a>
								</li>
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="wish" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">관심상품</a>
								</li>
								<c:if test="${userNum!=0 }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/myPage" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">마이페이지</a>
								</li>
								</c:if>
								<c:if test="${userNum==0 }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/admin" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">관리자페이지</a>
								</li>
								</c:if>
								<c:if test="${userNum==null }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="<%=cp %>/login" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">로그인</a>
								</li>
								</c:if>
								<c:if test="${userNum!=null }">
								<li class="top_item" style="list-style: none; display: list-item; text-align: -webkit-match-parent; margin-right: 10px;">
									<a href="logout" class="top_link" style="font-size: 12px; letter-spacing: -.06px;
									 color: rgba(34,34,34,.8);">로그아웃</a>
								</li>
								</c:if>
							</ul>
						</div>
						<hr style="    margin-top: 1rem; margin-bottom: -1rem; height:1px;color:#222 ; opacity: 10%">
						
						<div class="header_main" style="" >
							
  
							<div class="main_inner" style="display: flex; padding: 0 10px; height: 75px; min-width: 320px; align-items: center;" >
								<h1 style="margin-top: 14px;padding-top: 3px;" >
									<a href="mainPage" class="logo" >									
										<img src="/img/Kreamy.png" style="width: 167px; height: 41px;">
									</a>
								</h1>
								
								<div class="gnb_area" style="display: flex; align-items: center; margin-left: auto;" >
									<div class="gnb" style="" >
										<ul class="gnb_list" style="display: flex; align-items: center; list-style: none;margin-top: 0;margin-bottom: -1rem;" >											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="shop.action" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> SHOP </a>
											</li>
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;" >
											<a href="authPolicy" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> POLICY </a>
											</li>											
											
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none; " >
											<a href="noticeList" target="_blank" class="gnb_link" style="font-size: 15px; letter-spacing: -.15px;
											display: flex;"> NOTICE </a>
											</li>		
											
											<li class="gnb_item" style="margin-right: 35px; list-style: none;margin-top: -6px; " >
											<a target="_blank" class="gnb_link" style="cursor: pointer;">
											<svg onclick="searchBoxOn();" xmlns="http://www.w3.org/2000/svg" id="i-nav-search" fill="none" viewBox="0 0 28 28" style="width: 28px;">
											<path fill="#222" fill-rule="evenodd" d="M20.167 12.25a7.918 7.918 0 11-15.835-.001 7.918
											 7.918 0 0115.835.001zm-.233 6.27a9.883 9.883 0 002.233-6.27c0-5.477-4.44-9.916-9.917-9.916-5.477
											  0-9.917 4.44-9.917 9.916 0 5.477 4.44 9.917 9.917 9.917a9.877 9.877 0 006.27-2.233l5.273 5.273
											   1.414-1.414-5.273-5.273z" clip-rule="evenodd"></path></svg>
											</a>
											</li>										
											
										</ul>
									</div>
								<!-- gnb_area -->	
								</div>
								
								<div class="layer_search lg" id="searchBox" style="position: fixed; top: 0; right: 0; left: 0; bottom: 0; height: 100%;
								background: rgba(34,34,34,.5); overflow-y: auto; display: none;">
									<div class="search_container" style="background-color: #fff;">
										<div class="search_wrap" style=" width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
										overflow: hidden; display: flex; padding: 25px 40px 19px;">
											<div class="search_area" style="flex: 1; margin-right: 20px;">
												<div class="search" style=" position: relative;  padding: 0 40px 0 44px; height: 40px;
												    background-color: #f4f4f4; border-radius: 8px;">
												    
												    
												 <form action="" name="searchForm">												
													<input id="main_searchKey" onkeyup="requestGet();" name="searchKey" type="text" class="input_search show_placeholder_on_focus"
													style="width: 100%; height: 100%; transition: all .1s;  font-size: 14px;  letter-spacing: -.21px;
													padding: 0;  outline: 0;  border: 0; resize: none; border-radius: 0; background-color: rgba(0,0,0,0);"/>
												</form>
												
												</div>
											</div>
											<button class="btn_close" style=" margin-left: auto;
											    padding: 0; border: 0; outline: none; background: none; background-color: rgba(0,0,0,0);
											    appearance: none; border-radius: 0;" onclick="closeSearch();">
											취소
											</button>
										</div>
									
									</div>
									
									<!-- 검색시 없어져야함 -->
									<div class="recent_wrap" id="directSearch" style="background-color: #fff;">
										<div class="recent_area" style="position: relative; padding-bottom: 42px;">
											<div class="recent_box" style="width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
											 overflow: hidden; padding: 0 40px 10px;">
											 <strong class="recent_title" style="display: inline-block; line-height: 20px; font-size: 12px;color: #000;
   											 vertical-align: middle;">바로검색</strong>									
											
											</div>
											
											<div class="brand_list lg" style=" width: 704px;  padding-left: 0; padding-right: 0; margin: 0 auto;
											 overflow: hidden; padding: 0 40px; white-space: nowrap;"> 
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Jordan">
											<img width="85px" height="85px" src="/img/Jordan 1 Retro High OG University Blue_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Jordan</b></p>	
											</a>	
											</button>	
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Dunk">
											<img width="85px" height="85px" src="/img/Nike Dunk Low Retro Black_1.png" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Dunk</b></p>
											</a>	
											</button>
											
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Palace">
											<img width="85px" height="85px" src="/img/Palace Basically A Tri-Flag T-Shirt Black (21SS)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Palace</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Backpack">
											<img width="85px" height="85px" src="/img/Supreme Backpack Red (18FW)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>백팩</b></p>
											</a>
											</button>
											
											<button type="button" class="btn btn-outline-light" style="height: 97.5px; border-radius: 10px;">
											<a href="shop.action?searchKey=Supreme">
											<img width="85px" height="85px" src="/img/Supreme Swarovski Zippo Red (20FW)_1.jpg" 
											style="border-radius: 10px; background-color: #f6f6f6; margin-bottom: 5px;">
											<p class="shopSearch"><b>Supreme</b></p>
											</a>
											</button>
											
											</div>
											
										</div>
									</div>
									
									<!-- 아작스에 붙일부분 -->
									<div id="ajaxContent"  class="suggest_wrap" style="background-color: #fff; display: none;">
										
									
										<div class="suggest_area" style="width: 704px; padding-left: 0; padding-right: 0; margin: 0 auto;
										 overflow: hidden; position: relative; padding: 0 44px 23px 40px; ">
											<div class="suggest_title_area" style="margin-right: 43px;font-size: 14px; letter-spacing: -.21px;
											    color: #000; line-height: 20px; font-weight: 700; padding-top: 9px; padding-right: 100px;
											     padding-bottom: 13px; border-bottom: 1px solid #ebebeb;">
													<p class="suggest_title" style="font-size: 14px; letter-spacing: -.21px; color: #000;" 
													id="searchContent">
													
													 </p>
													 <a class="suugest_count" style="right: 49px; position: absolute; top: 5px;">
													 <span class="more_text" style="margin-top: 1px; margin-right: 2px; display: inline-block;
													   vertical-align: top; font-size: 12px; line-height: 16px; letter-spacing: -.06px;
													    color: #000;">
													${maxNum1 }
													 </span>
													 </a>
											<!-- suggest_tile area -->
											</div>
											<div class="suggest_list lg" style="padding-right: 43px; max-height: 420px; overflow-y: auto;">
												<div class="suggest_item" style="height: auto; border-bottom: 1px solid #ebebeb;" >
													
													<c:if test="${maxNum1!=0 }">
													<c:forEach var="dto" items="${prodImagelists1}">		
													<a href="mainToProducts?engProduct=${dto.engProduct }" class="suggest_link" style="display: flex; align-items: center; height:84px;">
														<div class="suggest_thum" style="overflow: hidden; margin-right: 7px; width: 70px; height: 70px;flex-shrink: 0;border-radius: 8px;">
														<img src="/img/${dto.imageName }" style="width: 100%; height: 100%; border: 0; vertical-align: top;">
														</div>
														
														<div class="suggest_info">
														<p class="title_kor" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box;
														    font-size: 14px;letter-spacing: -.21px;">
														   ${dto.engProduct }
														 </p>
														 <p class="model_eng" style="margin-top: 2px; font-size: 12px; letter-spacing: -.06px;
														     color: rgba(34,34,34,.5); overflow: hidden; text-overflow: ellipsis; display: -webkit-box;">
														 	
														 	<c:if test="${dto.shopPrice!=null}">
														 	<fmt:formatNumber value="${dto.shopPrice }" type="number" maxFractionDigits="3"/>원
														 	</c:if>
														 	<c:if test="${dto.shopPrice==null}">
														 	<b>-</b>
														 	</c:if>
														 
														 </p>
														 
														</div>
													</a>
													</c:forEach>
													</c:if>
													<c:if test="${maxNum1==0 }">
	
														<div align="center">
														<br/><br/><br/><br/>
														<p style="font-size: 16px; letter-spacing: -.16px; color: rgba(34,34,34,.8);">검색하신 결과가 없습니다.</p>
														<p style="padding-top: 6px; font-size: 13px; letter-spacing: -.07px; color: rgba(34,34,34,.5);">상품 등록 요청은 1:1 문의하기로 요청해주세요.</p>
														</div>
														
													</c:if>	
												</div>
												
												
											</div>
										<!-- suggestArea -->
										</div>
										
									<!-- suggest_wrap -->
									</div>
								
								<!-- layer_search lg -->
								</div>
								
								
							<!-- mainArea -->
							</div>
						
						</div>
						
					</div>
				</div>
			
			<!-- header lg -->
			</div>
		
		
			
		
		
		
			<div class="contain" style="overflow: hidden; position: relative; margin-top: -4px;min-height: 461px;margin-bottom: 120px;">
			
			<div style="color: #222;box-sizing: border-box;margin: 0;background-color: #fff;z-index: 100;padding: 40px 40px 0;
    position: fixed;top: 100px;left: 0;right: 0;border-bottom: 1px solid #ebebeb;">
	<div style="padding: 0;margin: 0 auto;max-width: 1200px;">
		<div style="display: flex;align-items: center;justify-content: center;padding: 0 10% 24px;">
			<h1 style="margin: 0;padding: 0;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size: 35px;font-weight: 700;font-stretch:extra-condensed; 
    		color: #000;letter-spacing: -.14px;cursor: pointer;" onclick="location.href='<%=cp%>/shop.action'">SHOP</h1>
		</div>
		<div style="overflow-x: auto;overflow-y: hidden;padding-bottom: 16px;white-space: nowrap;">
			<div style="margin-right: 8px;display: inline-block;vertical-align: top;">
				<div style="white-space: nowrap;display: inline-block;height: 38px;background-color: #f4f4f4; border-radius: 12px;font-size: 15px;letter-spacing: -.15px;
    			vertical-align: top;padding: 10px; line-height: 15px;" >
					<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-filter-on" fill="none" viewBox="0 0 24 24" style="width: 20px;">
					<path stroke="#000" d="M2 6h4m2 0h14"></path><path fill="#EF6253" d="M7 8a2 2 0 10.001-3.999A2 2 0 007 8z"></path>
					<path stroke="#000" d="M2 18h4m2 0h14"></path><path fill="#EF6253" d="M7 20a2 2 0 10.001-3.999A2 2 0 007 20z"></path>
					<path stroke="#000" d="M2 12h14m2 0h4"></path>
					<path fill="#EF6253" d="M17 14a2 2 0 10.001-3.999A2 2 0 0017 14z"></path>
					</svg>
				</div>
			</div>
			<span class="quick_filter" style="position: relative;margin: 0 8px;"></span>
			<div style="display: inline-block;padding: 10px 12px; height: 38px; background-color: #f4f4f4;border-radius: 12px;cursor:pointer;
   			font-size: 15px;letter-spacing: -.15px;vertical-align: top;"class="unchoice_category" id="sneakers_tab"
   			onclick="category_choice('sneakers')">스니커즈</div>
			<div style="display: inline-block;padding: 10px 12px; height: 38px; background-color: #f4f4f4;border-radius: 12px;cursor:pointer;
   			font-size: 15px;letter-spacing: -.15px;vertical-align: top;margin-left: 3px;"class="unchoice_category" id="apparel_tab"
   			onclick="category_choice('apparel')">의류</div>
			<div style="display: inline-block;padding: 10px 12px; height: 38px; background-color: #f4f4f4;border-radius: 12px;cursor:pointer;
   			font-size: 15px;letter-spacing: -.15px;vertical-align: top;margin-left: 3px;"class="unchoice_category" id="goods_tab"
   			onclick="category_choice('goods')">패션 잡화</div>
			<div style="display: inline-block;padding: 10px 12px; height: 38px; background-color: #f4f4f4;border-radius: 12px;cursor:pointer;
   			font-size: 15px;letter-spacing: -.15px;vertical-align: top;margin-left: 3px;"class="unchoice_category" id="life_tab"
   			onclick="category_choice('life')">라이프</div>
			<div style="display: inline-block;padding: 10px 12px; height: 38px; background-color: #f4f4f4;border-radius: 12px;cursor:pointer;
   			font-size: 15px;letter-spacing: -.15px;vertical-align: top;margin-left: 3px;"class="unchoice_category" id="tech_tab"
   			onclick="category_choice('tech')">테크</div>
		</div>
		<ul style="color: #222;box-sizing: border-box;margin: 0;list-style: none;white-space: nowrap;display: flex;
   		overflow-x: auto;padding: 0 0 16px;">
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Dunk');">
   					<img src="/img/Dunk_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Dunk</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Jordan');">
   					<img src="/img/Jordan_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Jordan</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Palace');">
   					<img src="/img/Palace_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Palace</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Stussy');">
   					<img src="/img/Stussy_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Stussy</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Keychain');">
   					<img src="/img/Keychain_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						키체인</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;"onclick="direct_search('Backpack');">
   					<img src="/img/Backpack_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						백팩</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;"onclick="direct_search('Helinox');">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;">
   					<img src="/img/Helinox_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Helinox</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;"onclick="direct_search('Supreme');">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;">
   					<img src="/img/Supreme_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						Supreme</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;"onclick="direct_search('Sony');">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;">
   					<img src="/img/PS5_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						PS5</p>
   				</div>
   			</li>
   			<li style="margin: 0;padding: 0;list-style: none;display: inline-block;vertical-align: top;border-radius: 8px;
   			background-color: rgba(0,0,0,0)!important;margin-left: 40px;"onclick="direct_search('Nintendo');">
   				<div style="white-space: nowrap;list-style: none;box-sizing: border-box;color: inherit;display: block;
   				text-align: center; cursor: pointer;width: 84px;height: 82px;">
   					<img src="/img/Nintendo_shop.png" style="vertical-align: top;user-select: none!important;
  						width: 70px;height: 70px;">
  						<p style="cursor: pointer;padding: 0;max-width: 80px;margin: -10px auto 0;font-size: 13px;font-weight: 700;">
  						닌텐도</p>
   				</div>
   			</li>
   		</ul>
	</div>
</div>
<div style="color: #222;box-sizing: border-box;display: flex;position:relative ;margin: 260px auto 0px;padding: 0 40px 80px;max-width: 1280px;">
	<div style="margin: 0;padding: 0;width: 210px;margin-right: 10px;padding-right: 10px;overflow-x: hidden;overflow-y: auto;">
		<div style="padding: 23px 0 15px;justify-content: space-between;display: flex;align-items: center;">
			<div style="display: flex;align-items: center;">
				<span style="font-size: 14px;letter-spacing: -.21px;font-weight: 700;">필터</span>
				<span style="margin-left: 4px;display: inline-flex;justify-content: center;align-items: center;width: 20px;height: 18px;
    			line-height: 18px; border-radius: 30px;background-color: #222;color: #fff;font-size: 11px;font-weight: 700;"id="filterCount">1</span>
			</div>
			<div style="font-size: 13px;letter-spacing: -.07px;color: rgba(34,34,34,.5);text-decoration: underline;
			cursor: pointer;" onclick="filter_remove();">모두 삭제</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;" id="close_category_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			 onclick="filter_open('category');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;margin-top:1px;letter-spacing: -.07px;font-weight: 700;"
					class="category_select_option_off" >
						카테고리
					</span>
					<span style="cursor: pointer;margin-top: 4px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
    				font-size: 15px;letter-spacing: -.15px;color: rgba(34,34,34,.5);" id="category_filter">
    					모든 카테고리
    				</span>
				</div>
				<div style="cursor: pointer;height: 20px;">
					<svg xmlns="http://www.w3.org/2000/svg" id="i-plus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px;">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="1.5" d="M10 4.167v11.666"></path>
					<path stroke="#BBB" stroke-width="1.5" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;display: none;" id="open_category_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			onclick="filter_close('category');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;letter-spacing: -.07px;font-weight: 700;"
					class="category_select_option_off">
						카테고리
					</span>
				</div>
				<div style="cursor: pointer;height: 20px; line-height: 18px;" >
					<svg xmlns="http://www.w3.org/2000/svg" id="i-minus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px; ">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="2" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
			<div style="padding-bottom: 24px;">
				<ul style="margin: 0;padding: 0;list-style: none;max-height: 315px;overflow-y: auto;">
					<li style="margin: 0;padding: 0;list-style: none;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						 onclick="category_choice('sneakers')">
							<div style="display: inline-block;"id="sneakers_checkBox" class="category_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px; 
							line-height: 25px;margin-top: -5px;">스니커즈</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="category_choice('apparel')">
							<div style="display: inline-block;"id="apparel_checkBox" class="category_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							 line-height: 25px;margin-top: -5px;">의류</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="category_choice('goods')">
							<div style="display: inline-block;"id="goods_checkBox" class="category_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							 line-height: 25px;margin-top: -5px;">패션 잡화</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="category_choice('tech')">
							<div style="display: inline-block;"id="tech_checkBox" class="category_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">테크</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="category_choice('life')">
							<div style="display: inline-block;"id="life_checkBox" class="category_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							 line-height: 25px;margin-top: -5px;">라이프</span>
						</div>
					</li>
				</ul>	
			</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;" id="close_brand_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			 onclick="filter_open('brand');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;margin-top:1px;letter-spacing: -.07px;font-weight: 700;"
					class="brand_select_option_off">
						브랜드
					</span>
					<span style="cursor: pointer;margin-top: 4px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
    				font-size: 15px;letter-spacing: -.15px;color: rgba(34,34,34,.5);" id="brand_filter">
    					모든 브랜드
    				</span>
				</div>
				<div style="cursor: pointer;height: 20px;">
					<svg xmlns="http://www.w3.org/2000/svg" id="i-plus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px;">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="1.5" d="M10 4.167v11.666"></path>
					<path stroke="#BBB" stroke-width="1.5" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;display: none;" id="open_brand_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			onclick="filter_close('brand');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;letter-spacing: -.07px;font-weight: 700;"
					class="brand_select_option_off" >
						브랜드
					</span>
				</div>
				<div style="cursor: pointer;height: 20px; line-height: 18px;" >
					<svg xmlns="http://www.w3.org/2000/svg" id="i-minus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px; ">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="2" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
			<div style="padding-bottom: 24px;">
				<ul style="margin: 0;padding: 0;list-style: none;max-height: 315px;overflow-y: auto;">
					<li style="margin: 0;padding: 0;list-style: none;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						 onclick="brand_choice('AMI')">
							<div style="display: inline-block;"id="AMI_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							 line-height: 25px;margin-top: -5px">AMI</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Acne_Studios')">
							<div style="display: inline-block;"id="Acne_Studios_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Acne Studios</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Adidas')">
							<div style="display: inline-block;"id="Adidas_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Adidas</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Alexander_McQueen')">
							<div style="display: inline-block;"id="Alexander_McQueen_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Alexander McQueen</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Asics')">
							<div style="display: inline-block;"id="Asics_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Asics</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('BAPE')">
							<div style="display: inline-block;"id="BAPE_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">BAPE</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Balenciaga')">
							<div style="display: inline-block;"id="Balenciaga_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Balenciaga</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Celine')">
							<div style="display: inline-block;"id="Celine_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Celine</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Clarks')">
							<div style="display: inline-block;"id="Clarks_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Clarks</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Converse')">
							<div style="display: inline-block;"id="Converse_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Converse</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Crocs')">
							<div style="display: inline-block;"id="Crocs_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Crocs</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Dior')">
							<div style="display: inline-block;"id="Dior_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Dior</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('FOG_Essentials')">
							<div style="display: inline-block;"id="FOG_Essentials_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">FOG Essentials</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Golden_Goose')">
							<div style="display: inline-block;"id="Golden_Goose_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Golden Goose</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Gucci')">
							<div style="display: inline-block;"id="Gucci_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Gucci</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Helinox')">
							<div style="display: inline-block;"id="Helinox_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Helinox</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Jordan')">
							<div style="display: inline-block;"id="Jordan_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Jordan</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Maison_Kitsune')">
							<div style="display: inline-block;"id="Maison_Kitsune_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Maison Kitsune</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Maison_Margiela')">
							<div style="display: inline-block;"id="Maison_Margiela_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Maison Margiela</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Microsoft')">
							<div style="display: inline-block;"id="Microsoft_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Microsoft</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Mizuno')">
							<div style="display: inline-block;"id="Mizuno_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Mizuno</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('New_Balance')">
							<div style="display: inline-block;"id="New_Balance_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">New Balance</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Nike')">
							<div style="display: inline-block;"id="Nike_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Nike</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Nintendo')">
							<div style="display: inline-block;"id="Nintendo_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Nintendo</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Oofos')">
							<div style="display: inline-block;"id="Oofos_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Oofos</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('PS5')">
							<div style="display: inline-block;"id="PS5_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">PS5</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Palace')">
							<div style="display: inline-block;"id="Palace_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Palace</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Prada')">
							<div style="display: inline-block;"id="Prada_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Prada</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Puma')">
							<div style="display: inline-block;"id="Puma_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Puma</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Reebok')">
							<div style="display: inline-block;"id="Reebok_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Reebok</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Saint_Laurent')">
							<div style="display: inline-block;"id="Saint_Laurent_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Saint Laurent</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Sony')">
							<div style="display: inline-block;"id="Sony_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Sony</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Starbucks')">
							<div style="display: inline-block;"id="Starbucks_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Starbucks</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Stussy')">
							<div style="display: inline-block;"id="Stussy_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Stussy</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Supreme')">
							<div style="display: inline-block;"id="Supreme_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Supreme</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('The_North_Face')">
							<div style="display: inline-block;"id="The_North_Face_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">The North Face</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Valentino')">
							<div style="display: inline-block;"id="Valentino_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Valentino</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="brand_choice('Vans')">
							<div style="display: inline-block;"id="Vans_checkBox" class="brand_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">Vans</span>
						</div>
					</li>
					
				</ul>	
			</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;" id="close_cost_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			 onclick="filter_open('cost');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;margin-top:1px;letter-spacing: -.07px;font-weight: 700;"
					class="cost_select_option_off" >
						가격
					</span>
					<span style="cursor: pointer;margin-top: 4px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
    				font-size: 15px;letter-spacing: -.15px;color: rgba(34,34,34,.5);" id="cost_filter">
    					모든 가격
    				</span>
				</div>
				<div style="cursor: pointer;height: 20px;">
					<svg xmlns="http://www.w3.org/2000/svg" id="i-plus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px;">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="1.5" d="M10 4.167v11.666"></path>
					<path stroke="#BBB" stroke-width="1.5" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
		</div>
		<div style="border-bottom: 1px solid #ebebeb;display: none;" id="open_cost_filter">
			<div style="justify-content: space-between;align-items: center;cursor: pointer;display: flex;padding: 14px 0;"
			onclick="filter_close('cost');">
				<div style="display: flex;flex-direction: column;max-width: calc(100% - 30px);">
					<span style="cursor: pointer;box-sizing: border-box;position: relative;font-size: 13px;letter-spacing: -.07px;font-weight: 700;"
					class="cost_select_option_off" >
						가격
					</span>
				</div>
				<div style="cursor: pointer;height: 20px; line-height: 18px;" >
					<svg xmlns="http://www.w3.org/2000/svg" id="i-minus-gray" fill="none" viewBox="0 0 20 20" style="width: 20px; ">
					<path stroke="#BBB" stroke-linejoin="round" stroke-width="2" d="M4.167 10h11.666"></path></svg>
				</div>
			</div>
			<div style="padding-bottom: 24px;">
				<ul style="margin: 0;padding: 0;list-style: none;max-height: 315px;overflow-y: auto;">
					<li style="margin: 0;padding: 0;list-style: none;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						 onclick="cost_choice('less_than_10')">
							<div style="display: inline-block;"id="less_than_10_checkBox" class="cost_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">10만원 이하</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="cost_choice('10-30')">
							<div style="display: inline-block;"id="10-30_checkBox" class="cost_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">10만원 - 30만원 이하</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="cost_choice('30-50')">
							<div style="display: inline-block;"id="30-50_checkBox" class="cost_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">30만원 - 50만원 이하</span>
						</div>
					</li>
					<li style="margin: 0;padding: 0;list-style: none;padding-top: 8px;">
						<div style="display: flex;align-items: flex-start;font-size: 14px;letter-spacing: -.21px;cursor: pointer;"
						onclick="cost_choice('more_than_50')">
							<div style="display: inline-block;"id="more_than_50_checkBox" class="cost_checkBox_unchecked">
								<svg xmlns="http://www.w3.org/2000/svg" id="i-checkbox-inactive" fill="none" viewBox="0 0 16 17" style="width: 16px; 
								height: 16px;margin-right: 8px;">
								<path stroke="#D3D3D3" d="M.5 1h15v15H.5z"></path></svg>
							</div>
							<span style="font-size: 14px;letter-spacing: -.21px;box-sizing: border-box;max-width: 160px;
							line-height: 25px;margin-top: -5px;">50만원 이상</span>
						</div>
					</li>
					
				</ul>	
			</div>
		</div>
	</div>
	<div flex: 1;">
		<div style="display: flex;flex-wrap: wrap;padding-top: 8px;max-width: 980px;"id="filter_tag">
			
		</div>
		<div id="productList">
		
			
		</div>
	</div>
</div>
<div id="wishProduct">

</div>
<input type="hidden" id="hidden_sort" value="">
				
			<!-- contain -->
			</div>
			
			
			
			
			<div class="banner_bottom lg" style="display: flex;">
					<a class="banner_box" style="background-color: #565656; background-image: url('/img/home_banner_bottom1.png');
					position: relative; padding: 36px 32px 0; width: 100%; height: 200px; background-position: 100% 0;
					 background-repeat: no-repeat; background-size: 350px 200px;">
						<div class="banner_info" style="max-width: 300px; color: #fff;">
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase;">
								service guide
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px;">
								
								"KREAMY은 처음이지?"
								<br/>
								"서비스 소개를 확인해보세요."
								
							</p>
						</div>					
					</a>
					
					
					<a class="banner_box" style="background-color: #3b3a3c; background-image: url('/img/home_banner_bottom2.png');
					position: relative; padding: 36px 32px 0; width: 100%; height: 200px; background-position: 100% 0;
					 background-repeat: no-repeat; background-size: 350px 200px;">
						<div class="banner_info" style="max-width: 300px; color: #fff;">
							<strong class="info_subtitle" style="font-size: 12px; text-transform: uppercase;">
								download the app
							</strong>
							<p class="info_title" style="padding-top: 12px;
							text-shadow: -1px 0 #565656, 0 1px #565656, 1px 0 #565656, 0 -1px #565656; font-size: 16px; letter-spacing: -.16px;
							line-height: 30px;">
								"KREAMY 앱을 설치하여"
								<br/>
								"한정판 스니커즈를 FLEX 하세요!"
																
							</p>
						</div>
					
					</a>
				
				<!-- banner_bottom lg -->
				</div>
			
					
					
			<div class="footer lg" style="padding: 50px 40px; border-top: 1px solid #ebebeb;">
				<div class="inner" style="position: relative;">
					<div class="service_area" style="display: flex; flex-direction: row-reverse; padding-bottom: 56px;
					border-bottom: 1px solid #ebebeb; justify-content: space-between;">
						<div class="custom_service" >
							<strong class="service_title" style="display: inline-flex; align-items: center;
							font-size: 16px; letter-spacing: -.16px; font-weight: 700;">
							고객센터
							<a class="serive_tel" style="margin-left: 4px; letter-spacing: normal;">
							1588-7813
							</a>
							</strong>
							<div class="service_time" style="padding-top: 8px;">
								<dl class="time_box" style="line-height: 17px;">
									<dt class="time_term" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgb(34,34,34,.5)">운영시간</dt>
									<dd class="time_description" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgba(34,34,34,.5)">
									평일 11:00 - 18:00 (토,일,공휴일 휴무)
									</dd>
								</dl>
								<dl class="time_box" style="padding-top: 4px; line-height: 17px;">
									<dt class="time_term" style="margin-right: 4px; float: left; font-size: 13px;
									letter-spacing: -.07px; color: rgba(34,34,34,.5);">점심시간</dt>
									<dd class="time_description" style="float: left; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5)">평일 13:00 ~ 14:00 </dd>								
								</dl>
							<!-- serivce_term -->
							</div>							
																		
							
							<div class="service_btn_box" style="padding-top: 17px;margin-right:10px ; display: inline-block ;">
							 <a href="FAQList" class="btn solid small" type="button" style="border-radius: 0; color: #fafafa; background-color: #222;
							 font-size: 12px; letter-spacing: -.06px; padding: 0 14px; height: 34px; line-height: 32px;
							 display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;">
							 자주 묻는 질문
							 </a>
							</div>
							<div class="service_btn_box" style="padding-top: 17px; display: inline-block;" >
							 <a href="questionList" class="btn solid small" type="button" style="border-radius: 0; color: #fafafa; background-color: #222;
							 font-size: 12px; letter-spacing: -.06px; padding: 0 14px; height: 34px; line-height: 32px;
							 display: inline-block; cursor: pointer; vertical-align: middle; text-align: center;">
							 1:1 문의하기
							 </a>
							</div>
							
						<!-- custom_service -->
						</div>
						
						<div class="footer_menu" style="display: flex; float: left;"> 
							
							
						<div>
								<div class="corporation_area" style="position: relative;">
						<ul class="term_list" style="padding-bottom: 16px; display: inline-flex; list-style: none;margin-top: 0;margin-bottom: -1rem;">
							<li class="term_item_privacy" style="margin-right: 20px; list-style: none;">
								<a class="term_link" style="font-weight: 700; display: block; font-size: 14px;
								letter-spacing: -.21px; color: #000;">
									개인정보처리방침
								</a>
							</li>
							<li class="term_item" style="margin-right: 20px;list-style: none;">
								<a class="term_link" style="display: block; font-size: 14px; letter-spacing: -.21px;
								color: #000;">
									이용약관
								</a>
							</li>
						</ul>
					
						<div class="footer_sns" style="position: absolute; top: 0; right: 0;">
						
						</div>
						
						<div class="business_info">
							<div class="info_list">
								<dl class="info_item" style="float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										크리미 주식회사 대표 
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										마진영
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										사업자등록번호:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										578-88-01618
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										통신판매업:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										제 2021-성남분당C-0093호
									</dd>
								</dl>
								
							<!-- info_list -->
							</div>
							
							
							
							<br/>
							<div class="info_list">
								<dl class="info_item" style="float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										사업장 소재지
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										경기도 성남시 분당구 분당내곡로 117,8층
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										개인정보책임관리자:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										유서원
									</dd>
								</dl>
								
								<dl class="info_item" style="margin-left: 17px; float: left;">
									<dt class="business_title" style="margin-right: 4px; float: left;
									line-height: 20px; font-size: 13px; letter-spacing: -.07px;
									color: rgba(34,34,34,.5);">
										호스팅서비스:
									</dt>
									<dd class="business_desc" style="float: left; line-height: 20px; font-size: 13px;
									    letter-spacing: -.07px; color: rgba(34,34,34,.5);">
										네이버 클라우드(주)										
									</dd>
								</dl>
								
							<!-- info_list -->
							</div>
							
							
							
							
							
							
							
							
							
							
							
						
						<!-- business_info -->
						</div>
					<!-- corporation_area -->
					</div>
					
					<div class="notice_area" style="padding-top: 30px;">
						<p class="notice" style="max-width: 605px; font-size: 12px; letter-spacing: -.06px; 
						color: rgba(34,34,34,.4) "> 
						크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다.
						 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다. © 2021 KREAMY.Corp.
						</p>
						
					
					<!-- notice_area -->
					</div>
						
						</div>
						
							
					<!-- serivce area -->
					</div>
					
				
				</div>
			

			</div>
					
			<!-- footer lg -->
		</div>	
<!-- wrap win_os lg -->
	</div>
<!-- layout -->	
	</div>
	<!-- nuxt -->
</div>





</body>
</html>