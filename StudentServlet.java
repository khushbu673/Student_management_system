package com.student.servlet;
import com.student.dao.StudentDAO;
import com.student.model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    StudentDAO dao = new StudentDAO();

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Student s = new Student();
            s.setName(request.getParameter("name"));
            s.setEmail(request.getParameter("email"));
            s.setPhone(request.getParameter("phone"));
            s.setAddress(request.getParameter("address"));
            s.setAge(Integer.parseInt(request.getParameter("age")));  // ✅ Fixed: was missing

            dao.addStudent(s);
            response.sendRedirect("viewStudents.jsp");

        } else if ("update".equals(action)) {
            Student s = new Student();
            s.setId(Integer.parseInt(request.getParameter("id")));
            s.setName(request.getParameter("name"));
            s.setEmail(request.getParameter("email"));
            s.setPhone(request.getParameter("phone"));
            s.setAddress(request.getParameter("address"));
            s.setAge(Integer.parseInt(request.getParameter("age")));  // ✅ Fixed: was getAge()

            dao.updateStudent(s);
            response.sendRedirect("viewStudents.jsp");

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteStudent(id);
            response.sendRedirect("viewStudents.jsp");
        }
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null && "edit".equals(action)) {  // ✅ null check retained
            int id = Integer.parseInt(request.getParameter("id"));
            Student s = dao.getStudentById(id);
            request.setAttribute("student", s);
            RequestDispatcher rd = request.getRequestDispatcher("editStudent.jsp");
            rd.forward(request, response);
        }
    }
}