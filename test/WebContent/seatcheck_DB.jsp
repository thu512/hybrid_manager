<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","ckdwn123");	


int sNo=Integer.parseInt(request.getParameter("sNo"));
int use=Integer.parseInt(request.getParameter("use"));

String s1="update seat set seat_use = "+use+" where seat_no="+sNo;            
Statement st=conn.createStatement();
int i = st.executeUpdate(s1);                          


    
%>


            
<script>window.close();</script>
   



