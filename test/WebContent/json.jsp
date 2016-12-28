<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.StringWriter"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","ckdwn123");	




String s1="select seat_use from seat";           
Statement st=conn.createStatement();
ResultSet rs= st.executeQuery(s1);
%>


<%
    Map<String, String> dummyData = new HashMap<String, String>();
	int i=1;
    while(rs.next()){
    	dummyData.put(String.valueOf(i), String.valueOf(rs.getInt(1)));
    	i++;
    }
	
   
     
    StringWriter sw = new StringWriter();
     
    // Jackson JSON Mapper 를 사용해서 Map 을 JSON 문자열로 변환
    ObjectMapper mapper = new ObjectMapper();
    mapper.writeValue(sw, dummyData);
     
    request.setAttribute("sw", sw);
%>
 
<%-- ajax 에서 넘겨준 callback 함수 파라메터 가져오기 --%>
${param.callback}(${sw});
