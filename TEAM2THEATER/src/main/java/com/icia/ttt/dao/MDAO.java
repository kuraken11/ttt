package com.icia.ttt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.ttt.dto.MEMBER;
import com.icia.ttt.dto.RESERVATION;

@Repository
public class MDAO {
	
	@Autowired
	SqlSessionTemplate sql;
	
	//아이디 확인
	public String idCheck(String memId) {
		return sql.selectOne("Member.idCheck", memId);
	}
	
	//회원가입
	public int mJoin(MEMBER member) {		
		return sql.insert("Member.mJoin", member);
	}

	//로그인
	public String mLogin(MEMBER member) {
		return sql.selectOne("Member.mLogin", member);
	}

	//회원 상세정보
	public MEMBER mView(String memId) {
		return sql.selectOne("Member.mView", memId);
	}
	
	//회원정보 수정
	public int mModify(MEMBER member) {
		return sql.update("Member.mPwchan", member);
	}

	public int mDelete(String memId) {
		return sql.delete("Member.mDelete", memId);
	}

	public List<MEMBER> mList() {
		return sql.selectList("Member.mList");
	}

	public List<RESERVATION> Ticketing() {
		return sql.selectList("Member.Ticketing");
	}

	public List<RESERVATION> myTicket(String memId) {
		return sql.selectList("Member.myTicket", memId);
	}

	
	

}
