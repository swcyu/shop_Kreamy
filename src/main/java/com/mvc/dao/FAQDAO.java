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

	
	//questionNum의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("FAQMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//입력
	public void insertData(FAQDTO dto) {

		sessionTemplate.insert("FAQMapper.insertData",dto);
				
	}//insertData
	
	
	
	//전체 데이터의 갯수
	 public int getDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("FAQMapper.getDataCount");
	      
	      return totalDataCount;
	      
	   }//getDataCount

	//<탭> 전체 데이터의 갯수
	 public int getTabDataCount(String FAQCategory) {   
	      
	    int tabDataCount = 0;
	      
		Map<String, Object> params = new HashMap<String, Object>();

	    params.put("FAQCategory", FAQCategory);  
	      
	    tabDataCount = sessionTemplate.selectOne("FAQMapper.getTabDataCount",params);
	      
	    return tabDataCount;
	      
	 }//getTabDataCount
	 
	 
	 
	//표시할 페이지 (rownum 범위) 데이터 - 페이징할 시작과 끝 번호를 주고
	 public List<FAQDTO> getLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		
	    List<FAQDTO> lists = sessionTemplate.selectList("FAQMapper.getLists",params);
		      
	    return lists;
	      
	}	

	//<탭> 표시할 페이지 (rownum 범위) 데이터 - 페이징할 시작과 끝 번호를 주고
	 public List<FAQDTO> getTabLists(int start, int end, String FAQCategory){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		params.put("FAQCategory", FAQCategory);
		
	    List<FAQDTO> TabLists = sessionTemplate.selectList("FAQMapper.getTabLists",params);
		      
	    return TabLists;
	      
	}	
	 
	 
	
	//num으로 조회한 한 개의 데이터(리스트에서 article로 갈 경우)
	public FAQDTO getReadData(int FAQNum) {
		
		FAQDTO dto = sessionTemplate.selectOne("FAQMapper.getReadData",FAQNum);
					
		return dto;		
		
	}//getReadData

	
	//삭제
	public void deleteData(int FAQNum) {
		
		sessionTemplate.delete("FAQMapper.deleteData",FAQNum);
		
	}//deleteData
	
	//수정
	public void updateData(FAQDTO dto) {
		
		sessionTemplate.update("FAQMapper.updateData", dto);
		
	}//updateData

	

		

}//QuestionDAO
