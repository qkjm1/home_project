<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code} LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<link rel="stylesheet" href="/resource/common.css" />
<div class="top-boundry-box"></div>
<div class="contain flex flex-col mx-auto">


	<div class="h-6"></div>
	<div class="flex">
		<form class="mx-auto w-full">
			<input type="hidden" name="searchKeywordTypeCode" value="info" />
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
	</div>
	<div class="info-con flex mx-auto justify-around">
		<div class="side-box flex flex-col">
			<div class="h-40"></div>
			<ul>
				<li>
					<a href="">머리</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="">목/어깨</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="">팔</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="">등/허리</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="">골반/다리</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="">종아리/발목</a>
				</li>
			</ul>
			<div class="flex-grow"></div>
		</div>
		<div class="w-3"></div>
		<div class="info-box flex flex-wrap">
			<div class="w-full flex">
				<div class="info-title">
					<div class="qna-title mx-auto flex items-center justify-center">
						<a href="/" class="text-xl font-bold">123${article.title}</a>
						<div class="">123${article.regDate.substring(0,10)}</div>
					</div>
					<div class="qna-body">
						<a href="/">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit recusandae voluptas sapiente reprehenderit natus consequuntur vel aliquid temporibus beatae suscipit labore voluptatibus at accusamus nulla nobis expedita eum. Repudiandae molestiae?${article.body}</a>
					</div>
				</div>
				<div>2</div>
				<div>3</div>
			</div>
			<div class="w-full flex">
				<div>4</div>
				<div>5</div>
				<div>6</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>