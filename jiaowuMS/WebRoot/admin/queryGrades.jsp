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
	width: 157px;
	height: 19px;
}

#Select2 {
	width: 72px;
}

.style2 {
	font-size: large;
	width: 111px;
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
	width: 111px;
	height: 59px;
}

.style4 {
	height: 59px;
}

#add {
	width: 87px;
	height: 29px;
}

.style5 {
	font-size: large;
	width: 111px;
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

#zhicheng {
	width: 137px;
}

#Select3 {
	width: 167px;
}

#Select4 {
	width: 161px;
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
				查询成绩<br />
			</div>
			<div class="content">
				<table>
					<thead>
					</thead>
					<tbody>
						<tr>
							<td class="style3">&nbsp;</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script>
						</tr>
						</tr>
						<tr>
							<td class="style3">学号</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <input id="Text1" type="text" />
						</tr>
						</tr>
						<tr>
							<td class="style3">姓名</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <input id="Text2" type="text" />
						</tr>
						</tr>
						<tr>
							<td class="style3">学院</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <select id="Select3" name="D7">
									<option>计算机与信息工程学院</option>
									<option>计算机与信息工程学院</option>
									<option>计算机与信息工程学院</option>
									<option>计算机与信息工程学院</option>
							</select>
						</tr>
						</tr>
						<tr>
							<td class="style3">专业</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <select id="Select4" name="D8">
									<option>计算机科学与技术</option>
									<option>计算机科学与技术</option>
									<option>计算机科学与技术</option>
									<option>计算机科学与技术</option>
							</select>
						</tr>
						<tr>
							<td class="style2">开课时间</td>
							<td><select id="xueyuan" name="D1">
									<option>2012-2013 上学期</option>
									<option>2012-2013 下学期</option>
									<option>2013-2014 上学期</option>
									<option>2013-2014 下学期</option>
							</select><br /></td>
						</tr>
						<tr>
							<td class="style3">课程性质</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <input id="Radio1" checked="true" name="R1" type="radio" value="V1" />选修&nbsp;&nbsp;&nbsp;&nbsp;
								<input id="Radio2" checked="true" name="R1" type="radio"
								value="V1" />必修
						</tr>
						</tr>
						<tr>
							<td class="style3">课程名称</td>
							<td class="style4"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> <select id="Select1" name="D9">
									<option>--无--</option>
									<option>大学英语</option>
									<option>高等数学</option>
									<option>离散数学</option>
							</select>
						</tr>
						</tr>
						<tr>
							<td class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="style6"><script type="text/javascript">
							<!--
								google_ad_client = "ca-pub-3413404722490728";
								/* postscript728+90postscript.html */
								google_ad_slot = "9238639693";
								google_ad_width = 728;
								google_ad_height = 90;
							//-->
							</script> <script type="text/javascript">
								
							</script> &nbsp;<input id="add" type="button" value="查询" />
						</tr>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<p>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</p>


	<p>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</p>


</body>

<!-- Mirrored from www.grafikart.fr/demo/coreadmin/modal.html by HTTrack Website Copier/3.x [XR&CO'2010], Mon, 29 Aug 2011 06:37:55 GMT -->
</html>
