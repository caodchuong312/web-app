<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
<%
    String success = request.getAttribute("success")+"";
    success = (success.equals("null"))?"":success;
    String error = request.getAttribute("error")+"";
    error = (error.equals("null"))?"":error;
%>
    <div class="container">
        <% if (!success.isEmpty()) { %>
        <div class="alert alert-success"><%=success%></div>
        <% } %>
        <h3>Login Form</h3>
        <form action="/users/login" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" id="username">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <br>
            <p><a class="link-opacity-75-hover" href="/user/register.jsp">Register</a></p>
            <br>
            <% if (!error.isEmpty()) { %>
            <div class="alert alert-danger"><%=error%></div>
            <% } %>
        </form>
    </div>
</body>
</html>
