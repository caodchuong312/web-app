<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
<%
    String error = request.getAttribute("error")+"";
    error = (error.equals("null"))?"":error;
%>
<div class="container">
    <h3>Register Form</h3>
    <% if (!error.isEmpty()) { %>
    <div class="alert alert-danger"><%=error%></div>
    <% } %>
    <form action="/users/register" method="POST">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" name="username" class="form-control" id="username">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" class="form-control" id="password">
        </div>
        <div class="mb-3">
            <label for="rePassword" class="form-label">Repeat Password</label>
            <input type="password" name="rePassword" class="form-control" id="rePassword">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button><br>
        <p><a class="link-opacity-75-hover" href="/user/login.jsp">Login</a></p>
    </form>
</div>
</body>
</html>
