package controller;

import database.CommentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Comment;

import java.io.IOException;

@WebServlet("/comment")
public class CommentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{

        CommentDAO commentDAO = new CommentDAO();
        String content = request.getParameter("content");
        int postId = Integer.parseInt(request.getParameter("postId"));
        String authorName = request.getSession().getAttribute("user")+"";;
        Comment comment = new Comment();
        comment.setPostId(postId);
        comment.setContent(content);
        comment.setAuthorName(authorName);
        int result = commentDAO.insert(comment);
        String url ="";
        if(result>0){
            url = "/post/view.jsp?id="+postId;
        }
        response.sendRedirect(request.getContextPath() + url);

        } catch ( IOException e) {
            throw new RuntimeException(e);
        }
    }
}
