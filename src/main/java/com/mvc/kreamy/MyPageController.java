package com.mvc.kreamy;

import com.mvc.dao.*;
import com.mvc.dto.*;
import com.mvc.util.MyUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MyPageController
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
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	MyUtil myUtil = new MyUtil();
	
	
	@RequestMapping(value = "/myPage",method = {RequestMethod.GET,RequestMethod.POST})
    public String myPage(HttpServletRequest request, HttpSession session)
    {
		if(session.getAttribute("userNum")==null) {
			session.setAttribute("nextUrl", "myPage");
			return "redirect:login";
		}
        int userNum = (Integer) session.getAttribute("userNum");
        Map<String, Object> hMap = new HashMap<String, Object>();
        hMap.put("userNum", userNum);
        
        MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
        List<BASDTO> buyLists = new ArrayList<BASDTO>();
        List<BidBuyDTO> bidBuyLists = bidBuyDAO.getBuyLists(userNum); 
        int bidBuyCount = bidBuyLists.size();
        List<BASDTO> sellLists = new ArrayList<BASDTO>();
        List<BidSellDTO> bidSellLists = bidSellDAO.getSellLists(userNum); 
        int bidSellCount = bidSellLists.size();
        
        hMap.put("mode", "trade");
        List<TradeDTO> tradeBuyLists = tradeDAO.getBuyTradeLists(hMap);
        int tradeBuyCount = tradeBuyLists.size();
        List<TradeDTO> tradeSellLists = tradeDAO.getSellTradeLists(hMap);
        int tradeSellCount = tradeSellLists.size();
        
        hMap.replace("mode", "end");
        List<TradeDTO> endBuyLists = tradeDAO.getBuyTradeLists(hMap);
        int endBuyCount = endBuyLists.size();
        List<TradeDTO> endSellLists = tradeDAO.getSellTradeLists(hMap);
        int endSellCount = endSellLists.size();
        
        BASDTO buyDTO;
        Iterator<BidBuyDTO> bidBuyIt = bidBuyLists.iterator();
        while(bidBuyIt.hasNext()){
        	
            BidBuyDTO bbDTO = bidBuyIt.next();
            buyDTO = new BASDTO();
            buyDTO.setEngProduct(bbDTO.getEngProduct());
            buyDTO.setImageName(bbDTO.getImageName());
            buyDTO.setSize(bbDTO.getUserSize());
            buyDTO.setState(bbDTO.getBidBuyState());
            buyDTO.setBASNum(bbDTO.getBidBuyNum());
            buyDTO.setMode("bidBuyDetail");
            
            buyLists.add(buyDTO);
        }
        
        Iterator<TradeDTO> tradeBuyIt = tradeBuyLists.iterator();
        while(tradeBuyIt.hasNext()) {
        	
        	TradeDTO tDTO = tradeBuyIt.next();
        	buyDTO = new BASDTO();
        	buyDTO.setEngProduct(tDTO.getEngProduct());
        	buyDTO.setImageName(tDTO.getImageName());
            buyDTO.setSize(tDTO.getUserSize());
            buyDTO.setState(tDTO.getTradeBuyState());
            buyDTO.setBASNum(tDTO.getTradeNum());
            buyDTO.setMode("tradeBuyDetail");
            
            buyLists.add(buyDTO);
        }
        
        Iterator<TradeDTO> endBuyIt = endBuyLists.iterator();
        while(endBuyIt.hasNext()) {
        	
        	TradeDTO eDTO = endBuyIt.next();
        	buyDTO = new BASDTO();
        	buyDTO.setEngProduct(eDTO.getEngProduct());
        	buyDTO.setImageName(eDTO.getImageName());
        	buyDTO.setSize(eDTO.getUserSize());
        	buyDTO.setState(eDTO.getTradeBuyState());
            buyDTO.setBASNum(eDTO.getTradeNum());
            buyDTO.setMode("endBuyDetail");
            
        	buyLists.add(buyDTO);
        }

        BASDTO sellDTO;
        Iterator<BidSellDTO> bidSellIt = bidSellLists.iterator(); 
        while(bidSellIt.hasNext()) {
        
            BidSellDTO bsDTO = bidSellIt.next();
            sellDTO = new BASDTO();
            sellDTO.setEngProduct(bsDTO.getEngProduct());
            sellDTO.setImageName(bsDTO.getImageName());
            sellDTO.setSize(bsDTO.getUserSize());
            sellDTO.setState(bsDTO.getBidSellState());
            sellDTO.setBASNum(bsDTO.getBidSellNum());
            sellDTO.setMode("bidSellDetail");
            
        	sellLists.add(sellDTO);
        
        }
        Iterator<TradeDTO> tradeSellIt = tradeSellLists.iterator();
        while(tradeSellIt.hasNext()) {
        	
        	TradeDTO tDTO = tradeSellIt.next();
        	sellDTO = new BASDTO();
        	sellDTO.setEngProduct(tDTO.getEngProduct());
        	sellDTO.setImageName(tDTO.getImageName());
        	sellDTO.setSize(tDTO.getUserSize());
        	sellDTO.setState(tDTO.getTradeSellState());
        	sellDTO.setBASNum(tDTO.getTradeNum());
            sellDTO.setMode("tradeSellDetail");
            
            sellLists.add(sellDTO);
        }
        
        Iterator<TradeDTO> endSellIt = endSellLists.iterator();
        while(endSellIt.hasNext()) {
        	
        	TradeDTO eDTO = endSellIt.next();
        	sellDTO = new BASDTO();
        	sellDTO.setEngProduct(eDTO.getEngProduct());
        	sellDTO.setImageName(eDTO.getImageName());
        	sellDTO.setSize(eDTO.getUserSize());
        	sellDTO.setState(eDTO.getTradeSellState());
        	sellDTO.setBASNum(eDTO.getTradeNum());
            sellDTO.setMode("endSellDetail");
            
        	sellLists.add(sellDTO);
        }
        
        int point = myPageDAO.getPoint(userNum);
        int validPoint = myPageDAO.getValidPoint(userNum);

        request.setAttribute("point", point);
        request.setAttribute("validPoint", validPoint);
        request.setAttribute("buyLists", buyLists);
        request.setAttribute("bidBuyCount", bidBuyCount);
        request.setAttribute("tradeBuyCount", tradeBuyCount);
        request.setAttribute("endBuyCount", endBuyCount);
        request.setAttribute("sellLists", sellLists);
        request.setAttribute("bidSellCount", bidSellCount);
        request.setAttribute("tradeSellCount", tradeSellCount);
        request.setAttribute("endSellCount", endSellCount);
        request.setAttribute("myPageDTO", myPageDTO);
        
       
        return "myPage/myPage";
    }

	@RequestMapping(value = "/myPageWish",method = {RequestMethod.GET,RequestMethod.POST})
    public String myPageWish(HttpServletRequest request, HttpSession session)
    {
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		int userNum = (Integer) session.getAttribute("userNum");
        List<WishDTO> wishList = wishDAO.getLists(userNum);
        Iterator<WishDTO> it = wishList.iterator();
        List<WishDTO> wishLists = new ArrayList<WishDTO>();

        while(it.hasNext()) {
            WishDTO wishDTO = it.next();
            if(wishDTO.getMinBidSellWishPrice() == -1)
                wishDTO.setMinPrice("-");
            else
            	wishDTO.setMinPrice(formatter.format(wishDTO.getMinBidSellWishPrice())+"원");

        	wishLists.add(wishDTO);
        }

		request.setAttribute("wishLists", wishLists);
        return "myPage/myPageWish";
    }
	
	@RequestMapping(value = "/deleteWish",method = {RequestMethod.GET,RequestMethod.POST})
    public String deleteWish(HttpServletRequest request)
    {
		int wishNum = Integer.parseInt(request.getParameter("wishNum"));
		wishDAO.deleteData(wishNum);
		return "redirect:myPageWish";
    }
	
	@RequestMapping(value = "/buying",method = {RequestMethod.GET,RequestMethod.POST})
	public String buying(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		Map<String, Object> hMap = new HashMap<String, Object>();   
        hMap.put("userNum", userNum);
        List<BidBuyDTO> bidBuyLists = bidBuyDAO.getBuyLists(userNum);
        int bidBuyCount = bidBuyLists.size();
        
        hMap.put("mode", "trade");
        List<TradeDTO> tradeBuyLists = tradeDAO.getBuyTradeLists(hMap);
        int tradeBuyCount = tradeBuyLists.size();
        
        hMap.replace("mode", "end");
        List<TradeDTO> endBuyLists = tradeDAO.getBuyTradeLists(hMap);
        int endBuyCount = endBuyLists.size();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        String today = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -1);
        String oneMonthAgo = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -2);
        String threeMonthAgo = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -3);
        String sixMonthAgo = sdf.format(calendar.getTime());

        String tab;
        if(request.getParameter("tab")==null || request.getParameter("tab").equals("")) {
        	tab = "bid";
        }else {
        	tab = request.getParameter("tab");
		}
        
        request.setAttribute("tab", tab);
        request.setAttribute("today", today);
        request.setAttribute("oneMonthAgo", oneMonthAgo);
        request.setAttribute("threeMonthAgo", threeMonthAgo);
        request.setAttribute("sixMonthAgo", sixMonthAgo);
        request.setAttribute("bidBuyCount", bidBuyCount);
        request.setAttribute("tradeBuyCount", tradeBuyCount);
        request.setAttribute("endBuyCount", endBuyCount);
        
		return "myPage/buying";
	}
	
	@RequestMapping(value = "/buyList",method = {RequestMethod.GET,RequestMethod.POST})
	public String buyList(HttpServletRequest request, HttpSession session)
	{
		DecimalFormat formatter = new DecimalFormat("###,###");
		int userNum = (Integer) session.getAttribute("userNum");
        String sort;
        if(request.getParameter("sort")==null || request.getParameter("sort").equals("")) {
        	sort = "noraml";
        }else {
			sort = request.getParameter("sort");
		}
        
        String state = request.getParameter("state");
        String mode = request.getParameter("mode");    
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        Map<String, Object> hMap = new HashMap<String, Object>();   
        hMap.put("userNum", userNum);
        hMap.put("sort", sort);
        hMap.put("state", state);
        hMap.put("mode", mode);
        hMap.put("startDate", startDate);
        hMap.put("endDate", endDate);
        List<BASDTO> buyLists = new ArrayList<BASDTO>();
        List<BidBuyDTO> bidBuyLists = bidBuyDAO.getFilterBuyLists(hMap);
        BASDTO buyDTO;
        Iterator<BidBuyDTO> bidBuyIt = bidBuyLists.iterator();
        while(bidBuyIt.hasNext()){
        	
            BidBuyDTO bbDTO = bidBuyIt.next();
            buyDTO = new BASDTO();
            buyDTO.setBASNum(bbDTO.getBidBuyNum());
            buyDTO.setEngProduct(bbDTO.getEngProduct());
            buyDTO.setImageName(bbDTO.getImageName());
            buyDTO.setSize(bbDTO.getUserSize());
            buyDTO.setState(bbDTO.getBidBuyState());
            buyDTO.setWishPrice(formatter.format(bbDTO.getBidBuyWishPrice())+"원");
            buyDTO.setValidDate(bbDTO.getBidBuyValidDate());
            
            buyLists.add(buyDTO);
        }
        System.out.println(mode);
        List<TradeDTO> tradeBuyLists = tradeDAO.getFilterBuyTradeLists(hMap);
        System.out.println(tradeBuyLists.size());
        request.setAttribute("buyLists", buyLists);
        request.setAttribute("tradeBuyLists", tradeBuyLists);
        request.setAttribute("sort", sort);
        request.setAttribute("mode", mode);
		return "myPage/buyList";
	}

	@RequestMapping(value = "/selling",method = {RequestMethod.GET,RequestMethod.POST})
    public String selling(HttpServletRequest request, HttpSession session)
    {
		int userNum = (Integer) session.getAttribute("userNum");
		Map<String, Object> hMap = new HashMap<String, Object>();   
        hMap.put("userNum", userNum);
        List<BidSellDTO> bidSellLists = bidSellDAO.getSellLists(userNum);
        int bidSellCount = bidSellLists.size();
        
        hMap.put("mode", "trade");
        List<TradeDTO> tradeSellLists = tradeDAO.getSellTradeLists(hMap);
        int tradeSellCount = tradeSellLists.size();
        
        hMap.replace("mode", "end");
        List<TradeDTO> endSellLists = tradeDAO.getSellTradeLists(hMap);
        int endSellCount = endSellLists.size();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        String today = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -1);
        String oneMonthAgo = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -2);
        String threeMonthAgo = sdf.format(calendar.getTime());
        calendar.add(Calendar.MONTH , -3);
        String sixMonthAgo = sdf.format(calendar.getTime());

        String tab;
        if(request.getParameter("tab")==null || request.getParameter("tab").equals("")) {
        	tab = "bid";
        }else {
        	tab = request.getParameter("tab");
		}
        
        request.setAttribute("tab", tab);
        request.setAttribute("today", today);
        request.setAttribute("oneMonthAgo", oneMonthAgo);
        request.setAttribute("threeMonthAgo", threeMonthAgo);
        request.setAttribute("sixMonthAgo", sixMonthAgo);
        request.setAttribute("bidSellCount", bidSellCount);
        request.setAttribute("tradeSellCount", tradeSellCount);
        request.setAttribute("endSellCount", endSellCount);
		
        return "myPage/selling";
    }

	@RequestMapping(value = "/sellList",method = {RequestMethod.GET,RequestMethod.POST})
	public String sellList(HttpServletRequest request, HttpSession session)
	{
		DecimalFormat formatter = new DecimalFormat("###,###");
		int userNum = (Integer) session.getAttribute("userNum");
        String sort;
        if(request.getParameter("sort")==null || request.getParameter("sort").equals("")) {
        	sort = "noraml";
        }else {
			sort = request.getParameter("sort");
		}
        
        String state = request.getParameter("state");
        String mode = request.getParameter("mode");    
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        Map<String, Object> hMap = new HashMap<String, Object>();   
        hMap.put("userNum", userNum);
        hMap.put("sort", sort);
        hMap.put("state", state);
        hMap.put("mode", mode);
        hMap.put("startDate", startDate);
        hMap.put("endDate", endDate);
        List<BASDTO> sellLists = new ArrayList<BASDTO>();
        List<BidSellDTO> bidSellLists = bidSellDAO.getFilterSellLists(hMap);
        int bidSellCount = bidSellLists.size();
        BASDTO sellDTO;
        Iterator<BidSellDTO> bidSellIt = bidSellLists.iterator();
        while(bidSellIt.hasNext()){
        	
            BidSellDTO bsDTO = bidSellIt.next();
            sellDTO = new BASDTO();
            sellDTO.setBASNum(bsDTO.getBidSellNum());
            sellDTO.setEngProduct(bsDTO.getEngProduct());
            sellDTO.setImageName(bsDTO.getImageName());
            sellDTO.setSize(bsDTO.getUserSize());
            sellDTO.setState(bsDTO.getBidSellState());
            sellDTO.setWishPrice(formatter.format(bsDTO.getBidSellWishPrice())+"원");
            sellDTO.setValidDate(bsDTO.getBidSellValidDate());
            
            sellLists.add(sellDTO);
        }
        
        List<TradeDTO> tradeSellLists = tradeDAO.getFilterSellTradeLists(hMap);
        
        request.setAttribute("sellLists", sellLists);
        request.setAttribute("tradeSellLists", tradeSellLists);
        request.setAttribute("sort", sort);
        request.setAttribute("mode", mode);
		return "myPage/sellList";
	}

	@RequestMapping(value = "/wish",method = {RequestMethod.GET,RequestMethod.POST})
    public String wish(HttpServletRequest request, HttpSession session)
    {
		if(session.getAttribute("userNum")==null) {
			session.setAttribute("nextUrl", "wish");
			return "redirect:login";
		}
		
        DecimalFormat formatter = new DecimalFormat("###,###");
        int userNum = (Integer) session.getAttribute("userNum");
        List<WishDTO> wishList = wishDAO.getLists(userNum);
        Iterator<WishDTO> it = wishList.iterator();
        List<WishDTO> wishLists = new ArrayList<WishDTO>();

        while(it.hasNext()) {
            WishDTO wishDTO = it.next();
            if(wishDTO.getMinBidSellWishPrice() == -1)
                wishDTO.setMinPrice("-");
            else
            	wishDTO.setMinPrice(formatter.format(wishDTO.getMinBidSellWishPrice())+"원");

        	wishLists.add(wishDTO);
        }

        request.setAttribute("wishLists", wishLists);
        return "myPage/wish";
    }

	@RequestMapping(value = "/wishList",method = {RequestMethod.GET,RequestMethod.POST})
    public String wishList(HttpServletRequest request, HttpSession session)
    {
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		int userNum = (Integer) session.getAttribute("userNum");
        List<WishDTO> wishList = wishDAO.getLists(userNum);
        Iterator<WishDTO> it = wishList.iterator();
        List<WishDTO> wishLists = new ArrayList<WishDTO>();
        WishDTO wishDTO;
        while(it.hasNext()){
            wishDTO = it.next();
            if(wishDTO.getMinBidSellWishPrice() == -1)
                wishDTO.setMinPrice("-");
            else
                wishDTO.setMinPrice(formatter.format(wishDTO.getMinBidSellWishPrice())+"원");
            
            wishLists.add(wishDTO);
        }

		request.setAttribute("wishLists", wishLists);
        return "myPage/wishList";
    }
	
	@RequestMapping(value = "/deleteWishList",method = {RequestMethod.GET,RequestMethod.POST})
    public String deleteWishList(HttpServletRequest request)
    {
		int wishNum = Integer.parseInt(request.getParameter("wishNum"));
		wishDAO.deleteData(wishNum);
		return "redirect:wishList";
    }
	
	@RequestMapping(value = "/deleteUser",method = {RequestMethod.GET,RequestMethod.POST})
	public void deleteUser(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		myPageDAO.deleteUser(userNum);
		
		session.invalidate();
	}
	
	
	
	@RequestMapping(value = "/profile",method = {RequestMethod.GET,RequestMethod.POST})
    public String profile(HttpServletRequest request)
    {
        return "myPage/profile";
    }
	
	@RequestMapping(value = "/profileContent",method = {RequestMethod.GET,RequestMethod.POST})
	public String profileContent(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
		request.setAttribute("myPageDTO", myPageDTO);
		return "myPage/profileContent";
	}

	@RequestMapping(value = "/address",method = {RequestMethod.GET,RequestMethod.POST})
    public String address()
    {
        return "myPage/address";
    }
	@RequestMapping(value = "/addrList",method = {RequestMethod.GET,RequestMethod.POST})
	public String addrList(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		List<AddrDTO> addrList = addrDAO.getLists(userNum);
		List<AddrDTO> addrLists = new ArrayList<AddrDTO>();
		
		List<BidBuyDTO> bidLists = bidBuyDAO.getLists(userNum);
		List<BidSellDTO> sellLists = bidSellDAO.getLists(userNum);
		
		Iterator<AddrDTO> addrIt = addrList.iterator();
		while(addrIt.hasNext()) {
			
			AddrDTO aDTO = addrIt.next();
			boolean flag1 = false;
			boolean flag2 = false;
			Iterator<BidBuyDTO> bidIt = bidLists.iterator();
			while(bidIt.hasNext()) {
				BidBuyDTO bDTO = bidIt.next();
				if(aDTO.getAddrNum()==bDTO.getAddrNum()) {
					flag1 = true;
					break;
				}
			}
			Iterator<BidSellDTO> sellIt = sellLists.iterator();
			while(sellIt.hasNext()) {
				BidSellDTO sDTO = sellIt.next();
				if(aDTO.getAddrNum()==sDTO.getAddrNum()) {
					flag2 = true;
					break;
				}
			}
			if(flag1||flag2) {
				aDTO.setUsing("yes");
			}else {
				aDTO.setUsing("no");
			}
			addrLists.add(aDTO);
		}
		
		
		request.setAttribute("addrLists", addrLists);
		return "myPage/addrList";
	}

	@RequestMapping(value = "/saveAddr",method = {RequestMethod.GET,RequestMethod.POST})
	public String saveAddr(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		AddrDTO addrDTO = new AddrDTO();
		
		int countAddr = addrDAO.getDataCount(userNum);
		
		String phone = request.getParameter("phone");
		if(phone.length()==10) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 6) + "-" + phone.substring(6);
		}
		if(phone.length()==11) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		}
		
		addrDTO.setAddrNum(addrDAO.maxNum()+1);
		addrDTO.setUserNum(userNum);
		addrDTO.setRecvName(request.getParameter("name"));
		addrDTO.setRecvPhone(phone);
		addrDTO.setPostNum(request.getParameter("zipcode"));
		addrDTO.setAddr1(request.getParameter("addr"));
		addrDTO.setAddr2(request.getParameter("detail"));
		if(countAddr==0) {
			addrDTO.setAddrBasic("yes");
		}else {
			addrDTO.setAddrBasic(request.getParameter("basic"));
		}
		
		if(addrDTO.getAddrBasic().equals("yes")) {
			addrDAO.allNotBasic();
		}
		addrDAO.insertData(addrDTO);
		
		return "redirect:addrList";
		
	}
	
	@RequestMapping(value = "/updateAddr",method = {RequestMethod.GET,RequestMethod.POST})
	public String updateAddr(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		AddrDTO addrDTO = new AddrDTO();
		String phone = request.getParameter("phone");
		if(phone.length()==10) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 6) + "-" + phone.substring(6);
		}
		if(phone.length()==11) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		}
		
		addrDTO.setAddrNum(Integer.parseInt(request.getParameter("addrNum")));
		addrDTO.setUserNum(userNum);
		addrDTO.setRecvName(request.getParameter("name"));
		addrDTO.setRecvPhone(phone);
		addrDTO.setPostNum(request.getParameter("zipcode"));
		addrDTO.setAddr1(request.getParameter("addr"));
		addrDTO.setAddr2(request.getParameter("detail"));
		addrDTO.setAddrBasic(request.getParameter("basic"));
		if(addrDTO.getAddrBasic().equals("yes")) {
			addrDAO.allNotBasic();
		}
		addrDAO.updateData(addrDTO);
		
		return "redirect:addrList";
		
	}
	
	@RequestMapping(value = "/deleteAddr",method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteAddr(HttpServletRequest request)
	{
		int addrNum = Integer.parseInt(request.getParameter("addrNum"));
		addrDAO.deleteData(addrNum);
		
		return "redirect:addrList";
	}
	
	@RequestMapping(value = "/changeBasicAddr",method = {RequestMethod.GET,RequestMethod.POST})
	public String changeBasicAddr(HttpServletRequest request)
	{
		int addrNum = Integer.parseInt(request.getParameter("addrNum"));
		
		addrDAO.allNotBasic();
		addrDAO.changeBasic(addrNum);
		
		return "redirect:addrList";
	}
	
	
	@RequestMapping(value = "/payment",method = {RequestMethod.GET,RequestMethod.POST})
    public String payment()
    {
        return "myPage/payment";
    }

	@RequestMapping(value = "/cardList",method = {RequestMethod.GET,RequestMethod.POST})
	public String cardList(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");
		PaymentDTO basicDTO = paymentDAO.getBasicData(userNum);
		List<PaymentDTO> payLists = paymentDAO.getLists(userNum);
		int countPay = paymentDAO.getDataCount(userNum);
		
		request.setAttribute("countPay", countPay);
		request.setAttribute("basicDTO", basicDTO);
		request.setAttribute("payLists", payLists);
		return "myPage/cardList";
	}

	@RequestMapping(value = "/savePay",method = {RequestMethod.GET,RequestMethod.POST})
	public String savePay(HttpServletRequest request, HttpSession session)
	{
		int userNum = (Integer) session.getAttribute("userNum");	
		PaymentDTO payDTO = new PaymentDTO();
		
		int countPay = paymentDAO.getDataCount(userNum);
		
		String cardNum = request.getParameter("card1")+"-"+request.getParameter("card2")+"-"+request.getParameter("card3")+"-"
						+request.getParameter("card4");
		
		payDTO.setPayNum(paymentDAO.maxNum()+1);
		payDTO.setUserNum(userNum);
		payDTO.setCardNum(cardNum);
		payDTO.setValidMonth(request.getParameter("month"));
		payDTO.setValidYear(request.getParameter("year"));
		payDTO.setBirthDate(request.getParameter("jumin"));
		payDTO.setBank(request.getParameter("bank"));
		
		if(countPay==0) {
			payDTO.setPayBasic("yes");
		}else {
			payDTO.setPayBasic("no");
		}
		
		paymentDAO.insertData(payDTO);
		
		return "redirect:cardList";
		
	}
	
	@RequestMapping(value = "/deletePay",method = {RequestMethod.GET,RequestMethod.POST})
	public String deletePay(HttpServletRequest request)
	{
		int payNum = Integer.parseInt(request.getParameter("payNum"));
		paymentDAO.deleteData(payNum);
		
		return "redirect:cardList";
	}
	
	@RequestMapping(value = "/changeBasicPay",method = {RequestMethod.GET,RequestMethod.POST})
	public String changeBasicPay(HttpServletRequest request)
	{
		int payNum = Integer.parseInt(request.getParameter("payNum"));
		
		paymentDAO.allNotBasic();
		paymentDAO.changeBasic(payNum);
		
		return "redirect:cardList";
	}
	
	@RequestMapping(value = "/account",method = {RequestMethod.GET,RequestMethod.POST})
    public String account(HttpServletRequest request, HttpSession session)
    {
		int userNum = (Integer) session.getAttribute("userNum");
		MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
        request.setAttribute("myPageDTO", myPageDTO);
        return "myPage/account";
    }
	
	@RequestMapping(value = "/saveAccount",method = {RequestMethod.GET,RequestMethod.POST})
	public void saveAccount(HttpServletRequest request, HttpSession session)
	{
		
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		String holder = request.getParameter("holder");
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		hMap.put("userNum", userNum);
		hMap.put("bank", bank);
		hMap.put("account", account);
		hMap.put("holder", holder);
		
		myPageDAO.updateAccount(hMap);
		
	}
	
	@RequestMapping(value = "/savePwd",method = {RequestMethod.GET,RequestMethod.POST})
	public String savePwd(HttpServletRequest request, HttpSession session){
		
		String newPwd = request.getParameter("newPwd");
		newPwd = bcryptPasswordEncoder.encode(newPwd);
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		hMap.put("userNum", userNum);
		hMap.put("newPwd", newPwd);
		
		myPageDAO.updatePwd(hMap);
		return "redirect:profileContent";
	}
	
	@RequestMapping(value = "/saveName",method = {RequestMethod.GET,RequestMethod.POST})
	public String saveName(HttpServletRequest request, HttpSession session){
		
		String newName = request.getParameter("newName");
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		hMap.put("userNum", userNum);
		hMap.put("newName", newName);
		
		myPageDAO.updateName(hMap);
		return "redirect:profileContent";
	}
	
	@RequestMapping(value = "/saveSize",method = {RequestMethod.GET,RequestMethod.POST})
	public String saveSize(HttpServletRequest request, HttpSession session){
		
		int size = Integer.parseInt(request.getParameter("size"));
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		hMap.put("userNum", userNum);
		hMap.put("size", size);
		
		myPageDAO.updateSize(hMap);
		return "redirect:profileContent";
	}

	@RequestMapping(value = "/adUpdate",method = {RequestMethod.GET,RequestMethod.POST})
    public void adUpdate(HttpServletRequest request, HttpSession session){
		
		String adData = request.getParameter("adData");
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		hMap.put("userNum", userNum);
		hMap.put("adData", adData);
		
		myPageDAO.updateAdData(hMap);
    }
	
	@RequestMapping(value = "/profileDefault",method = {RequestMethod.GET,RequestMethod.POST})
	public String profileDefault(HttpServletRequest request, HttpSession session){	
		
		int userNum = (Integer) session.getAttribute("userNum");
		String filePath = "c://image/"+myPageDAO.getReadData(userNum).getProfileImage();
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
		String image = request.getParameter("data");
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("userNum", userNum);
		hMap.put("image", image);
		myPageDAO.updateImage(hMap);
		
		return "redirect:profileContent";
	}
	
	@RequestMapping(value = "/imageUpload",method = {RequestMethod.GET,RequestMethod.POST})
	public String fileUpload(MultipartHttpServletRequest request, HttpServletRequest req, HttpSession session){

		int userNum = (Integer) session.getAttribute("userNum");
		String oldName = myPageDAO.getReadData(userNum).getProfileImage();
		if(!oldName.equals("blank_profile.png")) {
			String filePath = "c://image/"+ oldName;
			File preImage = new File(filePath);
			if(preImage.exists()) {
				preImage.delete();
			}
		}
		String path = "C://image";
		
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
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		
		hMap.put("userNum", userNum);
		hMap.put("image", newFileName);
		
		
		myPageDAO.updateImage(hMap);
		
		return "redirect:profileContent";
		
	}

	@RequestMapping(value = "/withdrawal",method = {RequestMethod.GET,RequestMethod.POST})
    public String withdrawal(){
        return "myPage/withdrawal";
    }
	@RequestMapping(value = "/bidBuyUpdate",method = {RequestMethod.GET,RequestMethod.POST})
	public String bidBuyUpdate(HttpServletRequest request, HttpSession session){
		
		int bidBuyNum = Integer.parseInt(request.getParameter("bidBuyNum"));
		int wishPrice = Integer.parseInt(request.getParameter("wishPrice"));
		
		
		
		return "redirect/bidBuyDetail";
	}
	
	@RequestMapping(value = "/bidBuyDetail",method = {RequestMethod.GET,RequestMethod.POST})
	public String bidBuyDetail(HttpServletRequest request, HttpSession session){
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int bidBuyNum = Integer.parseInt(request.getParameter("buyNum"));
		
		BidBuyDTO bidBuyDTO = bidBuyDAO.getOneData(bidBuyNum); 
		bidBuyDTO.setWishPrice(formatter.format(bidBuyDTO.getBidBuyWishPrice())+"원");
		if(bidBuyDTO.getMinBidSellPrice()==-1) {
			bidBuyDTO.setImmediateBuyPrice("-");
		}else {
			bidBuyDTO.setImmediateBuyPrice(formatter.format(bidBuyDTO.getMinBidSellPrice())+"원");
		}
		if(bidBuyDTO.getMaxBidBuyPrice()==-1) {
			bidBuyDTO.setImmediateSellPrice("-");
		}else {
			bidBuyDTO.setImmediateSellPrice(formatter.format(bidBuyDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(bidBuyDTO.getAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);
		
        int point = myPageDAO.getPoint(userNum);
        int validPoint = myPageDAO.getValidPoint(userNum);

        request.setAttribute("point", point);
        request.setAttribute("validPoint", validPoint);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("bidBuyDTO", bidBuyDTO);
		request.setAttribute("payDTO", payDTO);
		return "myPage/bidBuyDetail";
	}
	
	
	@RequestMapping(value = "/bidSellDetail",method = {RequestMethod.GET,RequestMethod.POST})
	public String bidSellDetail(HttpServletRequest request, HttpSession session){
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int bidSellNum = Integer.parseInt(request.getParameter("sellNum"));
		
		BidSellDTO bidSellDTO = bidSellDAO.getOneData(bidSellNum); 
		bidSellDTO.setWishPrice(formatter.format(bidSellDTO.getBidSellWishPrice())+"원");
		if(bidSellDTO.getMinBidSellPrice()==-1) {
			bidSellDTO.setImmediateBuyPrice("-");
		}else {
			bidSellDTO.setImmediateBuyPrice(formatter.format(bidSellDTO.getMinBidSellPrice())+"원");
		}
		if(bidSellDTO.getMaxBidBuyPrice()==-1) {
			bidSellDTO.setImmediateSellPrice("-");
		}else {
			bidSellDTO.setImmediateSellPrice(formatter.format(bidSellDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(bidSellDTO.getAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);
        MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
		
        String hideAccount = "";
        for(int i=0;i<myPageDTO.getAccount().length()-3;i++) {
        	hideAccount += "*";
        }
        hideAccount += myPageDTO.getAccount().substring(myPageDTO.getAccount().length()-3);
        myPageDTO.setAccount(hideAccount);
        
        int point = myPageDAO.getPoint(userNum);
		int validPoint = myPageDAO.getValidPoint(userNum);
		
		
		request.setAttribute("point", point);
		request.setAttribute("validPoint", validPoint);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("bidSellDTO", bidSellDTO);
		request.setAttribute("payDTO", payDTO);
		request.setAttribute("myPageDTO", myPageDTO);
		return "myPage/bidSellDetail";
	}
	
	@RequestMapping(value = "/tradeBuyDetail",method = {RequestMethod.GET,RequestMethod.POST})
    public String tradeBuyDetail(HttpServletRequest request, HttpSession session){
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int tradeNum = Integer.parseInt(request.getParameter("buyNum"));
		
		TradeDTO tradeBuyDTO = tradeDAO.getOneBuyData(tradeNum);
		tradeBuyDTO.setTradeWonPrice(formatter.format(tradeBuyDTO.getTradePrice())+"원");
		if(tradeBuyDTO.getMinBidSellPrice()==-1) {
			tradeBuyDTO.setImmediateBuyPrice("-");
		}else {
			tradeBuyDTO.setImmediateBuyPrice(formatter.format(tradeBuyDTO.getMinBidSellPrice())+"원");
		}
		if(tradeBuyDTO.getMaxBidBuyPrice()==-1) {
			tradeBuyDTO.setImmediateSellPrice("-");
		}else {
			tradeBuyDTO.setImmediateSellPrice(formatter.format(tradeBuyDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(tradeBuyDTO.getBuyAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);

		request.setAttribute("payDTO", payDTO);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("tradeBuyDTO", tradeBuyDTO);
        return "myPage/tradeBuyDetail";
    }

	@RequestMapping(value = "/tradeSellDetail",method = {RequestMethod.GET,RequestMethod.POST})
	public String tradeSellDetail(HttpServletRequest request, HttpSession session){
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int tradeNum = Integer.parseInt(request.getParameter("sellNum"));
		
		TradeDTO tradeSellDTO = tradeDAO.getOneSellData(tradeNum);
		tradeSellDTO.setTradeWonPrice(formatter.format(tradeSellDTO.getTradePrice())+"원");
		if(tradeSellDTO.getMinBidSellPrice()==-1) {
			tradeSellDTO.setImmediateBuyPrice("-");
		}else {
			tradeSellDTO.setImmediateBuyPrice(formatter.format(tradeSellDTO.getMinBidSellPrice())+"원");
		}
		if(tradeSellDTO.getMaxBidBuyPrice()==-1) {
			tradeSellDTO.setImmediateSellPrice("-");
		}else {
			tradeSellDTO.setImmediateSellPrice(formatter.format(tradeSellDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(tradeSellDTO.getSellAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);
        MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
		
        String hideAccount = "";
        for(int i=0;i<myPageDTO.getAccount().length()-3;i++) {
        	hideAccount += "*";
        }
        hideAccount += myPageDTO.getAccount().substring(myPageDTO.getAccount().length()-3);
        myPageDTO.setAccount(hideAccount);
        
		request.setAttribute("payDTO", payDTO);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("tradeSellDTO", tradeSellDTO);
		request.setAttribute("myPageDTO", myPageDTO);
		return "myPage/tradeSellDetail";
	}
	
	@RequestMapping(value = "/endBuyDetail",method = {RequestMethod.GET,RequestMethod.POST})
	public String endBuyDetail(HttpServletRequest request, HttpSession session){
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int tradeNum = Integer.parseInt(request.getParameter("buyNum"));
		
		TradeDTO endBuyDTO = tradeDAO.getOneBuyData(tradeNum);
		endBuyDTO.setTradeWonPrice(formatter.format(endBuyDTO.getTradePrice())+"원");
		if(endBuyDTO.getMinBidSellPrice()==-1) {
			endBuyDTO.setImmediateBuyPrice("-");
		}else {
			endBuyDTO.setImmediateBuyPrice(formatter.format(endBuyDTO.getMinBidSellPrice())+"원");
		}
		if(endBuyDTO.getMaxBidBuyPrice()==-1) {
			endBuyDTO.setImmediateSellPrice("-");
		}else {
			endBuyDTO.setImmediateSellPrice(formatter.format(endBuyDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(endBuyDTO.getBuyAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);
		
		request.setAttribute("payDTO", payDTO);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("endBuyDTO", endBuyDTO);
		return "myPage/endBuyDetail";
	}
	
	@RequestMapping(value = "/endSellDetail",method = {RequestMethod.GET,RequestMethod.POST})
	public String endSellDetail(HttpServletRequest request, HttpSession session){
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		int userNum = (Integer) session.getAttribute("userNum");
		
		int tradeNum = Integer.parseInt(request.getParameter("sellNum"));
		
		TradeDTO endSellDTO = tradeDAO.getOneSellData(tradeNum);
		endSellDTO.setTradeWonPrice(formatter.format(endSellDTO.getTradePrice())+"원");
		if(endSellDTO.getMinBidSellPrice()==-1) {
			endSellDTO.setImmediateBuyPrice("-");
		}else {
			endSellDTO.setImmediateBuyPrice(formatter.format(endSellDTO.getMinBidSellPrice())+"원");
		}
		if(endSellDTO.getMaxBidBuyPrice()==-1) {
			endSellDTO.setImmediateSellPrice("-");
		}else {
			endSellDTO.setImmediateSellPrice(formatter.format(endSellDTO.getMaxBidBuyPrice())+"원");
		}
		
		AddrDTO addrDTO = addrDAO.getOneData(endSellDTO.getSellAddrNum());
		PaymentDTO payDTO = paymentDAO.getBasicData(userNum);
        MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
		
        String hideAccount = "";
        for(int i=0;i<myPageDTO.getAccount().length()-3;i++) {
        	hideAccount += "*";
        }
        hideAccount += myPageDTO.getAccount().substring(myPageDTO.getAccount().length()-3);
        myPageDTO.setAccount(hideAccount);
        
		request.setAttribute("payDTO", payDTO);
		request.setAttribute("addrDTO", addrDTO);
		request.setAttribute("endSellDTO", endSellDTO);
		request.setAttribute("myPageDTO", myPageDTO);
		return "myPage/endSellDetail";
	}
	
	@RequestMapping(value = "/deleteBidBuy",method = {RequestMethod.GET,RequestMethod.POST})
	public void deleteBidBuy(HttpServletRequest request){
		int bidBuyNum = Integer.parseInt(request.getParameter("bidBuyNum"));
		bidBuyDAO.deleteData(bidBuyNum);
	}
	
	@RequestMapping(value = "/deleteBidSell",method = {RequestMethod.GET,RequestMethod.POST})
	public void deleteBidSell(HttpServletRequest request){
		int bidSellNum = Integer.parseInt(request.getParameter("bidSellNum"));
		bidSellDAO.deleteData(bidSellNum);
	}
	
	@RequestMapping(value = "/deleteEnd",method = {RequestMethod.GET,RequestMethod.POST})
	public void deleteEnd(HttpServletRequest request){
		int tradeNum = Integer.parseInt(request.getParameter("tradeNum"));
		
		tradeDAO.deleteData(tradeNum);
	}
	
	
	@RequestMapping(value = "/savePhone",method = {RequestMethod.GET,RequestMethod.POST})
	public String savePhone(HttpServletRequest request, HttpSession session){
		
		int userNum = (Integer) session.getAttribute("userNum");
		String flag ="yes";
		String newPhone = request.getParameter("newPhone");
		
		if(newPhone.length()==10) {
			newPhone = newPhone.substring(0, 3) + "-" + newPhone.substring(3, 6) + "-" + newPhone.substring(6);
		}
		if(newPhone.length()==11) {
			newPhone = newPhone.substring(0, 3) + "-" + newPhone.substring(3, 7) + "-" + newPhone.substring(7);
		}
		List<String> phoneList = myPageDAO.getPhoneList();
		Iterator<String> phoneIt = phoneList.iterator();
		while(phoneIt.hasNext()) {
			if(phoneIt.next().equals(newPhone)) {
				flag = "no";
				break;
			}
		}
		if(flag.equals("yes")) {
			Map<String, Object> hMap = new HashMap<String, Object>();
			hMap.put("userNum", userNum);
			hMap.put("phone", newPhone);
			myPageDAO.updatePhone(hMap);
		}
		
		request.setAttribute("save_check", flag);
		return "myPage/phoneCheck";
	}
	
	@RequestMapping(value = "/checkPwd",method = {RequestMethod.GET,RequestMethod.POST})
	public String checkPwd(HttpServletRequest request, HttpSession session){
		
		int userNum = (Integer) session.getAttribute("userNum");
		String flag ="no";
		String oldPwd = request.getParameter("oldPwd");
		
		MyPageDTO myPageDTO = myPageDAO.getReadData(userNum);
		
		if(bcryptPasswordEncoder.matches(oldPwd, myPageDTO.getPwd())) {
			flag ="yes";
		}
		request.setAttribute("check", flag);
		return "myPage/checkPwd";
	}
	
}
