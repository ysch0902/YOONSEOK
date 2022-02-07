<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	table{
		margin-top: 0%;
		
	}
	
	body{
		background-color: lightgray;
	}
	
	th{
		background-color: gray;
		color: white;
		width: 100px;
		height: 40px;
	}
	
	td{
		background-color: white;
		width: 250px;
		padding-left: 10px;
	}
	
	a{
		margin-top: 0%;
	}
	
	h2{
		margin-left: 46%;
		margin-top: 10%;
	}
</style>

<script>
	function deletecheck(){
		if(confirm("삭제하시겠습니까?")==true)	{
			location.href = "delete?boardnum=${board.boardnum}";
			//${board.boardnum} - 서버에서 가져온 자바 객체
		}else{
			return;
		}	
	}
</script>
</head>
<body>
	<h2>[ 글 읽기 ]</h2>
	
	<table align="center">
		<tr>
			<th>글 번호</th>
			<td>${board.boardnum}</td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td>${board.id}</td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td>${board.inputdate}</td>
		</tr>
		
		<tr>
			<th>조회수</th>
			<td>${board.hits}</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td>${board.title}</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>${board.contents}</td>
		</tr>
		
		<tr>
			<th>첨부파일</th>
			<td>${board.originalfile}</td>
		</tr>
	</table><br>
	<div align="center">
	<c:if test="${sessionScope.loginId == board.id}">
		<a href="update?num=${board.boardnum}">수정하기</a> &nbsp;&nbsp;
		<a href="javascript:deletecheck()">삭제하기</a> &nbsp;&nbsp;
	</c:if>
	<a href="list">목록보기</a>
	</div>
</body>
</html>