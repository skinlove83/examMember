<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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

	<!-- 테이블사용법 S -->
	<div class="tableBox">
	<h2>테이블</h2>
		<table>
			<thead>
				<tr>
					<th class="td_area">지역</th>
					<th class="td_shop">매장명</th>
					<th class="td_addr">주소</th>
					<th class="td_tel">전화번호</th>
					<th class="more"></th>
				</tr>
			</thead>
			<!-- START LIST -->
			<tbody>
				<%	
					//변수선언
					Connection conn = null; //URL
					Statement stmt = null; //SQL
					ResultSet rs = null;
						
					String url = "jdbc:mysql://localhost:3306/examloginDB";
					String user = "root";
					String pw = "mysql";
					
					try{
						
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection(url,user,pw);
						
						stmt = conn.createStatement();
						rs = stmt.executeQuery("select * from StoreName");
						while(rs.next()) {
							out.print("<tr  class='tr_list'><td class='td_area'>" + rs.getString("map") + "</td>");
							out.print("<td class='td_shop'>" + rs.getString("store") + "</td>");
							out.print("<td class='td_addr'>" + rs.getString("addr") + "</td>");
							out.print("<td class='td_tel'>" + rs.getString("tel") + "</td>");
							out.print("<td class='more'>-</td></tr>");
						}
						
					}catch(Exception e){
						out.print(e.getMessage());
					}			
				%>				
			</tbody>
			<!-- END LIST -->
		</table>
	</div>
	<!-- 테이블사용법 E -->
</body>
</html>