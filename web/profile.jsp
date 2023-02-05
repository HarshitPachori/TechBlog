<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <stylesheet" href="css/mystyle.css"/><link rel="stylesheet" href="css/mystyle.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 89%, 74% 94%, 30% 93%, 0 100%, 0 0);
        }
    </style>
    <title>JSP Page</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Programming Languages</a></li>
                            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Data Structures</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone"></span>  Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#addPostModal"><span class="fa fa-fire"></span>  Do Post</a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profileModal" tabindex="-1" aria-disabled="true"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet" tabindex="-1" aria-disabled="true"><span class="fa fa-user-plus"></span> log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--end of navbar-->
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
    <!--profile modal-->
    <!-- Button trigger modal -->

    <!-- Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>"  class="img-fluid" style="border-radius: 50%;max-width: 150px" alt="alt"/>
                        <br>
                        <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                        <!-- details-->
                        <div id="profile-details">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>                                   
                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><%= user.getAbout()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on:</th>
                                        <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--profile edit details-->
                        <div id="profile-edit" style="display:none">
                            <h2 class="mt-2">Please Edit Carefully</h2>                            
                            <form action="EditServlet" method="post" enctype="multipart/form-data"> <!-- enctype used bcz of image to decode it or used for img audio video etc -->
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <td>About:</td>
                                    <!--important bootstrap class => form-control-->
                                    <td>
                                        <textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%>
                                        </textarea>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>New Profile:</td>
                                        <!--important bootstrap class => form-control-->
                                        <td>
                                            <input type="file" name="image" class="form-control">
                                        </td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">
                                        Save
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>        
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of profile modal-->     

    <!--add post modal-->

   
    <div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the post details...</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddPostServlet" method="post">
                        
                        
                        <div class="form-group">
                            <input type="text" placeholder="Enter Post Title" class="form-control">
                            <br>
                        </div>
                        
                        <div class="form-group">
                            <textarea class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            <br>
                        </div>
                        
                        <div class="form-group">
                            <textarea class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                                                        <br>

                        </div>
                        
                        <div class="form-group">
                            <label>Upload pic </label>
                            <br>
                            <input type="file">
                        </div>
                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!--end add post modal-->



    <!--js-->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            let editStatus = false;
            $('#edit-profile-btn').click(function () {
                if (editStatus == false) {
                    $('#profile-details').hide();
                    $('#profile-edit').show();
                    editStatus = true;
                    $(this).text("back");
                } else {
                    $('#profile-details').show();
                    $('#profile-edit').hide();
                    editStatus = false;
                    $(this).text("edit");
                }
            });
        });
    </script>
</body>
</html>
