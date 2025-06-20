<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER JOIN"></c:set>
<%@ include file="../common/head.jspf"%>

<title>JOIN</title>

<link rel="stylesheet" href="/resource/common.css" />
<div class="top-boundry-box"></div>

<div class="contents-box flex justify-center items-center min-h-screen"">
  <div class="signup-box p-10 w-full max-w-lg">
    <div class="text-2xl font-bold text-center text-[#3C3C29]">회원가입</div>


    <form action="/usr/member/dojoin" method="POST" onsubmit="return validatePasswords();" class="space-y-4">

      <div>
        <label class="block font-medium text-[#3C3C29]">아이디</label>
        <input type="text" name="loginId" placeholder="아이디"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">비밀번호</label>
        <input type="password" name="loginPw" placeholder="비밀번호"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">비밀번호 확인</label>
        <input type="password" name="loginPwConfirm" placeholder="비밀번호 확인"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">이름</label>
        <input type="text" name="name" placeholder="이름"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">이메일</label>
        <input type="email" name="email" placeholder="이메일"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">닉네임</label>
        <input type="text" name="nickname" placeholder="닉네임"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div>
        <label class="block font-medium text-[#3C3C29]">전화번호</label>
        <input type="text" name="cellphoneNum" placeholder="010-1234-5678"
               class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#3C3C29]" required>
      </div>

      <div class="pt-4">
        <button type="submit"
                class="w-full bg-[#3C3C29] hover:bg-opacity-90 text-white font-semibold py-2 rounded-lg transition duration-200">
          가입하기
        </button>
      </div>
    </form>
  </div>
</div>


<a href="/oauth2/code/naver">
    네이버 로그인하기
</a>

<script>
	function validatePasswords() {

		const loginId = $("input[name='loginId']").val();
		const loginPw = $("input[name='loginPw']").val();
		const loginPwConfirm = $("input[name='loginPwConfirm']").val();
		const name = $("input[name='name']").val();
		const email = $("input[name='email']").val();
		const nickname = $("input[name='nickname']").val();
		const cellphoneNum = $("input[name='cellphoneNum']").val();

		if (!loginId || !loginPw || !loginPwConfirm || !name || !email
				|| !nickname || !cellphoneNum) {
			alert("모든 항목을 입력해주세요.");
			return false;
		}
		console.log("===모든항목입력===");

		if (loginPw !== loginPwConfirm) {
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name='loginPwConfirm']").focus();
			return false;
		}
		console.log("===비번일치===");

		return location.replace('/usr/member/dojoin');
	}
</script>

<%@ include file="../common/poot.jspf"%>