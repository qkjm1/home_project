package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.BookmarkRepository;
import com.example.demo.repository.MemberRepository;
import utill.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}


	public ResultData doJoin(String loginId, String loginPw, String name, String email, String nickname,
			String cellphoneNum) {

		Member logincof =  memberById(loginId);

		if(logincof!=null) {
			return ResultData.from("F-1", "중복된 아이디입니다","loginId",loginId);
		}
		memberRepository.memberJoin(loginId, loginPw, name, email, nickname, cellphoneNum);
		
		logincof =  memberById(loginId);
		if (logincof==null) {
			return ResultData.from("F-2", "로그인실패", "logincof", logincof);
		}


		return ResultData.from("S-1", "회원가입성공");
	}
	
	
	public Member memberById(String loginId) {
		return memberRepository.memberById(loginId);
	}

	public Member doLogin(String loginId) {
		Member member = memberById(loginId);
		return member;
	}


	public Member memberByIntId(int loginId) {
		return memberRepository.memberByIntId(loginId);
	}


	public ResultData<String> findById(int loginId) {
		 Member memberImg = memberRepository.findById(loginId);
		
		 if (memberImg == null) {
		        return ResultData.from("F-2", "회원 정보 없음");
		    }

		    String imagePath = memberImg.getProfileImage();
		    if (imagePath == null || imagePath.isEmpty()) {
		        return ResultData.from("F-1", "저장된 이미지 없음");
		    }
		 
		return ResultData.from("S-1", "저장된 이미지 있음","usrProfileImage",imagePath);
	}



}