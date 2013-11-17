<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
//javax.servlet.http.HttpSession mySession=request.getSession();
//mySession.invalidate();
session.removeAttribute("admin");
response.sendRedirect("Admin_login");
%>
