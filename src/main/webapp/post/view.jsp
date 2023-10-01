<%@ page import="database.PostDAO" %>
<%@ page import="model.Post" %>
<%@ page import="database.CommentDAO" %>
<%@ page import="model.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/partials/nav.jsp" />
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PostDAO postDAO = new PostDAO();
    Post post = postDAO.selectById(id);

    CommentDAO commentDAO = new CommentDAO();
    ArrayList<Comment> commentList = new ArrayList<Comment>();
    commentList = commentDAO.selectById(id);
%>
<div class="container">
    <h2><%= post.getTitle() %></h2>
    <div><p><%= post.getContent() %></p></div>
    <a href="/index.jsp" class="btn btn-primary float-right">Back</a>
    <br>
    <h4>Comment</h4>
    <div class="row">
        <%
            for(Comment comment: commentList){
        %>
        <div class="mb-3">
            <div class="card">
                <div class="card-body">
                    <p class="card-text"><b><%= comment.getAuthorName() %></b></p>
                    <p class="card-title"><%= comment.getContent() %></p>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <h4>Add a comment:</h4>
    <form action="/comment" method="POST">
        <div class="mb-3">
            <label class="small mb-1" for="comment">Comment</label>
            <textarea class="form-control" id="comment" name="content" rows="4" placeholder="Enter your comment"></textarea>
        </div>
        <input type="hidden" name="postId" value="<%=id%>">
        <button class="btn btn-primary" type="submit">Submit Comment</button>
    </form>
</div>
</body>
</html>
