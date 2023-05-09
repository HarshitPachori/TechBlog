<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <stylesheet" href="css/mystyle.css"/><link rel="stylesheet" href="css/mystyle.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Login Page</title>
</head>
<body>
    <!--navbar-->
    <%@include file="normal_navbar.jsp" %>
    <main class="primary-background primary-background "  style="padding-top: 20px;">
        <div class="container">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="reg-card-header card-header text-center  text-white ">
                        <span class="fa fa-user-circle fa-3x"></span>
                        <h4>Login Here</h4>
                    </div>
                    <%
                        Message m = (Message) session.getAttribute("msg");
                        if (m != null) {
                    %>
                    <div class="alert <%= m.getCssClass()%>" role="alert">
                        <%= m.getContent()%>
                    </div>
                    <%
                            session.removeAttribute("msg");
                        }
                    %>
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email"  name="email"  required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                            </div>
                            <div class="container text-center mt-4">
                                <button type="submit" class="btn btn-outline-light ">Submit</button>
                                <a href="register_page.jsp" class="btn btn-outline-light m-1 ">Create new account</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>
