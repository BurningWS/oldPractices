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
<body>
	<form action="getGrades" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover m10">
			<tr>
				<td width="10%" class="tableleft">寮€璇炬椂闂?/td>
				<td>
					<select name="semid">
						<option value="0">--璇烽€夋嫨--</option>
						<c:forEach var="sem" items="${list }">
							<option value='${sem.id }'>&nbsp;${sem.date }</option>
						</c:forEach>
					</select>
				</td>
			</tr>

			<tr>
				<td class="tableleft"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
					<button class="btn btn-primary" type="submit" id="submit">纭畾</button>
			</tr>
		</table>
	</form>
</body>
</html>
