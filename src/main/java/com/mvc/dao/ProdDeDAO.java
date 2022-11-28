package com.mvc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

public class ProdDeDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//ProdInfoDTO 가져오기
	public ProdInfoDTO getProdInfo(int prodNum) {
		
		ProdInfoDTO dto = 
				sessionTemplate.selectOne("com.prodDeMapper.getProdInfo",prodNum);
		return dto;
	}
	
	//ProdInfoDTO 가져오기(eng랑 사이즈로)
		public ProdInfoDTO getProdInfo2(String engProduct,String prodSize) {
			
			Map<String, String> tpMap = new HashMap<String, String>();	
			tpMap.put("prodSize", prodSize);
			tpMap.put("engProduct", engProduct);
			
			ProdInfoDTO dto = 
					sessionTemplate.selectOne("com.prodDeMapper.getProdInfo2",tpMap);
			return dto;
		}
	
	
	//사이즈 전체 가져오기
	public List<String> getSizeByEngProduct(String engProduct){
		
		List<String> lists = 
				sessionTemplate.selectList("com.prodDeMapper.getSizeByEngProduct", engProduct);
		return lists;
	}
	//사이즈랑 위시 함꼐
	public List<WishSizeDTO> getSizeWish(String engProduct,int userNum){		
		Map hMap = new HashMap();			
		hMap.put("engProduct", engProduct);
		hMap.put("userNum", userNum);								
		List<WishSizeDTO> lists = 
				sessionTemplate.selectList("com.prodDeMapper.getSizeWish", hMap);
		return lists;
	}
	//위시카운트세기 (유저꺼)
	public int countUserWish(String engProduct,int userNum){
		Map hMap = new HashMap();			
		hMap.put("engProduct", engProduct);
		hMap.put("userNum", userNum);		
		int c = sessionTemplate.selectOne("com.prodDeMapper.countUserWish",hMap);
		return c;
	}
	//위시 지우기
	public void deleteWish(String engProduct,String prodSize,int userNum) {
		Map hMap = new HashMap();	
		hMap.put("prodSize", prodSize);
		hMap.put("engProduct", engProduct);
		hMap.put("userNum", userNum);
		sessionTemplate.delete("com.prodDeMapper.deleteWish",hMap);
	}
	//위시추가하기
	public void insertWish(String engProduct,String prodSize,int userNum) {
		Map hMap = new HashMap();	
		hMap.put("prodSize", prodSize);
		hMap.put("engProduct", engProduct);
		hMap.put("userNum", userNum);
		sessionTemplate.insert("com.prodDeMapper.insertWish",hMap);
	}
	
	
	
	//상품 이미지 가져오기
	public List<String> getTotalImage(String engProduct){		
		List<String> lists = 
				sessionTemplate.selectList("com.prodDeMapper.getTotalImage", engProduct);
		return lists;		
	}
	//대표 상품 이미지 가져오기
	public String getRepImage(String engProduct) {		
		return sessionTemplate.selectOne("com.prodDeMapper.getRepImage",engProduct);
	}
	
	//가격들 dto 가져오기
	public List<ProductsDTO> getProdPriceList(List<String> sizeLists,String engProduct){
		
		List<ProductsDTO> lists = new ArrayList<ProductsDTO>();
		
		
		for(int i=0;i<sizeLists.size();i++) {
			ProductsDTO dto = new ProductsDTO();
			String prodSize = sizeLists.get(i);
			dto.setProdSize(prodSize);
			Map<String, String> tpMap = new HashMap<String, String>();	
			tpMap.put("prodSize", prodSize);
			tpMap.put("engProduct", engProduct);
			
			Integer IB = sessionTemplate.selectOne("com.prodDeMapper.getImmeBuyPrice",tpMap);
			Integer IS = sessionTemplate.selectOne("com.prodDeMapper.getImmeSellPrice",tpMap);
			
			
			Integer TP1 = sessionTemplate.selectOne("com.prodDeMapper.getRecentTradePrice",tpMap);
			Integer TP2 = sessionTemplate.selectOne("com.prodDeMapper.getRecent2TradePrice",tpMap);
			dto.setImmeBuyPrice(IB);
			dto.setImmeSellPrice(IS);
			dto.setLatestPrice(TP1);
			dto.setLatestPrice2(TP2);				
			
			lists.add(dto);
		}
				
		
		return lists;
	}
	
	//영어이름으로ProductsDTO받기
	public ProductsDTO getAllProducts(String engProduct) {
		
		ProductsDTO dto = new ProductsDTO();		
		Integer IB = sessionTemplate.selectOne("com.prodDeMapper.getTotImmeBuyPrice",engProduct);
		Integer IS = sessionTemplate.selectOne("com.prodDeMapper.getTotImmeSellPrice",engProduct);
		
		dto.setImmeBuyPrice(IB);
		dto.setImmeSellPrice(IS);
		
		String prodSize = sessionTemplate.selectOne("com.prodDeMapper.getRecentPriceSize",engProduct);
		
		Map<String, String> tpMap = new HashMap<String, String>();	
		tpMap.put("prodSize", prodSize);
		tpMap.put("engProduct", engProduct);
		
		if(prodSize!=null) {			
			Integer TP1 = sessionTemplate.selectOne("com.prodDeMapper.getRecentTradePrice",tpMap);
			Integer TP2 = sessionTemplate.selectOne("com.prodDeMapper.getRecent2TradePrice",tpMap);
			dto.setLatestPrice(TP1);
			dto.setLatestPrice2(TP2);
		}		
		return dto;
	}
	
	//사이즈에따른 productsDTO 받기 
		public ProductsDTO getProducts(String engProduct,String prodSize) {
			
			ProductsDTO dto = new ProductsDTO();
			
			dto.setProdSize(prodSize);
			Map<String, String> tpMap = new HashMap<String, String>();	
			tpMap.put("prodSize", prodSize);
			tpMap.put("engProduct", engProduct);			
			Integer IB = sessionTemplate.selectOne("com.prodDeMapper.getImmeBuyPrice",tpMap);
			Integer IS = sessionTemplate.selectOne("com.prodDeMapper.getImmeSellPrice",tpMap);			
			Integer TP1 = sessionTemplate.selectOne("com.prodDeMapper.getRecentTradePrice",tpMap);
			Integer TP2 = sessionTemplate.selectOne("com.prodDeMapper.getRecent2TradePrice",tpMap);
			dto.setImmeBuyPrice(IB);
			dto.setImmeSellPrice(IS);
			dto.setLatestPrice(TP1);
			dto.setLatestPrice2(TP2);
			
			return dto;
		}
	
		
	//체결거래
	
	public List<TISizeDTO> getTrade(String engProduct,String prodSize,
			String tot,String ob, String sort){ 
		
			Map<String, String> tpMap = new HashMap<String, String>();
	  
			tpMap.put("prodSize", prodSize); 
			tpMap.put("engProduct", engProduct);
			tpMap.put("tot", tot); 
			tpMap.put("ob", ob); 
			tpMap.put("sort", sort);
		  
			List<TISizeDTO> lists =
					sessionTemplate.selectList("com.prodDeMapper.getTrade", tpMap);
		  
			return lists;
	}
	 
	//구매입찰 사이즈
	public List<BidDTO> getBidBuy(String engProduct,String prodSize,
			String tot,String ob, String sort){	
		Map<String, String> tpMap = new HashMap<String, String>();	
		tpMap.put("prodSize", prodSize);
		tpMap.put("engProduct", engProduct);
		tpMap.put("tot", tot); 
		tpMap.put("ob", ob); 
		tpMap.put("sort", sort);
		List<BidDTO> lists = 
				sessionTemplate.selectList("com.prodDeMapper.getBidBuy", tpMap);
		return lists;		
	}
	
	//판매입찰 사이즈
	public List<BidDTO> getBidSell(String engProduct,String prodSize,
			String tot,String ob, String sort){	
		Map<String, String> tpMap = new HashMap<String, String>();	
		tpMap.put("prodSize", prodSize);
		tpMap.put("engProduct", engProduct);
		tpMap.put("tot", tot); 
		tpMap.put("ob", ob); 
		tpMap.put("sort", sort);
		List<BidDTO> lists = 
				sessionTemplate.selectList("com.prodDeMapper.getBidSell", tpMap);
		return lists;		
	}
	
	//주소관련
	public int getAddrMaxNum() {
		int maxNum=0;		
		maxNum = sessionTemplate.selectOne("com.prodDeMapper.addrMaxNum");		
		return maxNum;
	}	
	public void insertAddress(AddressDTO dto) {
		sessionTemplate.insert("com.prodDeMapper.insertAddress",dto);
	}	
	public List<AddressDTO> getMyAddress(int userNum){
		
		List<AddressDTO> lists = 
				sessionTemplate.selectList("com.prodDeMapper.myAddress",userNum);		
		return lists;
	}	
	public void updateFAddrB(int userNum) {
		sessionTemplate.update("com.prodDeMapper.updateFAddrB",userNum);
	}
	
	
	//카드관련	
	public void insertCard(PayInfoDTO dto) {
		sessionTemplate.insert("com.prodDeMapper.insertCard",dto);
	}	
	public List<PayInfoDTO> getMyCard(int userNum){		
		List<PayInfoDTO> lists = 
				sessionTemplate.selectList("com.prodDeMapper.myCard",userNum);		
		return lists;
	}	
	//ProdInfoDTO 가져오기
	public ProdInfoDTO getProdInfoByNum(int prodNum) {	
		return sessionTemplate.selectOne("com.prodDeMapper.getProdInfoByNum",prodNum);
	}
	public int getProdNum(String engProduct) {	
		 
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("engProduct", engProduct);
		
		int prodNum = sessionTemplate.selectOne("com.prodDeMapper.getProdNum",params);
		
		return prodNum;
	}
	public UserInfoDTO getAccount(int userNum) {
		return sessionTemplate.selectOne("com.prodDeMapper.getAccount",userNum);		
	}
	public void updateBank(String bank,String account,String holder,int userNum) {
		Map hMap = new HashMap();	
		hMap.put("bank", bank);
		hMap.put("account", account);
		hMap.put("holder", holder);
		hMap.put("userNum", userNum);		
		sessionTemplate.update("com.prodDeMapper.updateBank",hMap);
	}
	
	public int getAddrNum(String recvName,String recvPhone,String postNum,int userNum) {
		
		Map hMap = new HashMap();
		hMap.put("userNum", userNum);
		hMap.put("recvName", recvName);
		hMap.put("recvPhone", recvPhone);
		hMap.put("postNum", postNum);
				
		return sessionTemplate.selectOne("com.prodDeMapper.getAddrNum",hMap);
	}
	
	public void insertBidBuy(BidBuyInfoDTO dto) {
		sessionTemplate.insert("com.prodDeMapper.insertBidBuy",dto);
	}
	
	public void insertBidSell(BidSellInfoDTO dto) {
		sessionTemplate.insert("com.prodDeMapper.insertBidSell",dto);
	}
	public BidSellInfoDTO getISellIf(int productNum) {
		BidSellInfoDTO dto = 
				sessionTemplate.selectOne("com.prodDeMapper.getISellIf",productNum);
		return dto;
	}
	public BidBuyInfoDTO getIBuyIf(int productNum) {
		BidBuyInfoDTO dto = 
				sessionTemplate.selectOne("com.prodDeMapper.getIBuyIf",productNum);
		return dto;
	}
	public void deleteSellTE(int num) {
		sessionTemplate.delete("com.prodDeMapper.deleteSellTE",num);
	}		
	public void deleteBuyTE(int num) {
		sessionTemplate.delete("com.prodDeMapper.deleteBuyTE",num);
	}
	public void insertTradeInfo(TradeInfoDTO dto) {
		sessionTemplate.insert("com.prodDeMapper.insertTradeInfo",dto);
	}
	public int getBidBuyNum(int userNum) {
		return sessionTemplate.selectOne("com.prodDeMapper.getBidBuyNum",userNum);
	}
	public int getBidSellNum(int userNum) {
		return sessionTemplate.selectOne("com.prodDeMapper.getBidSellNum",userNum);
	}
	public int getTradeNumB(int userNum) {
		return sessionTemplate.selectOne("com.prodDeMapper.getTradeNumB",userNum);
	}
	public int getTradeNumS(int userNum) {
		return sessionTemplate.selectOne("com.prodDeMapper.getTradeNumS",userNum);
	}
}
