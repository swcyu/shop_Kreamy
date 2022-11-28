package com.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.BrandDTO;


public class BrandDAO {

private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}
	
	
		
	//brand ���� ��������
	
	public List<BrandDTO> getBrandLists(){
		
		List<BrandDTO> lists = 
				sessionTemplate.selectList("shopMapper.brand");
		
		return lists;
		
	}
	
	
	
	
}
