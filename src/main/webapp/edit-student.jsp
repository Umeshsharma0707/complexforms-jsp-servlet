<%@page import="complexforms.entities.Student"%>
<%@page import="complexforms.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complex form</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<h1 style="text-align: center">Student Profile</h1>
	<hr>
	<!-- ==================++++++++++++++++++++++++++++++++++++ -->
	<!-- getting student -->

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	%>
	<%
	Student student = (Student) StudentDao.getStudent(id);
	%>
	<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
	
	<div class="container mt-5">
		<h3><a href="all-students.jsp">Show All Students</a></h3>
		<h2>Student Update </h2>
		
		<% String updateMsg = (String)request.getAttribute("updateMsg"); %>
		<% if(updateMsg != null){ %>
			<span style="color: red;background: beige;"> <%out.print(updateMsg); %> </span><br>
			<span style="color: red;background: beige;">you can check in all students table</span>
		<%} %>
		<!-- +++++++++++++++++++++++++++++++++++++++++++++++ -->

		<form action="StudentRegistrationServlet" method="post">

			<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++ -->

			<input type="hidden" id="id" name="id" value="<%=student.getId()%>">

			<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++ -->
			<div class=" form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" name="name" id="name"
					value="<%=student.getName()%>" placeholder="Enter your name">
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" name="email" id="email"
					value="<%=student.getEmail()%>" placeholder="Enter your email">
			</div>
			<div class="form-group">
				<label for="DOB">D.O.B:</label> <input type="date"
					class="form-control" name="dob" id="DOB" value="<%=student.getDOB()%>"
					placeholder="Enter your DOB">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" name="password" id="password"
					value="<%=student.getPassword()%>" placeholder="Enter your password">
			</div>
			<div class="form-group">
				<label for="select">select semester</label> <select
					class="form-control" id="select" name="semester">
					<option value="sem-1"
						<%="sem-1".equals(student.getSemester()) ? "selected" : ""%>>sem-1</option>
					<option value="sem-2"
						<%="sem-2".equals(student.getSemester()) ? "selected" : ""%>>sem-2</option>
					<option value="sem-3"
						<%="sem-3".equals(student.getSemester()) ? "selected" : ""%>>sem-3</option>
					<option value="sem-4"
						<%="sem-4".equals(student.getSemester()) ? "selected" : ""%>>sem-4</option>
					<option value="sem-5"
						<%="sem-5".equals(student.getSemester()) ? "selected" : ""%>>sem-5</option>
					<option value="sem-6"
						<%="sem-6".equals(student.getSemester()) ? "selected" : ""%>>sem-6</option>
				</select>
			</div>
			<div class="card">
				<h6 style="margin: 5px">Subjects</h6>
				<div class="card-body">



					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="subjects"
							value="Java" id="flexCheckChecked" <%= student.getSubjects().contains("Java") ? "checked" : "" %>>  <label
							class="form-check-label" for="flexCheckChecked"> Java </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="subjects"
							value="python" id="python"  <%= student.getSubjects().contains("python") ? "checked" : "" %>> <label
							class="form-check-label" for="python"> python </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="subjects"
							value="DotNet" id="DotNet"  <%= student.getSubjects().contains("DotNet") ? "checked" : "" %>> <label
							class="form-check-label" for="DotNet"> DotNet </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="subjects"
							value="flutter" id="flutter"  <%= student.getSubjects().contains("flutter") ? "checked" : "" %>> <label
							class="form-check-label" for="flutter"> flutter </label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>Gender</label>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="male" value="male" <%= "male".equals(student.getGender()) ? "checked" : "" %> > <label
						class="form-check-label" for="male">male</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="female" value="female" <%= "female".equals(student.getGender()) ? "checked" : "" %>> <label
						class="form-check-label" for="female">female</label>
				</div>

			</div>
			<button type="submit" name="action" value="update student"
				class="btn btn-primary">Submit</button>
		</form>
	</div>
	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
