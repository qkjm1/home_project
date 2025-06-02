<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>네이버 로그인</title>
</head>
<body>


 <style>
    body, html {
      margin: 0;
      padding: 0;
    }
    #webgl-container {
      width: 800px;
      height: 600px;
      border: 1px solid #ccc;
    }
    canvas {
      display: block;
      width: 100%;
      height: 100%;
    }
  </style>

  <div class="main_1-box flex justify-center mx-auto">
    <div id="webgl-container"></div>
  </div>

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

</body>
</html>
