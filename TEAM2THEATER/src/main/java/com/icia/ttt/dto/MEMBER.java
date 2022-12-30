package com.icia.ttt.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MEMBER {

	private String memId;			//아이디
	private String memPw;			//비밀번호
	private String memName;			//이름
	private String memPhone;		//연락처
	private String memEmail;		//이메일
	private String memTheater1;		//선호영화관1
	private String memTheater2;		//선호영화관2
	
	private Date memBirth;			//생년월일
}
