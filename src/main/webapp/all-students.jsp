<%@page import="complexforms.dao.StudentDao"%>
<%@page import="complexforms.entities.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">

<h1><a href="index.jsp">add students</a></h1>
	<br>
    <h2>All Students List</h2>
   
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id </th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Semester</th>
                    <th>Subjects</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <%List<Student> students = StudentDao.getAllStudents();%>
            <%if(!students.isEmpty()) {%>
            <%for(Student student : students){ %>
                <tr>
                    <td><%=student.getId() %></td>
                    <td><%=student.getName() %></td>
                    <td><%=student.getEmail() %></td>
                    <td><%=student.getPassword() %></td>
                    <td><%=student.getSemester() %></td>
                    <td><%=student.getSubjects() %></td>
                    <td><%=student.getDOB()%></td>
                    <td><%=student.getGender()%></td>
                    <td><a href="edit-student.jsp?id=<%=student.getId()%>">edit</a></td>
                    <td><a href="delete-student.jsp?id=<%=student.getId()%>">delete</a></td>
                </tr>
                <%} %>
                <%}else if(students.isEmpty()) {%>
                	<h1>no students found</h1>
                <% }%>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
>