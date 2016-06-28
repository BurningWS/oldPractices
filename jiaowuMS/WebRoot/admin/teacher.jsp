<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>
			<img src="img/icons/posts.png" alt="" /> 老师信息
		</h1>
		<div class="bloc">
			<div class="title">
				<a href="#" title="删除" class="next"><img
					src="img/icons/delete.png" alt="" style="height: 22px" /></a>
			</div>
			<div class="content">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" class="checkall" /></th>
							<th>姓名</th>
							<th>性别</th>
							<th>职工号</th>
							<th>学院</th>
							<th>职称</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="t" items="${list }">
						<tr>
							<td><input type="checkbox" /></td>
							<td>${t.name }</td>
							<td>${t.male==true?'男':'女' }</td>
							<td>${t.id }</td>
							<td>计算机与信息工程学院</td>
							<td>${t.position }</td>
							<td class="actions"><a href="老师个人信息.html" title="编辑"><img
									src="img/icons/actions/edit.png" alt="" /></a><a href="#"
								title="删除"><img src="img/icons/actions/delete.png" alt="" /></a></td>
						</tr>
					</c:forEach>	
						
						
					</tbody>
				</table>
				<div class="left input">
					<!-- <select name="action" id="tableaction">
						<option value="">--学院--</option>
						<option value="">计算机与信息工程学院</option>
					</select> <select name="action" id="Select1">
						<option value="">--职称--</option>
						<option value="">讲师</option>
					</select> -->
				</div>
				<div class="pagination">
					<a href="#" class="prev">?</a> <a href="#" class="current">1</a> <a
						href="#">2</a> ... <a href="#">21</a> <a href="#">22</a> <a
						href="#" class="next">?</a>
				</div>
			</div>
		</div>