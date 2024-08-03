<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>
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
	<h1 style="text-align: center">Complex form</h1>
	<hr>
		<div class="container">
			<a href="all-students.jsp">get all students</a>
		</div>
	<% String msg = (String)request.getAttribute("msg"); %>
	<%if(msg!=null){ %>
	 <p><%out.print(msg); %></p>
	 <%} %>
	<div class="container mt-5">
		<h2>Student Registration Form</h2>
		<form action="StudentRegistrationServlet" method="post">
			<div class=" form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" name="name" id="name" placeholder="Enter your name">
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" name="email" id="email" placeholder="Enter your email">
			</div>
			<div class="form-group">
				<label for="DOB">D.O.B:</label> <input type="date"
					class="form-control" name="dob" id="DOB" placeholder="Enter your DOB">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" name="password" id="password"
					placeholder="Enter your password">
			</div>
			<div class="form-group">
				<label for="select">select semester</label> <select
					class="form-control" id="select" name="semester">
					<option value="sem-1">sem-1</option>
					<option value="sem-2">sem-2</option>
					<option value="sem-3">sem-3</option>
					<option value="sem-4">sem-4</option>
					<option value="sem-5">sem-5</option>
					<option value="sem-6">sem-6</option>
				</select>
			</div>
			<div class="card">
			<h6 style="margin: 5px">Subjects</h6>
				<div class="card-body">
					
			
			
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="subjects" value="Java"
					id="flexCheckChecked" checked> <label
					class="form-check-label" for="flexCheckChecked"> 
					Java </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox"  name="subjects"  value="python"
					id="python" > <label
					class="form-check-label" for="python"> 
					python </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox"  name="subjects"  value="DotNet"
					id="DotNet" > <label
					class="form-check-label" for="DotNet"> 
					DotNet </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox"  name="subjects"  value="flutter"
					id="flutter" > <label
					class="form-check-label" for="flutter"> 
					flutter </label>
			</div>
				</div>
			</div>
			<div class="form-group">
				<label>Gender</label>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="male" value="male" checked> <label
						class="form-check-label" for="male">male</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="female" value="female"> <label
						class="form-check-label" for="female">female</label>
				</div>
				
			</div>
			<button type="submit" name="action" value="add student" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<br>

<br><br><br><br><br>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
