<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
	
	table{
		border: white 3px solid;
		align : center;
		height: 40px;
	}
	
	th{
		background-color: rgb(180, 180, 180);
		width: 80px;
	}
		
	textarea{
		height: 300px;
		width: 555px;
	}
	
	input{
		width: 555px;
	}
	
	.box{
		height: 10px;
	}
	
	.submit{
		background-color: white;
	}
	
	#submit{
		width: 80px;
		hight: 40px;
		margin-top: 10px;
	}
	
	.box{
		height: 25px;
	}
	
	h2{
		margin-top: 70px;
	}
	
</style>
</head>
<body>

<h2 align="center">글쓰기</h2>

<form action="write" method="post">
<table align="center">

<tr>
	<th class="box">제목</th>
	<td><input type="text" name="title" id="title"></td>
</tr>

<tr>
	<th>내용</th>
	<td><textarea name="contents" id="contents"></textarea></td>
</tr>

<tr>
	<th class="box">파일첨부</th>
	<td><input type="file" name="file" id="file"></td>
</tr>

<tr>
	<td colspan="2" align="center" class="submit"><input type="submit" value="저장" id="submit"></td>
</tr>

</table>
</form>

</body>
</html>