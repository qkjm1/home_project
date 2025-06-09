<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN PAGE"></c:set>
<%@ include file="../common/head.jspf"%>
<title>MAIN</title>

<link rel="stylesheet" href="/resource/main.css" />
<link rel="stylesheet" href="/resource/main2.css" />
<div class="contain mx-auto flex flex-col">
	<div class="main_1-box flex">

		<div class="show Head">

			<div class="flex flex-grow ">
				<div class="qna-con felx flex-col mx-auto">
					<c:forEach var="article" items="${articles}">
						<div class="qna-box">
							<div class="qna-title mx-auto flex items-center justify-center">
								<a href="/" class="text-xl font-bold infoArtlce__get">${article.title}</a>
								<div class="flex-grow"></div>
								<div class="infoArtlce__get">${article.regDate.substring(0,10)}</div>
							</div>
							<div class="qna-body">
								<a href="detail?articleId=${article.id}" class="infoArtlce__get">${article.body}</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:if test="${empty articles }">
				<div class="noAr flex " style="text-align: center;">게시글이 없습니다</div>
			</c:if>


		</div>
		<div class="show Neck_Shoulder_B">목/어깨 뒤</div>
		<div class="show Neck_Shoulder_F">목/어깨 앞</div>
		<div class="show Chest_B">가슴 뒤</div>
		<div class="show Chest_F">가슴 앞</div>
		<div class="show Arms">팔</div>
		<div class="show Legs_B">다리 뒤</div>
		<div class="show Legs_F">다리 앞</div>
		<div class="show Pelvic">골반</div>
		<div class="show Calf">종아리</div>

		<div id="webgl-container"></div>
	</div>
	<div class="main_2-box">
		<div class="info-box flex flex-col">
			<form action="/usr/article/infolist" method="post" class="mx-auto">
				<input type="hidden" name="searchKeywordTypeCode" value="QnA" />
				<input type="hidden" name="boardId" value="2" />
				<div class="search-box">
					<input type="text" placeholder="검색어를 입력하세요" name="searchKeyword" value="${param.searchKeyword}" />
					<button type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="11" cy="11" r="8" />
  <line x1="21" y1="21" x2="16.65" y2="16.65" />
</svg>
					</button>
				</div>
			</form>
			<div class="flex-grow mx-auto">
				<div class="flex info-box-top">
					<div>1</div>
					<div>2</div>
					<div>3</div>
				</div>
				<div class="flex info-box-bot">
					<div>11</div>
					<div>22</div>
					<div>33</div>
				</div>
			</div>

		</div>
	</div>
	<div class="flex-grow main_3-box"></div>
</div>
<%@ include file="../common/poot.jspf"%>


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

<script>
function InfoArticle__get() {
	
	$.get('../article/infolist', {
		id : params.id,
		ajaxMode : 'Y'
	}, function(data) {
		console.log(data);
		console.log(data.data1);
		console.log(data.msg);
		$('.article-detail__hit-count').html(data.data1);
	}, 'json');
}

$(function() {
	InfoArticle__get();

})
</script>
