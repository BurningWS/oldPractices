<%@page import="cn.domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List<HttpSession> list = (List<HttpSession>) request
			.getServletContext().getAttribute("sessions");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>镞犳爣棰樻枃妗?/title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
<style type="text/css"></style>
</head>

<body>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td height="30"><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>
							<tr>
								<td height="24" bgcolor="#353c44"><table width="100%"
										border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td width="6%" height="19" valign="bottom"><div
																		align="center">
																		<img src="images/tb.gif" width="14" height="14">
																	</div></td>
																<td width="94%" valign="bottom"><span
																	class="STYLE1"> 鍦ㄧ嚎鐢ㄦ埛淇℃伅鍒楄〃</span></td>
															</tr>
														</tbody>
													</table></td>
												<td><div align="right">
														<span class="STYLE1"> &nbsp;</span>
													</div></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellpadding="0"
						cellspacing="1" bgcolor="#a8c7ce">
						<tbody>
							<tr>

								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">鐢ㄦ埛鍚?/span>
									</div></td>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">鐢ㄦ埛瑙掕壊</span>
									</div></td>

								<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">瀵嗙爜</span>
									</div></td>
								<td width="27%" height="20" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">闾</span>
									</div></td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div
										align="center">
										<span class="STYLE10">鍩烘湰鎿崭綔</span>
									</div></td>
							</tr>


							<%
								for (Iterator<HttpSession> i = list.iterator(); i.hasNext();) {
									HttpSession s = i.next();

									User u = (User)s.getAttribute("user");
									if (u != null) {
							%>
										<tr>
										<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
												align="center"><%=u.getUsername() %></div></td>
										<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
												align="center"><%=u.isAdmin()?"绯荤粺绠＄悊锻?:"鏅€氱敤鎴? %></div></td>

										<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
												align="center"><%=u.getPassword() %></div></td>
										<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
												align="center"><%=u.getEmail() %></div></td>
										<td height="20" bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE21"><a href=<%="servlet/UserServlet?method=delete&id="+ u.getId()%>>鍒犻櫎</a>
												 | <a href=<%="servlet/UserServlet?method=forUpdate&id="+ u.getId()%>>镆ョ湅</a></span>
											</div></td>
									</tr>
							<%
									}
								}
							%>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td height="30"><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>
							<tr>
								<td width="33%"><div align="left">
										<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;鍏辨湁<strong>
												243</strong> 鏉¤褰曪紝褰揿墠绗?strong> 1</strong> 椤碉紝鍏?<strong>10</strong> 椤?
										</span>
									</div></td>
								<td width="67%"><table width="312" border="0" align="right"
										cellpadding="0" cellspacing="0">
										<tbody>
											<tr>








											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>


	<div class="_bd_ext_tip _bd_ext_search_mode"
		style="visibility: hidden; left: 152px; top: 24px;">
		<span class="_bd_ext_search">鐧惧害涓€涓?/span><span class="_bd_ext_open">镓揿紑阈炬帴</span><span
			class="_bd_ext_copy">澶嶅埗</span>
	</div>
</body>
</html>