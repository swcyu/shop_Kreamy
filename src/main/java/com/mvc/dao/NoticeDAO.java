package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.NoticeDTO;


public class NoticeDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}

	
	//questionNum의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("noticeMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//입력
	public void insertData(NoticeDTO dto) {

		sessionTemplate.insert("noticeMapper.insertData",dto);
				
	}//insertData
	
	
	
	//전체 데이터의 갯수
	 public int getDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("noticeMapper.getDataCount");
	      
	      return totalDataCount;
	      
	}//getDataCount

	 
	 
	//표시할 페이지 (rownum 범위) 데이터 - 페이징할 시작과 끝 번호를 주고
	 public List<NoticeDTO> getLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		
	    List<NoticeDTO> lists = sessionTemplate.selectList("noticeMapper.getLists",params);
		      
	    return lists;
	      
	}	
	 
	 
	
	//num으로 조회한 한 개의 데이터(리스트에서 article로 갈 경우)
	public NoticeDTO getReadData(int noticeNum) {
		
		NoticeDTO dto = sessionTemplate.selectOne("noticeMapper.getReadData",noticeNum);
					
		return dto;		
		
	}//getReadData

	
	//삭제
	public void deleteData(int noticeNum) {
		
		sessionTemplate.delete("noticeMapper.deleteData",noticeNum);
		
	}//deleteData
	
	//수정
	public void updateData(NoticeDTO dto) {
		
		sessionTemplate.update("noticeMapper.updateData", dto);
		
	}//updateData


		

}//QuestionDAO
