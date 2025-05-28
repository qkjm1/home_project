package com.example.demo.controller;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import utill.Ut;

@Controller
public class usrMemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "/usr/member/join";
	}

	@RequestMapping("/usr/member/dojoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String email, String nickname,
			String cellphoneNum) {
		System.err.println("====진행상황====");
		System.err.println("====loginId====" + loginId);
		System.err.println("====loginPw====" + loginPw);
		System.err.println("====name====" + name);
		System.err.println("====email====" + email);
		System.err.println("====nickname====" + nickname);
		System.err.println("====cellphoneNum====" + cellphoneNum);

		// 인설트 시도
		ResultData member = memberService.doJoin(loginId, loginPw, name, email, nickname, cellphoneNum);

		if (member.isFail()) {
			return Ut.jsReplace(member.getData1Name(), member.getMsg(), "../member/join");
		}

		return Ut.jsReplace(member.getData1Name(), member.getMsg(), "../home/main");
	}

	@RequestMapping("/usr/member/login")
	public String showlogin() {
		return "/usr/member/login";
	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw) {
		System.err.println("====진행상황====");
		System.err.println("====loginId====" + loginId);
		System.err.println("====loginPw====" + loginPw);

		Member logincof = memberService.logincof(loginId);

		if (logincof == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("s%아이디 없음", loginId));
		}
		if (logincof.getLoginPw().equals(loginPw)==false) {
			return Ut.jsHistoryBack("F-2", "비밀번호 틀림");
		}
			return Ut.jsReplace("S-1", "로그인 성공", "../home/main");
	}
}
