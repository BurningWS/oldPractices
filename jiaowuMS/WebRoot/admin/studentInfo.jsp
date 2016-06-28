<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>
	<img src="img/icons/posts.png" alt=""> 瀛︾敓淇℃伅
</h1>
<div class="bloc">
	<div class="title">
		<a href="#" title="鍒犻櫎" class="next"><img
			src="img/icons/delete.png" alt="" style="height: 22px"></a><a
			href="#" class="toggle"></a>
	</div>
	<div class="content">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" class="checkall"></th>
					<th>濮揿悕</th>
					<th>瀛﹀佛</th>
					<th>镐у埆</th>
					<th>涓扑笟</th>
					<th>骞寸骇</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${list }">
					<tr>
						<td><input type="checkbox"></td>
						<td>${s.name }</td>
						<td>${s.id }</td>
						<td>${s.male == true?'鐢?:'濂? }</td>
						<td>${s.major }</td>
						<td>${s.year }绾?/td>
						<td class="actions"><a href="涓汉淇℃伅.html" title="缂栬緫"><img
								src="img/icons/actions/edit.png" alt=""></a><a href="#"
							title="鍒犻櫎"><img src="img/icons/actions/delete.png" alt=""></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="left input">
			<!-- <div class="selector" id="uniform-tableaction">
				<span>--瀛﹂櫌--</span><select name="action" id="tableaction"
					style="opacity: 0;">
					<option value="">--瀛﹂櫌--</option>
					<option value="">璁＄畻链轰笌淇℃伅宸ョ▼瀛﹂櫌</option>
				</select>
			</div>
			<div class="selector" id="uniform-Select1">
				<span>--涓扑笟--</span><select name="action" id="Select1"
					style="opacity: 0;">
					<option value="">--涓扑笟--</option>
					<option value="">璁＄畻链虹瀛︿笌鎶€链?/option>
				</select>
			</div>
			<div class="selector" id="uniform-Select2">
				<span>--骞寸骇--</span><select name="action" id="Select2"
					style="opacity: 0;">
					<option value="">--骞寸骇--</option>
					<option value="">2012绾?/option>
				</select>
			</div> -->
		</div>
		<div class="pagination">
			<a href="#" class="prev">芦</a> <a href="#" class="current">1</a> <a
				href="#">2</a> ... <a href="#">21</a> <a href="#">22</a> <a href="#"
				class="next">禄</a>
		</div>
	</div>
</div>
