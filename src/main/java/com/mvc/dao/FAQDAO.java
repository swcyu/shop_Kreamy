package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.FAQDTO;

public class FAQDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}

	
	//questionNum�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("FAQMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//�Է�
	public void insertData(FAQDTO dto) {

		sessionTemplate.insert("FAQMapper.insertData",dto);
				
	}//insertData
	
	
	
	//��ü �������� ����
	 public int getDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("FAQMapper.getDataCount");
	      
	      return totalDataCount;
	      
	   }//getDataCount

	//<��> ��ü �������� ����
	 public int getTabDataCount(String FAQCategory) {   
	      
	    int tabDataCount = 0;
	      
		Map<String, Object> params = new HashMap<String, Object>();

	    params.put("FAQCategory", FAQCategory);  
	      
	    tabDataCount = sessionTemplate.selectOne("FAQMapper.getTabDataCount",params);
	      
	    return tabDataCount;
	      
	 }//getTabDataCount
	 
	 
	 
	//ǥ���� ������ (rownum ����) ������ - ����¡�� ���۰� �� ��ȣ�� �ְ�
	 public List<FAQDTO> getLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		
	    List<FAQDTO> lists = sessionTemplate.selectList("FAQMapper.getLists",params);
		      
	    return lists;
	      
	}	

	//<��> ǥ���� ������ (rownum ����) ������ - ����¡�� ���۰� �� ��ȣ�� �ְ�
	 public List<FAQDTO> getTabLists(int start, int end, String FAQCategory){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		params.put("FAQCategory", FAQCategory);
		
	    List<FAQDTO> TabLists = sessionTemplate.selectList("FAQMapper.getTabLists",params);
		      
	    return TabLists;
	      
	}	
	 
	 
	
	//num���� ��ȸ�� �� ���� ������(����Ʈ���� article�� �� ���)
	public FAQDTO getReadData(int FAQNum) {
		
		FAQDTO dto = sessionTemplate.selectOne("FAQMapper.getReadData",FAQNum);
					
		return dto;		
		
	}//getReadData

	
	//����
	public void deleteData(int FAQNum) {
		
		sessionTemplate.delete("FAQMapper.deleteData",FAQNum);
		
	}//deleteData
	
	//����
	public void updateData(FAQDTO dto) {
		
		sessionTemplate.update("FAQMapper.updateData", dto);
		
	}//updateData

	

		

}//QuestionDAO
