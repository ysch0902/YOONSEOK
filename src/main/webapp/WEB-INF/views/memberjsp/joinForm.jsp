<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		let id = document.getElementById('id');
        let pw = document.getElementById('password');
        let pw2 = document.getElementById('password2');
        
        if(id.value.length < 5 || id.value.length > 10) {
            alert('ID는 5~10자 이내로 입력하세요.');
            return false;
        }
        if(pw.value.length < 5 || pw.value.length > 10) {
            alert('비밀번호는 5~10자 이내로 입력하세요.');
            return false;
        }
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

	
function idCheckOpen(){
		window.open('idcheck', 'newwin', 'left=500, top=200, width=600, height=200');
		}
		
</script>
</head>
<body>
<h1>[ 회원가입 ]</h1>
	<form action="join" method="post" onsubmit="return fromCheck()">
		ID		<input type="text" name="id" id="id" readonly="readonly">
				<input type="button" value="ID 중복확인" onclick="idCheckOpen()"><br>
				
		비밀번호	<input type="password" name="password" id="password"><br>
				<input type="password" id="password2"><br>
				
		이름		<input type="text" name="name" id="name"><br>
				
		전화번호	<input type="text" name="phone"><br>
				
		주소		<input type="text" name="address" id="address" style="width:300px"><br>
				
		이메일	<input type="text" name="email" id="email"><br>
				<input type="submit" id="submit" value="가입">
				<input type="reset" id="reset" value="다시 쓰기">		
		
	</form>
</body>
</html>