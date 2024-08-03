package complexforms.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import complexforms.connection.DBConnection;
import complexforms.entities.Student;

public class StudentDao {
	public static void insertStudent(Student student) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "insert into student (name,email,password,semester,subjects,date,gender) values (?,?,?,?,?,?,?)";            
			PreparedStatement pst = connection.prepareStatement(sql);
			
			pst.setString(1, student.getName());
			pst.setString(2, student.getEmail());
			pst.setString(3, student.getPassword());
			pst.setString(4, student.getSemester());
			pst.setString(5, String.join(",", student.getSubjects()));
			pst.setDate(6, new Date(student.getDOB().getTime()));
			pst.setString(7, student.getGender());
			
			pst.executeUpdate();
			System.out.println("student inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Student> getAllStudents(){
		List<Student> students = new ArrayList<Student>();
		
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "select * from student";            
			PreparedStatement pst = connection.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setEmail(rs.getString("email"));
				student.setSemester(rs.getString("semester"));
				student.setDOB(rs.getDate("date"));
				student.setGender(rs.getString("gender"));
				student.setPassword(rs.getString("password"));
				
				// getting subjects
				String str = rs.getString("subjects");
				if(str!=null && !str.isEmpty()) {
					String[] arr = str.split(",");
					List<String> subjects = new ArrayList<>();
					for(String sub : arr) {
						subjects.add(sub.trim());
					}
					student.setSubjects(subjects);
				}else {
					student.setSubjects(new ArrayList<>());
				}
				students.add(student);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return students;
	}
	// delete student
	public static void deleteStudent(int id) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "delete from student where id = ?";            
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			
			pst.executeUpdate();
			
			System.out.println("student deleted");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// get student 
	
	public static Student getStudent(int id) {
		Student student = null;
		
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "select * from student where id = ?";            
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				student = new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setEmail(rs.getString("email"));
				student.setPassword(rs.getString("password"));
				student.setSemester(rs.getString("semester"));
				student.setDOB(rs.getDate("date"));
				student.setGender(rs.getString("gender"));
				String str = rs.getString("subjects");
				if(str!=null && !str.isEmpty()) {
					String[] subjsArr = str.split(",");
					List<String> subjects = new ArrayList<String>();
					
					for(String sub : subjsArr) {
						subjects.add(sub);
					}
					student.setSubjects(subjects);
				}else {
					student.setSubjects(new ArrayList<String>());
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
	}
	public static void updateStudent(Student student) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "update student set name = ?,email=?,password=?,semester=?,subjects=?,"
					+ "date=?,gender=? where  id = ?";            
			PreparedStatement pst = connection.prepareStatement(sql);
			
			pst.setString(1, student.getName());
			pst.setString(2, student.getEmail());
			pst.setString(3, student.getPassword());
			pst.setString(4, student.getSemester());
			pst.setString(5, String.join(",", student.getSubjects()));
			pst.setDate(6, new Date(student.getDOB().getTime()));
			pst.setString(7, student.getGender());
			pst.setInt(8, student.getId());
			
			pst.executeUpdate();
			System.out.println("student updated at id : " + student.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}





