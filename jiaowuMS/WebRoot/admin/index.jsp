<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>鏁椤姟绠＄悊绯荤粺-绠＄悊锻?/title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery AND jQueryUI -->
<script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript"
	src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>

<link rel="stylesheet" href="css/min.css">
<script type="text/javascript" src="js/min.js"></script>
<script>
	function clientSideInclude(url) {
		var req = false;
		// Safari, Firefox, 鍙婂叾浠栭潪寰蒋娴忚鍣?
		if (window.XMLHttpRequest) {
			try {
				req = new XMLHttpRequest();
			} catch (e) {
				req = false;
			}
		} else if (window.ActiveXObject) {
			// For Internet Explorer on Windows
			try {
				req = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					req = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					req = false;
				}
			}
		}
		var element = document.getElementById('content');
		if (!element) {
			alert("鍑芥暟clientSideInclude镞犳硶镓惧埌id " + id + "銆?
					+ "浣犵殑缃戦〉涓繀椤绘湁涓€涓惈链夎繖涓猧d镄刣iv 鎴?span 镙囩銆?);
			return;
		}

		req.onreadystatechange = function() {
			element.innerHTML = req.responseText;
		}

		if (req) {
			// 鍚屾璇锋眰锛岀瓑寰呮敹鍒板叏閮ㄥ唴瀹?
			req.open('GET', url, true);
			req.send();
		} else {
			element.innerHTML = "瀵逛笉璧凤紝浣犵殑娴忚鍣ㄤ笉鏀寔" + "XMLHTTPRequest 瀵硅薄銆傝繖涓綉椤电殑鏄剧ず瑕佹眰"
					+ "Internet Explorer 5 浠ヤ笂鐗堟湰, "
					+ "鎴?Firefox 鎴?Safari 娴忚鍣紝涔熷彲鑳戒细链夊叾浠栧彲鍏煎镄勬祻瑙埚櫒瀛桦湪銆?;
		}
	}
</script>
<style type="text/css">
.style1 {
	height: 30px;
}

#add {
	width: 63px;
	height: 32px;
}

#delete {
	width: 64px;
	height: 32px;
}
</style>

</head>
<body>

	<script type="text/javascript" src="content/settings/main.js"></script>
	<link rel="stylesheet" href="content/settings/style.css">


	<!--              
                HEAD
            -->
	<div id="head">
		<div class="left">
			<a href="#" class="button profile"><img
				src="img/icons/top/huser.png" alt=""></a> 镇ㄥソ,绠＄悊锻?${sessionScope.admin.id } | <a href="logout">阃€鍑虹郴缁?/a>
		</div>
		<div class="right">
		</div>
	</div>


	<!--            
                SIDEBAR
            -->
	<div id="sidebar">
		<ul>
			<li class="current"><a href="#"><img
					src="img/icons/menu/brush.png" alt="">绠＄悊瀛︾敓淇℃伅</a>
				<ul>
					<li><a href="javascript:clientSideInclude('getAllStudentInfo')">瀛︾敓淇℃伅</a></li>
					<li><a href="addStudentInfo.jsp" class="zoombox w450 h312">娣诲姞瀛︾敓淇℃伅</a></li>
					<li><a href="addStudentMajor.jsp" class="zoombox w400 h140">瀛︾敓涓扑笟娣诲姞</a></li>
					<li><a href="selectCourseSwitch.jsp" class="zoombox w400 h101">阃夎寮€鍏?/a></li>
					<li><a href="queryGrades.jsp" class="zoombox w400 h312">瀛︾敓鎴愮哗镆ヨ</a></li>
				</ul></li>
			<li><a href="#"><img src="img/icons/menu/brush.png" alt="">
					绠＄悊钥佸笀淇℃伅</a>
				<ul style="display: none;">
					<li><a href="javascript:clientSideInclude('getAllTeacherInfo')">钥佸笀淇℃伅</a></li>
					<li><a href="addTeacherInfo.jsp" class="zoombox w400 h280">娣诲姞钥佸笀淇℃伅</a></li>
					<li><a href="addTeacherPosition.jsp" class="zoombox w400 h140">娣诲姞钥佸笀鑱屼綅</a></li>
				</ul></li>
			<li><a href="#"><img src="img/icons/menu/brush.png" alt="">
					绠＄悊璇剧▼淇℃伅</a>
				<ul style="display: none;">
					<li><a href="javascript:clientSideInclude('getAllCourses')">璇剧▼淇℃伅</a></li>
					<li><a href="addCourse.jsp" class="zoombox w450 h220">娣诲姞璇剧▼</a></li>
					<li><a href="addSemester.jsp" class="zoombox w400 h140">娣诲姞瀛︽湡</a></li>
					<li><a href="DaFenSwitch.jsp" class="zoombox w400 h101">镓揿垎寮€鍏?/a></li>
				</ul></li>
				<li><a href="#"><img src="img/icons/menu/brush.png" alt="" /> 绠＄悊鍏憡淇℃伅</a>
                    <ul>
                        <li><a href="javascript:clientSideInclude('broadcastInfo.jsp')">鍏憡淇℃伅</a></li>
                        <li><a href="addBroadcast.jsp" class="zoombox w540 h140">娣诲姞鍏憡</a></li>
                    </ul>
                </li>
		</ul>
	</div>




	<!--            
              CONTENT 
          -->
	<div id="content" class="white"></div>



	<div class="_bd_ext_tip" style="visibility: hidden;">
		<span class="_bd_ext_search">鐧惧害涓€涓?/span><span class="_bd_ext_open">镓揿紑阈炬帴</span><span
			class="_bd_ext_copy">澶嶅埗</span>
	</div>
</body>
</html>