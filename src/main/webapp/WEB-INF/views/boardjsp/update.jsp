<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>[ 글 수정 ]</h2>
	
	<form action="update" method="post" onsubmit="return fromCheck()">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title}"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name="contents">${board.contents}</textarea></td>
			</tr>
			
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="file" id="file" value="${board.originalfile}"></td>
			</tr>			
		</table>
		<input type="hidden" name="boardnum" value="${board.boardnum}">
		<input type="submit" id="submit" value="수정">	
		
	</form>
</body>
</html>