package com.mvc.dao;

import com.mvc.dto.MyPageDTO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MyPageDAO
{
	private SqlSessionTemplate sessionTemplate;
	
    public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }

    public MyPageDTO getReadData(int userNum){
        return sessionTemplate.selectOne("kreamy.myPageMapper.listOne", userNum);
    }
    
    public int updateAccount(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updateAccount", hMap);
    }
    
    public int updatePwd(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updatePwd", hMap);
    }
    
    public int updateName(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updateName", hMap);
    }
    
    public int updateSize(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updateSize", hMap);
    }
    
    public int updateAdData(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updateAdData", hMap);
    }
    
    public int updateImage(Map<String, Object> hMap){
    	return sessionTemplate.update("kreamy.myPageMapper.updateImage", hMap);
    }
    
    public int getPoint(int userNum){
    	return sessionTemplate.selectOne("kreamy.myPageMapper.getPoint", userNum);
    }
    
    public int getValidPoint(int userNum){
    	return sessionTemplate.selectOne("kreamy.myPageMapper.getValidPoint", userNum);
    }
    
    public int deleteUser(int userNum) {
    	return sessionTemplate.delete("kreamy.myPageMapper.deleteUser",userNum);
    }
    
    public List<String> getPhoneList() {
    	return sessionTemplate.selectList("kreamy.myPageMapper.getPhoneList");
    }
    
    public int updatePhone(Map<String, Object> hMap) {
    	return sessionTemplate.update("kreamy.myPageMapper.updatePhone",hMap);
    }
    
    public int getDataCount() {
    	return sessionTemplate.selectOne("kreamy.myPageMapper.getDataCount");
    }
}
