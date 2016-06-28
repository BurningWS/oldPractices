// 镞ユ湡阃夋嫨
// By Ziyue(http://www.web-v.com/)
// 浣跨敤鏂规硶锛?
// <script type="text/javascript" src="${pageContext.request.contextPath }/js/ShowCalendar.js"></script>
// <input name="birthday" type="text" id="birthday" title="镣瑰向阃夋嫨" onClick="showCalendar(this.id)">
	
var today; 
document.writeln("<div id='Calendar' style='position:absolute; z-index:1; visibility: hidden; filter:\"progid:DXImageTransform.Microsoft.Shadow(direction=135,color=#999999,strength=3)\"'></div>");
	

function getDays(month, year)
{ 
	var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
	//涓嬮溃镄勮繖娈典唬镰佹槸鍒ゆ柇褰揿墠鏄惁鏄棸骞寸殑 
	if (1 == month) 
	return ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28; 
	else 
	return daysInMonth[month]; 
} 

function getToday() 
{ 
	//寰楀埌浠婂ぉ镄勫勾,链?镞?
	this.now = new Date(); 
	this.year = this.now.getFullYear(); 
	this.month = this.now.getMonth(); 
	this.day = this.now.getDate(); 
}

function getStringDay(str) 
{ 
	//寰楀埌杈揿叆妗嗙殑骞?链?镞?
	var str=str.split("-")
	
	this.now = new Date(parseFloat(str[0]),parseFloat(str[1])-1,parseFloat(str[2])); 
	this.year = this.now.getFullYear(); 
	this.month = this.now.getMonth(); 
	this.day = this.now.getDate(); 
}

function newCalendar() { 
	var parseYear = parseInt(document.all.Year.options[document.all.Year.selectedIndex].value); 
	var newCal = new Date(parseYear, document.all.Month.selectedIndex, 1); 
	var day = -1; 
	var startDay = newCal.getDay(); 
	var daily = 0; 
	
	if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth())) 
		day = today.day; 

	var tableCal = document.all.calendar; 
	var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());

	for (var intWeek = 1; intWeek < tableCal.rows.length;intWeek++) 
		for (var intDay = 0;intDay < tableCal.rows[intWeek].cells.length;intDay++) 
		{ 
			var cell = tableCal.rows[intWeek].cells[intDay]; 
			if ((intDay == startDay) && (0 == daily)) 
				daily = 1; 

			if(day==daily) //浠婂ぉ锛岃皟鐢ㄤ粖澶╃殑Class 
			{
				cell.style.background='#6699CC';
				cell.style.color='#FFFFFF';
				//cell.style.fontWeight='bold';
			}
			else if(intDay==6) //锻ㄥ叚 
				cell.style.color='green'; 
			else if (intDay==0) //锻ㄦ棩 
				cell.style.color='red';

			if ((daily > 0) && (daily <= intDaysInMonth)) 
			{ 
				cell.innerText = daily; 
				daily++; 
			} 
			else 
				cell.innerText = ""; 
		} 
	} 

function GetDate(InputBox)
{ 
	var sDate; 
	//杩欐浠ｇ爜澶勭悊榧犳爣镣瑰向镄勬儏鍐?
	if (event.srcElement.tagName == "TD") 
	if (event.srcElement.innerText != "") 
	{ 
		sDate = document.all.Year.value + "-" + document.all.Month.value + "-" + event.srcElement.innerText;
		eval("document.all."+InputBox).value=sDate;
		HiddenCalendar();
	} 
} 

function HiddenCalendar()
{
	//鍏抽棴阃夋嫨绐楀彛
	document.all.Calendar.style.visibility='hidden';
}

function showCalendar(InputBox)
{
	var months = new Array("涓€链?, "浜屾湀", "涓夋湀", "锲涙湀", "浜旀湀", "鍏湀", "涓冩湀", "鍏湀", "涔濇湀", "鍗佹湀", "鍗佷竴链?, "鍗佷簩链?); 
	var days = new Array("镞?,"涓€", "浜?, "涓?, "锲?, "浜?, "鍏?); 

	var x,y,intLoop,intWeeks,intDays;
	var DivContent;
	var year,month,day;
	var o=eval("document.all."+InputBox);
	var thisyear; //鐪熸镄勪粖骞村勾浠?
	
	thisyear=new getToday();
	thisyear=thisyear.year;
	
	today = o.value;
	if(isDate(today))
	today = new getStringDay(today);
	else
	today = new getToday(); 
	
	//鏄剧ず镄勪綅缃?
	x=o.offsetLeft;
	y=o.offsetTop;
	while(o=o.offsetParent)
	{
	x+=o.offsetLeft;
	y+=o.offsetTop;
	}
	document.all.Calendar.style.left=x+2;
	document.all.Calendar.style.top=y+20;
	document.all.Calendar.style.visibility="visible";
	
	//涓嬮溃寮€濮嬭緭鍑烘棩铡呜〃镙?border-color:#9DBAF7)
	DivContent="<table border='0' cellspacing='0' style='border:1px solid #0066FF; background-color:#EDF2FC'>";
	DivContent+="<tr>";
	DivContent+="<td style='border-bottom:1px solid #0066FF; background-color:#C7D8FA'>";
	
	//骞?
	DivContent+="<select name='Year' id='Year' onChange='newCalendar()' style='font-family:Verdana; font-size:12px'>";
	for (intLoop = thisyear - 35; intLoop < (thisyear + 2); intLoop++) 
	DivContent+="<option value= " + intLoop + " " + (today.year == intLoop ? "Selected" : "") + ">" + intLoop + "</option>"; 
	DivContent+="</select>";
	
	//链?
	DivContent+="<select name='Month' id='Month' onChange='newCalendar()' style='font-family:Verdana; font-size:12px'>";
	for (intLoop = 0; intLoop < months.length; intLoop++) 
	DivContent+="<option value= " + (intLoop + 1) + " " + (today.month == intLoop ? "Selected" : "") + ">" + months[intLoop] + "</option>"; 
	DivContent+="</select>";
	
	DivContent+="</td>";
	
	DivContent+="<td style='border-bottom:1px solid #0066FF; background-color:#C7D8FA; font-weight:bold; font-family:Wingdings 2,Wingdings,Webdings; font-size:16px; padding-top:2px; color:#4477FF; cursor:hand' align='center' title='鍏抽棴' onClick='javascript:HiddenCalendar()'>S</td>";
	DivContent+="</tr>";
	
	DivContent+="<tr><td align='center' colspan='2'>";
	DivContent+="<table id='calendar' border='0' width='100%'>";
	
	//鏄熸湡
	DivContent+="<tr>";
	for (intLoop = 0; intLoop < days.length; intLoop++) 
	DivContent+="<td align='center' style='font-size:12px'>" + days[intLoop] + "</td>"; 
	DivContent+="</tr>";
	
	//澶?
	for (intWeeks = 0; intWeeks < 6; intWeeks++)
	{ 
	DivContent+="<tr>"; 
	for (intDays = 0; intDays < days.length; intDays++) 
	DivContent+="<td onClick='GetDate(\"" + InputBox + "\")' style='cursor:hand; border-right:1px solid #BBBBBB; border-bottom:1px solid #BBBBBB; color:#215DC6; font-family:Verdana; font-size:12px' align='center'></td>"; 
	DivContent+="</tr>"; 
	} 
	DivContent+="</table></td></tr></table>";
	
	document.all.Calendar.innerHTML=DivContent;
	newCalendar();
}

function isDate(dateStr)
{ 
	var datePat = /^(\d{4})(\-)(\d{1,2})(\-)(\d{1,2})$/;
	var matchArray = dateStr.match(datePat);
	if (matchArray == null) return false; 
	var month = matchArray[3];
	var day = matchArray[5]; 
	var year = matchArray[1]; 
	if (month < 1 || month > 12) return false; 
	if (day < 1 || day > 31) return false; 
	if ((month==4 || month==6 || month==9 || month==11) && day==31) return false; 
	if (month == 2)
	{
	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); 
	if (day > 29 || (day==29 && !isleap)) return false; 
	} 
	return true;
}