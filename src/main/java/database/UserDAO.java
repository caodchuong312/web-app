package database;

import model.User;
import util.SHA512;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO{
    public ArrayList selectAll() {
        ArrayList<User> result = new ArrayList<User>();
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "Select * from users";
            PreparedStatement st = c.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String username = rs.getString("id");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String profile = rs.getString("profile");
                User user = new User(id, username, password, email, profile);
                result.add(user);
            }
            JDBCUtil.closeConnection(c);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public User selectById(User t) {
        User user = null;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from users where id=?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setInt(1, t.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String profile = rs.getString("profile");
                user = new User(id, username, password, email, profile);
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    public User selectByName(String name) {
        User user = null;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from users where username=?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1,name);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String profile = rs.getString("profile");
                user = new User(id, username, password, email, profile);
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public int insert(User user) {
        int result = 0;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "insert into users(username, password, email, profile) values (?,?,?,?)";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getEmail());
            st.setString(4, user.getProfile());
            result = st.executeUpdate();
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }


    public int delete(User user) {
        int result = 0;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "delete from users where id = ?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setInt(1, user.getId());
            result = st.executeUpdate();
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public int update(String name, String newUsername, String newEmail, String newProfile) {
        int result = 0;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "update users set username =?,  email=?, profile=? where username =?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1,newUsername);
            st.setString(2, newEmail);
            st.setString(3, newProfile);
            st.setString(4, name);
            result = st.executeUpdate();
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public boolean checkUser(String username){
        boolean result = false;
        try {
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from users WHERE username=?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = true;
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public boolean login(String username, String password){
        boolean result = false;
        try {
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from users where username =? and password =?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = true;
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }





}
