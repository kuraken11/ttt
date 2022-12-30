package com.icia.ttt.controller;

import java.io.IOException;
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
import com.icia.ttt.dto.MOVIELIKE;
import com.icia.ttt.dto.MOVIEPOST;
import com.icia.ttt.dto.THEATER;
import com.icia.ttt.service.MVService;

@Controller
public class MVController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MVService mvsvc;

	@Autowired
	private HttpSession session;

	// csList : 영화 목록
	@RequestMapping(value = "/csMv", method = RequestMethod.GET)
	public ModelAndView csList() {

		mav = mvsvc.csList();

		return mav;
	}

	// mvList : 영화 목록
	@RequestMapping(value = "/allMv", method = RequestMethod.GET)
	public ModelAndView mvList() {

		mav = mvsvc.mvList();

		return mav;
	}

	// mvInfo :상세보기
	@RequestMapping(value = "/mvInfo", method = RequestMethod.GET)
	public ModelAndView mvInfo(@RequestParam("mv_Name") String mv_Name) {
		
		mav = mvsvc.mvInfo(mv_Name);
		
		return mav;
	}

	// 버퍼링 오류
	// mvLike : 영화 좋아요 추가
	@RequestMapping(value = "/mvLike", method = RequestMethod.GET)
	public ModelAndView mvLike(@ModelAttribute MOVIE movie) {
		
		mav = mvsvc.mvLike(movie);
		
		return mav;
	}

	// mlCheck : 좋아요 작성자인지 확인
	@RequestMapping(value = "/mlCheck", method = RequestMethod.POST)
	public @ResponseBody MOVIELIKE mlCheck(@ModelAttribute MOVIELIKE movieLike) {
		
		MOVIELIKE mlCheck = mvsvc.mlCheck(movieLike);
		
		return mlCheck;
	}

	// movieLikeUp : 좋아요 올리기
	@RequestMapping(value = "/movieLikeUp", method = RequestMethod.POST)
	public @ResponseBody MOVIELIKE movieLikeUp(@ModelAttribute MOVIELIKE movieLike) {
		
		MOVIELIKE movieLikeUp = mvsvc.movieLikeUp(movieLike);
		
		return movieLikeUp;
	}

	// movieLikeDown : 좋아요 내리기
	@RequestMapping(value = "/movieLikeDown", method = RequestMethod.POST)
	public @ResponseBody MOVIELIKE movieLikeDown(@ModelAttribute MOVIELIKE movieLike) {
		
		MOVIELIKE movieLikeDown = mvsvc.movieLikeDown(movieLike);
		
		return movieLikeDown;
	}

	// movieLikeCount : 좋아요 갯수 보여주기
	@RequestMapping(value = "/movieLikeCount", method = RequestMethod.POST)
	public @ResponseBody int movieLikeCount(@ModelAttribute MOVIELIKE movieLike) {
		
		int movieLikeCount = mvsvc.movieLikeCount(movieLike);
		
		return movieLikeCount;
	}

	// 예메율 1위
//	@RequestMapping(value = "/mvRes", method = RequestMethod.GET)
//	public ModelAndView mvRes() {
//		mav = mvsvc.mvRes();
//
//		return mav;
//	}
	
	// mpPostForm 무비 포스트 작성창
	@RequestMapping(value = "/mpPostForm", method = RequestMethod.GET)
	public String mpPostForm() {

		return "MV_PostForm";
	}
	
	// mvWrite : 무비 포스트 등록
	@RequestMapping(value = "/mvWrite", method = RequestMethod.POST)
	public ModelAndView mvWrite(@ModelAttribute MOVIEPOST movie) throws IllegalStateException, IOException {
		
		mav = mvsvc.mvWrite(movie);

		return mav;
	}

	// mvView : 무비 포스트 상세보기
	@RequestMapping(value = "/mvView", method = RequestMethod.GET)
	public @ResponseBody ModelAndView mvView(@RequestParam("mp_Seq") int mpseq) {
		
		mav = mvsvc.mvView(mpseq);
		
		return mav;
	}

	// mvPost : 무비 포스트 목록
	@RequestMapping(value = "/mvPost", method = RequestMethod.GET)
	public ModelAndView mvpostList() {
		
		mav = mvsvc.mvpostList();
		
		return mav;
	}

	// mvModifyForm : 무비 포스트 수정페이지로 이동
	@RequestMapping(value = "/mvModifyForm", method = RequestMethod.GET)
	public ModelAndView mvModifyForm(@RequestParam("mp_Seq") int mp_Seq) {
		
		mav = mvsvc.mvModifyForm(mp_Seq);
		
		return mav;
	}

	// mvModify : 무비 포스트 수정
	@RequestMapping(value = "/mvModify", method = RequestMethod.POST)
	public ModelAndView mvModify(@ModelAttribute MOVIEPOST movie) throws IllegalStateException, IOException {
		
		mav = mvsvc.mvModify(movie);
		
		return mav;
	}

	// mvDelete : 무비 포스트 삭제
	@RequestMapping(value = "/mvDelete", method = RequestMethod.GET)
	public ModelAndView mvDelete(@RequestParam(value = "mp_Seq", required = true) int mp_seq) {
		
		mav = mvsvc.mvDelete(mp_seq);
		
		return mav;
	}
}
