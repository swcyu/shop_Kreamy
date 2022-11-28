package com.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.AdminProdInfoDTO;
import com.mvc.dto.InspectDTO;
import com.mvc.dto.ProductDTO;


public class AdminProdInfoDAO {
	private SqlSessionTemplate sessionTemplate;
    
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }
	
	public int maxNum() {	
		return sessionTemplate.selectOne("kreamy.adminProdInfoMapper.maxNum");
	}
	
	public int getDataCount(Map<String, Object> hMap) {	
		return sessionTemplate.selectOne("kreamy.adminProdInfoMapper.getDataCount",hMap);
	}
	
	public int getProductCount(String category) {	
		return sessionTemplate.selectOne("kreamy.adminProdInfoMapper.getProductCount",category);
	}
	
	public void insertData(AdminProdInfoDTO APIDTO) {		
		sessionTemplate.insert("kreamy.adminProdInfoMapper.insertData",APIDTO);
	}
	
	public List<ProductDTO> getList(Map<String, Object> hMap) {
		return sessionTemplate.selectList("kreamy.adminProdInfoMapper.getList",hMap);	
	}

	public List<String> getEngProductList() {
		return sessionTemplate.selectList("kreamy.adminProdInfoMapper.getEngProductList");	
	}
	
	public int deleteData(String engProduct) {
		return sessionTemplate.delete("kreamy.adminProdInfoMapper.deleteData",engProduct);
	}
	
	public int getInspectDataCount(Map<String, Object> hMap) {	
		return sessionTemplate.selectOne("kreamy.adminProdInfoMapper.getInspectDataCount",hMap);
	}
	
	public List<InspectDTO> getInspectList(Map<String, Object> hMap) {
		return sessionTemplate.selectList("kreamy.adminProdInfoMapper.getInspectList",hMap);	
	}
	
}
