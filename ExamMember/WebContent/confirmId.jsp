<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="jsp.member.MemberDTO"%>
<%@  page import="jsp.member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = MemberDAO.getInstance();
		boolean result = dao.confirmId(id);
		if(result) { %>
			<h2>이미 사용중인 ID입니다.</h2>
		<% } else { %>
		<h2>입력하신 <%= id %>는 사용하실 수 있는 ID입니다</h2>
	<% } %>
</body>
</html>