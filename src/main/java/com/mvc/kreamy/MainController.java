package com.mvc.kreamy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.dao.BrandDAO;
import com.mvc.dao.ProdDeDAO;
import com.mvc.dao.ShopViewDAO;
import com.mvc.dto.BrandDTO;
import com.mvc.dto.ShopViewDTO;

@Controller("mainController")
public class MainController {

	@Autowired
	@Qualifier("ShopViewDAO")
	ShopViewDAO shopviewDao;
	
	@Autowired
	@Qualifier("BrandDAO")
	BrandDAO brandDao;
	
	@Autowired
	@Qualifier("prodDeDAO")
	ProdDeDAO prodDedao;
	
	@RequestMapping(value = "/mainToProducts",method = {RequestMethod.GET,RequestMethod.POST})
	public String mainToProducts(HttpServletRequest request) throws Exception{
			
		String engProduct = request.getParameter("engProduct");
		
		int prodNum = prodDedao.getProdNum(engProduct);
		
		return "redirect:products?prodNum="+prodNum;
	}
	@RequestMapping(value = "/mainPage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mainPage(HttpServletRequest request, HttpSession session) {
		
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		String searchKey = request.getParameter("searchKey");
		
		if(searchKey==null) {
			searchKey = "";
		}
		
		List<ShopViewDTO> lists = shopviewDao.getProdImageLists(searchKey);
		
		//찜하기 색깔 용
		  for(ShopViewDTO dto : lists) {
			  
			  int prodNum = dto.getProdNum();
			  String engProduct = dto.getEngProduct();
			  
			  Map<String, Object> params = new HashMap<String, Object>();
				
		
			  params.put("engProduct", engProduct);
			  
			  if(userNum!=-1) {
				  
				  params.put("userNum", userNum);
				  int checkNum = shopviewDao.checkNum(params);
				  
				  if(checkNum!=0) { 
					  //일치하는 prodNum이 wish에 있을 경우 - 검은색
					  dto.setCheckNum(1);
				  }else {
					  //일치하는 prodNum이 wish에 없을 경우 - 흰색
					  dto.setCheckNum(-1); 
				  }
			  }else {
				  dto.setCheckNum(userNum);
			  }
		  }
		
		
		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		
		
		
		
		request.setAttribute("prodImagelists", lists);
		
		request.setAttribute("brandLists", brandLists);
		
		
		return "mainPage/mainPage";
		
	}
	@RequestMapping(value = "/searchPage", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPage(HttpServletRequest request, HttpSession session) {
		
		
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		
		String searchKey = request.getParameter("searchKey");
		
		System.out.println(searchKey);
		
		if(searchKey==null) {
			searchKey = "";
		}
		
		List<ShopViewDTO> lists = shopviewDao.getProdImageLists(searchKey);
		 int maxNum = shopviewDao.getTotalProdImageLists(searchKey);
		//찜하기 색깔 용
		 for(ShopViewDTO dto : lists) {
			  
			  int prodNum = dto.getProdNum();
			  String engProduct = dto.getEngProduct();
			  
			  Map<String, Object> params = new HashMap<String, Object>();
				
		
			  params.put("engProduct", engProduct);
			  
			  if(userNum!=-1) {
				  
				  params.put("userNum", userNum);
				  int checkNum = shopviewDao.checkNum(params);
				  
				  if(checkNum!=0) { 
					  //일치하는 prodNum이 wish에 있을 경우 - 검은색
					  dto.setCheckNum(1);
				  }else {
					  //일치하는 prodNum이 wish에 없을 경우 - 흰색
					  dto.setCheckNum(-1); 
				  }
			  }else {
				  dto.setCheckNum(userNum);
			  }
		  }
		
		
		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		System.out.println(maxNum);
		
		
		request.setAttribute("maxNum1", maxNum);
		request.setAttribute("prodImagelists1", lists);
		
		request.setAttribute("searchKey", searchKey);
		
		
		return "mainPage/ajaxSearch";
		
	}
	
}
