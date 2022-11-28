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

	//����Ʈ
	@RequestMapping(value = "/noticeList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String noticeList(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = noticeDao.getDataCount();
	
		int numPerPage = 5;
		
		//��ü������ ��
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//������ �����Ǿ ���� �����ִ� ������(������ ������)�� ������ ���� ��� 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//������ ��������
		List<NoticeDTO> lists = noticeDao.getLists(start, end);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/noticeList";
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/noticeArticle?pageNum=" + currentPage;
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/noticeList";
		
	}//list
	
	
	//��ƼŬ
	@RequestMapping(value = "/noticeArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String noticeArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list���� �Ѿ���� ������ 2�� �޾Ƽ� article�� ���� 
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
		
		
		//article�� �ʿ��� ������ �ѱ�� 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "service/noticeArticle";
		
	}//article
	
	/* ���� ���� ���� (FAQ) */
	//����Ʈ
	@RequestMapping(value = "/FAQList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQList(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		int FAQCategoryNum = 0;
		
		//�� ó��
		if(request.getParameter("FAQCategory")!=null) {
			FAQCategoryNum = Integer.parseInt(request.getParameter("FAQCategory"));
		}
		
		
		String FAQCategory = "";
		
		switch (FAQCategoryNum) {
		case 1:
			FAQCategory = "�̿���å";
			break;

		case 2:
			FAQCategory = "����";
			break;

		case 3:
			FAQCategory = "����";
			break;

		case 4:
			FAQCategory = "�Ǹ�";
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
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/FAQList";
		
		//��ü����,��ü������ ��
		if(FAQCategory!=null) {
			
			int tabDataCount = FAQDao.getTabDataCount(FAQCategory);
			int tabTotalPage = myUtil.getPageCount(numPerPage, tabDataCount);
			if(currentPage>tabTotalPage) {
				currentPage = tabTotalPage;
			}//if
			
			listUrl = cp + "/FAQList?FAQCategory=" + FAQCategoryNum;
			
			//������ ���ϱ�
			String tabPageIndexList = myUtil.pageIndexList(currentPage, tabTotalPage, listUrl);
			
			request.setAttribute("tabPageIndexList", tabPageIndexList);
			request.setAttribute("tabDataCount", tabDataCount);
			
		}else if(FAQCategory==null) {
			
			int dataCount = FAQDao.getDataCount();
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}//if
			
			//������ ���ϱ�
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList", pageIndexList);
			request.setAttribute("dataCount", dataCount);

			
		}
		
		
		//������ ��������
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		if(FAQCategory!=null) {
			List<FAQDTO> tabLists = FAQDao.getTabLists(start, end, FAQCategory);
			
			request.setAttribute("tabLists", tabLists);
		}
		
		
	
		//�ּ����� 
		if(FAQCategory!=null) {

			String tabArticleUrl = cp + "/FAQArticle?FAQCategory=" + FAQCategory + "&pageNum=" + currentPage;
			request.setAttribute("tabArticleUrl", tabArticleUrl);

			
		}else if(FAQCategory==null) {
			
			String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
			request.setAttribute("articleUrl", articleUrl);
		}
		
		
		
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		
		

		return "service/FAQList";
		
	}//list
	
	//����Ʈ_�̿���å
	@RequestMapping(value = "/FAQListPolicy", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListPolicy(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//��ü������ ��
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//������ �����Ǿ ���� �����ִ� ������(������ ������)�� ������ ���� ��� 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//������ ��������
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/FAQList";
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListPolicy";
		
	}//list
	
	//����Ʈ
	@RequestMapping(value = "/FAQListCommon", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListCommon(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//��ü������ ��
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//������ �����Ǿ ���� �����ִ� ������(������ ������)�� ������ ���� ��� 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//������ ��������
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/FAQListCommon";
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListCommon";
		
	}//list

	//����Ʈ_����
	@RequestMapping(value = "/FAQListBuy", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListBuy(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//��ü������ ��
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//������ �����Ǿ ���� �����ִ� ������(������ ������)�� ������ ���� ��� 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//������ ��������
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/FAQListBuy";
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListBuy";
		
	}//list

	//����Ʈ_�Ǹ�
	@RequestMapping(value = "/FAQListSell", method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQListSell(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = FAQDao.getDataCount();
	
		int numPerPage = 5;
		
		//��ü������ ��
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//������ �����Ǿ ���� �����ִ� ������(������ ������)�� ������ ���� ��� 
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}//if
		
		//������ ���� �������� (rownum�� ���۰�, ��������)
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		//������ ��������
		List<FAQDTO> lists = FAQDao.getLists(start, end);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/FAQListSell";
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/FAQArticle?pageNum=" + currentPage;
		
		//�������� �������� �ѱ� ������
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "service/FAQListSell";
		
	}//list

	
	
	//��ƼŬ
	@RequestMapping(value = "/FAQArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String FAQArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list���� �Ѿ���� ������ 2�� �޾Ƽ� article�� ���� 
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
		
		
		//article�� �ʿ��� ������ �ѱ�� 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "service/FAQArticle";
		
	}//article
	
	//��ƼŬ
	@RequestMapping(value = "/authPolicy",method = {RequestMethod.GET,RequestMethod.POST})	
	public String authPolicy(HttpServletRequest request) throws Exception{
		
		
		return "service/authPolicy";
	}
}
