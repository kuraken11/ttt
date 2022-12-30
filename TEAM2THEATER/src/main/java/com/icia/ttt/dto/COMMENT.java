package com.icia.ttt.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class COMMENT {
	private String cmt_Id;		//아이디
	private String cmt_Point;	//평점
	private String cmt_Comment; //관람평
	private String cmt_Mvname;  //영화이름
	
	private int cmt_Like;  //좋아요
	private Date cmt_Time; //작성 시간
}
