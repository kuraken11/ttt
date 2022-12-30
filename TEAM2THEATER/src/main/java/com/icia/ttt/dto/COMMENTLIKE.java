package com.icia.ttt.dto;

import lombok.Data;

@Data	
public class COMMENTLIKE {
	private String cl_CmtId;	//댓글 작성자의 아이디
	private String cl_Movie;	//영화이름 상세보기중
	private String cl_Id;	//좋아요 누른 분 아이디 
	private String cl_Check; //
	private int cl_Num;	//
}
