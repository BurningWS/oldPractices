<%@page import="cn.dao.impl.BookDaoImpl"%>
<%@page import="cn.service.impl.BusinessServiceImpl"%>
<%@page import="cn.domain.Book"%>
<%@page import="cn.domain.PageBean"%>
<%@page import="cn.domain.QueryInfo"%>
<%@page import="cn.domain.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BusinessServiceImpl bs = new BusinessServiceImpl();
	List<Category> list = bs.getAllCategories();
	request.setAttribute("list", list);
	
	QueryInfo qi = new QueryInfo();
	qi.setCurrentpage(1);
	qi.setPagesize(8);
	PageBean<Book> pb = bs.queryBook(qi);
	List<Book> books = pb.getList();
	
	String id = request.getParameter("id");
	BookDaoImpl bdi = new BookDaoImpl();
	Book b = bdi.find(Integer.parseInt(id));
	request.setAttribute("b", b);

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<base href="<%=basePath%>">
<title>Single</title>
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
    <style type="text/css">
.body-wrapper .para{font-size:14px;word-wrap:break-word;color:#333;margin-bottom:15px;text-indent:2em;line-height:24px;zoom:1}.body-wrapper sup{position:relative;top:-.5em;line-height:0;font-size:75%;vertical-align:baseline;cursor:default}
        .style1
        {
            font-size: 14px;
            color: #000000;
        }
        </style>
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
								data-tooltip="${c.name }"><a href=../servlet/UIServlet?method=getAll&cid=${c.id }" target="_blank">
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
      	   <div class="movie_top">
      	         <div class="col-md-9 movie_box">
                        <div class="grid images_3_of_2">
                        	<div class="movie_image">
                                <span class="movie_rating">5.0</span>
                                <img src="../img/bookcover/${b.id }.jpg" class="img-responsive" alt="${b.name }">
                            </div>
                            <div class="movie_rate">
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                        <div class="para">
                            涔?鍚嶏细${b.name }<br>
                            浣?钥咃细${b.author }<br>
                            绫?鍨嬶细<c:forEach var="c" items="${b.categories }">${ c.name} | </c:forEach> <br>
                            鍑虹増镞堕棿锛?{b.pdate }<br>
                            鍑虹増绀撅细${b.publisher }<br>
                            婕敾绠€浠嬶细<br>
&nbsp;&nbsp;&nbsp;
                          ${b.description }</div>
                           
		                <div class="single">
		                <h1>鏂颁功阃熼€?/h1>
		                <ul class="single_list">
					        <li>
					            <div class="preview">
                                <a href="single.html"><img src="images/杩介绛濈殑浜?jpg" class="img-responsive" alt=""></a></div>
					            <div class="data">
					                <div class="para">
                                        涔?鍚嶏细杩介绛濈殑浜?br>
                                        浣?钥咃细鍗″嫆寰仿疯儭璧涘凹锛圞haled Hosseini锛?
                                        <br>
                                        绫?鍒细闀跨瘒灏忚<br>
                                        鍑虹増镞堕棿锛?003骞?br>
                                        鍐呭绠€浠嬶细<br>
&nbsp;&nbsp; 銆婅拷椋庣瓭镄勪汉銆嬫槸阒垮瘜姹楁柉鍧︿綔瀹跺搱鍒╁痉路渚禌灏硷纸Khaled Hosseini锛夌殑绗竴閮ㄥ皬璇达紝浜?003骞村嚭鐗堬紝鏄编锲?005骞寸殑鎺掑悕绗笁镄勬渶鐣呴攒涔︺€?br>
&nbsp;&nbsp; 鍏ㄤ功锲寸粫椋庣瓭涓庨樋瀵屾困涓や釜灏戝勾涔嬮棿灞曞紑锛屼竴涓瘜瀹跺皯骞翠笌瀹朵腑浠嗕汉鍏充簬椋庣瓭镄勬晠浜嬶紝鍏充簬浜烘€х殑鑳屽弥涓庢晳璧庛€?/div>
					                <p>&nbsp;</p>
					            </div>
					            <div class="clearfix"></div>
					        </li>
					         
					         
					     	
					        <li>
					            <a href="single.html"></a><div class="preview"><a href="single.html"></a><a href="#"><img src="images/镫煎浘鑵?jpg" class="img-responsive" alt=""></a></div>
					            <div class="data">
                                     涔?鍚嶏细镫煎浘鑵?br>
                                     浣?钥咃细濮沧垘
                                     <br>
                                     绫?鍒细闀跨瘒灏忚 <br>
                                     鍑虹増镞堕棿锛?004骞?链?br>
                                     鍐呭绠€浠嬶细<br>
&nbsp;&nbsp; 銆婄嫾锲捐吘銆嬫槸涓€閮ㄤ互镫间负鍙栾堪涓讳綋镄勫皬璇达紝璁茶堪浜嗕笂涓笘绾叚涓冨崄骞翠唬涓€浣岖煡闱掑湪鍐呰挋鍙よ崏铡熸彃阒熸椂涓庤崏铡熺嫾銆佹父鐗ф皯镞忕浉渚濈浉瀛樼殑鏁呬簨銆?br>
					            </div>
					            <div class="clearfix"></div>
					        </li>
			  			</ul>
                      </div>
                      </div>
                       
                      <div class="clearfix"> </div>
                  </div>
           </div>
    </div>
</div>
<div class="container"> 
 <footer id="footer">
 	<div id="footer-3d">
		<div class="gp-container">
			<span class="first-widget-bend"> </span>
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

<div class="_bd_ext_tip _bd_ext_search_mode" style="visibility: hidden; left: 175px; top: 912px;"><span class="_bd_ext_search">鐧惧害涓€涓?/span><span class="_bd_ext_open">镓揿紑阈炬帴</span><span class="_bd_ext_copy">澶嶅埗</span></div></body></html>