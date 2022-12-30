package com.icia.ttt.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dao.MVDAO;
import com.icia.ttt.dao.THEDAO;
import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.RESERVATION;
import com.icia.ttt.dto.THEATER;

@Service
public class THEService {
	
	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private THEDAO thedao;
	
	@Autowired
	private MVDAO mvdao;

	@Autowired
	private HttpSession session;

	private ModelAndView mav = new ModelAndView();

	
	public List<THEATER> theList(THEATER theater) {
		
		
		List<THEATER> theList = thedao.theList(theater);
		
		List<THEATER> result = theList;
		
		
		mav.addObject("result", result);
		
		return result;
	}


	public ModelAndView seetTheater(String code) {
		
		THEATER theater = thedao.seetTheater(code);
		
		mav.addObject("theater", theater);
		
		mav.setViewName("MV_SeetForm");
		
		return mav;
	}


	public String setColor(RESERVATION res) {
		
		String result = thedao.setColor(res);
		
		if(result == null) {
			result = "OK";
		} else {
			result = "NO";
		}
		
		System.out.println(result);
		
		return result;
	}

	// doPay : 결제
	public String doPay(RESERVATION res) {
		
		int pay = thedao.doPay(res); 
		
		String result="";
		
		if(pay > 0) {
			result = "OK";
			
		} else {
			result= "NO";
		}
		
		
		return result;
	}


	public ModelAndView deleteRes(RESERVATION res) {
		
		int result = thedao.deleteRes(res);
		
		if(result>0) {
			mav.setViewName("redirect:/myPage");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}



	
	
	
	
	
	
	
	
}
