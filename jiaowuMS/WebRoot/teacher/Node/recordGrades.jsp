<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	<form action="executeGrades" method="post" id="fm">
		<input type="hidden" name="tid" value="${sessionScope.teacher.id }">
		<input type="hidden" name="cid" value="${c.id }"> <input
			type="hidden" id="subm" name="subm" value="false"> <input
			type="hidden" id="jsongo" name="json" value="">
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>开课学期</th>
					<th>课程名称</th>
					<th>总成绩</th>
				</tr>
			</thead>

			<c:forEach var="s" items="${list }">
				<tr>
					<td>${s.id }</td>
					<td>${s.name }</td>
					<td>${c.semester }</td>
					<td>${c.name }</td>
					<c:choose>
						<c:when test="${submit==true }">
							<td><input type="text" name="grades" disabled="disabled"
								value="${s.grades }"></td>
						</c:when>
						<c:otherwise>
							<td><input type="text" name="grades" value="${s.grades }"></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th><input class="btn btn-primary" id="btn1" type="button"
					value="保存"></th>
				<th><input class="btn btn-primary" id="btn2" type="button"
					value="提交"></th>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		var stu = [];
		function constructJson() {

			//alert(JSON.stringify(stu));

			var tbody = document.getElementsByTagName("tbody");
			//alert(tbody.length);
			var trs = tbody[0].getElementsByTagName('tr');
			//alert(trs.length);

			for (var i = 0; i < trs.length - 1; i++) { //<tr>

				var tds = trs[i].childNodes;
				var sid = tds[1].innerHTML;
				//alert(sid);
				var grades = $(tds[tds.length - 2].firstChild).val();
				//tds[tds.length - 2].firstChild.getAttribute("value");
				//alert(grades);

				var arr = {
					"sid" : sid,
					"grades" : grades
				};
				stu.push(arr);

				//alert(JSON.stringify(stu));
			}
			document.getElementById("jsongo").value = '{"stu":'
					+ JSON.stringify(stu) + '}';

		}

		<c:choose>
			<c:when test="${submit==false }">
				$(document).ready(function() {
					$("#btn1").click(function() {
						constructJson();
						document.getElementById("fm").submit();
					});
				});
	
				$(document).ready(function() {
					$("#btn2").click(function() {
						constructJson();
						document.getElementById("subm").value = 'true';
						document.getElementById("fm").submit();
					});
				});
			</c:when>
			<c:otherwise>
				$(document).ready(function() {
					$("#btn1").click(function() {
						alert('您已提交，不能进行操作');
					});
				});
	
				$(document).ready(function() {
					$("#btn2").click(function() {
						alert('您已提交，不能进行操作');
					});
				});
			</c:otherwise>
		</c:choose>

		
	</script>
</body>
</html>
