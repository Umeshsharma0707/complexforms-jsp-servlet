<%@page import="complexforms.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete student page</title>
</head>
<body>
	<%int id = Integer.parseInt(request.getParameter("id")); %>
	<% StudentDao.deleteStudent(id); %>
	<% response.sendRedirect("all-students.jsp"); %>
	
</body>
</html>