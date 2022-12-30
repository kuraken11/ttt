package com.icia.ttt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ttt.dto.COMMENT;
import com.icia.ttt.dto.COMMENTLIKE;
import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.PAGE;

@Repository
public class CDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<COMMENT> cList(String cmt_Mvname) {
		return sql.selectList("Comment.cList",cmt_Mvname);
	}

	public int cmtWrite(COMMENT comment) {
		return sql.insert("Comment.cmtWrite",comment);
	}

	public int cmtDelete(COMMENT comment) {
		return sql.delete("Comment.cmtDelete",comment);
	}
	
	public int cmtModify(COMMENT comment) {
		return sql.update("Comment.cmtModify",comment);
	}

	public String cmtCheck(COMMENT comment) {
		return sql.selectOne("Comment.cmtCheck",comment);
	}

	public String cmtLikeCheck(COMMENTLIKE commentLike) {
		System.out.println(commentLike);
		return sql.selectOne("Comment.cmtLikeCheck",commentLike);
	}

	public int cmtLikeUp(COMMENTLIKE commentLike) {
		return sql.insert("Comment.cmtLikeUp",commentLike);
	}
	public int cmtLikeDown(COMMENTLIKE commentLike) {
		return sql.insert("Comment.cmtLikeDown",commentLike);
	}

	public int cmtLikeNum(COMMENTLIKE commentLike) {
		return sql.selectOne("Comment.cmtLikeNum",commentLike);
	}
	


}
