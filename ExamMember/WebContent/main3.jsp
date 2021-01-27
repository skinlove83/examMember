<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>테이블</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	var emailSelect = function(select_obj) {
		var selected_index = select_obj.selectedIndex;
		var selected_value = select_obj.options[selected_index].value;
		document.getElementById("email_dns").value = selected_value;
		//alert(selected_value);
	}
	
	// 취소 버튼 클릭시 로그인 화면으로 이동
    function goLoginForm() {
        location.href="index.jsp";
    }
	
	function confirmId() {
		if(document.frm1.id.value == "") {
			alert("ID를 입력하세요.");
			return;
		}
		url = "confirmId.jsp?id=" + document.frm1.id.value;
		open(url, "confirm", "toolbar=no, location=no,status=no, menubar=no,scrollbars=no, width=300, height=200");
	}
	
	
	function myFunction(e) {
        document.getElementById("email_dns").value = e.target.value
    }
</script>
</head>
<body>
	<h1>Jo Hye-yeong exam JSP</h1>
	<div class="logintop">
		<jsp:include page="loginMenu.jsp" flush="true" />
	</div>
	<!-- 상단 메뉴 S -->
	<div class="fixed">
		<jsp:include page="menu.jsp" flush="false" />
	</div>
	<!-- filters -->
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <defs>
            <filter id="shadowed-goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
                <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2" result="shadow" />
                <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                <feBlend in2="shadow" in="goo" result="goo" />
                <feBlend in2="goo" in="SourceGraphic" result="mix" />
            </filter>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feBlend in2="goo" in="SourceGraphic" result="mix" />
            </filter>
        </defs>
    </svg>
	<!-- 상단 메뉴 E -->
	<!-- 폼 테그 사용법 S -->
	<div class="formBox">
		<h2>form</h2>
		<form action="join.jsp" name="frm1"  method="post" onsubmit="return checkValue()">
			<input type="hidden" name="action" value="insert">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id">
						<input type="button" value="중복확인" onclick="confirmId(this.form)"> 
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"> 영문/숫자포함 6자 이상</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mbname"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type='text' name="email"> @ <input type='text' name="email_dns" id="email_dns"> 
						<select name="emailaddr" id="emailaddr" onchange="myFunction(event)">
								<option value="">직접입력</option>
								<option value="daum.net">daum.net</option>
								<option value="empal.com">empal.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="msn.com">msn.com</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" style="width: 90%;">
					</td>
				</tr>
				<tr>
				<tr>
					<th>핸드폰 번호</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr height="2" bgcolor="#FFC8C3">
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입">
						<input type="button" value="취소" onclick="goLoginForm()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 폼 테그 사용법 E -->
</body>
</html>