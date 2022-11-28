package com.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.TradeDTO;

public class TradeDAO
{

    private SqlSessionTemplate sessionTemplate;
    
    public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

    public List getBuyTradeLists(Map<String, Object> hMap){
        return sessionTemplate.selectList("kreamy.tradeMapper.getBuyLists", hMap);
    }
    
    public List getFilterBuyTradeLists(Map<String, Object> hMap){
    	return sessionTemplate.selectList("kreamy.tradeMapper.getFilterBuyLists", hMap);
    }
    
    public List getSellTradeLists(Map<String, Object> hMap){
    	return sessionTemplate.selectList("kreamy.tradeMapper.getSellLists", hMap);
    }
    
    public List getFilterSellTradeLists(Map<String, Object> hMap){
    	return sessionTemplate.selectList("kreamy.tradeMapper.getFilterSellLists", hMap);
    }
    
    public TradeDTO getOneBuyData(int tradeNum) {
    	return sessionTemplate.selectOne("kreamy.tradeMapper.getOneBuyData",tradeNum);
    }

    public TradeDTO getOneSellData(int tradeNum) {
    	return sessionTemplate.selectOne("kreamy.tradeMapper.getOneSellData",tradeNum);
    }
    
    public int updateData(Map<String, Object> hMap) {
		return sessionTemplate.update("kreamy.tradeMapper.updateData",hMap);
	}
    
    public int deleteData(int tradeNum) {
    	return sessionTemplate.delete("kreamy.tradeMapper.deleteData",tradeNum);
    }
    
   public List<TradeDTO> getSellTradeNum(int userNum) {
	   return sessionTemplate.selectList("kreamy.tradeMapper.getSellTradeNum", userNum);
    }
    
    public List<TradeDTO> getBuyTradeNum(int userNum) {
    	return sessionTemplate.selectList("kreamy.tradeMapper.getBuyTradeNum", userNum);
    }
    
    public int getDataCount(String today) {
    	return sessionTemplate.selectOne("kreamy.tradeMapper.getDataCount",today);
    }
}
