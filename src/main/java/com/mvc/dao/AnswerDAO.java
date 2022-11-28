package com.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import com.mvc.dto.AnswerDTO;

public class AnswerDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {	
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//answerNum�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("answerMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//�Է�
	public void insertAnswerData(AnswerDTO dto) {

		sessionTemplate.insert("answerMapper.insertAnswerData",dto);
				
	}//insertData
	
	
	//answerNum���� ��ȸ�� �� ���� ������(����Ʈ���� article�� �� ���)
	public AnswerDTO getReadAnswerData(int questionNum) {
		
		AnswerDTO dto = sessionTemplate.selectOne("answerMapper.getReadAnswerData",questionNum);
					
		return dto;		
		
	}//getReadData

	
	//����
	public void deleteAnswerData(int answerNum) {
		
		sessionTemplate.delete("answerMapper.deleteAnswerData",answerNum);
		
	}//deleteData

	
	//����
	public void updateAnswerData(AnswerDTO dto) {
		
		sessionTemplate.update("answerMapper.updateAnswerData", dto);
		
	}//updateData

	
}//AnswerDAO
