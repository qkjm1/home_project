<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<form action="/member/uploadProfile" method="post" enctype="multipart/form-data">
		<input type="file" name="profileImage" accept="image/*" />
		<button type="submit">사진 업로드</button>
	</form>

</body>
</html>