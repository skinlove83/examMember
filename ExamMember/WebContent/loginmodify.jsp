<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="member_error.jsp"%>
<%@  page import="jsp.member.MemberDTO"%>
<%@  page import="jsp.member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>테이블</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	function deletechk() {
		result = confirm("정말로 삭제하시겠습니까");
		
		if(result) {
			document.frm1.action.value="delete";
			document.frm1.submit();
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
	<%
        String id = session.getAttribute("id").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO memberdto = dao.getUserInfo(id);
    %>
	<div class="formBox">
		<h2>수정화면</h2>
		<% out.println(memberdto.getMbname() + " 님의 정보입니다."); %>
		<br><br>
		<form action="loginmodifyPro.jsp" name="userInfo" onsubmit="return checkValue()" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						 <%=memberdto.getId() %> 
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" value="<%=memberdto.getPw() %>"> 영문/숫자포함 6자 이상</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mbname" value="<%=memberdto.getMbname() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type='text' name="email" value="<%=memberdto.getEmail() %>"> @ 
						<input type='text' name="email_dns" id="email_dns" value="<%=memberdto.getEmail_dns() %>"> 
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" value="<%=memberdto.getAddr() %>" style="width: 90%;">
					</td>
				</tr>
				<tr>
				<tr>
					<th>핸드폰 번호</th>
					<td><input type="text" name="tel" value="<%=memberdto.getTel() %>"></td>
				</tr>
				<tr height="2" bgcolor="#FFC8C3">
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장" >
						<input type="reset" value="취소" >
						<input type="button" value="삭제" onclick="javascript:window.location='delete.jsp'" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 폼 테그 사용법 E -->
</body>
</html>