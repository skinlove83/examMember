<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<script type="text/javascript">        
        function changeView(value){
            
            if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
            {
                location.href="main1.jsp";
            }
            else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
            {
                location.href="index.jsp";
            }
            else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
            {
                location.href="main3.jsp";
            }
            else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
            {
                location.href="logoutPro.jsp";
            }
            else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
            {
                location.href="main1.jsp?contentPage=loginmodify.jsp";
            }
        }
    </script>
<body>
 <%
    // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
    if(session.getAttribute("id")==null){ 
%>
<a href="javascript:changeView(1)">로그인</a><a href="javascript:changeView(2)">회원가입</a>
<%
    // 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
    }else{ 
%>
		<%=session.getAttribute("id") %></font>님 로그인되었습니다.
        <a href="javascript:changeView(3)">로그아웃</a><a href="loginmodify.jsp">내정보</a>
<%    }    %>
</body>
</html>