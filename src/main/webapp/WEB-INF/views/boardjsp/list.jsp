<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	body{
		background-color: lightgray;
	}
	table{
		width: 750px;
		margin: auto;
		color: black;
		font-weight: bold;
	}
	
	#button{
		margin-left: 70%;
		margin-bottom: 0.5%;	
	}
	
	h2{
		margin-left: 46%;
		margin-top: 5%;
		color: black;
		font-weight: bold;		
	}
	
	th{
		background-color: gray;
		color: white;
	}
	
	td{
		background-color: white;
	}
	
	#sort{
		margin-left: 26%;
		margin-bottom: -2.8%;
	}
</style>
</head>
<body>
<h2>[ 게시판 ]</h2>


<!-- 게시판 글 목록 출력될 영역 -->
<p id="sort">전체</p>

<p id="button"><input type="button" value="글쓰기" onclick="location.href='write'"></p>

<form action="list" method="GET">
<table>
		<tr>
			<th>번호</th>
			<th width="28%" height="33">제목</th>
			<th width="20%">작성자</th>
			<th width="18%">조회수</th>
			<th width="27%">등록일</th>
		</tr>
	<c:forEach var="board" items="${list}">
		<tr>
			<td align="center" height="35">${board.boardnum}</td>
			<td><a href="read?num=${board.boardnum}">${board.title}</a></td>
			<td align="center">${board.id}</td>
			<td align="center">${board.hits}</td>
			<td align="center">${board.inputdate}</td>
		</tr>
	</c:forEach>
</table>
</form> 
<!-- 페이지 이동 및 검색 폼 영역 -->

</body>
</html>