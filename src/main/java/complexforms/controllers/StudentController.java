package complexforms.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import complexforms.dao.StudentDao;
import complexforms.entities.Student;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentRegistrationServlet")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("add student")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String dobStr = request.getParameter("dob");
			String semester = request.getParameter("semester");
			String[] subjectsArr = request.getParameterValues("subjects");
			String gender = request.getParameter("gender");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = null;
			try {
				dob = sdf.parse(dobStr);
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<String> subjects = Arrays.asList(subjectsArr);

			Student student = new Student();
			student.setName(name);
			student.setEmail(email);
			student.setPassword(password);
			student.setDOB(dob);
			student.setSemester(semester);
			student.setGender(gender);
			student.setSubjects(subjects);

			try {
				StudentDao.insertStudent(student);

				request.setAttribute("msg", "data inserted");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} catch (Exception e) {
				//e.printStackTrace();
				request.setAttribute("msg", "error occur ! student not inserted");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else if(action.equalsIgnoreCase("update student")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String dobStr = request.getParameter("dob");
			String semester = request.getParameter("semester");
			String[] subjectsArr = request.getParameterValues("subjects");
			String gender = request.getParameter("gender");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dob = null;
			try {
				dob = sdf.parse(dobStr);
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<String> subjects = Arrays.asList(subjectsArr);

			Student student = new Student();
			student.setId(id);
			student.setName(name);
			student.setEmail(email);
			student.setPassword(password);
			student.setDOB(dob);
			student.setSemester(semester);
			student.setGender(gender);
			student.setSubjects(subjects);
			
			StudentDao.updateStudent(student);
			
			request.setAttribute("updateMsg", "student updated successfully");
			request.getRequestDispatcher("edit-student.jsp").forward(request, response);
		}
	}
}
