<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<body>
	<div align="center">

		<table id="kbtable" border="1" width="100%" bordercolorlight="#588FC7"
			cellspacing="0" cellpadding="0" bordercolor="#588FC7"
			bordercolordark="#ffffff">
			<tr>
				<td width="70" height="28" align="center">学号</td>

				<td width="70" height="28" align="center">姓名</td>

				<td width="123" height="28" align="center">学期</td>

				<td width="123" height="28" align="center">课程</td>

				<td width="123" height="28" align="center">成绩</td>
			</tr>


			<c:forEach var="s" items="${list }">


				<tr>
					<td width="70" height="28" align="center">${s.id }</td>
					<td width="70" height="28" align="center">${s.name }</td>
					<td width="70" height="28" align="center">${c.semester }</td>
					<td width="70" height="28" align="center">${c.name }</td>
					<td width="70" height="28" align="center">${s.grades }</td>
				</tr>

			</c:forEach>


			<tr>
				<td width="124" height="28" align="center">备注</td>
				<td height="28" colspan="7" align="center">&nbsp; ;</td>
			</tr>


		</table>

	</div>


</body>
</html>