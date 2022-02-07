<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
<style>
	h2{
		color: blue;
		text-align: left;
	}
	
	body{
		 background-color: rgb(207, 207, 207);
		 text-align: center;
	}
</style>
</head>
<body>
<c:if test="${sessionScope.loginId != null}">
	<h2>${sessionScope.loginId}(${sessionScope.loginName})님 환영합니다.</h2>
</c:if>

<h1>
	[ springWeb5 ] 
</h1>

	<c:if test="${sessionScope.loginId == null}">
		<li><a href="member/join">회원가입</a></li>
		<li><a href="member/login">로그인</a></li>
	</c:if>

	<c:if test="${sessionScope.loginId != null}">
		<li><a href="member/update">개인정보수정</a></li>
		<li><a href="member/logout">로그아웃</a></li>
	</c:if>

		<li><a href="board/list">게시판</a></li>

</body>
</html>
