package com.icia.ttt.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dto.MEMBER;
import com.icia.ttt.service.MService;

@Controller
public class MController {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MService msvc;

	@Autowired
	private HttpSession session;

	// mJoinForm : 회원가입 페이지
	@RequestMapping(value = "/mJoinForm", method = RequestMethod.GET)
	public String mJoinForm() {
		return "M_Join";
	}

	// mLoginForm: 로그인 페이지
	@RequestMapping(value = "/mLoginForm", method = RequestMethod.GET)
	public String mLoginForm() {
		return "M_Login";
	}

	// mPwForm: 비밀번호 찾는 홈페이지로
	@RequestMapping(value = "/mPwForm", method = RequestMethod.GET)
	public String mPwForm() {
		return "M_Pw";
	}

	// mJoin : 회원가입
	@RequestMapping(value = "/mJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {

		mav = msvc.mJoin(member);
		return mav;
	}

	// idoverlap : 아이디 중복체크 ajax
	@RequestMapping(value = "/idoverlap", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("memId") String memId) {

		System.out.println("ajax로 넘어온 memId : " + memId);
		String result = msvc.idoverlap(memId);

		System.out.println("db에서 확인한 result메세지 : " + result);
		return result;
	}

	// mCheckEmail : 이메일확인
	@RequestMapping(value = "/mCheckEmail", method = RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam("memEmail") String memEmail) {
		System.out.println("memEmail : " + memEmail);
		String uuid = msvc.checkEmail(memEmail);
		System.out.println("uuid : " + uuid);
		return uuid;
	}

	// mLogin : 로그인
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute MEMBER member) {

		mav = msvc.mLogin(member);
		return mav;
	}

	// mLogout : 로그아웃
	@RequestMapping(value = "/mLogout", method = RequestMethod.GET)
	public String mLogout() {
		session.invalidate();

		return "index";
	}

	// mModiForm : 회원수정 페이지
	@RequestMapping(value = "/mModiForm", method = RequestMethod.GET)
	public ModelAndView mModiForm(@RequestParam("memId") String memId) {
		mav = msvc.mModiForm(memId);
		return mav;
	}

	// mPwChange : 비밀번호 변경
	@RequestMapping(value = "/mPwChange", method = RequestMethod.POST)
	public ModelAndView mPwChange(@ModelAttribute MEMBER member) {
		System.out.println("controller");
		mav = msvc.mPwChange(member);
		return mav;
	}

	// myPage : 나의페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("memId") String memId) {
		mav = msvc.mView(memId);
		return mav;
	}

	// mDelete : 회원삭제
	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam("memId") String memId) {
		mav = msvc.mDelete(memId);

		return mav;
	}

	// mList : 회원목록
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public ModelAndView mList() {

		mav = msvc.mList();
		return mav;
	}

}
