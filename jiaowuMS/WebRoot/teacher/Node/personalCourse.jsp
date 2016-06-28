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

</head>
<body>

	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>课程名称</th>
				<th>上课老师</th>
				<th>上课时间</th>
				<th>上课周数</th>
				<th>管理操作</th>
			</tr>
		</thead>


		<c:forEach var="c" items="${list }">
				<tr>
					<td>${c.name }</td>
					<td>${t.name }</td>
					<td>${c.semester }</td>
					<td>${c.weeks }</td>
					<td><a href="forRecordScores?cid=${c.id}">录入成绩</a></td>
				</tr>
		</c:forEach>
	</table>

</body>
</html>
