package com.icia.ttt.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MOVIEPOST {
	private String mp_Id;	    //아이디
	private String mp_PosterName;   //포스터
	private String mp_Content;  //문구
	private String mp_Mvname;   //영화이름
	private String mp_Title;    //제목
	
	private Date mp_Time;       //작성시간
	private MultipartFile mp_Poster;
	
	private int mp_Like;        //좋아요
	private int mp_Seq;			//포스터 번호

}
