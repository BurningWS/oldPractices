<%@page import="cn.domain.Broadcast"%>
<%@page import="java.util.List"%>
<%@page import="cn.service.impl.BusinessServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
BusinessServiceImpl bsi = new BusinessServiceImpl();
List<Broadcast> list = bsi.getAllBroadcast();
request.setAttribute("list", list);
System.out.println(list);
%>
<h1>
	<img src="img/icons/posts.png" alt="" /> 鍏憡淇℃伅
</h1>
<div class="bloc">
	<div class="title"></div>
	<div class="content">
		<table>
			<thead>
				<tr>
					<th>鍏憡鍐呭</th>
					<th>镞堕棿</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list }">
					<tr>

						<td>${b.content }</td>
						<td>${b.time }</td>
						<td class="actions"><a href="" title="缂栬緫"><img
								src="img/icons/actions/edit.png" alt="" /></a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="left input">
			<!-- <select name="action" id="tableaction">
				<option value="">--镞堕棿--</option>
				<option value="">链€杩戜竴涓槦链?/option>
				<option value="">链€杩戜竴涓湀</option>
				<option value="">链€杩戜笁涓湀</option>
				<option value="">镟翠箙</option>
			</select> -->
		</div>
		<div class="pagination">
			<a href="#" class="prev">芦</a> <a href="#" class="current">1</a> <a
				href="#">2</a> ... <a href="#">21</a> <a href="#">22</a> <a href="#"
				class="next">禄</a>
		</div>
	</div>
</div>