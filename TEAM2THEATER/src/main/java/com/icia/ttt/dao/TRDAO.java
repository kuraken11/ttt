package com.icia.ttt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ttt.dto.THEATER;

@Repository
public class TRDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public List<THEATER> trDate(THEATER theater) {
		return sql.selectList("TheateR.trDate",theater);
	}

}
