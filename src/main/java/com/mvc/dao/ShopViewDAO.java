package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.mvc.dto.ShopViewDTO;

public class ShopViewDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//checkNum 
	
	public int checkNum(Map<String, Object> params) {
		
		int checkNum = 0;
		
		checkNum = sessionTemplate.selectOne("shopMapper.checkNum", params);
		
		return checkNum;
	}
	
	
	//��ü������

	public int getTotalProdImageLists(String searchKey) {
		
		int maxNum = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		
		maxNum = sessionTemplate.selectOne("shopMapper.totalProdImage",params);
		
		return maxNum;
		
	}
	
	
	public List<ShopViewDTO> getProdImageLists(String searchKey){
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		
		List<ShopViewDTO> lists = 
				sessionTemplate.selectList("shopMapper.prodImage",params);
		
		return lists;
		
	}
	
	
	//������ ����
		//�귣�� ���� �������
			public int getTotalCategorySearchLists(String category, String[] brandNames, String beginPrice, String endPrice) {
				
				int maxNum = 0;
				
				Map<String, Object> params = new HashMap<String, Object>();
				
				params.put("category", category);
				params.put("brandNames", brandNames);
				params.put("beginPrice", beginPrice);
				params.put("endPrice", endPrice);
				
				maxNum = sessionTemplate.selectOne("shopMapper.totalCategoryProdImage",params);
				
				return maxNum;
				
			}
		//������ ����
		//�귣�� ���� ���� ���
			public int getTotalCategorySearchLists1(String category, String brandName, String beginPrice, String endPrice) {
				
				int maxNum = 0;
				
				Map<String, Object> params = new HashMap<String, Object>();
				
				params.put("category", category);
				params.put("brandName", brandName);
				params.put("beginPrice", beginPrice);
				params.put("endPrice", endPrice);

				
				maxNum = sessionTemplate.selectOne("shopMapper.totalCategoryProdImage1",params);
				
				return maxNum;
				
			}
		
		//��ǰ ��ȸ
		//�귡�� ���� ���� ���
		public List<ShopViewDTO> getCategorySearchLists(String category, String[] brandNames,String sorting, String beginPrice, String endPrice) {
			
			
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("category", category);
			params.put("brandNames", brandNames);
			params.put("sorting", sorting);
			params.put("beginPrice", beginPrice);
			params.put("endPrice", endPrice);

			
			//params.put("brandName", brandName);
			//System.out.println("dao sorting: " +sorting);
			
			List<ShopViewDTO> lists = 
					sessionTemplate.selectList("shopMapper.categorySearch",params);
			
			
			
			
			return lists;
			
		}
		//��ǰ��ȸ
		//�귣����� ���� ���
		public List<ShopViewDTO> getCategorySearchLists1(String category, String brandName,String sorting, String beginPrice, String endPrice) {
			
			
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("category", category);
			params.put("brandName", brandName);
			params.put("sorting", sorting);
			params.put("beginPrice", beginPrice);
			params.put("endPrice", endPrice);

			//System.out.println("dao sorting: " +sorting);
			//params.put("brandName", brandName);
			
			List<ShopViewDTO> lists = 
					sessionTemplate.selectList("shopMapper.categorySearch1",params);
			
			return lists;
			
		}	
	
	
	
	
}
