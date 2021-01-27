<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
    
function checkValue(){
    inputForm = eval("document.loginInfo");
    if(!inputForm.id.value)
    {
        alert("아이디를 입력하세요");    
        inputForm.id.focus();
        return false;
    }
    if(!inputForm.password.value)
    {
        alert("비밀번호를 입력하세요");    
        inputForm.password.focus();
        return false;
    }
}

// 회원가입 버튼 클릭시 회원가입 화면으로 이동
function goJoinForm() {
    location.href="main3.jsp";
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
    	<jsp:include page="menu.jsp" flush="false"/>
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

    <!-- 로그인 S -->
   	<div class="loginBox" id="imgBox">
		<h2>로그인</h2>
		<form action="loginPro.jsp" name="loginInfo" method="post" onsubmit="return checkValue()">
			<div class="loginTable">
				<table>
	                <tbody>
	                	<tr>
		                    <th>아이디</th>
		                    <td><input type="text" name="id" maxlength="50"></td>
		                </tr>
		                <tr>
		                    <th>비밀번호</th>
		                    <td><input type="password" name="pw" maxlength="50"></td>
		                </tr>
	                </tbody>
	            </table>
	            <br>
	            <input type="submit" value="로그인"/>
	            <input type="button" value="회원가입" onclick="goJoinForm()" />
			</div>
		</form>
		<%
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
			String msg = request.getParameter("msg");

			if (msg != null && msg.equals("0")) {
				out.println("<br>");
				out.println("<p color='red' size='5'>비밀번호를 확인해 주세요.</p>");
			} else if (msg != null && msg.equals("-1")) {
				out.println("<br>");
				out.println("<p color='red' size='5'>아이디를 확인해 주세요.</p>");
			}
		%>
	</div>
    <!-- 로그인 E -->
</body>
</html>