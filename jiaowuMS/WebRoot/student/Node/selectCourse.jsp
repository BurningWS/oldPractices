<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<frameset rows="50%,50%">

	<frame src="../getAllCourses">
	<frame src="../getTheStuCourses?sid=${sessionScope.student.id}">

</frameset>
