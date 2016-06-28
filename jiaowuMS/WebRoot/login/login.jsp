<%@page import="cn.domain.Broadcast"%>
<%@page import="java.util.List"%>
<%@page import="cn.service.impl.BusinessServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/login/";
	
	BusinessServiceImpl bsi = new BusinessServiceImpl();
	List<Broadcast> list = bsi.getAllBroadcast();
	request.setAttribute("list", list);
	System.out.println(list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">

<link href="css/index.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2013级计科一班第二组学生管理系统</title>
<link href="css/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="js/jQuery1.7.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var $tab_li = $('#tab ul li');
		$tab_li.hover(function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			var index = $tab_li.index(this);
			$('div.tab_box > div').eq(index).show().siblings().hide();
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		/*学生登录信息验证*/
		$("#stu_username_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入16位学号') {
				$(this).val('');
			}
		});
		$("#stu_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入16位学号');
			}
		});
		$("#stu_password_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入密码') {
				$(this).val('');
			}
		});
		$("#stu_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入密码');
			}
		});
		$("#stu_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#stu_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".stu_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".stu_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : false
		});
		/*导师登录信息验证*/
		$("#tea_username_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入16位教工号') {
				$(this).val('');
			}
		});
		$("#tea_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入16位教工号');
			}
		});
		$("#tea_password_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入密码') {
				$(this).val('');
			}
		});
		$("#tea_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入密码');
			}
		});
		$("#tea_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#tea_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".tea_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".tea_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : false
		});
		/*教务登录信息验证*/
		$("#sec_username_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入16位教务号') {
				$(this).val('');
			}
		});
		$("#sec_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入16位教务号');
			}
		});
		$("#sec_password_hide").focus(function() {
			var username = $(this).val();
			if (username == '请输入密码') {
				$(this).val('');
			}
		});
		$("#sec_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('请输入密码');
			}
		});
		$("#sec_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#sec_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".sec_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".sec_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : false
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$(".screenbg ul li").each(function() {
			$(this).css("opacity", "0");
		});
		$(".screenbg ul li:first").css("opacity", "1");
		var index = 0;
		var t;
		var li = $(".screenbg ul li");
		var number = li.size();
		function change(index) {
			li.css("visibility", "visible");
			li.eq(index).siblings().animate({
				opacity : 0
			}, 3000);
			li.eq(index).animate({
				opacity : 1
			}, 3000);
		}
		function show() {
			index = index + 1;
			if (index <= number - 1) {
				change(index);
			} else {
				index = 0;
				change(index);
			}
		}
		t = setInterval(show, 8000);
		//根据窗口宽度生成图片宽度
		var width = $(window).width();
		$(".screenbg ul img").css("width", width + "px");
	});
</script>
</head>

<body>
	<div id="tab">
		<ul class="tab_menu">
			<li class="selected">学生登录</li>
			<li>导师登录</li>
			<li>教务登录</li>
		</ul>
		<div class="tab_box">
			<!-- 学生登录开始 -->
			<div>
				<div class="stu_error_box"></div>
				<form action="studentLogin" method="post"
					class="stu_login_error">
					<div id="username">
						<label>学&nbsp;&nbsp;&nbsp;号：</label> <input type="text"
							id="stu_username_hide" name="username" value="请输入16位学号"
							nullmsg="学号不能为空！" datatype="s6-16" errormsg="学号为16位数字！"
							sucmsg="学号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="text"
							value="请输入密码!" name="password"
							onfocus="if(this.value==defaultValue) {this.value='';this.type='password'}"
							onblur="if(!value) {value=defaultValue; this.type='text';}"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="stu_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" /> <img src="images/captcha.jpg"
							title="点击更换" alt="验证码占位图" />
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 学生登录结束-->
			<!-- 导师登录开始-->
			<div class="hide">
				<div class="tea_error_box"></div>
				<form action="teacherLogin" method="post"
					class="tea_login_error">
					<div id="username">
						<label>教工号：</label> <input type="text" id="tea_username_hide"
							name="username" value="请输入16位教工号" nullmsg="教工号不能为空！"
							datatype="s6-18" errormsg="教工号范围在6~18个字符之间！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="text"
							value="请输入密码!" name="password"
							onfocus="if(this.value==defaultValue) {this.value='';this.type='password'}"
							onblur="if(!value) {value=defaultValue; this.type='text';}"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="tea_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" /> <img src="images/captcha.jpg"
							title="点击更换" alt="验证码占位图" />
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 导师登录结束-->
			<!-- 教务登录开始-->
			<div class="hide">
				<div class="sec_error_box"></div>
				<form action="adminLogin" method="post" class="sec_login_error">
					<div id="username">
						<label>教务号：</label> <input type="text" id="sec_username_hide"
							name="username" value="请输入16位教务号" nullmsg="教务号不能为空！"
							datatype="s6-18" errormsg="教务号范围在6~18个字符之间！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="text"
							value="请输入密码!" name="password"
							onfocus="if(this.value==defaultValue) {this.value='';this.type='password'}"
							onblur="if(!value) {value=defaultValue; this.type='text';}"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="sec_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" /> <img src="images/captcha.jpg"
							title="点击更换" alt="验证码占位图" />
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 教务登录结束-->
		</div>
	</div>
	<div class="bottom">13级计科一班第二组</div>
	<div class="screenbg">
		<ul>
			<li><a href="javascript:;"><img src="images/0.jpg"></a></li>
			<li><a href="javascript:;"><img src="images/1.jpg"></a></li>
			<li><a href="javascript:;"><img src="images/2.jpg"></a></li>
		</ul>
	</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>
	<div>&nbsp</div>


	<div class="Top_Record">
		<div class="record_Top">
			<p>信息发布</p>
		</div>
		<div class="topRec_List">
			<dl>
				<dd>标题</dd>
				<dd></dd>
				<dd>内容</dd>
				<dd>时间</dd>
			</dl>
			<div class="maquee">
				<ul>
					<c:forEach var="b" items="${list }">
						<font size="28">
							<li><a href="javascript:void(0)" style="color:White">
									<div>${b.id }</div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
									<div>${b.content }</div>
									<div>${b.time }</div>
							</a></li>
						</font>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>





	<script type="text/javascript">
		function autoScroll(obj) {
			$(obj).find("ul").animate({
				marginTop : "-39px"
			}, 500, function() {
				$(this).css({
					marginTop : "0px"
				}).find("li:first").appendTo(this);
			})
		}
		$(function() {
			setInterval('autoScroll(".maquee")', 1500);
			setInterval('autoScroll(".apple")', 2000);

		})
	</script>
</body>
</html>
