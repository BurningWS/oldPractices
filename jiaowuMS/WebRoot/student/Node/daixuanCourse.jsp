<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="Css/style.css" />
<script type="text/javascript" src="Js/jquery.js"></script>
<script type="text/javascript" src="Js/jquery.sorted.js"></script>
<script type="text/javascript" src="Js/bootstrap.js"></script>
<script type="text/javascript" src="Js/ckform.js"></script>
<script type="text/javascript" src="Js/common.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>

<script language="JavaScript">

	function ajax(tid, cid) {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 ) {
				if (xmlhttp.status == 200) {
					window.parent.document.location.reload();
				} else {
					alert(xmlhttp.responseText);
				}
			}
		}
		xmlhttp.open("GET", "saveCourses?tid=" + tid
				+ "&cid=" + cid, true);
		xmlhttp.send();
	}

</script>

</head>
<body>

	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>璇剧▼鍚岖О</th>
				<th>涓婅钥佸笀</th>
				<th>涓婅镞堕棿</th>
				<th>涓婅锻ㄦ暟</th>
				<th>阃夎浜烘暟</th>
				<th>绠＄悊鎿崭綔</th>
			</tr>
		</thead>


		<c:forEach var="c" items="${list }">
			<c:forEach var="t" items="${c.teachers }">
				<tr>
					<td>${c.name }</td>
					<td>${t.name }</td>
					<td>${c.semester }</td>
					<td>${c.weeks }</td>
					<td>${t.people }</td>
					<td><a href="javascript:ajax('${t.id}','${c.id }')">阃夎</a></td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>

</body>
</html>
