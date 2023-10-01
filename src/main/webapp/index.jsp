<%@ page import="java.util.ArrayList" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="model.Post" %>
<%@ page import="database.PostDAO" %>
<%@ page import="org.owasp.encoder.Encoder" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Blog</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<%
  String user = (String) request.getSession().getAttribute("user");
  if (user == null) {
    response.sendRedirect("/user/login.jsp");
  }
  PostDAO postDAO = new PostDAO();
  ArrayList<Post> postList;
  String search = request.getParameter("search");
  if (search == null) {
    search = "";
  }
  postList = postDAO.selectByTitle(search);
%>
<jsp:include page="/partials/nav.jsp" />
<div class="container">
  <div class="row">
    <div class="col-md-6 mx-auto">
      <div class="text-center">
        <h2>Search</h2>
      </div>
      <form action="/index.jsp" method="get">
        <div class="input-group">
          <input type="text" class="form-control" id="search" name="search" placeholder="Enter your search term">
          <div class="input-group-append">
            <button class="btn btn-primary" type="submit">Search</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <br>
  <h2>Blog List</h2>
  <div class="row">
    <%
      for(Post post: postList){
    %>
    <div class="mb-3">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"><a href="/post/view.jsp?id=<%= post.getId() %>"><%=Encode.forHtml(post.getTitle()) %></a></h5>
          <p class="card-text"><%=Encode.forHtml(post.getContent()) %></p>
        </div>
      </div>
    </div>
    <%
      }
    %>
  </div>
</div>
</body>
</html>