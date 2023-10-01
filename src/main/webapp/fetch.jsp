<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fetch Remote Object</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/partials/nav.jsp" />
<div class="container">
    <h3>Location</h3>
    <form action="/fetch" method="post">
        <div class="form-group">
            <label for="location">Url:</label>
            <input type="text" class="form-control" id="location" name="location" placeholder="Enter url">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <div>
        Response Body:
        <pre>${body}</pre>
    </div>
</div>
</body>
</html>
