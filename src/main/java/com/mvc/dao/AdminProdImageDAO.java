package com.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.AdminProdImageDTO;

public class AdminProdImageDAO {
	private SqlSessionTemplate sessionTemplate;
    
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }
	
	public int maxNum() {	
		return sessionTemplate.selectOne("kreamy.adminProdImageMapper.maxNum");
	}
	
	public void insertData(AdminProdImageDTO APIDTO) {		
		sessionTemplate.insert("kreamy.adminProdImageMapper.insertData",APIDTO);
	}
	public int deleteData(String engProduct) {
		return sessionTemplate.delete("kreamy.adminProdImageMapper.deleteData",engProduct);
	}
}
