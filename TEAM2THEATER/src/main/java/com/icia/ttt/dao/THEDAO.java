package com.icia.ttt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.RESERVATION;
import com.icia.ttt.dto.THEATER;

@Repository
public class THEDAO {

	@Autowired
	SqlSessionTemplate sql;

	public List<THEATER> theList(THEATER theater) {
		
		return sql.selectList("Theater.theList", theater);
	}

	public THEATER seetTheater(String code) {
		return sql.selectOne("Theater.seetTheater", code);
	}

	public String setColor(RESERVATION res) {
		return sql.selectOne("Theater.setColor", res);
	}

	public int doPay(RESERVATION res) {
		
		sql.update("Theater.seetCnt", res);
		
		return sql.insert("Theater.dopay", res);
	}

	public int deleteRes(RESERVATION res) {
		
		sql.update("Theater.returnCnt", res);
		
		return sql.delete("Theater.deleteRes", res);
	}




	
}
