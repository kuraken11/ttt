package com.icia.ttt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dto.THEATER;
import com.icia.ttt.service.TRService;

@Controller
public class TRController {
	
	private ModelAndView mav = new ModelAndView();
	
	private THEATER theater = new THEATER();

	@Autowired
	private TRService trsvc;

	@Autowired
	private HttpSession session;

	
	// 페이지 이동용
	@RequestMapping(value = "/thTh", method = RequestMethod.GET)
	public String test() {
		return "TH_Thether";
	}
	
	//trDate
	@RequestMapping(value = "/trDate", method = RequestMethod.POST)
	public @ResponseBody List<THEATER> trDate(@ModelAttribute THEATER theater) {
		
		System.out.println(theater);
		List<THEATER> theaterList = trsvc.trDate(theater);

		return theaterList;
	}
}
