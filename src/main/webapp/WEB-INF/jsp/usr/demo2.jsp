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

	<div class="part-selector">
		<div class="show Arms">팔</div>
		<div class="show Calf">종아리</div>
		<div class="show Chest_B">가슴 뒤</div>
		<div class="show Chest_F">가슴 앞</div>
		<div class="show Head">머리</div>
		<div class="show Legs_B">다리 뒤</div>
		<div class="show Legs_F">다리 앞</div>
		<div class="show Neck_Shoulder_B">목/어깨 뒤</div>
		<div class="show Neck_Shoulder_F">목/어깨 앞</div>
		<div class="show Pelvic">골반</div>
	</div>
	<div id="webgl-container"></div>
</body>

<script type="importmap">
    {
      "imports": {
        "three": "https://unpkg.com/three@0.141.0/build/three.module.js",
        "GLTFLoader": "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js",
        "OrbitControls": "https://unpkg.com/three@0.141.0/examples/jsm/controls/OrbitControls.js"
      }
    }
  </script>

<script type="module" src="/resource/00_TEST.js"></script>
</html>
<style>
.part-selector{
	position: absolute;
}
.part {
	display: none;
	margin: 5px;
	padding: 8px 12px;
}

.part.active {
	display: block;
	background-color: #4287f5;
	color: white;
	border-color: #2e65c6;
}
</style>



</body>
</html>
