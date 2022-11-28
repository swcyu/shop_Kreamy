package com.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.BidBuyDTO;
import com.mvc.dto.BidSellDTO;

public class BidSellDAO
{
	private SqlSessionTemplate sessionTemplate;
	
    public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

    public List getSellLists(int userNum){
        return sessionTemplate.selectList("kreamy.bidSellMapper.getSellLists", userNum);
    }
    
    public List getFilterSellLists(Map<String, Object> hMap){
    	return sessionTemplate.selectList("kreamy.bidSellMapper.getFilterSellLists", hMap);
    }

    public List getLists(int userNum){
        return sessionTemplate.selectList("kreamy.bidSellMapper.getLists", userNum);
    }
    
    public BidSellDTO getOneData(int bidSellNum){
    	return sessionTemplate.selectOne("kreamy.bidSellMapper.getOneData", bidSellNum);
    }
    
    public int deleteData(int bidSellNum) {
    	return sessionTemplate.delete("kreamy.bidSellMapper.deleteData",bidSellNum);
    }
    public int getDataCount(String today) {
    	return sessionTemplate.selectOne("kreamy.bidSellMapper.getDataCount",today);
    }
}
