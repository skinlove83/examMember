<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script type="text/javascript">
        
        // 로그아웃 담당 JSP로 이동
        function logoutPro(){
            location.href="logout.jsp";
        }
    </script>
</head>
<body>
	<b>메인화면입니다.</b><br><br>
    <%
        if(session.getAttribute("id") == null) // 로그인이 안되었을 때
        { 
            // 로그인 화면으로 이동
            response.sendRedirect("login.jsp");
        }
        else // 로그인 했을 경우
        {
    %>
    
    <h2>
        <jsp:forward page="main1.jsp"></jsp:forward>
    </h2>
    
    <br><br>
    <input type="button" value="로그아웃" onclick="logoutPro()" />
    
    <%} %>    
</body>
</html>