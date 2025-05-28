package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int id;
	private String regDate;
	private String updateDate;
	private String loginId;
	private String loginPw;
	private int authLevel;
	private String name;
	private String nickname;
	private int cellphoneNum;
	private String email;
	private int delstatus;
	private int delDate;
	
	// 소셜로그인 시도 //
	private String google_loginId;
	private String kakao_loginId;
	
	
}
