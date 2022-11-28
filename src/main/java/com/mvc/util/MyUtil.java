// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MyUtil.java

package com.mvc.util;


public class MyUtil{
//전체 페이지수 구하기
	//numPerPage : 한 화면에 표시할 데이터의 갯수
	//dataCount : 전체 데이터 갯수 
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}

	//페이징 처리 메소드
	//currentPage : 현재 표시할 페이지
	//totalPage : 전체 페이지 수
	//listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage) {
		
		int numPerBlock = 5; // ◀ 이전 1 2 3 4 5 ▶ 다음
		int currentPageSetup; //표시할 첫페이지에서 -1 한 값
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) {
			return "";
		}
		
		//이전 페이지 번호 구하기
		currentPageSetup = ((currentPage-1)/numPerBlock)*numPerBlock;
/*		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock ==0) {
			currentPageSetup -= numPerBlock; 
		}
		*/
		// 이전
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<div id='first' onclick=\""+"move_page(1);\"></div>&nbsp;");
			sb.append("<div id='prev' onclick=\""+"move_page("+currentPageSetup+");\"></div>&nbsp;");
		}
		
		//바로가기 페이지
		page = currentPageSetup +1;
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			if(page==currentPage) {
				sb.append("<div class='current_page'>" + page + "</div>&nbsp;");
			}else{
				sb.append("<div class='page_button' onclick=\""+"move_page("+page+");\">" + page + "</div>&nbsp;");
			}
			page++;
		}
		
		if(totalPage - currentPageSetup > numPerBlock) {
			sb.append("<div id='next' onclick=\""+"move_page("+page+");\"></div>&nbsp;");
			sb.append("<div id='last' onclick=\""+"move_page("+totalPage+");\"></div>&nbsp;");
		}
		
		return sb.toString();
		
			
	}
	
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {	
		
		int numPerBlock = 5; // 화면 하단에 나오는 페이지수  <- 1 2 3 4 5 ->(이런식)
		int currentPageSetup; // 표시할 첫 페이지(page)에서 -1 한 값'<-' 삼각형에 들어가는 값
		int page; // 1 2 3 4 5 이런식
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) {	
			return "";
		}
		
		//list.jsp
		//list.jsp?searchKey=subject&searchValue=1
		if(listUrl.indexOf("?")!=-1) {	
			listUrl +="&";
		}else {	
			listUrl +="?";
		}
		
		//이전페이지 번호 구하기
		//<- 6 7 8 9 10 ->
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock ==0) {	
			currentPageSetup = currentPageSetup- numPerBlock;
		}
		
		//<-이전◀이전
		//<a href="list.jsp?pageNum=5">
		if(totalPage > numPerBlock && currentPageSetup > 0) {	
			
			sb.append("<a href=\"" + listUrl +"pageNum="+
					   currentPageSetup +"\">\r\n" + 
					   		"<svg xmlns=\"http://www.w3.org/2000/svg\" id=\"i-arr-page-prev\" fill=\"none\" viewBox=\"0 0 17 18\" style=\"width: 20px;\">" + 
					   		"<path stroke=\"#222\" d=\"M10.5 13.5L6.5 9l4-4.5\"></path></svg>" + 
					   		"</a>&nbsp;");
			
		}
		//바로가기 페이지
		//<- 6 7 8 9 10 ->
		page = currentPageSetup+1;
		
		
		while(page<=totalPage && page <=(currentPageSetup+numPerBlock)) {	
			
			
			if(page==currentPage) {	
				sb.append("<font color=\"black\"><b>" + page + "</b></font>&nbsp;");
				//<font color="Fuchsia">2</font>&nbsp;"
			} else {	
				
				sb.append("<a href=\"" + listUrl + "pageNum=" +page + "\" style=\"color: #222222;\">" +
				 page + "</a>&nbsp;");
				
				//<a href="list.jsp?pageNum=9">9</a>&nbsp;
			}
			
			page++;
		}
		
		//-> 다음
		//<- 6 7 8 9 10 -> totalPage=12
		if(totalPage - currentPageSetup > numPerBlock) {	
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + 
					"\"><svg xmlns=\"http://www.w3.org/2000/svg\" id=\"i-arr-page-next\" fill=\"none\" viewBox=\"0 0 19 18\" style=\"width: 20px;\">" + 
					"<path stroke=\"#222\" d=\"M7.25 4.5l4.5 4.5-4.5 4.5\"></path></svg></a>&nbsp;");
			//<a href="list.jsp?pagNum=11">▶다음</a>&nbsp;
		}
		
		
		
		return sb.toString();
	}
}
