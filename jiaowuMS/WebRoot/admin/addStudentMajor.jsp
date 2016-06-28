<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from www.grafikart.fr/demo/coreadmin/modal.html by HTTrack Website Copier/3.x [XR&CO'2010], Mon, 29 Aug 2011 06:37:41 GMT -->
<head>
<title>Your Admin Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Reset all CSS rule -->
<link rel="stylesheet" href="css/reset.css" />

<!-- Main stylesheed  (EDIT THIS ONE) -->
<link rel="stylesheet" href="css/style.css" />

<!-- jQuery AND jQueryUI -->
<script type="text/javascript"
	src="../../../ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/jqueryui/jqueryui.css" />

<!-- jWysiwyg - https://github.com/akzhan/jwysiwyg/ -->
<link rel="stylesheet" href="js/jwysiwyg/jquery.wysiwyg.old-school.css" />
<script type="text/javascript" src="js/jwysiwyg/jquery.wysiwyg.js"></script>


<!-- Tooltipsy - http://tooltipsy.com/ -->
<script type="text/javascript" src="js/tooltipsy.min.js"></script>

<!-- iPhone checkboxes - http://awardwinningfjords.com/2009/06/16/iphone-style-checkboxes.html -->
<script type="text/javascript" src="js/iphone-style-checkboxes.js"></script>
<script type="text/javascript" src="js/excanvas.js"></script>

<!-- Load zoombox (lightbox effect) - http://www.grafikart.fr/zoombox -->
<script type="text/javascript" src="js/zoombox/zoombox.js"></script>
<link rel="stylesheet" href="js/zoombox/zoombox.css" />

<!-- Charts - http://www.filamentgroup.com/lab/update_to_jquery_visualize_accessible_charts_with_html5_from_designing_with/ -->
<script type="text/javascript" src="js/visualize.jQuery.js"></script>

<!-- Uniform - http://uniformjs.com/ -->
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>


<!-- Main Javascript that do the magic part (EDIT THIS ONE) -->
<script type="text/javascript" src="js/main.js"></script>

<style type="text/css">
#Select1 {
	width: 166px;
}

#Select2 {
	width: 172px;
}

.style2 {
	font-size: large;
}

#Button1 {
	width: 67px;
	height: 26px;
}

#Button2 {
	width: 67px;
	height: 26px;
}

#Sxy {
	width: 158px;
}

#Sxh {
	width: 150px;
}

#Szy {
	width: 154px;
}

#Sxueyuan {
	width: 140px;
}

#Szhuanye {
	width: 141px;
}

#zhuanye {
	width: 170px;
}

#xueyuan {
	width: 164px;
}

.style3 {
	font-size: large;
	width: 140px;
	height: 59px;
}

.style4 {
	height: 59px;
}

#add {
	width: 52px;
}

.style5 {
	font-size: large;
	width: 140px;
	height: 30px;
}

.style6 {
	height: 30px;
}

#cancel {
	width: 52px;
}

#nianji {
	width: 99px;
}

#Radio1 {
	width: 16px;
}

.style7 {
	font-size: x-large;
}
</style>

</head>
<body class="modal white">





	<!--            
              CONTENT 
                        -->
	<div id="content" class="white">



		<div class="bloc">
			<div class="title" style="font-size: xx-large; top: 0px; left: 0px">
				<span class="style7">添加学生专业</span><br />
			</div>
			<div class="content">
				<table>
					<thead>
					</thead>
					<tbody>
						<form action="addMajor" method="post">
							<tr>
								<td class="style2">专业</td>
								<td class="style2"><input name="major" type="text" />
							</tr>
							<tr>
								<td class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									id="add" type="submit" value="添加" /></td>
								<td class="style2"><input id="cancel" type="button"
									value="取消" />
							</tr>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

<!-- Mirrored from www.grafikart.fr/demo/coreadmin/modal.html by HTTrack Website Copier/3.x [XR&CO'2010], Mon, 29 Aug 2011 06:37:55 GMT -->
</html>
