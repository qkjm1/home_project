<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<!-- 최신 버전의 jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="utf-8">
<title>네이버 로그인</title>
</head>
<body>
<head>
<title>네이버로그인</title>
</head>
<body>

<div class="img_upload">
  <img src="${empty profileImage ? '/profile/default.png' : profileImage}" alt="프로필 이미지" style="width:150px; height:150px; border-radius:50%;">
  
</div>
<script>

const evtSource = new EventSource(`/sse/subscribe?memberId=123`); // 로그인된 유저 ID로 대체

evtSource.addEventListener("connect", function(e) {
    console.log("SSE 연결됨: " + e.data);
});

evtSource.addEventListener("alarm", function(e) {
    console.log("알림 수신: " + e.data);
    // 예: 알림 표시 UI 업데이트
});
</script>



</body>
</html>
