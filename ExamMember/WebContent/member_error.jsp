<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
</head>
<body>
	<div align="center">
		<h2>에러</h2>
		<hr>
		<table cellpadding="5" width="400">
			<tr width="100%" bgColor="#FFC19E">
				<td align="center">
					에러가 발생하였습니다. <br>
					관리자에게 문의바랍니다. Tec: 02-111-2222<br>
					<hr>
					에러내용 >> <%= exception.printStackTrace() %>
					<br><br>
					에러내용 >> <%= exception %>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>