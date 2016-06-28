<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>
<title>镞犳爣棰樻枃妗?/title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<script language="javascript">
	jQuery().ready(function(){
		jQuery('#navigation').accordion({
			header: '.head',
			navigation1: true, 
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'
		});
	});
</script>
<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
<div  style="height:100%;">
  <ul id="navigation">
    <li> <a class="head">涔︾睄绠＄悊</a>
      <ul>
        <li><a href="${basePath}/servlet/BookServlet?method=addBookUI" target="rightFrame">娣诲姞涔︾睄</a></li>
        <li><a href="${basePath}/servlet/BookServlet?method=listBook" target="rightFrame">镆ョ湅/淇敼涔︾睄</a></li>
      </ul>
    </li>
    <li> <a class="head">鍒嗙被绠＄悊</a>
      <ul>
        <li><a href="${basePath}/servlet/CategoryServlet?method=addCategoryUI" target="rightFrame">娣诲姞鍒嗙被</a></li>
        <li><a href="${basePath}/servlet/CategoryServlet?method=listCategory" target="rightFrame">镆ョ湅/鍒犻櫎鍒嗙被</a></li>
      </ul>
    </li>
    <li> <a class="head">鐢ㄦ埛绠＄悊</a>
      <ul>
        <li><a href="${basePath}/servlet/UserServlet?method=getAll" target="rightFrame">镆ョ湅鐢ㄦ埛</a></li>
      </ul>
    </li>
    <li> <a class="head">鏂伴椈绠＄悊</a>
      <ul>
        <li><a href="${basePath}/back/addnews.jsp" target="rightFrame">娣诲姞鏂伴椈</a></li>
        <li><a href="${basePath}/back/listnews.jsp" target="rightFrame">镆ョ湅鏂伴椈</a></li>
      </ul>
    </li>
    <li> <a class="head">鐗堟湰淇℃伅</a>
      <ul>
        <li><a href="#" >V1.0</a></li>
      </ul>
    </li>
  </ul>
</div>
</body>
</html>
