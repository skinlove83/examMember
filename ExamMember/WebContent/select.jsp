<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>www.webmadang.net</title>
<script language="javascript">
<!--
function getSelectValue(frm)
{
 frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
 frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
}
//-->
</script>
</head>
<body>
<form name="form">
<select name="selectBox" onChange="getSelectValue(this.form);">
 <option value="option1">웹마당넷1</option>
 <option value="option2">웹마당넷2</option>
 <option value="option3">웹마당넷3</option>
 <option value="option4">웹마당넷4</option>
</select><br><br>
텍스트값: <input type="text" name="textValue">&nbsp;&nbsp;옵션값: <input type="text" name="optionValue">
</form>
</body>
</html>