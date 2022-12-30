package com.icia.ttt.dto;

import lombok.Data;

@Data
public class THEATER {
	private String the_Code;    //극장 분류 코드 
	private String the_Loc2;    //극장 상세지역
	private String the_Theater; //상영관
	private String the_Name;	//영화이름
	private String the_Type;    //영화 타입 
	
	private String the_Day;		//관람일자
	private String the_Start;		//관람시작시간
	private String the_End;		//관람끝시간
	private String the_PosterName; //영화포스터
	private String the_Age;      //영화 관람가 
	
	private int the_Allseet;	//전체 좌석
	private int the_Seet;  		//여분 좌석. 예매 성공시 예매 좌석은 -1 업데이트
}