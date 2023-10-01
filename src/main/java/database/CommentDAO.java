package database;

import model.Comment;
import model.Post;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class CommentDAO  {
    public ArrayList<Comment> selectById(int postid) {
        ArrayList<Comment> commentArrayList = new ArrayList<Comment>();
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "select * from comments where postid =?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setInt(1, postid);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int id = Integer.parseInt(rs.getString("id"));
                int postId = rs.getInt("postid");
                String authorName = rs.getString("authorname");
                String content = rs.getString("content");
                Comment comment = new Comment(id, postId, authorName, content);
                commentArrayList.add(comment);
            }
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commentArrayList;
    }

    public int insert(Comment comment) {
        int result = 0;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "insert into comments(authorname, postid, content) values (?,?,?)";
            PreparedStatement st = c.prepareStatement(sql);
            st.setString(1, comment.getAuthorName());
            st.setInt(2, comment.getPostId());
            st.setString(3, comment.getContent());
            result = st.executeUpdate();
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public int delete(int id) {
        int result = 0;
        try{
            Connection c = JDBCUtil.getConnection();
            String sql = "delete from comments where id =?";
            PreparedStatement st = c.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
            JDBCUtil.closeConnection(c);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }


}
