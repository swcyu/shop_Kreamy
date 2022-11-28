package com.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.AddrDTO;


public class AddrDAO
{
	private SqlSessionTemplate sessionTemplate; 
  	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

	public int maxNum() {	
		return sessionTemplate.selectOne("kreamy.addrMapper.maxNum");
	}
	
	public int getDataCount(int userNum) {	
		return sessionTemplate.selectOne("kreamy.addrMapper.getDataCount",userNum);
	}
	
	public void insertData(AddrDTO addrDTO) {		
		sessionTemplate.insert("kreamy.addrMapper.insertData",addrDTO);
	}

	public void updateData(AddrDTO addrDTO) {		
		sessionTemplate.update("kreamy.addrMapper.updateData",addrDTO);
	}
	
	public void deleteData(int addrNum) {		
		sessionTemplate.delete("kreamy.addrMapper.deleteData",addrNum);
	}
	
	public void changeBasic(int addrNum) {		
		sessionTemplate.update("kreamy.addrMapper.changeBasic",addrNum);
	}
	
	public List<AddrDTO> getLists(int userNum) {	
		return sessionTemplate.selectList("kreamy.addrMapper.getLists", userNum);
	}

	public AddrDTO getOneData(int addrNum) {	
		return sessionTemplate.selectOne("kreamy.addrMapper.getOneData", addrNum);
	}
	
	public int allNotBasic(){
    	return sessionTemplate.update("kreamy.addrMapper.allNotBasic");
    }
}
