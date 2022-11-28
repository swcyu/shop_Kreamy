package com.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import com.mvc.dto.AnswerDTO;

public class AnswerDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//answerNum의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("answerMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//입력
	public void insertAnswerData(AnswerDTO dto) {

		sessionTemplate.insert("answerMapper.insertAnswerData",dto);
				
	}//insertData
	
	
	//answerNum으로 조회한 한 개의 데이터(리스트에서 article로 갈 경우)
	public AnswerDTO getReadAnswerData(int questionNum) {
		
		AnswerDTO dto = sessionTemplate.selectOne("answerMapper.getReadAnswerData",questionNum);
					
		return dto;		
		
	}//getReadData

	
	//삭제
	public void deleteAnswerData(int answerNum) {
		
		sessionTemplate.delete("answerMapper.deleteAnswerData",answerNum);
		
	}//deleteData

	
	//수정
	public void updateAnswerData(AnswerDTO dto) {
		
		sessionTemplate.update("answerMapper.updateAnswerData", dto);
		
	}//updateData

	
}//AnswerDAO
