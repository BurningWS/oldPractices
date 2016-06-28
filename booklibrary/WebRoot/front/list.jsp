<%@page import="cn.domain.Category"%>
<%@page import="cn.dao.impl.CategoryDaoImpl"%>
<%@page import="cn.domain.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("cid");
request.setAttribute("cid", id);

CategoryDaoImpl cdi = new CategoryDaoImpl();
if(id != null) { 
Category c = cdi.getCategory(id);
request.setAttribute("c", c);
}

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<base href="<%=basePath%>">
<title>${c.name }</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<link href="http://fonts.useso.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
	<div class="container_wrap">
<div class="header_top">
		    <div class="col-sm-3 logo"><a href="${pageContext.request.contextPath}/front/index.jsp"><img src="images/logo.jpg" alt="" /></a></div>
		    <div class="col-sm-6 nav">
			  <ul>
				 <!-- *********************Categories************************************* -->
						<c:forEach var="c" items="${list }">
							<li><span class="simptip-position-bottom simptip-movable"
								data-tooltip="${c.name }"><a href="${pageContext.request.contextPath}/servlet/UIServlet?method=getAll&cid=${c.id }" target="_blank">
								</a> </span></li>
						</c:forEach>
				<!-- *********************Categories************************************* -->
			 </ul>
			</div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
	
				<c:choose>
						   <c:when test="${user != null }">  
						       <c:out value="娆㈣繋镇紝${user.username }"></c:out>
						       <a href="../servlet/UserServlet?method=quit">娉ㄩ攒</a>
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
			<div class="clearfix"> </div>
	      </div>
	      <div class="content">
	   	   <h2 class="m_3">${c.name }</h2>
      	       <div class="movie_top">
      	         <div class="col-md-9 movie_box">
                        
                      <c:forEach var="b" items="${pb.list }">
                      <div class="movie movie-test movie-test-dark movie-test-left">
                          <div class="movie__images">
                              <a href="${pageContext.request.contextPath}/front/single.jsp?id=${b.id }" target="_blank" class="movie-beta__link">
                                  <img alt="${b.name }" src="${pageContext.request.contextPath}/img/bookcover/${b.id }.jpg" width="306" height="350" class="img-responsive">
                              </a>
                          </div>
                          <div class="movie__info">
                              <a href="${pageContext.request.contextPath}/front/single.jsp?id=${b.id }" target="_blank" class="movie__title"> ${b.name }</a>
                              <br><br>
                              
                          	    浣滆€? ${b.author }
                          	    
                          	  <br>
                              <br>
                              <p class="movie__option">
                              	绫诲埆锛?c:forEach var="c" items="${b.categories }" >
                             		 <a href="../servlet/UIServlet?method=getAll&cid=${c.id }" target="_blank">${c.name }</a> |  
                              	</c:forEach>
                              </p><br>
                              <p class="movie__option">
                              	鍑虹増绀撅细 ${b.publisher }
                              </p><br>
                              <ul class="list_6">
                                  <li><i class="icon1"> </i><p><%=(int)(Math.random()*10000) %></p></li>
                                  <li><i class="icon3"> </i><p><%=(int)(Math.random()*1000) %></p></li>
                                  <br>
                                  <li>璇勪环 : &nbsp;&nbsp;<p><img src="images/rating1.png" alt=""></p></li>
                                  <div class="clearfix"> </div>
                              </ul>
                          </div>
                          <div class="clearfix"> </div>
                      </div>
                      </c:forEach>
                         

                      </div>
                  
                      <br>
                      
                      <div class="clearfix"> </div>
</div>
		<!-- *************************pageSeparate********************* -->
		<div id="pagination" style="display: block;">
							<div class="pagination">
								<span class="current prev"><a href="javascript:void(0)"
									onclick="gotopage(${pb.previouspage})">涓娄竴椤?/a></span>
								<%
									PageBean pb = (PageBean)request.getAttribute("pb");
								pb.getTotalpage();
								%>
								<!-- ***************阕佺⒓********************** -->
								<c:forEach var="i" items="${pb.pagebar }">
									<c:if test="${i==pb.currentpage }">
										<span class="current">${i }</span>
									</c:if>
									<c:if test="${i!=pb.currentpage }">
										<a href="javascript:void(0)" onclick="gotopage(${i})">${i }</a>
									</c:if>
								</c:forEach>
								<!-- ************************************* -->
								<a href="javascript:void(0)" onclick="gotopage(${pb.nextpage})"
									class="next">涓嬩竴椤?/a>
							</div>
						</div>
</div>
</div>
<script type="text/javascript">
function gotopage(currentpage) {
	if (currentpage > ${pb.totalrecord} || currentpage < 1) {
		alert('wrong input...');
	} else { 
		window.location.href = '${pageContext.request.contextPath}/servlet/UIServlet?method=${method}<%=id==null?"":"&cid="+id%>&currentpage='+ currentpage + '&name=${name}';
		}
	}
</script>
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
					<img src="images/f_logo.png" alt="">
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
				      <p>娆㈣繋鑱旗郴婀栧寳澶у镄勬垜浠?/p>
			        </div>
		     </div>
		    <div class="clearfix"> </div>
	        </div>
	        <div class="clearfix"> </div>
		</div>
	</div>
  </footer>
</div>		

</div><div class="_bd_ext_tip _bd_ext_search_mode" style="visibility: hidden; left: 711px; top: 297px;"><span class="_bd_ext_search">鐧惧害涓€涓?/span><span class="_bd_ext_open">镓揿紑阈炬帴</span><span class="_bd_ext_copy">澶嶅埗</span></div></body></html>