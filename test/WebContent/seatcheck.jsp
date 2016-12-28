<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","ckdwn123");	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 

<head> 

<mata name="viewport" content="width=device-width,initial-scale=1"></mata>

</head> 
 <style type="text/css">
	html { 
	background: url("bg4.jpg") no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
table{
background-color: rgba( 213, 213, 213, 0.7 );
}
</style>
<body> 
<br>

	<h2 align="center" style="color:black"> 카페 좌석 현황 </h2> 

	



<p align="center" style="color:black">좌석 배치도 </p>
<p align="center" style="color:black">white=사용가능  /  gray=사용 불가</p>
<section> 

<table align="center" border="1" width="90%" height="100%">
	
	<tr>
	<td id="1" colspan='2' rowspan='5' width="10%" align="center" onclick="buttonColor('1');">1</td>
	<td width="5%" style=border:0px  rowspan='9'></td>
	<td  colspan='8' rowspan='6' align="center" width="25%" bgcolor="black" style="color:white">--카운터--</td>
	<td  width="5%" style=border:0px rowspan='11'></td>
	<td id="5" colspan='2' rowspan='2' width="8%" align="center" onclick="buttonColor('5');">5</td>
	<td width="5%" style=border:0px rowspan='11'></td>
	<td id="6" width="12%" colspan='2' rowspan='2' align="center" onclick="buttonColor('6');">6</td>
	<td width="5%" style=border:0px rowspan='11'></td>
	<td id="8" width="12%" colspan='2' rowspan='2' align="center" onclick="buttonColor('8');">8</td>
	<td width="5%" style=border:0px rowspan='11'></td>	
	<td width="5%" style=border:0px></td>
	</tr>
	
	<tr>
	<td  style=border:0px>&nbsp;</td>
	</tr>

	
	<tr>
	<td  style=border:0px colspan='2' rowspan='2'></td>	
	<td  style=border:0px colspan='2' rowspan='2'></td>	
	<td  style=border:0px colspan='2' rowspan='2'></td>
	<td id="11" align="center" onclick="buttonColor('11');">11</td>
	</tr>
	
	
	<tr>	
	<td  style=border:0px >&nbsp;</td>
	</tr>
	
	
	<tr>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px>&nbsp;</td>
	<td id="7" colspan='2' rowspan='2' align="center" onclick="buttonColor('7');">7</td>
	<td id="9" colspan='2' rowspan='2' align="center" onclick="buttonColor('9');">9</td>	
	<td id="12" align="center" onclick="buttonColor('12');">12</td>
	</tr>
	
	
	<tr>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px >&nbsp;</td>
	</tr>
	
	
	
	<tr>
	<td  style=border:0px>&nbsp;</td>
	<td  style=border:0px>&nbsp;</td>	
	<td  style=border:0px colspan='8' rowspan='3'></td>
	<td  style=border:0px colspan='2' rowspan='3'></td>	
	<td  style=border:0px colspan='2' rowspan='3'></td>
	<td  style=border:0px colspan='2' rowspan='3'></td>
	<td style=border:0px ></td>
	</tr>
	
	
	
	<tr>
	<td id="2" colspan='2' rowspan='4' align="center" onclick="buttonColor('2');">2</td>
	<td  style=border:0px>&nbsp;</td>	
	</tr>
	
	
	
	<tr>	
	<td id="13" align="center" onclick="buttonColor('13');">13</td>
	</tr>
	
	
	
	<tr>	
	<td style=border:0px colspan='5' rowspan='2'></td>	
	<td id="3" width="12%" colspan='2' rowspan='2' align="center" onclick="buttonColor('3');">3</td>	
	<td id="4" width="12%" colspan='2' rowspan='2' align="center" onclick="buttonColor('4');">4</td>
	<td  style=border:0px colspan='2' rowspan='2'></td>
	<td  style=border:0px colspan='2' rowspan='2'></td>
	<td id="10" colspan='2' rowspan='2' align="center" onclick="buttonColor('10');">10</td>
	<td  style=border:0px>&nbsp;</td>	
	</tr>
	
	
	
	
	
	<tr>
	<td id="14" align="center" onclick="buttonColor('14');">14</td>
	</tr>
	
	
	
	<tr>
	<td  style=border:0px colspan='1'></td>
	<td align="center" colspan='6' bgcolor="black" style="color:white">화장실</td>
	<td  style=border:0px colspan='6'></td>
	<td align="center" colspan='5' bgcolor="black" style="color:white">출입문</td>
	<td  style=border:0px colspan='3'></td>
	</tr>
	
	</table>

</section> 

</body> 

<script> 
var seats=[];
<%

//1,ture=사용가능 cyan / 0,false= 사용 불가  gray
Statement st=conn.createStatement();	
ResultSet rs=st.executeQuery("select * from seat");
%>

	
	<%while(rs.next()){%>
	var num=<%=rs.getInt(1)%>;
	var use= <%=rs.getInt(2)%>;
	
	if(use ==1){
		seats[num]=true;
		
	}
	else if(use==0){
		seats[num]=false;
	}
	<%}%>
	
function init(){
	
	for (var i=1; i<17; i++) { 
		if(seats[i]){
			
			showSeatColor(true,i);
		}
		else{
			
			showSeatColor(false,i);
		}
		
	} 
}


function reserve(bValue,sNo) { 
	
	
	var SeatNo = document.getElementById(sNo).id;
	
	seatNo = Number(SeatNo); 
	
	if(bValue) { 
		
			seats[seatNo] = true; 
			var url = "seatcheck_DB.jsp?sNo=" + SeatNo+"&use=1";
			window.open(url, "get", "height =0, width = 0  left=0, top=0 menubar=no status=no");
			
		
	} 
	else { 
		
			seats[seatNo] = false; 
			var url = "seatcheck_DB.jsp?sNo=" + SeatNo+"&use=0";
			window.open(url, "get", "height =0, width = 0  left=0, top=0 menubar=no status=no");
			
	
	} 
	
} 


function showSeatColor(bValue, seatNo) { 

	var seatld = document.getElementById(seatNo); 
	if(bValue){ 
		seatld.style.backgroundColor = 'white'; 
	}
	else{ 

		seatld.style.backgroundColor = '#747474'; 
	}
} 


function buttonColor(seatNo) { 
	
	var seatld = document.getElementById(seatNo); 
	if(seats[seatNo]){ 
		reserve(false,seatNo);
		seatld.style.backgroundColor = 'gray'; 
	}
	else{ 
		reserve(true,seatNo);
		seatld.style.backgroundColor = 'white'; 
	}
	
} 
window.onload = function(){
init();
}
</script>
</html> 

