package com.icia.ttt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.RESERVATION;
import com.icia.ttt.dto.THEATER;
import com.icia.ttt.service.THEService;

@Controller
public class THEController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private THEService thesvc;

	@Autowired
	private HttpSession session;
	
	// quickRes : 빠른 예매
	@RequestMapping(value = "/quickRes", method = RequestMethod.GET)
	public String quickRes() {
		
		return "MV_Res";
	}
	
	// setRes
	@RequestMapping(value = "/setRes", method = RequestMethod.POST)
	public @ResponseBody List<THEATER> setRes(@ModelAttribute THEATER theater) {
		
		List<THEATER> result = thesvc.theList(theater);
		
		return result;
	}
	
	// seetForm : 좌석 예매
	@RequestMapping(value = "/seetForm", method = RequestMethod.GET)
	public ModelAndView seetForm(@RequestParam("the_Code") String code) {
			
		mav = thesvc.seetTheater(code);
		
		return mav;
	}
	
	// setColor : 좌석 색깔표시
	@RequestMapping(value = "/setColor", method = RequestMethod.POST)
	public @ResponseBody String setColor(@ModelAttribute RESERVATION res) {
			
		String result = thesvc.setColor(res);
		
		System.out.println(result);
			
		return result;
	}
	
	// doPay : 결제
	@RequestMapping(value = "/doPay", method = RequestMethod.POST)
	public @ResponseBody String doPay(@ModelAttribute RESERVATION res) {
			
		String result = thesvc.doPay(res);

		return result;
	}
	
	//deleteRes 예매 취소
	@RequestMapping(value = "/deleteRes", method = RequestMethod.GET)
	public ModelAndView deleteRes(@ModelAttribute RESERVATION res) {
				
		mav = thesvc.deleteRes(res);

		return mav;
	}
}
