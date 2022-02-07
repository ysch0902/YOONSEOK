<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function fromCheck(){
	let searchId = document.getElementById('searchId');
    
    if(searchId.value.length < 5 || searchId.value.length > 10) {
        alert('ID는 5~10자 이내로 입력하세요.');

        return false;
    }

    return;
}

function idInput(){
	opener.document.getElementById('id').value = '${searchId}';
	this.close();

	//this / opener
}

</script>
</head>
<body>
<h2>[ 아이디 중복확인 ]</h2>
<form action="idcheck" method="post" onsubmit="return fromCheck()">
	검색할 ID		<input type="text" name="searchId" id="searchId">
				<input type="submit" value="검색">
</form>

<!-- 검색후에만 이곳에 검색 결과 출력 -->
<!-- 모델에 담아온 값을 통해서 검색 전/후 파악 가능 -->
	<c:if test="${searchId != null}">
	
	<!-- ID 사용 가능 -->
		<c:if test="${member == null}">
			<p>${searchId} : 사용 가능한 ID입니다.</p>
			<p><input type="button" value="ID사용하기" onclick="idInput()"></p>
		</c:if>
	
	<!-- ID 사용 불가능 -->
		<c:if test="${member != null}">
			<p>${searchId} : 이미 사용중인 ID입니다.</p>
		</c:if>
	
	</c:if>

</body>
</html>