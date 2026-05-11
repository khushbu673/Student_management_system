<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
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
        button { width: 100%; padding: 10px; background: #28a745;
                 color: white; border: none; border-radius: 5px;
                 cursor: pointer; font-size: 16px; }
        a { display: block; text-align: center; margin-top: 10px; }
    </style>
</head>
<body>
<div class="box">
    <h2>➕ Add New Student</h2>
    <form action="StudentServlet" method="post">
        <input type="hidden" name="action" value="add"/>
        <input type="text" name="name" placeholder="Full Name" required/>
        <input type="email" name="email" placeholder="Email" required/>
        <input type="text" name="phone" placeholder="Phone" required/>
        <input type="text" name="address" placeholder="Address" required/>
        <input type="number" name="age" placeholder="Enter Age" required />
        <button type="submit">Add Student</button>
    </form>
    <a href="viewStudents.jsp">← Back to Students</a>
</div>
</body>
</html>