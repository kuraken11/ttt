package com.icia.ttt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ttt.dto.MEMBER;
import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.MOVIELIKE;
import com.icia.ttt.dto.MOVIEPOST;

@Repository
public class MVDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	// 잘못만듬
	public MOVIE mvView() {
		return sql.selectOne("Movie.mvView");
	}

	public int mvLike(MOVIE movie) {
		
		return sql.update("Movie.mvLike",movie);
	}
	
	public List<MOVIE> mvList() {
		return sql.selectList("Movie.mvList");
	}
	
	public MOVIE mvInfo(String mv_Name) {
		return sql.selectOne("Movie.mvInfo",mv_Name);
	}
	
	public String mlCheck(MOVIELIKE movieLike) {
		return sql.selectOne("Movie.mlCheck",movieLike);
	}

	public int movieLikeUp(MOVIELIKE movieLike) {
		return sql.insert("Movie.movieLikeUp",movieLike);
	}

	public int movieLikeDown(MOVIELIKE movieLike) {
		return sql.delete("Movie.movieLikeDown",movieLike);
	}

	public int movieLikeCount(MOVIELIKE movieLike) {
		return sql.selectOne("Movie.movieLikeCount",movieLike);
	}
	
	public List<MOVIE> csList() {
		return sql.selectList("Movie.csList");
	}

	public int mvCount() {
		return sql.selectOne("Movie.mvCount");
	}

	public String mvRes(int mvCount) {
		return sql.selectOne("Movie.mvRes", mvCount);
	}
	
	public int mvWrite(MOVIEPOST movie) {
		
		return sql.insert("Movie.mvWrite", movie);
	}
	public List<MOVIEPOST> mvpostList() {
		return sql.selectList("Movie.mvpostList");
	}
	
	public MOVIEPOST mvView(int mpseq) {
		return sql.selectOne("Movie.mvView", mpseq);
	}

	public int mvDelete(int mp_seq) {
		return sql.delete("Movie.mvDelete", mp_seq);
	}

	public int mvModify(MOVIEPOST movie) {
		return sql.update("Movie.mvModify", movie);
	}
}
