package com.mvc.kreamy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.dao.BidBuyDAO;
import com.mvc.dao.BidSellDAO;
import com.mvc.dao.ProdDeDAO;
import com.mvc.dto.AddressDTO;
import com.mvc.dto.BidBuyInfoDTO;
import com.mvc.dto.BidDTO;
import com.mvc.dto.BidSellInfoDTO;
import com.mvc.dto.PayInfoDTO;
import com.mvc.dto.ProdInfoDTO;
import com.mvc.dto.ProductsDTO;
import com.mvc.dto.TISizeDTO;
import com.mvc.dto.TradeInfoDTO;
import com.mvc.dto.UserInfoDTO;
import com.mvc.dto.WishSizeDTO;

@Controller("productsController")
public class ProductsController {
	
	@Autowired
	@Qualifier("prodDeDAO")
	ProdDeDAO prodDedao;
	
	@Autowired
	@Qualifier("bidBuyDAO")
	BidBuyDAO bidBuyDAO;
			
	@Autowired
	@Qualifier("bidSellDAO")
	BidSellDAO bidSellDAO;
	
	@RequestMapping(value = "/products",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String products(HttpServletRequest request, HttpSession session ) throws Exception{
						
		int prodNum = Integer.parseInt(request.getParameter("prodNum"));
		int userNum;
		if(session.getAttribute("userNum")==null) {
			userNum = -1;
		}else {
			userNum = (Integer) session.getAttribute("userNum");
		}
		ProdInfoDTO pIdto = prodDedao.getProdInfo(prodNum);
		List<String> sizeLists = prodDedao.getSizeByEngProduct(pIdto.getEngProduct());		
		List<ProductsDTO> productsList = prodDedao.getProdPriceList(sizeLists,pIdto.getEngProduct());
		List<String> imageLists = prodDedao.getTotalImage(pIdto.getEngProduct());		
		String repImage = prodDedao.getRepImage(pIdto.getEngProduct());
		
		
		List<WishSizeDTO> wsLists = prodDedao.getSizeWish(pIdto.getEngProduct(),userNum);
		
		
		int wsc = prodDedao.countUserWish(pIdto.getEngProduct(),userNum);//유저넘 추가
		
		ProductsDTO prodTotdto = prodDedao.getAllProducts(pIdto.getEngProduct());
		
		request.setAttribute("wsc", wsc);
		request.setAttribute("wsLists", wsLists);
		request.setAttribute("prodNum", prodNum);
		request.setAttribute("pIdto", pIdto);
		request.setAttribute("productsList", productsList);
		request.setAttribute("imageLists", imageLists);
		request.setAttribute("repImage", repImage);
		request.setAttribute("sizeLength", sizeLists.size());
		request.setAttribute("sizeLists", sizeLists);
		request.setAttribute("prodTotdto", prodTotdto);
		
		return "products/productDetail";
	}
	
	@RequestMapping(value = "/pDAjax",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String pDAjax(HttpServletRequest request) throws Exception{
		
		String prodSize = request.getParameter("prodSize");
		String engProduct = request.getParameter("engProduct");
		String tot;
		if(prodSize.equals("모든 사이즈")) {
			tot="tot";
		}else {
			tot="";
		}		
		String ob1=request.getParameter("ob1");
		String sort1=request.getParameter("sort1");
		String ob2=request.getParameter("ob2");
		String sort2=request.getParameter("sort2");
		String ob3=request.getParameter("ob3");
		String sort3=request.getParameter("sort3");
				
		List<TISizeDTO> tisizeLists=
				prodDedao.getTrade(engProduct, prodSize, tot, ob1, sort1);
		List<BidDTO> bidsellLists=
				prodDedao.getBidSell(engProduct, prodSize, tot, ob2, sort2);
		List<BidDTO> bidbuyLists=
				prodDedao.getBidBuy(engProduct, prodSize, tot, ob3, sort3);
				
		request.setAttribute("tisizeLists", tisizeLists);
		request.setAttribute("tiLength", tisizeLists.size());
		request.setAttribute("bidbuyLists", bidbuyLists);
		request.setAttribute("bbLength", bidbuyLists.size());
		request.setAttribute("bidsellLists", bidsellLists);
		request.setAttribute("bsLength", bidsellLists.size());
		
		return "products/pDAjax";
	}
	
	@RequestMapping(value = "/wishU",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String s(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		String engProduct = request.getParameter("engProduct");	
		String aD = request.getParameter("aD");
		String prodSize = request.getParameter("prodSize"); 		
	
		if(aD.equals("d")) {
			prodDedao.deleteWish(engProduct, prodSize, userNum);
			
		}else if(aD.equals("a")) {
			prodDedao.insertWish(engProduct, prodSize, userNum);
		}
		
		
		return "";
	}
	
	@RequestMapping(value = "/buy/check",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String buycheck(HttpServletRequest request) throws Exception{
		
		String prodSize = request.getParameter("prodSize");	
		String engProduct = request.getParameter("engProduct");
		
		ProdInfoDTO pIdto = prodDedao.getProdInfo2(engProduct, prodSize);
		List<String> sizeLists = prodDedao.getSizeByEngProduct(pIdto.getEngProduct());
		List<ProductsDTO> productsList = prodDedao.getProdPriceList(sizeLists,pIdto.getEngProduct());
		String repImage = prodDedao.getRepImage(pIdto.getEngProduct());
		
		request.setAttribute("prodSize", prodSize);
		request.setAttribute("pIdto", pIdto);
		request.setAttribute("sizeLists", sizeLists);
		request.setAttribute("productsList", productsList);
		request.setAttribute("repImage", repImage);
		
		return "buy/check";
	}
	
	@RequestMapping(value = "/buy/check2",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String buycheck2(HttpServletRequest request) throws Exception{
		
		String prodSize = request.getParameter("prodSize");	
		String engProduct = request.getParameter("engProduct");
		
		ProdInfoDTO pIdto = prodDedao.getProdInfo2(engProduct, prodSize);
		List<String> sizeLists = prodDedao.getSizeByEngProduct(pIdto.getEngProduct());
		List<ProductsDTO> productsList = prodDedao.getProdPriceList(sizeLists,pIdto.getEngProduct());
		String repImage = prodDedao.getRepImage(pIdto.getEngProduct());
		
		request.setAttribute("prodSize", prodSize);
		request.setAttribute("pIdto", pIdto);
		request.setAttribute("sizeLists", sizeLists);
		request.setAttribute("productsList", productsList);
		request.setAttribute("repImage", repImage);
		
		return "buy/check2";
	}
	
	@RequestMapping(value = "/buy",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String buy(HttpServletRequest request, HttpSession session) throws Exception{
		
		String prodSize = request.getParameter("prodSize");	
		String engProduct = request.getParameter("engProduct");
		int userNum = (Integer) session.getAttribute("userNum");
		List<AddressDTO> addrLists = prodDedao.getMyAddress(userNum);
		List<PayInfoDTO> cardLists = prodDedao.getMyCard(userNum);
		ProdInfoDTO pIdto = prodDedao.getProdInfo2(engProduct, prodSize);		
		String repImage = prodDedao.getRepImage(pIdto.getEngProduct());
		ProductsDTO pbsdto = prodDedao.getProducts(engProduct, prodSize);	
	
		
				
		request.setAttribute("prodSize", prodSize);
		request.setAttribute("pIdto", pIdto);		
		request.setAttribute("repImage", repImage);
		request.setAttribute("pbsdto", pbsdto);
		request.setAttribute("addrLists", addrLists);
		request.setAttribute("cardLists", cardLists);
		if(request.getParameter("bidBuyNum")!=null&&request.getParameter("wishPrice")!=null) {
			int bidBuyNum = Integer.parseInt(request.getParameter("bidBuyNum"));
			int wishPrice = Integer.parseInt(request.getParameter("wishPrice"));
			request.setAttribute("bidBuyNum", bidBuyNum);
			request.setAttribute("wishPrice", wishPrice);
		}
		return "buy/buy";
	}
	
	@RequestMapping(value = "/sell",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String sell(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		String prodSize = request.getParameter("prodSize");	
		String engProduct = request.getParameter("engProduct");
		
		List<AddressDTO> addrLists = prodDedao.getMyAddress(userNum);
		List<PayInfoDTO> cardLists = prodDedao.getMyCard(userNum);
		ProdInfoDTO pIdto = prodDedao.getProdInfo2(engProduct, prodSize);		
		String repImage = prodDedao.getRepImage(pIdto.getEngProduct());
		ProductsDTO pbsdto = prodDedao.getProducts(engProduct, prodSize);		
		UserInfoDTO bankdto = prodDedao.getAccount(userNum);
		
		request.setAttribute("prodSize", prodSize);
		request.setAttribute("pIdto", pIdto);		
		request.setAttribute("repImage", repImage);
		request.setAttribute("pbsdto", pbsdto);
		request.setAttribute("addrLists", addrLists);
		request.setAttribute("cardLists", cardLists);
		request.setAttribute("bankdto", bankdto);
		if(request.getParameter("bidSellNum")!=null&&request.getParameter("wishPrice")!=null) {
			int bidSellNum = Integer.parseInt(request.getParameter("bidSellNum"));
			int wishPrice = Integer.parseInt(request.getParameter("wishPrice"));
			request.setAttribute("bidSellNum", bidSellNum);
			request.setAttribute("wishPrice", wishPrice);
		}
		
		return "buy/sell";
	}
	
	
	
	
	@RequestMapping(value = "/buy/addr",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bsAjax(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");	
		int maxNum = prodDedao.getAddrMaxNum();
		String basic = request.getParameter("basic");
		AddressDTO dto = new AddressDTO();
		List<AddressDTO> addrLists = prodDedao.getMyAddress(userNum);
		
		dto.setAddrNum(maxNum+1);
		dto.setUserNum(userNum);		
		dto.setRecvName(request.getParameter("recvName"));
		String phone = request.getParameter("recvPhone");
		if(phone.length()==10) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 6) + "-" + phone.substring(6);
		}
		if(phone.length()==11) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		}
		dto.setRecvPhone(phone);
		dto.setPostNum(request.getParameter("postNum"));
		dto.setAddr1(request.getParameter("addr1"));
		dto.setAddr2(request.getParameter("addr2"));
				
		if(addrLists.size()==0) {
			dto.setAddrBasic("yes");			
		}else{
			if(basic.equals("yes")) {
				prodDedao.updateFAddrB(userNum);
				dto.setAddrBasic("yes");
			}else {
				dto.setAddrBasic("no");
			}			
		}
		prodDedao.insertAddress(dto);
		addrLists = prodDedao.getMyAddress(userNum);
		request.setAttribute("addrLists", addrLists);
		
		return "buy/addr";
	}
	
	@RequestMapping(value = "/buy/card",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String cardAjax(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		String tp = request.getParameter("tp");
		
		String card1 = request.getParameter("card1");
		String card2 = request.getParameter("card2");
		String card3 = request.getParameter("card3");
		String card4 = request.getParameter("card4");
		String jumin = request.getParameter("jumin");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String bank = request.getParameter("bank");		
		String card = card1 + "-" + card2 + "-" + card3 + "-" + card4;
		List<PayInfoDTO> cardLists = prodDedao.getMyCard(userNum);
		PayInfoDTO dto = new PayInfoDTO();	
		dto.setUserNum(userNum);
		dto.setCardNum(card);
		dto.setValidMonth(month);
		dto.setValidYear(year);
		dto.setBirthDate(jumin);
		dto.setBank(bank);
		
		if(cardLists.size()==0) {
			dto.setPayBasic("yes");			
		}else{
			dto.setPayBasic("no");		
		}
		prodDedao.insertCard(dto);
		cardLists = prodDedao.getMyCard(userNum);
		
		request.setAttribute("cardLists", cardLists);
		request.setAttribute("tp", tp);
		
		return "buy/card";
	}
	
	@RequestMapping(value = "/buy/bank",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String gs(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		String holder = request.getParameter("holder");
		prodDedao.updateBank(bank, account, holder, userNum);		
		
		UserInfoDTO bankdto = prodDedao.getAccount(userNum);
		
		request.setAttribute("bankdto", bankdto);
		
		return "buy/bank";
	}
	@RequestMapping(value = "/buy/bidbuy",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bb(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		int productNum = Integer.parseInt(request.getParameter("productNum"));//pIdto에있다.
		int wishPrice = Integer.parseInt(request.getParameter("wishPrice"));
		int vd = Integer.parseInt(request.getParameter("vd"));		
		int totPayment = Integer.parseInt(request.getParameter("totPayment"));
		String recvName = request.getParameter("recvName");
		String recvPhone = request.getParameter("recvPhone");
		String postNum = request.getParameter("postNum");
		System.out.println("이다음게 비드바이넘");
		System.out.println(request.getParameter("bidBuyNum"));
		if(request.getParameter("bidBuyNum")==null) {			
			System.out.println("널값임");
		}
		if(request.getParameter("bidBuyNum").equals(" ")) {			
			System.out.println("널232");
		}
		if(request.getParameter("bidBuyNum")!=null&&(!request.getParameter("bidBuyNum").equals(""))) {		
			System.out.println("널아님");
			int bidBuyNum = Integer.parseInt(request.getParameter("bidBuyNum"));			
			bidBuyDAO.deleteData(bidBuyNum);
		}
		
		
		int addrNum=prodDedao.getAddrNum(recvName, recvPhone, postNum, userNum);
						
		BidBuyInfoDTO dto = new BidBuyInfoDTO();
		dto.setUserNum(userNum);
		dto.setProductNum(productNum);
		dto.setBidBuyWishPrice(wishPrice);
		dto.setVd(vd);
		dto.setAddrNum(addrNum);
		dto.setTotPayment(totPayment);
		
		prodDedao.insertBidBuy(dto);		
		
		int bidNum = prodDedao.getBidBuyNum(userNum);	
		
		request.setAttribute("bidNum", bidNum);		
		return "buy/bidNum";
	}
	@RequestMapping(value = "/buy/bidsell",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bs(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		int productNum = Integer.parseInt(request.getParameter("productNum"));//pIdto에있다.
		int wishPrice = Integer.parseInt(request.getParameter("wishPrice"));
		int vd = Integer.parseInt(request.getParameter("vd"));		
		String recvName = request.getParameter("recvName");
		String recvPhone = request.getParameter("recvPhone");
		String postNum = request.getParameter("postNum");
		
		int addrNum=prodDedao.getAddrNum(recvName, recvPhone, postNum, userNum);
						
		BidSellInfoDTO dto = new BidSellInfoDTO();
		dto.setUserNum(userNum);
		dto.setProductNum(productNum);
		dto.setBidSellWishPrice(wishPrice);
		dto.setVd(vd);
		dto.setAddrNum(addrNum);
		if(request.getParameter("bidSellNum")!=null&&(!request.getParameter("bidSellNum").equals(""))) {
			int bidSellNum = Integer.parseInt(request.getParameter("bidSellNum"));
			bidSellDAO.deleteData(bidSellNum);
			
		}
		
		prodDedao.insertBidSell(dto);		
		int bidNum = prodDedao.getBidSellNum(userNum);		
		request.setAttribute("bidNum", bidNum);
		return "buy/bidNum";
	}
			
	
	@RequestMapping(value = "/buy/buyI",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bi(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		TradeInfoDTO tdto = new TradeInfoDTO();
		int productNum = Integer.parseInt(request.getParameter("productNum"));//pIdto에있다.		
		BidSellInfoDTO bdto = prodDedao.getISellIf(productNum);
		
				
		String recvName = request.getParameter("recvName");
		String recvPhone = request.getParameter("recvPhone");
		String postNum = request.getParameter("postNum");
		
		int addrNum=prodDedao.getAddrNum(recvName, recvPhone, postNum, userNum);
		
		tdto.setProductNum(productNum);
		tdto.setSellUserNum(bdto.getUserNum());
		tdto.setBuyUserNum(userNum);
		tdto.setTradePrice(bdto.getBidSellWishPrice());
		tdto.setBuyAddrNum(addrNum);
		tdto.setSellAddrNum(bdto.getAddrNum());		
		
		prodDedao.insertTradeInfo(tdto);
		prodDedao.deleteSellTE(bdto.getBidSellNum());	
		
		request.setAttribute("bidNum", prodDedao.getTradeNumB(userNum));
		
		return "buy/bidNum";
	}
	
	@RequestMapping(value = "/buy/sellI",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String si(HttpServletRequest request, HttpSession session) throws Exception{
		
		int userNum = (Integer) session.getAttribute("userNum");
		TradeInfoDTO tdto = new TradeInfoDTO();
		int productNum = Integer.parseInt(request.getParameter("productNum"));//pIdto에있다.		
		BidBuyInfoDTO bdto = prodDedao.getIBuyIf(productNum);
		
				
		String recvName = request.getParameter("recvName");
		String recvPhone = request.getParameter("recvPhone");
		String postNum = request.getParameter("postNum");
		
		int addrNum=prodDedao.getAddrNum(recvName, recvPhone, postNum, userNum);
		
		tdto.setProductNum(productNum);
		tdto.setSellUserNum(userNum);
		tdto.setBuyUserNum(bdto.getUserNum());
		tdto.setTradePrice(bdto.getBidBuyWishPrice());
		tdto.setBuyAddrNum(bdto.getAddrNum());
		tdto.setSellAddrNum(addrNum);		
				
		
		prodDedao.insertTradeInfo(tdto);
		prodDedao.deleteBuyTE(bdto.getBidBuyNum());	
		System.out.println("확인1");
		request.setAttribute("bidNum", prodDedao.getTradeNumS(userNum));
		System.out.println(prodDedao.getTradeNumS(userNum));
		return "buy/bidNum";
	}
	
	@RequestMapping(value = "/0401_notice", method = RequestMethod.GET)
	public String prod0401() {
		return "products/0401_notice";
	}	
	
}
