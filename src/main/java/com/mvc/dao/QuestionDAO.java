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

	
	//questionNum�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("questionMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//�Է�
	public void insertData(QuestionDTO dto) {

		sessionTemplate.insert("questionMapper.insertData",dto);
				
	}//insertData
	
	
	
	//��ü �������� ����
	 public int getDataCount(int userNum) {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("questionMapper.getDataCount",userNum);
	      
	      return totalDataCount;
	      
	 }//getDataCount

	//������ - ��ü �������� ����
	 public int adminGetDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("questionMapper.adminGetDataCount");
	      
	      return totalDataCount;
	      
	   }//getDataCount

	 
	 
	//ǥ���� ������ (rownum ����) ������ - ����¡�� ���۰� �� ��ȣ�� �ְ�
	 public List<QuestionDTO> getLists(int start, int end, int userNum){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		params.put("userNum", userNum);

	    List<QuestionDTO> lists = sessionTemplate.selectList("questionMapper.getLists",params);
		      
	    return lists;
	      
	}	
	 
	//������ - ǥ���� ������ (rownum ����) ������ - ����¡�� ���۰� �� ��ȣ�� �ְ�
	 public List<QuestionDTO> adminGetLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);

	    List<QuestionDTO> lists = sessionTemplate.selectList("questionMapper.adminGetLists",params);
		      
	    return lists;
	      
	}	

	 
	
	//num���� ��ȸ�� �� ���� ������(����Ʈ���� article�� �� ���)
	public QuestionDTO getReadData(int questionNum) {
		
		QuestionDTO dto = sessionTemplate.selectOne("questionMapper.getReadData",questionNum);
					
		return dto;		
		
	}//getReadData

	
	//����
	public void deleteData(int questionNum) {
		
		sessionTemplate.delete("questionMapper.deleteData",questionNum);
		
	}//deleteData

	
	
	//����
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
