package com.icia.ttt.dto;

import java.sql.Date;

import lombok.Data;

//로그인아이디 날짜 영화이름 극장이름 상영관 타입 끝나는/시작 시간 총인원 어른 청소년 어린이 결제금액 예매좌석

@Data
public class RESERVATION {
	
	private int res_Seq; //취소할 때 필요
	//private String res_Code; //좌석 업뎃용
	
	private String res_Id;		//아이디	
	private String res_Mvname;	//영화이름
	private String res_Day;		//관람일자
	private String res_Loc2;	//극장 상세지역
	private String res_Theater; //상영관
	
	private String res_Start;		//관람 시작 시간
	private String res_End;		//관람 끝 시간
	
	private int res_Person;		//예매 인원
	private int res_Price;		//결제금액
	private String res_Seet;    //예매한 좌석
	private String res_Type;    //예매한 영화의 타입(2d, 3d)
	
	private int res_Adult;      //성인 수
	private int res_Youth;		//청소년 수
	private int res_Child;		//어린이 수
}