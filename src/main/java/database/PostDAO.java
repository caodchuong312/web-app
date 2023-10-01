package database;

import model.Comment;
import model.Post;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {

    public ArrayList<Post> selectAll() {
        ArrayList<Post> result = new ArrayList<Post>();
        try {
            Connection c = JDBCUtil.getConnection();
            String sql = "Select * from posts";
            PreparedStatement st = c.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String title = rs.getString("title");
                String content = rs.getString("content");
                int authorId = rs.getInt("authorid");
                Post post = new Post(id, title, content, authorId);
                result.add(post);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public Post selectById(int postId) {
        Post result = null;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from posts where id=?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setInt(1,postId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String  title = rs.getString("title");
                String content = rs.getString("content");
                int authorId = rs.getInt("authorid");
                result = new Post(id, title, content, authorId);
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public ArrayList<Post> selectByTitle(String search) {
        ArrayList<Post> result = new ArrayList<Post>();
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from posts where title like '%"+search+"%'";
            PreparedStatement st = c.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                String title = rs.getString("title");
                String content = rs.getString("content");
                int authorId = rs.getInt("authorid");
                Post post = new Post(id, title, content, authorId);
                result.add(post);
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

}
