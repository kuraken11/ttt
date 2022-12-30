package com.icia.ttt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.ttt.dao.CDAO;
import com.icia.ttt.dto.COMMENT;
import com.icia.ttt.dto.COMMENTLIKE;

@Service
public class CService {

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private CDAO cdao;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;
	
	COMMENTLIKE cmtLikeCheck = new COMMENTLIKE();
	
	public List<COMMENT> cList(String cmt_Mvname) {
		
		List<COMMENT> commentList = cdao.cList(cmt_Mvname);
		
		return commentList;
	}


	public List<COMMENT> cmtWrite(COMMENT comment) {
		List<COMMENT> commentList = null;
		
		String resultCheck = cdao.cmtCheck(comment);
		
		System.out.println(resultCheck);
		
		if(resultCheck != null) {
			// ��ġ�� �� ���� ���
			commentList = null;
		}else {
			int result  = cdao.cmtWrite(comment);
			commentList = cdao.cList(comment.getCmt_Mvname());
		
		}
		
		return commentList;
	}


	public List<COMMENT> cmtDelete(COMMENT comment) {
		List<COMMENT> commentList = null;
		
		int result = cdao.cmtDelete(comment);
		
		if(result > 0) {
			commentList = cdao.cList(comment.getCmt_Mvname());
		}else {
			commentList = null;
		}
		
		return commentList;
	}


	public List<COMMENT> cmtModify(COMMENT comment) {
		List<COMMENT> commentList = null;
		
		int result = cdao.cmtModify(comment);
		
		if(result > 0) {
			commentList = cdao.cList(comment.getCmt_Mvname());
		}else {
			commentList = null;
		}
		return commentList;
	}


	public COMMENTLIKE cmtLikeCheck(COMMENTLIKE commentLike) {
		
		String clCheck = cdao.cmtLikeCheck(commentLike);
		
		if(commentLike.getCl_Id().equals(null)) {
			cmtLikeCheck = null;
			return cmtLikeCheck;
		}
		System.out.println("cmtLikeCheck : ");
		System.out.println(clCheck);
		
		if(clCheck == null) {
			cmtLikeCheck.setCl_Check("OK");
			int Up =cdao.cmtLikeUp(commentLike); // ���ƿ� �����ֱ�
			cmtLikeCheck.setCl_Num(cdao.cmtLikeNum(commentLike));	//���ƿ� ���� ���ϱ�
			cmtLikeCheck.setCl_CmtId(commentLike.getCl_CmtId());
		}else {		
			cmtLikeCheck.setCl_Check("NO");
			int Down =cdao.cmtLikeDown(commentLike); // ���ƿ� ������
			cmtLikeCheck.setCl_Num(cdao.cmtLikeNum(commentLike));	//���ƿ� ���� ���ϱ�
			cmtLikeCheck.setCl_CmtId(commentLike.getCl_CmtId());
		}

		
		return cmtLikeCheck;
	}

	// ���ƿ� �����ֱ�
	public COMMENTLIKE cmtLikeCheckBefore(COMMENTLIKE commentLike) {
		
		String clCheck = cdao.cmtLikeCheck(commentLike);
		System.out.println(clCheck);
		
		if(clCheck == null) {
			cmtLikeCheck.setCl_Check("OK");
			cmtLikeCheck.setCl_Num(cdao.cmtLikeNum(commentLike));	//���ƿ� ���� ���ϱ�
			cmtLikeCheck.setCl_CmtId(commentLike.getCl_CmtId());
		}else {
			cmtLikeCheck.setCl_Check("NO");
			cmtLikeCheck.setCl_Num(cdao.cmtLikeNum(commentLike));	//���ƿ� ���� ���ϱ�
			cmtLikeCheck.setCl_CmtId(commentLike.getCl_CmtId());
		}
		return cmtLikeCheck;
	}

}
