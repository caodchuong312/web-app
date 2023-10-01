<%@ page import="database.UserDAO" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="../css/profile.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
<%
    String name = (String) request.getSession().getAttribute("user");
    UserDAO userDAO = new UserDAO();
    User user = userDAO.selectByName(name);
    System.out.println(user.toString());

    String profile = user.getProfile();
    profile = (profile == null)?"":profile;
    String success = request.getAttribute("success")+"";
    success = (success.equals("null"))?"":success;
    String error = request.getAttribute("error")+"";
    error = (error.equals("null"))?"":error;

%>

<jsp:include page="../partials/nav.jsp" />
<div class="container-xl px-4 mt-4">
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <img class="img-account-profile rounded-circle mb-2" src="/img/<%= request.getAttribute("fileName") %>" alt="">
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <form action="/users/upload" method="post" enctype="multipart/form-data">
                        Select image to upload:
                        <input type="file" name="file" id="file">
                        <input type="submit" value="Upload Image" name="submit">
                    </form>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <form action="/update" method="POST">
                <div class="card mb-4">
                    <div class="card-header">Account Details</div>
                    <% if (!success.isEmpty()) { %>
                    <div class="alert alert-success"><%=success%></div>
                    <% } %>
                    <% if (!error.isEmpty()) { %>
                    <div class="alert alert-danger"><%=error%></div>
                    <% } %>
                    <div class="card-body">
                        <form action="/update" method="POST">
                            <div class="mb-3">
                                <label class="small mb-1" for="username">Username</label>
                                <input class="form-control" id="username" name="username" type="text" placeholder="Enter your username" value="<%=user.getUsername()%>">
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="email">Email</label>
                                <input class="form-control" id="email" name="email" type="email" placeholder="Enter your email" value="<%=user.getEmail()%>">
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="profile">Profile</label>
                                <br>
                                <textarea name="profile" id="profile" rows="4" cols="50"><%=profile%></textarea>
                            </div>
                            <button class="btn btn-primary" type="submit">Save changes</button>
                        </form>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
