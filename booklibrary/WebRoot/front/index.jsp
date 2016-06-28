<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="cn.domain.News"%>
<%@page import="cn.domain.User"%>
<%@page import="cn.domain.Book"%>
<%@page import="cn.domain.PageBean"%>
<%@page import="cn.domain.QueryInfo"%>
<%@page import="cn.domain.Category"%>
<%@page import="cn.service.impl.BusinessServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BusinessServiceImpl bs = new BusinessServiceImpl();
	List<Category> list = bs.getAllCategories();
	request.setAttribute("list", list);
	
	List<News> allnews = bs.getAllNews();
	
	QueryInfo qi = new QueryInfo();
	qi.setCurrentpage(1);
	qi.setPagesize(8);
	PageBean<Book> pb = bs.queryBook(qi);
	List<Book> books = pb.getList();
	
	String msg = null;
	Cookie[] cookies = request.getCookies();
	boolean visit = false;
	
	for(int i=0;i<cookies.length;i++) {
		if(cookies[i].getName().equals("lastAccess") ) {
			msg = URLDecoder.decode(cookies[i].getValue(), "utf-8");
			visit = true;
			break;
		}
	}
	
	if(!visit)
		msg = "镇ㄦ槸绗竴娆＄橱褰曟湰绔?;
	String nmsg = URLEncoder.encode("镇ㄤ笂娆＄橱褰曟椂闂翠负锛?br/>" + new Date().toLocaleString(), "utf-8");
	Cookie c = new Cookie("lastAccess", nmsg);
	c.setMaxAge(60*60*24*7);
	response.addCookie(c);
	
	request.getSession();
	
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/otherjs.js"></script>
<link
	href='http://fonts.useso.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="${pageContext.request.contextPath}/front/index.jsp"><img
						src="images/logo.jpg" alt="" /></a>
				</div>
				<div class="col-sm-6 nav">
					<ul>
						<!-- *********************Categories************************************* -->
						<c:forEach var="c" items="${list }">
							<li><span class="simptip-position-bottom simptip-movable"
								data-tooltip="${c.name }"><a
									href="../servlet/UIServlet?method=getAll&cid=${c.id }"
									target="_blank"> </a> </span></li>
						</c:forEach>
						<!-- *********************Categories************************************* -->
					</ul>
				</div>
				<div class="col-sm-3 header_right">
					<ul class="header_right_box">

						<c:choose>
							<c:when test="${user != null }">
								<c:out value="娆㈣繋镇紝${user.username }"></c:out>
								<a href="../servlet/UserServlet?method=quit">娉ㄩ攒</a><br/>
								<%=msg%>
							</c:when>
							<c:otherwise>
								<span class="simptip-position-bottom simptip-movable"
									data-tooltip="鐧诲綍/娉ㄥ唽"><a href=login.html>
										<li class="last"><i class="edit"></i></li>
								</a></span>
								<div class="clearfix"></div>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">

						<%
							for (int i = 0; i < 3; i++) {
								if (allnews.size() <= i)
									break;
								News n = allnews.get(i);
						%>
						<li><a href="news.jsp?id=<%=n.getId()%>" target="_blank"><img
								src="../img/newscover/<%=n.getId()%>.jpg" class="img-responsive"
								alt="" /></a></li>
						<%
							}
						%>
					</ul>
				</div>



			</div>
			<div class="content">
				<div class="box_1">
					<h1 class="m_2">鏂颁功阃熼€?/h1>
					<div class="search">
						<form action="javascript:void(0)">
							<input id="searchKey" type="text" value="Search..."
								onFocus="this.value='';"
								onBlur="if (this.value == '') {this.value ='Search...';}">
							<input type="submit" value="" onclick="jump()">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="box_2">
					<%
						Iterator<Book> it = books.iterator();
						for (Book b = it.next(); it.hasNext();) {
					%>
					<div class="col-md-5 grid_3">
						<div class="row_1">
							<div class="col-md-6 grid_7">

								<%
									for (int i = 0; i < 2; i++) {
								%>
								<div class="grid_2">
									<a href="single.jsp?id=<%=b.getId()%>" target="_blank"> <img
										src="../img/bookcover/<%=b.getId()%>.jpg"
										class="img-responsive" alt="<%=b.getName()%>" /></a>
								</div>
								<%
									if (it.hasNext())
												b = it.next();
								%>
								<div class="grid_2 col_1">
									<a href="single.jsp?id=<%=b.getId()%>" target="_blank"><img
										src="../img/bookcover/<%=b.getId()%>.jpg"
										class="img-responsive" alt="<%=b.getName()%>" /></a>
								</div>
								<%
									if (it.hasNext())
												b = it.next();
										}
								%>
							</div>
						</div>
					</div>
					<%
						}
					%>


					<!-- ******************************** -->
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<footer id="footer">
		<div id="footer-3d">
			<div class="gp-container">
				<span class="first-widget-bend"></span>
			</div>
		</div>
		<div id="footer-widgets" class="gp-footer-larger-first-col">
			<div class="gp-container">
				<div class="footer-widget footer-1">
					<div class="wpb_wrapper">
						<img src="images/f_logo.png" alt="" />
					</div>
					<br>
					<p>缁忚绷鎴戜滑涓嶆哙锷姏缁堜簬锅氩嚭浜呜繖涓綉绔?/p>
					<p class="text">浠嶆湁璁稿锷熻兘涓嶅畲鍠勶紝甯屾湜澶у澶氩鍖呮兜</p>
				</div>
				<div class="footer_box">
					<div class="col_1_of_3 span_1_of_3">
						<h3>瀹炵敤鍒嗙被</h3>
						<ul class="first">
							<li><a href="#">铡嗗彶璁板綍</a></li>
							<li><a href="#">蹇€熸煡璇?/a></li>
							<li><a href="#">濂戒功鎺ㄨ崘</a></li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>涔︽湰淇℃伅</h3>
						<ul class="first">
							<li><a href="#">鏂颁功阃熼€?/a></li>
							<li><a href="#">鐣呴攒鐑功</a></li>
							<li><a href="#">涔︽湰绾犻敊</a></li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>鍏虫敞鎴戜滑</h3>
						<ul class="first">
							<li><a href="#">寰崥</a></li>
							<li><a href="#">寰俊</a></li>
							<li><a href="#">qq绌洪棿</a></li>
						</ul>
						<div class="copy">
							<p>
							<%
							int t = 0;
							List<HttpSession> l = (List<HttpSession>)(request.getServletContext().getAttribute("sessions"));
							if(l != null)
								t = l.size();
							%>
								<a href="javascript:void(0)">褰揿墠鍦ㄧ嚎浜烘暟:<%=t %></a>
							</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		</footer>
	</div>
</body>
</html>
