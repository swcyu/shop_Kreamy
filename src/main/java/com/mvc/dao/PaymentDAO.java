package com.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.PaymentDTO;

public class PaymentDAO {

	private SqlSessionTemplate sessionTemplate;
	
    public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
        this.sessionTemplate = sessionTemplate;
    }
    public int maxNum() {	
		return sessionTemplate.selectOne("kreamy.paymentMapper.maxNum");
	}
	
	public int getDataCount(int userNum) {	
		return sessionTemplate.selectOne("kreamy.paymentMapper.getDataCount",userNum);
	}
	
	public void insertData(PaymentDTO paymentDTO) {		
		sessionTemplate.insert("kreamy.paymentMapper.insertData",paymentDTO);
	}

	public void deleteData(int payNum) {		
		sessionTemplate.delete("kreamy.paymentMapper.deleteData",payNum);
	}
	
	public void changeBasic(int payNum) {		
		sessionTemplate.update("kreamy.paymentMapper.changeBasic",payNum);
	}
	
	public List<PaymentDTO> getLists(int userNum) {	
		return sessionTemplate.selectList("kreamy.paymentMapper.getLists", userNum);
	}

	public PaymentDTO getBasicData(int userNum) {	
		return sessionTemplate.selectOne("kreamy.paymentMapper.getBasicData", userNum);
	}
	
	public int allNotBasic(){
    	return sessionTemplate.update("kreamy.paymentMapper.allNotBasic");
    }
}
