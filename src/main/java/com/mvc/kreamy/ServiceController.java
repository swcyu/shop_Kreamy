package com.mvc.kreamy;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.dao.AnswerDAO;
import com.mvc.dao.BrandDAO;
import com.mvc.dao.FAQDAO;
import com.mvc.dao.NoticeDAO;
import com.mvc.dao.QuestionDAO;
import com.mvc.dao.TradeDAO;
import com.mvc.dto.AnswerDTO;
import com.mvc.dto.BrandDTO;
import com.mvc.dto.FAQDTO;
import com.mvc.dto.NoticeDTO;
import com.mvc.dto.QuestionDTO;
import com.mvc.dto.TradeDTO;
import com.mvc.util.MyUtil;



@Controller("serviceController")
public class ServiceController {

	@Autowired
	@Qualifier("questionDAO")
	QuestionDAO questionDao;
	
	@Autowired
	@Qualifier("answerDAO")
	AnswerDAO answerDao;

	@Autowired
	@Qualifier("tradeDAO")
    TradeDAO tradeDao;

	@Autowired
	@Qualifier("BrandDAO")
	BrandDAO brandDao;
	
	@Autowired
	@Qualifier("FAQDAO")
	FAQDAO FAQDao;

	@Autowired
	@Qualifier("noticeDAO")
	NoticeDAO noticeDao;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;

	//리스트
	@RequestMapping(value = "/noticeList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String noticeList(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = noticeDao.getDataCount();
	
		int numPerPage = 5;
		
		//전체페이지 수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//데이터 삭제되어서 현재 보고있는 페이지(마지막 페이지)에 데이터 없는 경우 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//데이터 가져오기
		List<NoticeDTO> lists = noticeDao.getLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/noticeList";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/noticeArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/noticeList";
		
	}//list
	
	
	//아티클
	@RequestMapping(value = "/noticeArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String noticeArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum")); 
		String pageNum = request.getParameter("pageNum");
		
		NoticeDTO dto = noticeDao.getReadData(noticeNum);
	  
		if(dto==null) {
			return "redirect:/noticeList"; 
		}
		
		
		if(dto.getNoticeContent()!=null||!dto.getNoticeContent().equals("")) {
			dto.setNoticeContent(dto.getNoticeContent().replaceAll("\n", "<br/>"));
		}

		String param = "pageNum=" + pageNum;
		param += "&noticeNum=" + noticeNum;
		
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "service/noticeArticle";
		
	}//article
	
	/* 자주 묻는 질문 (FAQ) */
	//리스트
	@RequestMapping(value = "/FAQList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQList(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		int FAQCategoryNum = 0;
		
		//탭 처리
		if(request.getParameter("FAQCategory")!=null) {
			FAQCategoryNum = Integer.parseInt(request.getParameter("FAQCategory"));
		}
		
		
		String FAQCategory = "";
		
		switch (FAQCategoryNum) {
		case 1:
			FAQCategory = "이용정책";
			break;

		case 2:
			FAQCategory = "공통";
			break;

		case 3:
			FAQCategory = "구매";
			break;

		case 4:
			FAQCategory = "판매";
			break;

		default:
			FAQCategory = null;
			break;
		}
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		int numPerPage = 5;
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/FAQList";
		
		//전체갯수,전체페이지 수
		if(FAQCategory!=null) {
			
			int tabDataCount = FAQDao.getTabDataCount(FAQCategory);
			int tabTotalPage = myUtil.getPageCount(numPerPage, tabDataCount);
			if(currentPage>tabTotalPage) {
				currentPage = tabTotalPage;
			}//if
			
			listUrl = cp + "/FAQList?FAQCategory=" + FAQCategoryNum;
			
			//페이지 구하기
			String tabPageIndexList = myUtil.pageIndexList(currentPage, tabTotalPage, listUrl);
			
			request.setAttribute("tabPageIndexList", tabPageIndexList);
			request.setAttribute("tabDataCount", tabDataCount);
			
		}else if(FAQCategory==null) {
			
			int dataCount = FAQDao.getDataCount();
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}//if
			
			//페이지 구하기
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList", pageIndexList);
			request.setAttribute("dataCount", dataCount);

			
		}
		
		
		//데이터 가져오기
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		if(FAQCategory!=null) {
			List<FAQDTO> tabLists = FAQDao.getTabLists(start, end, FAQCategory);
			
			request.setAttribute("tabLists", tabLists);
		}
		
		
	
		//주소정리 
		if(FAQCategory!=null) {

			String tabArticleUrl = cp + "/FAQArticle?FAQCategory=" + FAQCategory + "&pageNum=" + currentPage;
			request.setAttribute("tabArticleUrl", tabArticleUrl);

			
		}else if(FAQCategory==null) {
			
			String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
			request.setAttribute("articleUrl", articleUrl);
		}
		
		
		
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		
		

		return "service/FAQList";
		
	}//list
	
	//리스트_이용정책
	@RequestMapping(value = "/FAQListPolicy", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListPolicy(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//전체페이지 수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//데이터 삭제되어서 현재 보고있는 페이지(마지막 페이지)에 데이터 없는 경우 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//데이터 가져오기
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/FAQList";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListPolicy";
		
	}//list
	
	//리스트
	@RequestMapping(value = "/FAQListCommon", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListCommon(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//전체페이지 수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//데이터 삭제되어서 현재 보고있는 페이지(마지막 페이지)에 데이터 없는 경우 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//데이터 가져오기
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/FAQListCommon";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListCommon";
		
	}//list

	//리스트_구매
	@RequestMapping(value = "/FAQListBuy", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListBuy(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//전체페이지 수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//데이터 삭제되어서 현재 보고있는 페이지(마지막 페이지)에 데이터 없는 경우 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//데이터 가져오기
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/FAQListBuy";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListBuy";
		
	}//list

	//리스트_판매
	@RequestMapping(value = "/FAQListSell", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListSell(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//전체페이지 수
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//데이터 삭제되어서 현재 보고있는 페이지(마지막 페이지)에 데이터 없는 경우 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//데이터 범위 가져오기 (rownum의 시작값, 마지막값)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//데이터 가져오기
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/FAQListSell";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListSell";
		
	}//list

	
	
	//아티클
	@RequestMapping(value = "/FAQArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
		int FAQNum = Integer.parseInt(request.getParameter("FAQNum")); 
		String pageNum = request.getParameter("pageNum");
		
		FAQDTO dto = FAQDao.getReadData(FAQNum);
	  
		if(dto==null) {
			return "redirect:/FAQList"; 
		}
		
		if(dto.getFAQContent()!=null||!dto.getFAQContent().equals("")) {
			dto.setFAQContent(dto.getFAQContent().replaceAll("\n", "<br/>"));
		}

		String param = "pageNum=" + pageNum;
		param += "&FAQNum=" + FAQNum;
		
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "service/FAQArticle";
		
	}//article
	
	//아티클
	@RequestMapping(value = "/authPolicy",method = {RequestMethod.GET,RequestMethod.POST})	
	public String authPolicy(HttpServletRequest request) throws Exception{
		
		
		return "service/authPolicy";
	}
}
