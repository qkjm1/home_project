<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="/resource/common.css" />
<div class="top-boundry-box"></div>
<div class="contain flex flex-col mx-auto">
	<div class="h-20"></div>
	<div>
		<div class="mx-auto">
			<form id="articleForm" action="../article/doModify" method="POST">
				<input type="hidden" name="articleId" value="${article.id}" />
				<input type="hidden" name="boardId" value="2" />
				<input type="hidden" name="body" id="bodyInput" />

				<select name="partId" class="partId anto">
					<option value="" selected disabled>분류</option>
					<option value="1">머리</option>
					<option value="2">목/어깨</option>
					<option value="3">팔</option>
					<option value="4">등/허리</option>
					<option value="5">골반/다리</option>
					<option value="6">종아리/발목</option>
				</select>

				<input id="titleInput" required="required" name="title" type="text" autocomplete="off" placeholder="제목"
					value="${article.title }" />
				<div class="h-2"></div>

				<div id="editor"></div>
				<input type="hidden" id="articleBody" value="${article.body}" />

				<div class="btns flex justify-between">
					<button class="btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
					<button class="btn btn-primary" type="submit">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	const editor = new toastui.Editor({
		el : document.querySelector('#editor'),
		height : '800px',
		initialEditType : 'markdown',
		previewStyle : 'vertical',
		initialValue : document.querySelector('#articleBody').value
	});

	document.querySelector('#articleForm').addEventListener(
			'submit',
			function(e) {
				e.preventDefault();
				document.querySelector('#bodyInput').value = editor
						.getMarkdown();
				this.submit();
			});
</script>


<%@ include file="../common/poot.jspf"%>