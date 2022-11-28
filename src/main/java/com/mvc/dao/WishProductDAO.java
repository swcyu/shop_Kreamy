package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.mvc.dto.WishProductDTO;

public class WishProductDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}
	
	
	public List<WishProductDTO> getWishProduct(String engProduct){
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("engProduct", engProduct);
		
		List<WishProductDTO> lists = 
				sessionTemplate.selectList("shopMapper.wishProduct",params);
		
		return lists;
		
	}
	
	public int maxWishNum() {
		
		int maxWishNum = sessionTemplate.selectOne("shopMapper.maxWishNum");
		
		return maxWishNum;		
		
	}
	
	public void insertData(Map<String, Object> params) {	
		
		sessionTemplate.insert("shopMapper.insertWishProduct",params);
				
	}
	
	public int checkNum(Map<String, Object> params) {
		
		int checkNum = 0;
		
		checkNum = sessionTemplate.selectOne("shopMapper.wishCheckNum", params);
		
		return checkNum;
	}
	
	public void deleteWishProduct(int productNum) {
		
		sessionTemplate.delete("shopMapper.deleteWishProduct", productNum);
		
	}
	
}
