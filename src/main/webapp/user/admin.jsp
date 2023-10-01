<%@ page import="database.UserDAO" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../partials/nav.jsp" />
<%
    String name = (String) request.getSession().getAttribute("user");
    UserDAO userDAO = new UserDAO();
    User user = userDAO.selectByName(name);
    try {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
        objectOutputStream.writeObject(user);
        objectOutputStream.close();
        byte[] serializedObject = byteArrayOutputStream.toByteArray();
        String base64String = Base64.getEncoder().encodeToString(serializedObject);
        Cookie cookie = new Cookie("data", base64String);
        response.addCookie(cookie);
    } catch (IOException e) {
        e.printStackTrace();
    }
    String username = "";
    try {
        Cookie[] cookies = request.getCookies();
        String data ="";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("data")) {
                    data = cookie.getValue();
                }
            }
        }
        byte[] serializedObject = Base64.getDecoder().decode(data);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(serializedObject);
        ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
        User obj = (User) objectInputStream.readObject();
        objectInputStream.close();
        username = obj.getUsername();
    } catch (IOException | ClassNotFoundException e) {
        e.printStackTrace();
    }
    if(username.equals("admin")){%>
        <h1>Hello <%=username%></h1><%
    }else { %>
        <h1>You are not admin!</h1>
    <%}
%>


</body>
</html>
