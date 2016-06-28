<%@page import="cn.domain.Teacher"%>
<%@page import="java.util.List"%>
<%@page import="cn.service.impl.BusinessServiceImpl"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BusinessServiceImpl bsi = new BusinessServiceImpl();
	List<Teacher> tlist = bsi.getAllTeachers();
	request.setAttribute("tlist", tlist);
	System.out.println(tlist);
%>
<h1>
	<img src="img/icons/posts.png" alt="" /> 课程信息
</h1>
<div class="bloc">
	<div class="title">
		<a href="#" title="删除" class="next"><img
			src="img/icons/delete.png" alt="" style="height: 22px" /></a>
	</div>
	<div class="content">
	<form action="dispatchCourse" method="post">
					
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" class="checkall" /></th>
					<th>课程名</th>
					<th>课程号</th>
					<th>学期</th>
					<th>学分</th>
					<th>教室</th>
					<th>上课时间</th>
					<th>上课老师</th>
					<th>分配课程</th>
				</tr>
			</thead>
			<tbody>
				<%
					Random r = new Random();
				%>
				<c:forEach var="c" items="${list }">
				<input type="hidden" name="cid" value="${c.id }">
					<tr>
						<td><input type="checkbox" /></td>
						<td>${c.name }</td>
						<td>${c.id }</td>
						<td>${c.semester }</td>
						<td>4</td>
						<td>教<%=r.nextInt(6) + 1%>-101
						</td>
						<td>周一1-2节</td>
						
							<td><select name="tid">
									<option value="0">-请选择-</option>
									<c:forEach var="t" items="${tlist }">
										<option value="${t.id }">${t.name }</option>
									</c:forEach>
							</select></td>
						<td class="actions"><input type="submit" value="提交">
							 <!-- </a><a href="javascript:void(0)"
							title="删除"><img src="img/icons/actions/delete.png" alt="" /></a> --></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		</form>
		<div class="left input">
			<!-- <select name="action" id="tableaction">
				<option value="">--学院--</option>
				<option value="">计算机与信息工程学院</option>
			</select> -->
		</div>
		<div class="pagination">
			<a href="#" class="prev">?</a> <a href="#" class="current">1</a> <a
				href="#">2</a> ... <a href="#">21</a> <a href="#">22</a> <a href="#"
				class="next">?</a>
		</div>