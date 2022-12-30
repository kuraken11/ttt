package com.icia.ttt.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dao.MVDAO;
import com.icia.ttt.dto.MOVIE;
import com.icia.ttt.dto.MOVIELIKE;
import com.icia.ttt.dto.MOVIEPOST;
import com.icia.ttt.dto.THEATER;

@Service
public class MVService {
	
	private static final String List = null;
	
	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private MVDAO mvdao;

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav = new ModelAndView();
	
	MOVIELIKE mlCheck = new MOVIELIKE();
	
	// 영화 목록
	public ModelAndView mvList() {

		List<MOVIE> mvList = mvdao.mvList();

		mav.setViewName("MV_List");
		mav.addObject("mvList", mvList);

		return mav;
	}

	// 좋아요
	public ModelAndView mvLike(MOVIE movie) {

		System.out.println(movie.getMv_Name());
		int result = mvdao.mvLike(movie);

		movie = mvdao.mvInfo(movie.getMv_Name());
		System.out.println(movie);

		if (result > 0) {
			mav.addObject("movie", movie);
			mav.setViewName("MV_Info");
		} else {
			mav.addObject("movie", movie);
			mav.setViewName("index");
		}
		System.out.println(result);

		return mav;
	}

	// 영화 정보 상세보기
	public ModelAndView mvInfo(String mv_Name) {
		MOVIE movie = mvdao.mvInfo(mv_Name);

		System.out.println(movie);

		mav.addObject("movie", movie);
		mav.setViewName("MV_Info");

		return mav;
	}

	public ModelAndView csList() {

		List<MOVIE> csList = mvdao.csList();

		mav.setViewName("MV_Commingsoon");

		mav.addObject("csList", csList);

		return mav;
	}

	public ModelAndView mvRes() {

		int mvCount = mvdao.mvCount();

		String mvRes = mvdao.mvRes(mvCount);

		mav.setViewName("index");
		mav.addObject("mv_Review", mvRes);

		return mav;
	}

	public ModelAndView mvWrite(MOVIEPOST movie) throws IllegalStateException, IOException {

		MultipartFile mp_Poster = movie.getMp_Poster();

		UUID uuid = UUID.randomUUID();

		String mp_PosterName = uuid.toString().substring(0, 8) + "_" + mp_Poster.getOriginalFilename();

		String savaPath = request.getServletContext().getRealPath("/resources/fileUpload/");

		if (!mp_Poster.isEmpty()) {
			mp_Poster.transferTo(new File(savaPath + mp_PosterName));
			movie.setMp_PosterName(mp_PosterName);
			System.out.println(mp_PosterName);
		}

		int result = mvdao.mvWrite(movie);

		if (result > 0) {
			mav.setViewName("MV_PostList");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	// 무비 포스트 상세보기
	public ModelAndView mvView(int mpseq) {
		
		MOVIEPOST moviepost = mvdao.mvView(mpseq);

		mav.addObject("moviepost", moviepost);
		mav.setViewName("MV_View");

		return mav;
	}
	
public MOVIELIKE mlCheck(MOVIELIKE movieLike) {
		
		String result = mvdao.mlCheck(movieLike);
		
		if(result == null) {
			mlCheck.setMl_Check("NO"); 
		}else{
			mlCheck.setMl_Check("result");
		}
		
		// 값 넣어주기.
		mlCheck.setMl_Id(movieLike.getMl_Id());
		mlCheck.setMl_Movie(movieLike.getMl_Movie());
		
		return mlCheck;
	}

	public MOVIELIKE movieLikeUp(MOVIELIKE movieLike) {
		
		int result = mvdao.movieLikeUp(movieLike);
		
		mlCheck.setMl_Id(movieLike.getMl_Id());
		mlCheck.setMl_Movie(movieLike.getMl_Movie());
		
		return mlCheck;
	}

	public MOVIELIKE movieLikeDown(MOVIELIKE movieLike) {
		int result = mvdao.movieLikeDown(movieLike);
		
		mlCheck.setMl_Id(movieLike.getMl_Id());
		mlCheck.setMl_Movie(movieLike.getMl_Movie());
		
		return mlCheck;
	}

	public int movieLikeCount(MOVIELIKE movieLike) {
		int movieLikeCount = mvdao.movieLikeCount(movieLike);
		return movieLikeCount;
	}
	
	public ModelAndView mvpostList() {
		List<MOVIEPOST> movieList = mvdao.mvpostList();

		System.out.println("[4] dao → service \n boardList : " + movieList);

		// MODEL
		mav.addObject("movieList", movieList);

		// VIEW
		mav.setViewName("MV_PostList");

		return mav;
	}

	public ModelAndView mvDelete(int mp_seq) {

		int result = mvdao.mvDelete(mp_seq);

		if (result > 0) {
			mav.setViewName("redirect:/mvPost");
		} else {
			mav.setViewName("redirect:/mvView?mp_seq=" + mp_seq);
		}

		return mav;
	}

	// 수정
	public ModelAndView mvModify(MOVIEPOST movie) throws IllegalStateException, IOException {

		// 업로드 파일이름
		MultipartFile mp_Poster = movie.getMp_Poster();

		UUID uuid = UUID.randomUUID();

		// 만약에 업로드 파일이 없다면
		if (!mp_Poster.getOriginalFilename().isEmpty()) {

			String deletePath = "/resources/fileUpload/" + movie.getMp_PosterName();

			File deleteFile = new File(deletePath);

			if (deleteFile.exists()) {
				deleteFile.delete();
				System.out.println("기존 파일 삭제 성공!");
			} else {
				System.out.println("파일존재x, 삭제 실패!");
			}

			// 랜덤한 식별 문자 uuid.toString().substring(0,8)과 실제 파일이름을 합친 것
			String fileName = uuid.toString().substring(0, 8) + "_" + mp_Poster.getOriginalFilename();

			// board객체에 생성한 업로드한 파일 이름을 저장한다
			movie.setMp_PosterName(fileName);

			// 저장 경로에 파일을 업로드한다.
			String savePath = request.getServletContext().getRealPath("/resources/fileUpload/");

			mp_Poster.transferTo(new File(savePath + fileName));
		}

		int result = mvdao.mvModify(movie);

		if (result > 0) {
			mav.setViewName("MV_PostList");
		} else {
			mav.setViewName("redirect:/MV_PostList");
		}

		return mav;
	}

	public ModelAndView mvModifyForm(int mp_Seq) {

		MOVIEPOST movie = mvdao.mvView(mp_Seq);
		// M
		mav.addObject("modify", movie);

		// V
		mav.setViewName("MV_Modify");

		return mav;
	}
}
