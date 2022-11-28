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

	
	//questionNum�� �ִ밪
	public int getMaxNum() {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("noticeMapper.maxNum");
		
		return maxNum;
		
	}//getMaxNum
	
	
	
	//�Է�
	public void insertData(NoticeDTO dto) {

		sessionTemplate.insert("noticeMapper.insertData",dto);
				
	}//insertData
	
	
	
	//��ü �������� ����
	 public int getDataCount() {   
	      
	      int totalDataCount = 0;
	      
	      totalDataCount = sessionTemplate.selectOne("noticeMapper.getDataCount");
	      
	      return totalDataCount;
	      
	}//getDataCount

	 
	 
	//ǥ���� ������ (rownum ����) ������ - ����¡�� ���۰� �� ��ȣ�� �ְ�
	 public List<NoticeDTO> getLists(int start, int end){   
 		 
		Map<String, Object> params = new HashMap<String, Object>();
	    
		params.put("start", start);
		params.put("end", end);
		
	    List<NoticeDTO> lists = sessionTemplate.selectList("noticeMapper.getLists",params);
		      
	    return lists;
	      
	}	
	 
	 
	
	//num���� ��ȸ�� �� ���� ������(����Ʈ���� article�� �� ���)
	public NoticeDTO getReadData(int noticeNum) {
		
		NoticeDTO dto = sessionTemplate.selectOne("noticeMapper.getReadData",noticeNum);
					
		return dto;		
		
	}//getReadData

	
	//����
	public void deleteData(int noticeNum) {
		
		sessionTemplate.delete("noticeMapper.deleteData",noticeNum);
		
	}//deleteData
	
	//����
	public void updateData(NoticeDTO dto) {
		
		sessionTemplate.update("noticeMapper.updateData", dto);
		
	}//updateData


		

}//QuestionDAO
