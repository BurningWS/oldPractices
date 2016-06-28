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
				<th>瀛﹀佛</th>
				<th>濮揿悕</th>
				<th>寮€璇惧链?/th>
				<th>璇剧▼鍚岖О</th>
				<th>镐绘垚缁?/th>

			</tr>
		</thead>

		<tbody>
			<tr>
				<c:forEach var="c" items="${list }">
					<c:if test="${c.grades > 0}">
						<tr>
							<td>${sessionScope.student.id}</td>
							<td>${sessionScope.student.name}</td>
							<td>${c.semester }</td>
							<td>${c.name }</td>
							<td>${c.grades }</td>
						</tr>
					</c:if>
				</c:forEach>
			</tr>
		</tbody>
	</table>

</body>
</html>