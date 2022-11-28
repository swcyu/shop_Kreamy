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

	//작성
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

	//작성 저장
	@RequestMapping(value = "/questionWrite_ok", method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionWrite_ok(QuestionDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
	
		int maxNum = questionDao.getMaxNum();
				
		dto.setUserNum((Integer) session.getAttribute("userNum"));
		dto.setQuestionNum(maxNum+1);
		dto.setQuestionStatus("답변대기");
		
		questionDao.insertData(dto);
		
		return "redirect:questionList";
		
	}


	//리스트
	@RequestMapping(value = "/questionList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionList(HttpServletRequest request,HttpSession session) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");
		Integer userNum = (Integer) session.getAttribute("userNum");
		
		if(userNum==null) {
			return "redirect:/login"; 
		}
		
		
		//임시 userNum
		//int userNum=1;

		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = questionDao.getDataCount(userNum);
		
		
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
		List<QuestionDTO> questionLists = questionDao.getLists(start, end, userNum);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/questionList";
		
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/questionArticle?pageNum=" + currentPage;
		
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("questionLists", questionLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("pageNum", pageNum);

		return "question/questionList";
		
	}//list

	
	//문의 세부 내용	
	@RequestMapping(value = "/questionArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
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
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("adto", adto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "question/questionArticle";
		
	}//article

	
	//삭제 
	@RequestMapping(value = "/questionDeleted",method = {RequestMethod.GET,RequestMethod.POST})	
	public String questionDeleted(HttpServletRequest request) throws Exception{
		
		int questionNum = Integer.parseInt(request.getParameter("questionNum"));
		String pageNum = request.getParameter("pageNum");
	
		questionDao.deleteData(questionNum);
		
		return "redirect:/questionList?pageNum=" + pageNum;
		
	}//deleted
	
}//QuestionController
