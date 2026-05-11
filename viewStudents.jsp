<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.student.dao.StudentDAO, com.student.model.Student, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f0f2f5; }
        h2 { color: #333; }
        table { width: 100%; border-collapse: collapse;
                background: white; border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        th { background: #007bff; color: white; padding: 12px; }
        td { padding: 10px; border-bottom: 1px solid #ddd;
             text-align: center; }
        tr:hover { background: #f5f5f5; }
        .btn { padding: 6px 12px; border: none; border-radius: 4px;
               cursor: pointer; color: white; text-decoration: none; }
        .edit { background: #28a745; }
        .delete { background: #dc3545; }
        .add-btn { background: #007bff; color: white; padding: 10px 20px;
                   border: none; border-radius: 5px; cursor: pointer;
                   margin-bottom: 15px; font-size: 14px; }
        .top { display: flex; justify-content: space-between;
               align-items: center; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("Index.jsp");
        return;
    }
    StudentDAO dao = new StudentDAO();
    List<Student> students = dao.getAllStudents();
%>
<div class="top">
    <h2>🎓 All Students</h2>
    <div>
        <span>Welcome, <%= session.getAttribute("user") %> | </span>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<a href="addStudent.jsp">
    <button class="add-btn">+ Add New Student</button>
</a>

<table>
    <tr>
        <th>ID</th><th>Name</th><th>Email</th>
        <th>Phone</th><th>Address</th>
        <th>Age</th>          <!-- ✅ Fixed: Age header added -->
        <th>Actions</th>
    </tr>
    <% for(Student s : students) { %>
    <tr>
        <td><%= s.getId() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getEmail() %></td>
        <td><%= s.getPhone() %></td>
        <td><%= s.getAddress() %></td>
        <td><%= s.getAge() %></td>    <!-- ✅ Fixed: now in correct order -->
        <td>
            <a class="btn edit"
               href="StudentServlet?action=edit&id=<%= s.getId() %>">Edit</a>
            <a class="btn delete"
               href="StudentServlet?action=delete&id=<%= s.getId() %>"
               onclick="return confirm('Delete this student?')">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>