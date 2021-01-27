<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@  page import="jsp.member.MemberDTO"%>
<%@  page import="jsp.member.MemberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>테이블</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
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
	<% 
        request.setCharacterEncoding("utf-8"); 
    %>
    <jsp:useBean id="memberdto" class="jsp.member.MemberDTO" />
    <jsp:setProperty property="*" name="memberdto"/>   
    <%
        MemberDAO dao = MemberDAO.getInstance();
    
        // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        // UserInsert()는 회원 정보를 members 테이블에 저장한다.
        dao.UserInsert(memberdto);
    %>
    <br><br><br><br><br>
	<h2>회원가입이 완료되었습니다</h2>
	<p><string style="font-weight: bold;color: rebeccapurple;"><%=memberdto.getMbname() %></string> 님 가입을 축하드립니다.</p>
	<a href="login.jsp">로그인 하러 가기</a>
	<hr>
	<h3>회원가입내용확인</h3>
	<div class="formBox formBox2">
		<form>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<%=memberdto.getId() %> 
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%=memberdto.getPw() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=memberdto.getMbname() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<%=memberdto.getEmail() %>@<%=memberdto.getEmail_dns() %>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=memberdto.getAddr() %></td>
			</tr>
			<tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><%=memberdto.getTel() %></td>
			</tr>
		</table>
	</form>
	</div>	
</body>
</html>