package com.mvc.kreamy;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.dao.AnswerDAO;
import com.mvc.dao.BrandDAO;
import com.mvc.dao.QuestionDAO;
import com.mvc.dao.TradeDAO;
import com.mvc.dto.AnswerDTO;
import com.mvc.dto.BrandDTO;
import com.mvc.dto.QuestionDTO;
import com.mvc.dto.TradeDTO;
import com.mvc.util.MyUtil;



@Controller("questionController")
public class QuestionController {

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
	@Qualifier("myUtil")
	MyUtil myUtil;

	//�ۼ�
	@RequestMapping(value = "/questionWrite", method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionWrite(HttpServletRequest request,HttpSession session) throws Exception{
		
		//int userNum = Integer.parseInt(request.getParameter("userNum"));
		int userNum = (Integer) session.getAttribute("userNum");
		
		List<TradeDTO> sellTradeNumLists = tradeDao.getSellTradeNum(userNum);
		int sellTradeNumListsSize = sellTradeNumLists.size();
		
		List<TradeDTO> buyTradeNumLists = tradeDao.getBuyTradeNum(userNum);
		int buyTradeNumListsSize = buyTradeNumLists.size();

		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		request.setAttribute("sellTradeNumLists", sellTradeNumLists);
		request.setAttribute("buyTradeNumLists", buyTradeNumLists);
		request.setAttribute("sellTradeNumListsSize", sellTradeNumListsSize);
		request.setAttribute("buyTradeNumListsSize", buyTradeNumListsSize);
		request.setAttribute("brandLists", brandLists);
		
		return "question/questionWrite";
		
	}//created

	//�ۼ� ����
	@RequestMapping(value = "/questionWrite_ok", method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionWrite_ok(QuestionDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
	
		int maxNum = questionDao.getMaxNum();
				
		dto.setUserNum((Integer) session.getAttribute("userNum"));
		dto.setQuestionNum(maxNum+1);
		dto.setQuestionStatus("�亯���");
		
		questionDao.insertData(dto);
		
		return "redirect:questionList";
		
	}


	//����Ʈ
	@RequestMapping(value = "/questionList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionList(HttpServletRequest request,HttpSession session) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		Integer userNum = (Integer) session.getAttribute("userNum");
		
		if(userNum==null) {
			return "redirect:/login"; 
		}
		
		
		//�ӽ� userNum
		//int userNum=1;

		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//��ü����
		int dataCount = questionDao.getDataCount(userNum);
		
		
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
		List<QuestionDTO> questionLists = questionDao.getLists(start, end, userNum);
		
		//����¡�� �Ѱ��� �ּ�
		String listUrl = cp + "/questionList";
		
	
		//������ ���ϱ�
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ּ����� 
		String articleUrl = cp + "/questionArticle?pageNum=" + currentPage;
		
		
		//�������� �������� �ѱ� ������
		request.setAttribute("questionLists", questionLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("pageNum", pageNum);

		return "question/questionList";
		
	}//list

	
	//���� ���� ����	
	@RequestMapping(value = "/questionArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list���� �Ѿ���� ������ 2�� �޾Ƽ� article�� ���� 
		int questionNum = Integer.parseInt(request.getParameter("questionNum")); 
		String pageNum = request.getParameter("pageNum");
		
		QuestionDTO dto = questionDao.getReadData(questionNum);
	
		AnswerDTO adto = answerDao.getReadAnswerData(questionNum);
		  
		if(dto==null) {
			return "redirect:/questionList"; 
		}
		
		if(dto.getQuestionContent()!=null||!dto.getQuestionContent().equals("")) {
			dto.setQuestionContent(dto.getQuestionContent().replaceAll("\n", "<br/>"));
		}
		 
		if(adto!=null) {
			if(adto.getAnswerContent()!=null||!adto.getAnswerContent().equals("")) {
				adto.setAnswerContent(adto.getAnswerContent().replaceAll("\n", "<br/>"));
			}
		}
		
		//article�� �ʿ��� ������ �ѱ�� 
		request.setAttribute("dto", dto);
		request.setAttribute("adto", adto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "question/questionArticle";
		
	}//article

	
	//���� 
	@RequestMapping(value = "/questionDeleted",method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionDeleted(HttpServletRequest request) throws Exception{
		
		int questionNum = Integer.parseInt(request.getParameter("questionNum"));
		String pageNum = request.getParameter("pageNum");
	
		questionDao.deleteData(questionNum);
		
		return "redirect:/questionList?pageNum=" + pageNum;
		
	}//deleted
	
}//QuestionController
