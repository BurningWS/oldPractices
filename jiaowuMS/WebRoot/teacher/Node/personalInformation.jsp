<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3<!DOCTYPE html PUBLIC " ->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        td {
            text-align: center;
        }
    </style>
</head>
<body>

    <input type="hidden" name="xs0101id" value="2013221104210017" />
    <table id="xjkpTable" width="720" border="1px" style="border-collapse:collapse; table-layout:fixed" align="center">
        <tr>
            <td colspan="7" align="center" style="font-weight:bold; font-size:16px;">教&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;息</td>
        </tr>
        <tr>
            <td>院系</td>
            <td></td>
            <td>姓名</td>
            <td>${t.name }</td>
            <td>性别</td>
            <td>${t.male==true?'男':'女' }</td>
            <td rowspan="3"><img alt="照片" src="/uploadfile/studentphoto/pic/d28860373637b92362e15ee8d7e0fed6.JPG" style="width:78px; height:110px;" /></td>
        </tr>
        <tr>
            <td>职称</td>
            <td>${t.position }</td>
            <td >职工号</td>
            <td colspan ="2">&nbsp;${t.id }</td>
            
            
        </tr>
        <tr>
            <td>出生日期</td>
            <td>&nbsp;</td>
            <td>婚否</td>
            <td>&nbsp;</td>
            <td>本人电话</td>
            <td>&nbsp;</td>
        </tr>
       
        
    </table>
    <br />
    <iframe id="iframe" name="iframe" style="display:none"></iframe>




</body>
</html>