<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/fetch.jsp">Fetch</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto me-2">
                <li class="nav-item">
                <a class="nav-link" href="/user/admin.jsp">Admin panel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile.jsp">Hello, <%=request.getSession().getAttribute("user")%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/users/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>