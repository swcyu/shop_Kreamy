// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MyUtil.java

package com.mvc.util;


public class MyUtil{
//��ü �������� ���ϱ�
	//numPerPage : �� ȭ�鿡 ǥ���� �������� ����
	//dataCount : ��ü ������ ���� 
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}

	//����¡ ó�� �޼ҵ�
	//currentPage : ���� ǥ���� ������
	//totalPage : ��ü ������ ��
	//listUrl : ��ũ�� ������ url
	public String pageIndexList(int currentPage, int totalPage) {
		
		int numPerBlock = 5; // �� ���� 1 2 3 4 5 �� ����
		int currentPageSetup; //ǥ���� ù���������� -1 �� ��
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) {
			return "";
		}
		
		//���� ������ ��ȣ ���ϱ�
		currentPageSetup = ((currentPage-1)/numPerBlock)*numPerBlock;
/*		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock ==0) {
			currentPageSetup -= numPerBlock; 
		}
		*/
		// ����
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<div id='first' onclick=\""+"move_page(1);\"></div>&nbsp;");
			sb.append("<div id='prev' onclick=\""+"move_page("+currentPageSetup+");\"></div>&nbsp;");
		}
		
		//�ٷΰ��� ������
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
		
		int numPerBlock = 5; // ȭ�� �ϴܿ� ������ ��������  <- 1 2 3 4 5 ->(�̷���)
		int currentPageSetup; // ǥ���� ù ������(page)���� -1 �� ��'<-' �ﰢ���� ���� ��
		int page; // 1 2 3 4 5 �̷���
		
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
		
		//���������� ��ȣ ���ϱ�
		//<- 6 7 8 9 10 ->
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock ==0) {	
			currentPageSetup = currentPageSetup- numPerBlock;
		}
		
		//<-����������
		//<a href="list.jsp?pageNum=5">
		if(totalPage > numPerBlock && currentPageSetup > 0) {	
			
			sb.append("<a href=\"" + listUrl +"pageNum="+
					   currentPageSetup +"\">\r\n" + 
					   		"<svg xmlns=\"http://www.w3.org/2000/svg\" id=\"i-arr-page-prev\" fill=\"none\" viewBox=\"0 0 17 18\" style=\"width: 20px;\">" + 
					   		"<path stroke=\"#222\" d=\"M10.5 13.5L6.5 9l4-4.5\"></path></svg>" + 
					   		"</a>&nbsp;");
			
		}
		//�ٷΰ��� ������
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
		
		//-> ����
		//<- 6 7 8 9 10 -> totalPage=12
		if(totalPage - currentPageSetup > numPerBlock) {	
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + 
					"\"><svg xmlns=\"http://www.w3.org/2000/svg\" id=\"i-arr-page-next\" fill=\"none\" viewBox=\"0 0 19 18\" style=\"width: 20px;\">" + 
					"<path stroke=\"#222\" d=\"M7.25 4.5l4.5 4.5-4.5 4.5\"></path></svg></a>&nbsp;");
			//<a href="list.jsp?pagNum=11">������</a>&nbsp;
		}
		
		
		
		return sb.toString();
	}
}
