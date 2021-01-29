<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
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
    	<jsp:include page="menu.jsp" flush="true"/>
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

    <!-- 이미지사용법 S -->
   	<div class="imgBox" id="imgBox">
		<h2>이미지</h2>
		<%	
		//변수선언
		Connection conn = null; //URL
		Statement stmt = null; //SQL
		ResultSet rs = null;
			
			String url = "jdbc:mysql://localhost:3306/examloginDB";
			String user = "root";
			String pw = "zerock";
			
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url,user,pw);
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select * from puppy");
				
				
				while(rs.next()) {
					out.print("<figure><img src='" + rs.getString("image") + "'/>");
					out.print("<figcaption>" + rs.getString("title") + "</figcaption></figure>");
				}
				
			}catch(Exception e){
				out.print(e.getMessage());
			}
			
	%>
				
	</div>
    <!-- 이미지사용법 E -->
</body>
</html>