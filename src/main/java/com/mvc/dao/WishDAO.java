package com.mvc.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.WishDTO;

public class WishDAO
{
	private SqlSessionTemplate sessionTemplate; 
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

    public List<WishDTO> getLists(int userNum){
        return sessionTemplate.selectList("kreamy.wishMapper.getLists", Integer.valueOf(userNum));
    }
    
	public void deleteData(int wishNum) {	
		sessionTemplate.delete("kreamy.wishMapper.deleteData",wishNum);
	}
    
}
