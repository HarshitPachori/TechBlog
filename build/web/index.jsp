<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="css/mystyle.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>TechBlog</title>
    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid banner-background p-0 m-0">
            <div class="jumbotron secondary-background text-white mb-4 p-5">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>Welcome to technical blog, world full of technolgy.
                        A programming language is a system of notation for writing computer programs.Most programming languages are text-based formal languages, but they may also be graphical.</p>
                    <p>The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language.</p>
                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start ! its free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
        <!--cards-->
        <div class="container">
            <div class="row "><!-- ek row me 12 card aa skte h -->
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn  primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-2"><!-- ek row me 12 card aa skte h -->
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-2"> <!-- 4cd card ki col -->
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-black">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--js-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
