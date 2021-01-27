<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리스트</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
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
                <feGaussianBlur in="SourceGraphic" result="blur"
			stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix"
			values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feGaussianBlur in="goo" stdDeviation="3"
			result="shadow" />
                <feColorMatrix in="shadow" mode="matrix"
			values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2"
			result="shadow" />
                <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                <feBlend in2="shadow" in="goo" result="goo" />
                <feBlend in2="goo" in="SourceGraphic" result="mix" />
            </filter>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" result="blur"
			stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix"
			values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feBlend in2="goo" in="SourceGraphic" result="mix" />
            </filter>
        </defs>
    </svg>
	<!-- 상단 메뉴 E -->

	<!-- list 사용법 S -->
	<div class="listBox">
		<h2>리스트</h2>
		<div class="blue">
			<h3>커피종류</h3>
			<hr class="hr">
			<ul>
				<li><p>에스프레소 [Espresso]</p></li>
				<li><p>아메리카노 [Americano]</p></li>
				<li><p>카푸치노 [Cappuccino]</p></li>
				<li><p>카페라떼 [Cafe latte]</p></li>
				<li><p>카페모카 [Cafe Mocha]</p></li>
				<li><p>마끼아또 [Macchiato]</p></li>
				<li><p>에스프레소 콘파냐 [Con Panna]</p></li>
				<li><p>아포가토 [Affogato]</p></li>
				<li><p>카페로얄 [Cafe Royal]</p></li>
				<li><p>더치커피 [Dutch Coffee]</p></li>
			</ul>
		</div>
		<div class="red">
			<h3>로스팅 순서</h3>
			<hr class="hr">
			<ol>
				<li><p>라이트로스트</p></li>
				<li><p>시나몬로스트</p></li>
				<li><p>미디움로스트</p></li>
				<li><p>하이로스트</p></li>
				<li><p>시티로스트</p></li>
				<li><p>풀시티로스트</p></li>
				<li><p>프렌치로스트</p></li>
				<li><p>이탈리안로스트</p></li>
				<li><p>순서있는 리스트</p></li>
				<li><p>순서있는 리스트</p></li>
			</ol>
		</div>


	</div>
	<!-- list 사용법 E -->
</head>
<body>

</body>
</html>