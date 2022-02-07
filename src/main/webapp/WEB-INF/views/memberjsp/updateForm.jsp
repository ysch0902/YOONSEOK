<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<style>
	form{
		font-weight: bold;
		font-size: 20px;
		color: red;
		margin-left: 30px;
		margin-top: 20px;
	}
	
	#password2{
		margin-left: 87px;
	}
	
	#submit{
		margin-left: 100px;
	}
	
	#id{
		margin-left: 59px;
	}
	
	#name{
		margin-left: 40px;
	}
	
	#address{
		margin-left: 40px;
	}
	
	#email{
		margin-left: 20px;
	}
	
	#submit, reset {
		margin-top: 15px;
	}
	
</style>
<script>
	function fromCheck(){
		
        let pw = document.getElementById('password');
        let pw2 = document.getElementById('password2');
        let name = document.getElementById('name');
        
        if(pw.value != pw2.value){
            alert('비밀번호가 일치하지 않습니다.');
            return false;
        }
        if(name.value == ''){
            alert('이름 입력');
            return false;
        }
        
        return true;
		}

</script>		
</head>
<body>
	<h1>[ 회원 정보 수정 ]</h1>
	<form action="update" method="post" onsubmit="return fromCheck()">
				
		비밀번호	<input type="password" name="password" id="password"><br>
				<input type="password" id="password2"><br>
				
		이름		<input type="text" name="name" id="name" value="${member.name}"><br>
				
		전화번호	<input type="text" name="phone" value="${member.phone}"><br>
				
		주소		<input type="text" name="address" id="address" style="width:300px" value="${member.address}"><br>
				
		이메일	<input type="text" name="email" id="email" value="${member.email}"><br>
				<input type="submit" id="submit" value="변경">
				<input type="reset" id="reset" value="다시 쓰기">		
		
	</form>

</body>
</html>