package com.mvc.kreamy;

import com.mvc.dao.*;
import com.mvc.dto.*;
import com.mvc.util.MyUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class AdminController
{
	@Autowired
	@Qualifier("myPageDAO")
    MyPageDAO myPageDAO;

	@Autowired
	@Qualifier("addrDAO")
    AddrDAO addrDAO;
    
	@Autowired
	@Qualifier("bidBuyDAO")
    BidBuyDAO bidBuyDAO;
    
	@Autowired
	@Qualifier("bidSellDAO")
    BidSellDAO bidSellDAO;
    
	@Autowired
	@Qualifier("tradeDAO")
    TradeDAO tradeDAO;
    
	@Autowired
	@Qualifier("wishDAO")
    WishDAO wishDAO;

	@Autowired
	@Qualifier("paymentDAO")
	PaymentDAO paymentDAO;
	
	@Autowired
	@Qualifier("adminProdInfoDAO")
	AdminProdInfoDAO adminProdInfoDAO;
	
	@Autowired
	@Qualifier("adminProdImageDAO")
	AdminProdImageDAO adminProdImageDAO;
	
	@Autowired
	@Qualifier("questionDAO")
	QuestionDAO questionDao;

	@Autowired
	@Qualifier("answerDAO")
	AnswerDAO answerDao;

	@Autowired
	@Qualifier("FAQDAO")
	FAQDAO FAQDao;

	@Autowired
	@Qualifier("noticeDAO")
	NoticeDAO noticeDao;
	
	MyUtil myUtil = new MyUtil();
	
	
	@RequestMapping(value = "/admin",method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(HttpServletRequest request){	
		
		int userCount = myPageDAO.getDataCount();
		int sneakersCount = adminProdInfoDAO.getProductCount("sneakers");
		int appraelCount = adminProdInfoDAO.getProductCount("apparel");
		int goodsCount = adminProdInfoDAO.getProductCount("goods");
		int lifeCount = adminProdInfoDAO.getProductCount("life");
		int techCount = adminProdInfoDAO.getProductCount("tech");
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
				
		Date time = new Date();
		String today = format.format(time);
		int bidBuyCount = bidBuyDAO.getDataCount(today);
		int bidSellCount = bidSellDAO.getDataCount(today);
		int tradeCount = tradeDAO.getDataCount(today);
		int questionCount = questionDao.getDataTodayCount(today);
		int questionNoAnswerCount = questionDao.getDataNoAnswerCount();
		
		request.setAttribute("questionNoAnswerCount", questionNoAnswerCount);
		request.setAttribute("questionCount", questionCount);
		request.setAttribute("bidBuyCount", bidBuyCount);
		request.setAttribute("bidSellCount", bidSellCount);
		request.setAttribute("tradeCount", tradeCount);
		request.setAttribute("sneakersCount", sneakersCount);
		request.setAttribute("appraelCount", appraelCount);
		request.setAttribute("goodsCount", goodsCount);
		request.setAttribute("lifeCount", lifeCount);
		request.setAttribute("techCount", techCount);
		request.setAttribute("userCount", userCount);
		return "admin/admin";
	}
	@RequestMapping(value = "/adminProduct",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProduct(HttpServletRequest request){	
		
		return "admin/adminProduct";
	}
	@RequestMapping(value = "/adminProductList",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductList(HttpServletRequest request){	
		String cp = request.getContextPath();
		
		int numPerPage = 6;
		int totalPage = 0;
		int totalDataCount = 0;
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}else {
			pageNum = "1";
		}
		String searchValue = request.getParameter("searchValue");
		if(searchValue==null) {
			searchValue = "";
		}
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("searchValue", searchValue);

		totalDataCount = adminProdInfoDAO.getDataCount(hMap);
		
		if(totalDataCount!=0) {
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);
		}
		
		if(currentPage>totalPage) {
			currentPage=totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		hMap.put("start", start);
		hMap.put("end", end);
		
		List<ProductDTO> prodLists = adminProdInfoDAO.getList(hMap);
		
	
		
		request.setAttribute("pageIndexList", myUtil.pageIndexList(currentPage, totalPage));
		
		
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("prodLists", prodLists);
		return "admin/adminProductList";
	}
	@RequestMapping(value = "/adminProductDelete",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductDelete(HttpServletRequest request){	
		String engProduct = request.getParameter("engProduct");
		adminProdInfoDAO.deleteData(engProduct);
		adminProdImageDAO.deleteData(engProduct);
		return adminProductList(request);
	}
	
	@RequestMapping(value = "/adminProductAdd",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductAdd(HttpServletRequest request){	
		
		
		return "admin/adminProductAdd";
	}

	@RequestMapping(value = "/adminProductAddPhoto",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductAddPhoto(MultipartHttpServletRequest request){
		
		String path = "C://image";
		String mode = request.getParameter("mode");
		MultipartFile file = request.getFile("file");
		String newFileName = null;
		String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		
		newFileName += System.nanoTime();//10의 -9승
		
		newFileName += fileExt;
		
		File f = new File(path);
		
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(file!=null && file.getSize()>0) {
			try {
				FileOutputStream fos = new FileOutputStream(path + "/" + newFileName);
				
				InputStream is = file.getInputStream();
				
				byte[] buffer  = new byte [512];
				while(true) {
					int data = is.read(buffer,0,buffer.length);
					if(data==-1) {
						break;
					}
					
					fos.write(buffer,0,data);
				}
				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		request.setAttribute("mode", mode);
		request.setAttribute("imageName", newFileName);
		
		return "admin/adminProductAddPhoto";
	}
	@RequestMapping(value = "/adminProductDeletePhoto",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductDeletePhoto(HttpServletRequest request){	
			
		String filePath = "c://image/"+request.getParameter("fileName");
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
		return "admin/adminProductAddPhoto";
	}
	
	@RequestMapping(value = "/adminProductSave",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductSave(HttpServletRequest request){	
		
		String[] cloth_size = {"XXS","XS","S","M","L","XL","XXL"};
		
		AdminProdInfoDTO APIDTO = new AdminProdInfoDTO();
		
		
		APIDTO.setEngProduct(request.getParameter("engProduct"));
		APIDTO.setKorProduct(request.getParameter("korProduct"));
		
		String styleNum = request.getParameter("styleNum");
		if(styleNum.equals("") || styleNum==null) {
			APIDTO.setStyleNum("-");
		}else {
			APIDTO.setStyleNum(styleNum);
		}
		String colorway = request.getParameter("colorway");
		if(colorway.equals("") || colorway==null) {
			APIDTO.setColorway("-");
		}else {
			APIDTO.setColorway(colorway);
		}
		APIDTO.setReleaseDate(request.getParameter("releaseDate"));
		APIDTO.setRetailPrice(request.getParameter("retailPrice"));
		APIDTO.setBrandName(request.getParameter("brandName"));
		
		String category = request.getParameter("category");
		if(category.equals("스니커즈")) {
			category = "sneakers";
		}else if(category.equals("의류")) {
			category = "apparel";
		}else if(category.equals("패션잡화")) {
			category = "goods";
		}else if(category.equals("라이프")) {
			category = "life";
		}else {
			category = "tech";
		}
		APIDTO.setCategory(category);
		APIDTO.setCondition("새상품");
		
		String shoe;
		if(category.equals("sneakers")) {
			for(int i=220;i<=300;i=i+5) {
				shoe = Integer.toString(i);
				APIDTO.setUserSize(shoe);
				APIDTO.setProdNum(adminProdInfoDAO.maxNum()+1);
				adminProdInfoDAO.insertData(APIDTO);
			}
		}else if(category.equals("apparel")) {
			for(int i=0;i<cloth_size.length;i++) {
				APIDTO.setUserSize(cloth_size[i]);
				APIDTO.setProdNum(adminProdInfoDAO.maxNum()+1);
				adminProdInfoDAO.insertData(APIDTO);
			}
		}else {
			APIDTO.setUserSize("ONE SIZE");
			APIDTO.setProdNum(adminProdInfoDAO.maxNum()+1);
			adminProdInfoDAO.insertData(APIDTO);
		}

		String imageName1 = request.getParameter("photo1");	
		String imageName2 = request.getParameter("photo2");	
		String imageName3 = request.getParameter("photo3");	
		
		AdminProdImageDTO imgDTO = new AdminProdImageDTO();
		
		imgDTO.setImageNum(adminProdImageDAO.maxNum()+1);
		imgDTO.setEngProduct(APIDTO.getEngProduct());
		imgDTO.setImageName(imageName1);
		imgDTO.setImageType("list");
		adminProdImageDAO.insertData(imgDTO);	
		
		if(imageName2!=null) {
			imgDTO.setImageNum(adminProdImageDAO.maxNum()+1);
			imgDTO.setImageName(imageName2);
			imgDTO.setImageType("detail");
			adminProdImageDAO.insertData(imgDTO);	
		}
		if(imageName3!=null) {
			imgDTO.setImageNum(adminProdImageDAO.maxNum()+1);
			imgDTO.setImageName(imageName3);
			imgDTO.setImageType("detail");
			adminProdImageDAO.insertData(imgDTO);	
		}
		
		
		return "admin/adminProduct";
	}
	@RequestMapping(value = "/adminProductEngCheck",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminProductEngCheck(HttpServletRequest request){
		
		String flag ="yes";
		String engProduct = request.getParameter("engProduct");
		
		List<String> EngProdList = adminProdInfoDAO.getEngProductList();
		Iterator<String> EngIt = EngProdList.iterator();
		while(EngIt.hasNext()) {
			if(EngIt.next().equals(engProduct)) {
				flag = "no";
				break;
			}
		}
		request.setAttribute("save_check", flag);
		return "admin/adminProductEngCheck";
	}
	
	@RequestMapping(value = "/adminInspection",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminInspection(HttpServletRequest request){	
		
		
		return "admin/adminInspection";
	}
	
	@RequestMapping(value = "/adminInspectionList",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminInspectionList(HttpServletRequest request){	
		String cp = request.getContextPath();
		int numPerPage = 6;
		int totalPage = 0;
		int totalDataCount = 0;
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}else {
			pageNum = "1";
		}
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		if(searchValue==null) {
			searchValue = "";
		}
		if(searchKey==null||searchKey.equals("")){
			searchKey = "total";
		}
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("searchKey", searchKey);
		hMap.put("searchValue", searchValue);

		totalDataCount = adminProdInfoDAO.getInspectDataCount(hMap);
		
		if(totalDataCount!=0) {
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);
		}
		
		if(currentPage>totalPage) {
			currentPage=totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		hMap.put("start", start);
		hMap.put("end", end);
		
		List<InspectDTO> inspectList = adminProdInfoDAO.getInspectList(hMap);
		List<InspectDTO> inspectLists = new ArrayList<InspectDTO>();
		Iterator<InspectDTO> inspIT = inspectList.iterator();
		
		while(inspIT.hasNext()) {
			InspectDTO iDTO = inspIT.next();
			String number = Integer.toString(iDTO.getTradeNum());
			int length = number.length();
			for(int i=0 ; i<3-length;i++) {
				number = "0"+number;
			}
			
			iDTO.setThreeTradeNum(number);
			inspectLists.add(iDTO);
		}
		request.setAttribute("pageIndexList", myUtil.pageIndexList(currentPage, totalPage));
		
		request.setAttribute("searchKey", searchKey);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("inspectLists", inspectLists);
		
		return "admin/adminInspectionList";
	}
	@RequestMapping(value = "/adminInspectionUpdate",method = {RequestMethod.GET,RequestMethod.POST})
	public String adminInspectionUpdate(HttpServletRequest request){	
		
		String mode = request.getParameter("mode");
		int tradeNum = Integer.parseInt(request.getParameter("tradeNum"));
		String state = request.getParameter("state");
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mode", mode);
		hMap.put("tradeNum", tradeNum);
		hMap.put("state", state);
		
		tradeDAO.updateData(hMap);
		
		
		return "admin/adminInspectionList";
	}
	@RequestMapping(value = "/adminQuestionList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminQuestionList(HttpServletRequest request) throws Exception{
		
		String cp = request.getContextPath();
		
		//page
		String pageNum = request.getParameter("pageNum");

		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체갯수
		int dataCount = questionDao.adminGetDataCount();
	
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
		List<QuestionDTO> questionLists = questionDao.adminGetLists(start, end);
		
		//페이징에 넘겨줄 주소
		String listUrl = cp + "/adminQuestionList";
		
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/adminQuestionArticle?pageNum=" + currentPage;
		
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("questionLists", questionLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "admin/adminQuestionList";
		
	}//list

	
	//문의 세부 내용	
	@RequestMapping(value = "/adminQuestionArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminQuestionArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
		int questionNum = Integer.parseInt(request.getParameter("questionNum")); 
		String pageNum = request.getParameter("pageNum");
		
		QuestionDTO dto = questionDao.getReadData(questionNum);
		
		AnswerDTO adto = answerDao.getReadAnswerData(questionNum);
		  
		if(dto==null) {
			return "redirect:/adminQuestionList"; 
		}
		
		String updateAnswerContent = "";
		
		if(dto.getQuestionContent()!=null||!dto.getQuestionContent().equals("")) {
			dto.setQuestionContent(dto.getQuestionContent().replaceAll("\n", "<br/>"));
		}

		if(adto!=null) {
			if(adto.getAnswerContent()!=null||!adto.getAnswerContent().equals("")) {
				updateAnswerContent = adto.getAnswerContent();
				adto.setAnswerContent(adto.getAnswerContent().replaceAll("\n", "<br/>"));
			}
		}

		String param = "pageNum=" + pageNum;
		param += "&questionNum=" + questionNum;
		
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("adto", adto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("updateAnswerContent", updateAnswerContent);
		 		
		return "admin/adminQuestionArticle";
		
	}//article

	//문의 세부 내용	
	@RequestMapping(value = "/adminQuestionArticle_ok",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminQuestionArticle_ok(AnswerDTO adto, QuestionDTO dto, HttpServletRequest request) throws Exception{
		
		int maxNum = answerDao.getMaxNum();
		int questionNum = Integer.parseInt(request.getParameter("questionNum"));
		String pageNum = request.getParameter("pageNum");
		
		adto.setAnswerNum(maxNum+1);
		dto.setQuestionStatus("답변완료");
		
		questionDao.updateData(dto);
		answerDao.insertAnswerData(adto);
		
		String param = "pageNum=" + pageNum;
		param += "&questionNum="+questionNum;

		 		
		return "redirect:adminQuestionArticle?"+param;
		
	}//article 

	//문의 답변 수정	
	@RequestMapping(value = "/adminQuestionUpdate",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminQuestionUpdate(AnswerDTO adto, QuestionDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");	
		int questionNum = Integer.parseInt(request.getParameter("questionNum"));
		
		answerDao.updateAnswerData(adto);
		
		String param = "pageNum=" + pageNum;
		param += "&questionNum="+questionNum;
		
				
		return "redirect:adminQuestionArticle?"+param;
	}

	//문의 답변 삭제	
	@RequestMapping(value = "/adminQuestionDelete",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminQuestionDelete(AnswerDTO adto, QuestionDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		int questionNum = Integer.parseInt(request.getParameter("questionNum"));
		
		dto.setQuestionStatus("답변대기");
		
		questionDao.updateData(dto);
		
		answerDao.deleteAnswerData(questionNum);
		
		String param = "pageNum=" + pageNum;
		param += "&questionNum="+questionNum;
		
		return "redirect:adminQuestionArticle?"+param;
	}


	/* 공지사항 (notice) */
	//리스트
	@RequestMapping(value = "/adminNoticeList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeList(HttpServletRequest request) throws Exception{
		
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
		String listUrl = cp + "/adminNoticeList";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/adminNoticeArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "admin/adminNoticeList";
		
	}//list
	
	
	//아티클
	@RequestMapping(value = "/adminNoticeArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum")); 
		String pageNum = request.getParameter("pageNum");
		
		NoticeDTO dto = noticeDao.getReadData(noticeNum);
	  
		if(dto==null) {
			return "redirect:/adminNoticeList"; 
		}
		
		
		if(dto.getNoticeContent()!=null||!dto.getNoticeContent().equals("")) {
			dto.setNoticeContent(dto.getNoticeContent().replaceAll("\n", "<br/>"));
		}

		String param = "pageNum=" + pageNum;
		param += "&noticeNum=" + noticeNum;
		
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "admin/adminNoticeArticle";
		
	}//article
	
	
	
	//작성
	@RequestMapping(value = "/adminNoticeWrite", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeWrite(HttpServletRequest request) throws Exception{
		
		return "admin/adminNoticeWrite";
		
	}//created

	//작성 저장
	@RequestMapping(value = "/adminNoticeWrite_ok", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeWrite_ok(NoticeDTO dto, HttpServletRequest request) throws Exception{
	
		int maxNum = noticeDao.getMaxNum();
		
		dto.setNoticeNum(maxNum+1);
		
		noticeDao.insertData(dto);
		
		return "redirect:adminNoticeList";
		
	}
	
	
	//수정
		@RequestMapping(value = "/adminNoticeUpdate",method = {RequestMethod.GET,RequestMethod.POST})	
		public String adminNoticeUpdate(HttpServletRequest request) throws Exception{

			String cp = request.getContextPath();
			
			String pageNum = request.getParameter("pageNum");	
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));

			NoticeDTO dto = noticeDao.getReadData(noticeNum);
			
			if(dto==null) {
				return "redirect:/adminNoticeList"; 
			}
			
			if(dto.getNoticeContent()!=null||!dto.getNoticeContent().equals("")) {
				dto.setNoticeContent(dto.getNoticeContent().replaceAll("<br/>","\n"));
			}

			String param = "pageNum=" + pageNum;
			param += "&noticeNum=" + noticeNum;
			
			//필요한 데이터 넘기기 
			request.setAttribute("dto", dto);
			request.setAttribute("pageNum", pageNum);
					
			return "admin/adminNoticeUpdate";
			
		}
	

	//수정-저장
	@RequestMapping(value = "/adminNoticeUpdate_ok",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeUpdate_ok(NoticeDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");	
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));

		noticeDao.updateData(dto);
		
		String param = "pageNum=" + pageNum;
		param += "&noticeNum=" + noticeNum;
				
		return "redirect:adminNoticeArticle?"+param;
	}

	
	
	//삭제	
	@RequestMapping(value = "/adminNoticeDelete",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminNoticeDelete(NoticeDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		
		noticeDao.deleteData(noticeNum);
		
		String param = "pageNum=" + pageNum;
		
		return "redirect:adminNoticeList?"+param;
	}
	

	
	
	
	/* 자주 묻는 질문 (FAQ) */
	//리스트
	@RequestMapping(value = "/adminFAQList", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQList(HttpServletRequest request) throws Exception{
		
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
		String listUrl = cp + "/adminFAQList";
	
		//페이지 구하기
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//주소정리 
		String articleUrl = cp + "/adminFAQArticle?pageNum=" + currentPage;
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);

		return "admin/adminFAQList";
		
	}//list
	
	
	//아티클
	@RequestMapping(value = "/adminFAQArticle",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQArticle(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		//list에서 넘어오는 데이터 2개 받아서 article로 가기 
		int FAQNum = Integer.parseInt(request.getParameter("FAQNum")); 
		String pageNum = request.getParameter("pageNum");
		
		FAQDTO dto = FAQDao.getReadData(FAQNum);
	  
		if(dto==null) {
			return "redirect:/adminFAQList"; 
		}
		
		if(dto.getFAQContent()!=null||!dto.getFAQContent().equals("")) {
			dto.setFAQContent(dto.getFAQContent().replaceAll("\n", "<br/>"));
		}

		String param = "pageNum=" + pageNum;
		param += "&FAQNum=" + FAQNum;
		
		
		//article에 필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		 		
		return "admin/adminFAQArticle";
		
	}//article
	
	
	
	//작성
	@RequestMapping(value = "/adminFAQWrite", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQWrite(HttpServletRequest request) throws Exception{
		
		return "admin/adminFAQWrite";
		
	}//created

	//작성 저장
	@RequestMapping(value = "/adminFAQWrite_ok", method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQWrite_ok(FAQDTO dto, HttpServletRequest request) throws Exception{
	
		int maxNum = FAQDao.getMaxNum();
		
		dto.setFAQNum(maxNum+1);
		
		FAQDao.insertData(dto);
		
		return "redirect:adminFAQList";
		
	}
	
	
	//수정
	@RequestMapping(value = "/adminFAQUpdate",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQUpdate(HttpServletRequest request) throws Exception{

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");	
		int FAQNum = Integer.parseInt(request.getParameter("FAQNum"));

		FAQDTO dto = FAQDao.getReadData(FAQNum);
		
		if(dto==null) {
			return "redirect:/adminFAQList"; 
		}
		
		if(dto.getFAQContent()!=null||!dto.getFAQContent().equals("")) {
			dto.setFAQContent(dto.getFAQContent().replaceAll("<br/>","\n"));
		}
	
		//필요한 데이터 넘기기 
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
				
		return "admin/adminFAQUpdate";
		
	}
	

	//수정-저장
	@RequestMapping(value = "/adminFAQUpdate_ok",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQUpdate_ok(FAQDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");	
		int FAQNum = Integer.parseInt(request.getParameter("FAQNum"));

		FAQDao.updateData(dto);
		
		String param = "pageNum=" + pageNum;
		param += "&FAQNum=" + FAQNum;
				
		return "redirect:adminFAQArticle?"+param;
	}

	
	
	//삭제	
	@RequestMapping(value = "/adminFAQDelete",method = {RequestMethod.GET,RequestMethod.POST})	
	public String adminFAQDelete(NoticeDTO dto, HttpServletRequest request) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		int FAQNum = Integer.parseInt(request.getParameter("FAQNum"));
		
		FAQDao.deleteData(FAQNum);
		
		String param = "pageNum=" + pageNum;
		
		return "redirect:adminFAQList?"+param;
	}
	
}
