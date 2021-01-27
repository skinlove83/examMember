<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="member_error.jsp"%>
<%@  page import="jsp.member.MemberDTO"%>
<%@  page import="jsp.member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>테이블</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	// 비밀번호 미입력시 경고창
	function checkValue() {
		if (!document.deleteform.pw.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
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
	<%-- <jsp:useBean id="ab" class="jsp.member.MemberDTO" scope="request" /> --%>
	<div class="formBox">
		<h2>내정보</h2>
		<br>
		<form name="deleteform" method="post" action="deletePro.jsp" onsubmit="return checkValue()">
			<table>
				<thead>
					<tr>
		                <th>비밀번호</th>
		                <td><input type="password" name="pw" maxlength="50"></td>
		            </tr>
				</thead>
			</table>
			<br>
			<input type="button" value="취소" onclick="javascript:window.location='main1.jsp'">
       		<input type="submit" value="탈퇴" />
		</form>
	</div>
	<!-- 폼 테그 사용법 E -->
</body>
</html>