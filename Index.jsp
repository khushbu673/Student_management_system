<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management - Login</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; 
               display: flex; justify-content: center; 
               align-items: center; height: 100vh; margin: 0; }
        .box { background: white; padding: 40px; 
               border-radius: 10px; width: 350px;
               box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        input { width: 100%; padding: 10px; margin: 10px 0; 
                border: 1px solid #ddd; border-radius: 5px;
                box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #007bff;
                 color: white; border: none; border-radius: 5px; 
                 cursor: pointer; font-size: 16px; }
        button:hover { background: #0056b3; }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
<div class="box">
    <h2>🎓 Student Management</h2>
    <% if(request.getParameter("error") != null) { %>
        <p class="error">Invalid username or password!</p>
    <% } %>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Username" required/>
        <input type="password" name="password" placeholder="Password" required/>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>