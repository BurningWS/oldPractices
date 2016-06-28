<%@page import="cn.utils.MD5Util"%>
<%@page import="cn.domain.StudentM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
StudentM sm = (StudentM)request.getAttribute("sm");
String sid = sm.getS().getId();
%>
<html>
<head>
<title></title>
<style type="text/css">
td {
	text-align: center;
}
</style>
</head>
<body>

	<input type="hidden" name="xs0101id" value="2013221104210017">
	<table id="xjkpTable" width="720" border="1px"
		style="border-collapse:collapse; table-layout:fixed" align="center">
		<tbody>
			<tr>
				<td width="80px"></td>
				<td width="74px"></td>
				<td width="64px"></td>
				<td width="96px"></td>
				<td width="144px"></td>
				<td width="144px"></td>
				<td width="90px"></td>
				<td width="54px"></td>

			</tr>


			<tr>
				<td colspan="8" align="center"
					style="font-weight:bold; font-size:16px;">瀛?nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绫?nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;鍗?nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;鐗?/td>
			</tr>
			<tr>
				<td>闄㈢郴</td>
				<td>${sm.department }</td>
				<td>涓扑笟</td>
				<td>${sm.s.major }</td>
				<td>瀛﹀埗</td>
				<td>${sm.years }</td>
				<td>鐝骇</td>
				<td>${sm.clazz }</td>


			</tr>
			<tr>
				<td>濮揿悕</td>
				<td>${sm.s.name}</td>
				<td>镐у埆</td>
				<td>${sm.s.male==true?'鐢?:'濂?}</td>
				<td>瀛﹀佛</td>
				<td>${sm.s.id}</td>
				<td colspan="2" rowspan="5"><img alt="镦х墖"
					src="http://jwxt.hubu.edu.cn/uploadfile/studentphoto/pic/<%= MD5Util.encode(sid)%>.JPG"
					style="width:78px; height:110px;"></td>
			</tr>
			<tr>
				<td>鍑虹敓镞ユ湡</td>
				<td>${sm.s.birthday}</td>
				<td>濠氩惁</td>
				<td>${sm.married==true?'宸插':'链'}</td>
				<td>链汉鐢佃瘽</td>
				<td>${sm.s.phone }</td>
			</tr>
			<tr>
				<td>涓扑笟鏂瑰悜</td>
				<td colspan="2">&nbsp;</td>
				<td>鏀挎不闱㈣矊</td>
				<td colspan="2">&nbsp;鍏遍潚锲㈠憳</td>
			</tr>
			<tr>
				<td>绫嶈疮</td>
				<td colspan="5">${sm.origin}</td>
			</tr>
			<tr>
				<td>鍏ュ厷锲㈡椂闂?/td>
				<td colspan="3">&nbsp;</td>
				<td>姘戞棌</td>
				<td>${sm.nation }</td>
			</tr>
			<tr>
				<td>瀛︿范褰㈠纺</td>
				<td>&nbsp;</td>
				<td>瀛︿范灞傛</td>
				<td colspan="2">&nbsp;${sm.layer}</td>
				<td>澶栬绉岖被</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>瀹跺涵鐜颁綇鍧€</td>
				<td colspan="4">&nbsp;</td>
				<td>涓嬭溅鐏溅绔?/td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>闾敛缂栫爜</td>
				<td>${sm.postcode }</td>
				<td>瀹跺涵鐢佃瘽</td>
				<td colspan="2">${sm.homephone}</td>
				<td>鑱旗郴浜?/td>
				<td colspan="2">${sm.contact}</td>
			</tr>
			<tr>
				<td colspan="8" style="font-size:14px">瀛?nbsp;&nbsp;&nbsp;涔?nbsp;&nbsp;&nbsp;鍙?nbsp;&nbsp;&nbsp;宸?nbsp;&nbsp;&nbsp;浣?nbsp;&nbsp;&nbsp;绠€&nbsp;&nbsp;&nbsp;铡?/td>
			</tr>
			<tr>
				<td colspan="2">璧锋骞存湀</td>
				<td colspan="4" style="center">瀛?nbsp;&nbsp;&nbsp;镙?nbsp;&nbsp;&nbsp;鎴?nbsp;&nbsp;&nbsp;宸?nbsp;&nbsp;&nbsp;浣?nbsp;&nbsp;&nbsp;鍗?nbsp;&nbsp;&nbsp;浣?/td>
				<td colspan="2">鑱屽姟</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="4">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>




			<tr>
				<td>澶勫垎镞ユ湡</td>
				<td colspan="2">澶勫垎鍚岖О</td>
				<td colspan="3">澶勫垎鍗曚綅</td>
				<td colspan="2">澶勫垎铡熷洜</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">&nbsp;</td>
				<td colspan="3">&nbsp;</td>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>鍏ュ镞ユ湡</td>
				<td colspan="3">&nbsp;${sm.daytoschool }</td>
				<td>姣曚笟镞ユ湡</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td>鍏ュ钥冨佛</td>
				<td colspan="3">&nbsp;${sm.ruxuekaohao }</td>
				<td>韬唤璇佺紪鍙?/td>
				<td colspan="3">&nbsp;${sm.s.idcard }</td>
			</tr>
			<tr>
				<td>姣?缁?涓氲瘉涔﹀佛</td>
				<td colspan="3">&nbsp;</td>
				<td>瀛﹀＋璇佷功鍙?/td>
				<td colspan="3">&nbsp;</td>
			</tr>
		</tbody>
	</table>
	<br>
	<iframe id="iframe" name="iframe" style="display:none"></iframe>






</body>
</html>