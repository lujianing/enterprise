<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String activecode = request.getParameter("activecode");
	out.print(name+":"+activecode);
	
 %>
 <a href="/enterprise/User_activetype?name=<%=name%>">点击</a>
