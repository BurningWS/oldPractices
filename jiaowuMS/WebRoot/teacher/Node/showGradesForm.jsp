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
<script>
	function ajax(semid) {
		//alert(semid);
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					var json = eval(xmlhttp.responseText);
					parseJson(json);
				}
			}
		};
		xmlhttp.open("GET",
				"getTeaSemesterCourses?tid=${sessionScope.teacher.id}&semid="
						+ semid, true);
		xmlhttp.send();
	}

	function parseJson(json) {
		//alert('parse');
		//alert(json.length);

		var course = document.getElementById("coursename"); //clear 
		course.options.length = 1;

		for (var i = 0; i < json.length; i++) {
			var optionElement = document.createElement("option");//生成option节点
			optionElement.setAttribute("value", json[i].id);
			optionElement.innerText = json[i].name;
			var parent = document.getElementById("coursename");
			parent.appendChild(optionElement);
			parent[i+1].selected = true;
		}
		
		//alert('success');
	}
</script>
</head>
<body>
	<form action="getStuGrades" method="post" class="definewidth m20" id="fm">
		<table class="table table-bordered table-hover m10">
			<tr>
				<td width="10%" class="tableleft">开课时间</td>
				<td><select name="semid" onchange="ajax(this.value);" onclick="ajax(this.value);" id="semName">
						<option value="0">--请选择--</option>
						<c:forEach var="s" items="${list }">
							<option value='${s.semid }'>&nbsp;${s.semester }</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<td width="10%" class="tableleft">课程名称</td>
				<td><select name="cid" id="coursename">
						<option value="0">--请选择--</option>
				</select></td>
			</tr>
			<tr>
				<td class="tableleft"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input class="btn btn-primary" type="button" value="确定" id="sub"></input></td>
			</tr>
		</table>
	</form>
</body>
</html>
<script>
	$(function() {
		$('#sub').click(function() {
			var x=document.getElementById("semName");
			var a = x.selectedIndex;
			//alert(a);
			x=document.getElementById("coursename");
			var b = x.selectedIndex;
			//alert(b);
			if(a == 0 || b == 0) {
				alert('请选择学期和课程');
				return;
			}
			$('#fm').submit();
			//alert('yyy');
		});

	});
</script>