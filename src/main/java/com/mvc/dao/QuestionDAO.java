package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.QuestionDTO;

public class QuestionDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}

	
	//questionNum의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("questionMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//입력
	public void insertData(QuestionDTO dto) {

		sessionTemplate.insert("questionMapper.insertData",dto);
				
	}//insertData
	
	
	
	//전체 데이터의 갯수
	 public int getDataCount(int userNum) {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("questionMapper.getDataCount",userNum);
	      
	      return totalDataCount;
	      
	 }//getDataCount

	//관리자 - 전체 데이터의 갯수
	 public int adminGetDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("questionMapper.adminGetDataCount");
	      
	      return totalDataCount;
	      
	   }//getDataCount

	 
	 
	//표시할 페이지 (rownum 범위) 데이터 - 페이징할 시작과 끝 번호를 주고
	 public List<QuestionDTO> getLists(int start, int end, int userNum){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		params.put("userNum", userNum);

	    List<QuestionDTO> lists = sessionTemplate.selectList("questionMapper.getLists",params);
		      
	    return lists;
	      
	}	
	 
	//관리자 - 표시할 페이지 (rownum 범위) 데이터 - 페이징할 시작과 끝 번호를 주고
	 public List<QuestionDTO> adminGetLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);

	    List<QuestionDTO> lists = sessionTemplate.selectList("questionMapper.adminGetLists",params);
		      
	    return lists;
	      
	}	

	 
	
	//num으로 조회한 한 개의 데이터(리스트에서 article로 갈 경우)
	public QuestionDTO getReadData(int questionNum) {
		
		QuestionDTO dto = sessionTemplate.selectOne("questionMapper.getReadData",questionNum);
					
		return dto;		
		
	}//getReadData

	
	//삭제
	public void deleteData(int questionNum) {
		
		sessionTemplate.delete("questionMapper.deleteData",questionNum);
		
	}//deleteData

	
	
	//수정
	public void updateData(QuestionDTO dto) {
		
		sessionTemplate.update("questionMapper.updateData", dto);
		
	}//updateData

	public int getDataTodayCount(String today) {
		return sessionTemplate.selectOne("questionMapper.getDataTodayCount",today);
	}

		
	public int getDataNoAnswerCount() {
		return sessionTemplate.selectOne("questionMapper.getDataNoAnswerCount");
	}
	
	

}//QuestionDAO
