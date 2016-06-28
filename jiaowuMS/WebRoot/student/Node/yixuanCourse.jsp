<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
<meta charset="UTF-8">
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
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				window.parent.document.location.reload();
			}
		}
		xmlhttp.open("GET", "quitCourses?tid=" + tid
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
					<td><a href="javascript:ajax('${t.id}','${c.id }')">阃€璇?/a></td>
				</tr>
			</c:forEach>
		</c:forEach>
		
	</table>

</body>
</html>
