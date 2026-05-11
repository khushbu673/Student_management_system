package com.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    static final String URL = "jdbc:mysql://localhost:3306/student_db";
    static final String USER = "root";
    static final String PASS = ""; // ← apna password daalo yahan

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("DB Connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}