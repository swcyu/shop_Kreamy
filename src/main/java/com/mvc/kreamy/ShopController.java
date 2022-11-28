package com.mvc.kreamy;



import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.util.MyUtil;
import com.mvc.dao.BrandDAO;
import com.mvc.dao.ShopViewDAO;
import com.mvc.dao.WishProductDAO;
import com.mvc.dto.BrandDTO;

import com.mvc.dto.ShopViewDTO;
import com.mvc.dto.WishProductDTO;



@Controller("shopController")
public class ShopController {
	
	@Autowired
	@Qualifier("ShopViewDAO")
	ShopViewDAO shopviewDao;
	
	@Autowired
	@Qualifier("BrandDAO")
	BrandDAO brandDao;
	
	@Autowired
	@Qualifier("WishProductDAO")
	WishProductDAO wishProductDao;
	
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;
	
	
	

	@RequestMapping(value = "/shop.action",method = {RequestMethod.GET,RequestMethod.POST})	
	public String shop(HttpServletRequest request) {
		
		String searchKey = request.getParameter("searchKey");
		
		request.setAttribute("searchKey",searchKey);
		
		return "shop/shop";
	
	}
	
	
	@RequestMapping(value = "/shopSearch.action",method = {RequestMethod.GET,RequestMethod.POST})	
	public String shopSearch(HttpServletRequest request, HttpSession session) {
		
		//�ΰ�,�귣���̸�
		
		List<BrandDTO> brandLists = brandDao.getBrandLists();
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
		
		
		int maxNum = shopviewDao.getTotalProdImageLists(searchKey);
		
		List<ShopViewDTO> lists = shopviewDao.getProdImageLists(searchKey);
		
	
		 for(ShopViewDTO dto : lists) {
			 
			  int prodNum = dto.getProdNum();
			  String engProduct = dto.getEngProduct();
			  
			  Map<String, Object> params = new HashMap<String, Object>();
				
		
			  params.put("engProduct", engProduct);
			  
			  if(userNum!=-1) {
				  
				  params.put("userNum", userNum);
				  int checkNum = shopviewDao.checkNum(params);
				  
				  if(checkNum!=0) { 
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
					  dto.setCheckNum(1);
				  }else {
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
					  dto.setCheckNum(-1); 
				  }
			  }else {
				  dto.setCheckNum(userNum);
			  }
		 }
		request.setAttribute("prodImagelists", lists);
		
		request.setAttribute("maxNum", maxNum);
		request.setAttribute("searchKey",searchKey);
		request.setAttribute("brandLists", brandLists);		
		return "shop/shopFilter";
	
	}
	
	
	@RequestMapping(value = "/filterSearch.action", method = {RequestMethod.GET,RequestMethod.POST})			
	public String filterSearch(HttpServletRequest request, Model model, HttpSession session) {
		
		//�ΰ�,�귣���̸�
		
		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		String category="";
		if(!request.getParameter("category").equals("��� ī�װ�")) {
			category = request.getParameter("category");	
			if(category.equals("����Ŀ��")) {
				category="sneakers";
			}else if(category.equals("�Ƿ�")) {
				category="apparel";
			}else if(category.equals("�м� ��ȭ")) {
				category="goods";
			}else if(category.equals("��ũ")) {
				category="tech";
			}else {
				category="life";
			}
		}
		String[] brands= {};
		String brand = "";
		if(!request.getParameter("brand").equals("��� �귣��")) {
			brand = request.getParameter("brand");
		}
		if((!brand.equals(""))) {
			if(brand.indexOf(",")==-1) {
				brands = new String[1];
				brands[0]=brand;
			}else {
				brands = brand.split(", ");
			}
		}
		String sorting="";
		if(request.getParameter("sorting")!=null) {
			sorting = request.getParameter("sorting");	
		}
		String price = "";
		String beginPrice="";
		String endPrice="";
		if(!request.getParameter("cost").equals("��� ����")) {
			price = request.getParameter("cost");
		}
		if(!price.equals("")) {
			
			if(price.equals("10���� ����")) {
				beginPrice="";
				endPrice="100000";
			}else if(price.equals("10���� - 30���� ����")) {
				beginPrice="100000";
				endPrice="300000";
			}else if(price.equals("30���� - 50���� ����")) {
				beginPrice="300000";
				endPrice="500000";
			}else {
				beginPrice="500000";
				endPrice="";
			}
			
		}
		
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		
		if("".equals(brand)) {//Jordan,Nike
			System.out.println("�귣����� null");
			
			int maxNum = shopviewDao.getTotalCategorySearchLists1(category, brand, beginPrice, endPrice);
			
			List<ShopViewDTO> lists = shopviewDao.getCategorySearchLists1(category,brand,sorting, beginPrice, endPrice);
			
			 for(ShopViewDTO dto : lists) {
				 
				  int prodNum = dto.getProdNum();
				  String engProduct = dto.getEngProduct();
				  
				  Map<String, Object> params = new HashMap<String, Object>();
					
			
				  params.put("engProduct", engProduct);
				  
				  if(userNum!=-1) {
					  
					  params.put("userNum", userNum);
					  int checkNum = shopviewDao.checkNum(params);
					  
					  if(checkNum!=0) { 
						  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
						  dto.setCheckNum(1);
					  }else {
						  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
						  dto.setCheckNum(-1); 
					  }
				  }else {
					  dto.setCheckNum(userNum);
				  }
				  
			 }  
			
			
			//System.out.println("��Ʈ�ѷ� sorting:" + sorting);
			
			//model.addAttribute("prodImagelists", lists);
			request.setAttribute("prodImagelists", lists);

			request.setAttribute("maxNum", maxNum);
		
		
		}else {
			System.out.println("�귣�� ���� ����");
	
			int maxNum = shopviewDao.getTotalCategorySearchLists(category,brands,beginPrice,endPrice);
			
			List<ShopViewDTO> lists = shopviewDao.getCategorySearchLists(category,brands,sorting,beginPrice,endPrice);
			
			
			 for(ShopViewDTO dto : lists) {
				 
				  int prodNum = dto.getProdNum();
				  String engProduct = dto.getEngProduct();
				  
				  Map<String, Object> params = new HashMap<String, Object>();
					
			
				  params.put("engProduct", engProduct);
				  
				  if(userNum!=-1) {
					  params.put("userNum", userNum);
				 
					  int checkNum = shopviewDao.checkNum(params);
					  
					  if(checkNum!=0) { 
						  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
						  dto.setCheckNum(1);
					  }else {
						  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
						  dto.setCheckNum(-1); 
					  }
				  }else {
					  dto.setCheckNum(userNum);
				  }
			 }
			//model.addAttribute("prodImagelists", lists);
			request.setAttribute("prodImagelists", lists);
			
			//System.out.println("��Ʈ�ѷ� sorting:" + sorting);
			
			request.setAttribute("maxNum", maxNum);
			
		}
			
		
		request.setAttribute("category", category);
		request.setAttribute("brandName", brand);
		request.setAttribute("sorting", sorting);
		request.setAttribute("price", price);
		//request.setAttribute("brandNameList", brandNameList);
		//upperSearch
		request.setAttribute("brandLists", brandLists);	
		
		return "shop/shopFilter";
		
		
		
	}
	@RequestMapping(value = "/filterSearch2.action", method = {RequestMethod.GET,RequestMethod.POST})			
	public String filterSearch2(HttpServletRequest request, Model model,HttpSession session,
			@RequestParam("category") String category,
			@RequestParam("brandName") String brandName,
			@RequestParam("sorting") String sorting,
			@RequestParam("price") String price
			) {
		
		/*
		 * redirect.addAttribute("category", category);
		 * redirect.addAttribute("brandName", brandName);
		 * redirect.addAttribute("sorting", sorting);
		 *  redirect.addAttribute("price", price);
		 */
		
		
		

		//�ΰ�,�귣���̸�
		
		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		/*
		if(category==null) {
			 category = request.getParameter("category");
		}
		
		
		if(brandName==null) {
			 brandName = request.getParameter("brandName");
		}
		
		if(sorting==null) {
			 sorting = request.getParameter("sorting");
		}
		
		if(price==null) {
			//���� ����
			 price = request.getParameter("price");
		}
		*/
		
		
		
		//System.out.println("���μ�ġ category ����: " + category + "brandName ����: " + brandName + "sorting ����: " + sorting + "price ����: " + price);
		
		String[] prices = price.split("-");
		String beginPrice = "";
		String endPrice = "";
		
		beginPrice = prices[0];
		
		if(prices.length>1) {
			endPrice = prices[1];
		}

		//System.out.println("���۰� :" + beginPrice + ", �� ��: " + endPrice);
		
		if("".equals(brandName)) {
			System.out.println("good");
		}
		
		//Jordan,Nike
		//System.out.println("brandName�� ��:" + brandName + " category�� ��: " + category + "sorting�� ��:" +sorting);
		//releasedate
		
		//Jordan,dunk,supreme
		//©�� ������ ��
		
		// �迭�� ����
		// �귣�� �̸��� �־���
		
		
		String[] categories= new String[6];
		
		categories[0] = "sneakers";
		categories[1] = "apparel";
		categories[2] = "goods";
		categories[3] = "life";
		categories[4] = "tech";
		categories[5] = "";
		
		if(category==null) {
			category = "";
		}
		
		
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		
		
		System.out.println(category);
		
		for(int i=0; i<categories.length;i++) {
			
			if(categories[i].equals(category)) {
				
				
				if("".equals(brandName)) {//Jordan,Nike
					System.out.println("�귣����� null");
					
					if(brandName==null) {
						brandName = "";
					}
					
					
					
					int maxNum = shopviewDao.getTotalCategorySearchLists1(category, brandName, beginPrice, endPrice);
					
					List<ShopViewDTO> lists = shopviewDao.getCategorySearchLists1(category,brandName,sorting, beginPrice, endPrice);
					
					
					 for(ShopViewDTO dto : lists) {
						 
						  int prodNum = dto.getProdNum();
						  String engProduct = dto.getEngProduct();
						  
						  Map<String, Object> params = new HashMap<String, Object>();
							
					
						  params.put("engProduct", engProduct);
						  
						  if(userNum!=-1) {
							  params.put("userNum", userNum);
						 
							  int checkNum = shopviewDao.checkNum(params);
							  
							  if(checkNum!=0) { 
								  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
								  dto.setCheckNum(1);
							  }else {
								  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
								  dto.setCheckNum(-1); 
							  }
						  }else {
							  dto.setCheckNum(userNum);
						  }
					  }
					
					//System.out.println("��Ʈ�ѷ� sorting:" + sorting);
					
					//model.addAttribute("prodImagelists", lists);
					request.setAttribute("prodImagelists", lists);

					request.setAttribute("maxNum", maxNum);
				
				
				}else {
					System.out.println("�귣�� ���� ����");
					String[] brandNames = brandName.split("\\,");
					
					
					int maxNum = shopviewDao.getTotalCategorySearchLists(category,brandNames,beginPrice,endPrice);
					
					List<ShopViewDTO> lists = shopviewDao.getCategorySearchLists(category,brandNames,sorting,beginPrice,endPrice);
					
					
					 for(ShopViewDTO dto : lists) {
						 
						  int prodNum = dto.getProdNum();
						  String engProduct = dto.getEngProduct();
						  
						  Map<String, Object> params = new HashMap<String, Object>();
							
					
						  params.put("engProduct", engProduct);
						  if(userNum!=-1) {
							  params.put("userNum", userNum);
						 
							  int checkNum = shopviewDao.checkNum(params);
							  
							  if(checkNum!=0) { 
								  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
								  dto.setCheckNum(1);
							  }else {
								  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
								  dto.setCheckNum(-1); 
							  }
						  }else {
							  dto.setCheckNum(userNum);
						  }
					 }
					
					//model.addAttribute("prodImagelists", lists);
					request.setAttribute("prodImagelists", lists);
					
					//System.out.println("��Ʈ�ѷ� sorting:" + sorting);
					
					request.setAttribute("maxNum", maxNum);
					
					
					
				}
			}
			
		}
		
		
		
		
		String aa = "category="+category +"&brandName="+brandName+"&sorting="+sorting+"&price="+price;
				
		
		request.setAttribute("category", category);
		request.setAttribute("brandName", brandName);
		request.setAttribute("sorting", sorting);
		request.setAttribute("price", price);
		//request.setAttribute("brandNameList", brandNameList);
		request.setAttribute("aa", aa);
		
		//upperSearch
		request.setAttribute("brandLists", brandLists);	
	
		return "shop/shopFilter";
		
		
	}


	
	@RequestMapping(value = "/wishProdcut.action", method = {RequestMethod.GET,RequestMethod.POST})			
	public String wishProdcut(HttpServletRequest request, Model model, HttpSession session) {
		
		String engProduct = request.getParameter("engProduct");
		String category = request.getParameter("category");
		String brandName = request.getParameter("brandName");
		String sorting = request.getParameter("sorting");
		String price = request.getParameter("price");
		
		String mode = request.getParameter("mode");
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		//String brandNameList = request.getParameter("brandNameList");
		
		
		//System.out.println("engProduct ����: " + engProduct);
		//System.out.println("�������δ�Ʈ category ����: " + category + "brandName ����: " + brandName + "sorting ����: " + sorting + "price ����: " + price);
		
		List<WishProductDTO> wishProductLists = wishProductDao.getWishProduct(engProduct);
		
		
		//���ϱ� ���� ��
		  for(WishProductDTO dto : wishProductLists) {
		 
			  int productNum = dto.getProdNum();
			 
			  Map<String, Object> params = new HashMap<String, Object>();
			
			  params.put("productNum", productNum);
			  
			  if(userNum!=-1) {
				  
				  params.put("userNum", userNum);
				  int checkNum = wishProductDao.checkNum(params);
				  
				  if(checkNum!=0) { 
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
					  dto.setWishCheckNum(1);
				  }else {
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
					  dto.setWishCheckNum(-1); 
				  }
			  }else {
				  dto.setWishCheckNum(userNum);
			  }
			  
		  }
		
		
		request.setAttribute("wishProductLists", wishProductLists);
		request.setAttribute("category", category);
		request.setAttribute("brandName", brandName);
		request.setAttribute("sorting", sorting);
		request.setAttribute("price", price);
		request.setAttribute("mode", mode);
		//request.setAttribute("brandNameList", brandNameList);
		
		return "shop/shopWish";
		
	}
	
	
	@RequestMapping(value = "/wishSave.action", method = {RequestMethod.GET,RequestMethod.POST})			
	public String wishSave(HttpServletRequest request, Model model,RedirectAttributes redirect,HttpSession session) {
		
		String mode = request.getParameter("mode");
		System.out.println(mode);
		String userSize = request.getParameter("userSize");
		String engProduct1 = request.getParameter("engProduct");
		int productNum = Integer.parseInt(request.getParameter("prodNum"));
		
		
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum=-1;
		}else {
			userNum= (Integer) session.getAttribute("userNum");
		}
		//System.out.println("prodNum: "+ productNum);
			
		//db�� ���û�ǰ �ֱ�.
		
		int maxWishNum = wishProductDao.maxWishNum();
		
		//System.out.println(maxWishNum+1);
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("productNum", productNum);
		params.put("userNum", userNum);
		
		int checkNum = wishProductDao.checkNum(params);
		
		//System.out.println("���ü��̺� checkNumȮ��: " + checkNum);
		
		if(checkNum==0) {
			
			params.put("userSize", userSize);
			params.put("engProduct", engProduct1);
			params.put("wishNum", maxWishNum+1);
			params.put("prodNum", productNum);
			params.put("userNum", userNum);
			
			
			wishProductDao.insertData(params);
			
		}else {
			
			wishProductDao.deleteWishProduct(productNum);
			
		}
		
		
		//����
		String category = request.getParameter("category");
		String brandName = request.getParameter("brandName");
		String sorting = request.getParameter("sorting");
		String price = request.getParameter("price");
		//String brandNameList = request.getParameter("brandNameList");
		
		
		redirect.addAttribute("category", category);
		redirect.addAttribute("brandName", brandName);
		redirect.addAttribute("sorting", sorting);
		redirect.addAttribute("price", price);
		//redirect.addAttribute("brandNameList", brandNameList);
		
		if(mode.equals("mainPage")) {
			
			return "redirect:/mainPageList";
		}
		
		//System.out.println("���ü��̺� category ����: " + category + "brandName ����: " + brandName + "sorting ����: " + sorting + "price ����: " + price);
		
		return "redirect:/filterSearch2.action";
		
	}
	
	@RequestMapping(value = "/mainPageList", method = {RequestMethod.GET,RequestMethod.POST})
	public String mainPage(HttpServletRequest request, HttpSession session) {
		
		String more1 = "more1";
		String more2 = "more2";
		
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
		
		//���ϱ� ���� ��
		  for(ShopViewDTO dto : lists) {
		 
			  
			  int prodNum = dto.getProdNum();
			  String engProduct = dto.getEngProduct();
			  
			  Map<String, Object> params = new HashMap<String, Object>();
				
		
			  params.put("engProduct", engProduct);
			  
			  if(userNum!=-1) {
				  
				  params.put("userNum", userNum);
				  int checkNum = shopviewDao.checkNum(params);
				  
				  if(checkNum!=0) { 
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ������
					  dto.setCheckNum(1);
				  }else {
					  //��ġ�ϴ� prodNum�� wish�� ���� ��� - ���
					  dto.setCheckNum(-1); 
				  }
			  }else {
				  dto.setCheckNum(userNum);
			  }
		
		  }
		List<BrandDTO> brandLists = brandDao.getBrandLists();
		
		
		
		
		request.setAttribute("prodImagelists", lists);
		request.setAttribute("brandLists", brandLists);
		
		request.setAttribute("more1", more1);
		request.setAttribute("more2", more2);
		
		return "redirect:/mainPage";
		
	}
	
}
