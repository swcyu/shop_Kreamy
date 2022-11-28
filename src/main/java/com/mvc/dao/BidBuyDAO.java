package com.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.BidBuyDTO;

public class BidBuyDAO
{
	private SqlSessionTemplate sessionTemplate;
    
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

    public List getBuyLists(int userNum){
        return sessionTemplate.selectList("kreamy.bidBuyMapper.getBuyLists", userNum);
    }
    
    public List getFilterBuyLists(Map<String, Object> hMap){
    	return sessionTemplate.selectList("kreamy.bidBuyMapper.getFilterBuyLists", hMap);
    }
    
    public List getLists(int userNum){
    	return sessionTemplate.selectList("kreamy.bidBuyMapper.getLists", userNum);
    }
    
    public BidBuyDTO getOneData(int bidBuyNum){
    	return sessionTemplate.selectOne("kreamy.bidBuyMapper.getOneData", bidBuyNum);
    }
    
    public int deleteData(int bidBuyNum) {
    	return sessionTemplate.delete("kreamy.bidBuyMapper.deleteData",bidBuyNum);
    }
    
    public int getDataCount(String today) {
    	return sessionTemplate.selectOne("kreamy.bidBuyMapper.getDataCount",today);
    }
    
}
