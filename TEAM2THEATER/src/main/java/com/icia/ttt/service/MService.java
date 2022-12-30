package com.icia.ttt.service;

import java.util.List;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dao.MDAO;
import com.icia.ttt.dto.MEMBER;
import com.icia.ttt.dto.RESERVATION;

@Service
public class MService {

	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private MDAO mdao;

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSender mailSender;

	private ModelAndView mav = new ModelAndView();

	// 회원가입
	public ModelAndView mJoin(MEMBER member) {

		// 비밀번호 암호화
		member.setMemPw(pwEnc.encode(member.getMemPw()));

		int result = mdao.mJoin(member);

		if (result > 0) {
			mav.setViewName("M_Login");
		} else {
			mav.setViewName("M_Join");
		}

		return mav;
	}

	// 아이디 중복확인
	public String idoverlap(String memId) {
		
		String checkId = mdao.idCheck(memId);

		String result;

		if (checkId == null) {
			// 아이디 사용가능
			result = "OK";
		} else {
			// 이미 사용중인 아이디
			result = "NO";
		}

		return result;
	}

	public String checkEmail(String memEmail) {
		String uuid = UUID.randomUUID().toString().substring(0, 6);

		MimeMessage mail = mailSender.createMimeMessage();

		String mailContent = "<h2>안녕하세요. TTTheater입니다.</h2><br/>" + "<h3>인증번호는 " + uuid + " 입니다.</h3>";

		try {
			mail.setSubject("[이메일 인증] TTTheater 이메일 인증", "UTF-8");
			mail.setText(mailContent, "UTF-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(memEmail));

			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return uuid;
	}

	// 로그인
	public ModelAndView mLogin(MEMBER member) {

		String encPw = mdao.mLogin(member);

		if (pwEnc.matches(member.getMemPw(), encPw)) {
			session.setAttribute("loginId", member.getMemId());

			mav.setViewName("index");
		} else {
			mav.setViewName("M_Login");
		}

		return mav;
	}
	
	//회원수정 페이지로
	public ModelAndView mModiForm(String memId) {
		MEMBER member = mdao.mView(memId);

		mav.addObject("member", member);
		mav.setViewName("M_Modify");
		return mav;
	}
	// 비번 수정
	public ModelAndView mPwChange(MEMBER member) {
		
		member.setMemPw(pwEnc.encode(member.getMemPw()));
		
		int result = mdao.mModify(member);
		
		if (result > 0) {
			mav.setViewName("M_Login");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}

	// 상세목록
		public ModelAndView mView(String memId) {

			MEMBER member = mdao.mView(memId);
			List<RESERVATION> Ticket = mdao.myTicket(memId);
			
			mav.addObject("view", member);
			mav.addObject("Ticket",Ticket);
			
			mav.setViewName("M_View");	

			return mav;
		}
		
		
		// 회원삭제
		public ModelAndView mDelete(String memId) {
			int result = mdao.mDelete(memId);
			
			if(result>0) {
				mav.setViewName("redirect:/index");
				session.invalidate();
			} else {
				mav.setViewName("index");
			}
			
			return mav;
		}
		
		//회원리스트랑 티켓정보보기
		public ModelAndView mList() {
			
			List<MEMBER> memberList = mdao.mList();
			List<RESERVATION> Ticket = mdao.Ticketing();
			
			mav.addObject("memberList", memberList);
			mav.addObject("Ticket", Ticket);
			
			mav.setViewName("M_List");
			return mav;
		}

		
	

}
