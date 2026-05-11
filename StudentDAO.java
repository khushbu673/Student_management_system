package com.student.dao;
import com.student.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try {
            Connection con = DBconnection.getConnection();
            String sql = "SELECT * FROM students";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setAge(rs.getInt("age"));  // ✅ Fixed: was setAddress()
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addStudent(Student s) {
        try {
            Connection con = DBconnection.getConnection();
            String sql = "INSERT INTO students(name,email,phone,address,age) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPhone());
            ps.setString(4, s.getAddress());
            ps.setInt(5, s.getAge());  // ✅ Fixed: was getage()
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Student getStudentById(int id) {
        Student s = null;
        try {
            Connection con = DBconnection.getConnection();
            String sql = "SELECT * FROM students WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setAge(rs.getInt("age"));  // ✅ Fixed: age was missing entirely
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public void updateStudent(Student s) {
        try {
            Connection con = DBconnection.getConnection();
            // ✅ Fixed: added missing comma, added age param, fixed index order
            String sql = "UPDATE students SET name=?,email=?,phone=?,address=?,age=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPhone());
            ps.setString(4, s.getAddress());
            ps.setInt(5, s.getAge());  // ✅ age → index 5
            ps.setInt(6, s.getId());   // ✅ id  → index 6
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(int id) {
        try {
            Connection con = DBconnection.getConnection();
            String sql = "DELETE FROM students WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}