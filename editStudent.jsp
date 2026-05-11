<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.student.model.Student"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body { font-family: Arial; background: #f0f2f5;
               display: flex; justify-content: center;
               align-items: center; min-height: 100vh; }
        .box { background: white; padding: 40px; width: 400px;
               border-radius: 10px;
               box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        input { width: 100%; padding: 10px; margin: 8px 0;
                border: 1px solid #ddd; border-radius: 5px;
                box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #007bff;
                 color: white; border: none; border-radius: 5px;
                 cursor: pointer; font-size: 16px; }
        a { display: block; text-align: center; margin-top: 10px; }
    </style>
</head>
<body>
<%  Student s = (Student) request.getAttribute("student"); %>
<div class="box">
    <h2>✏️ Edit Student</h2>
    <form action="StudentServlet" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= s.getId() %>"/>
        <input type="text" name="name" value="<%= s.getName() %>" required/>
        <input type="email" name="email" value="<%= s.getEmail() %>" required/>
        <input type="text" name="phone" value="<%= s.getPhone() %>" required/>
        <input type="text" name="address" value="<%= s.getAddress() %>" required/>
        <input type="number" name="age" value="<%= s.getAge() %>" required />
        <button type="submit">Update Student</button>
    </form>
    <a href="viewStudents.jsp">← Back to Students</a>
</div>
</body>
</html>