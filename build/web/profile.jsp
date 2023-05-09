<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
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

        body{
            background: url(img/bg3.jpg);
            background-attachment: fixed;
            background-size: cover;
        }
        /*        .list-group-item.active{
                    background-color:  #0D47A1!important;
                }*/
    </style>
    <title>Profile Page</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark secondary-background">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="profile.jsp">Home</a>
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

    <!--main body of the page-->
    <main>
        <div class="container">
            <div class="row mt-4">
                <!--first column-->
                <div class="col-md-4">
                    <!--categories-->
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active" aria-current="true">
                            All Posts
                        </a>
                        <%
                            PostDao d = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Categories> list1 = d.getAllCategories();
                            for (Categories c1 : list1) {
                        %>
                        <a href="#" onclick="getPosts(<%=c1.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%=  c1.getName()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-8" >
                    <!--posts-->
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-3x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>
                    <div class="container-fluid" id="post-container"></div>
                </div>
            </div>
        </div>
    </main>
    <!--end of main body of the page-->

    <!--profile modal-->
    <!-- Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header secondary-background text-white text-center">
                    <h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="btn-close banner-background" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body banner-background">
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
                                        <td><%= DateFormat.getDateInstance().format(user.getDateTime())%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div

                        <!--profile edit details-->
                        <div id="profile-edit" style="display:none">
                            <form action="EditServlet" method="post" enctype="multipart/form-data"> <!-- enctype used bcz of image to decode it or used for img audio video etc -->
                                <table class="table">
                                    <tr>
                                        <th>ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th>Name:</th>
                                        <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <th>Password:</th>
                                        <td>
                                            <input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Gender:</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <th>About:</th>
                                    <!--important bootstrap class => form-control-->
                                    <td>
                                        <textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%>
                                        </textarea>
                                    </td>
                                    </tr>
                                    <tr>
                                        <th>New Profile:</th>
                                        <!--important bootstrap class => form-control-->
                                        <td>
                                            <input type="file" name="image" class="form-control">
                                        </td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-secondary  ">
                                        Save Changes
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer secondary-background">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="edit-profile-btn" class="btn primary-background text-black">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of profile modal-->

    <!--add post modal-->
    <div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header secondary-background text-center text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
                    <button type="button" class="btn-close banner-background" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body banner-background">
                    <form id="add-post-form" action="AddPostServlet" method="post">
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Category</label>
                            <select class="form-control" name="cid">
                                <option selected disabled class="text-center">---------- Select Category ----------</option>
                                <%
                                    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Categories> list = postDao.getAllCategories();
                                    for (Categories c : list) {
                                %>
                                <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <!--write name of each field to fetch data from servlet-->
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Title</label>
                            <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Content</label>
                            <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Code (optional)</label>
                            <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Upload pic</label>
                            <br>
                            <input type="file" name="pPic">
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-secondary">Upload Post</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--end add post modal-->

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
    <!--now add post js-->
    <script>
        $(document).ready(function () {
            $('#add-post-form').on("submit", function (event) {
//                this code gets executed when form is submitted
                event.preventDefault();
                console.log("submitted");
                let form = new FormData(this);
//        now requesting to
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
//                        success..
                        if (data.trim() === 'done') {
                            swal("Good job!", "Saved Successfully", "success").then((value) => {
                                window.location = "profile.jsp";
                            });

                        } else {
                            swal("Error!", "Something went wrong try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
//                        error..
                        swal("Error!", "Something went wrong try again...", "error");
                    },
                    processData: false,
                    contentType: false // ye dono false kiye h qki form me photo bhi hai
                });
            });
        });
    </script>

    <!--loading post using ajax-->
    <script >
        function getPosts(catId, temp) {
            //console.log(catId);
            $('#loader').show();
            $('#post-container').hide();
            $('.c-link').removeClass('active');
            // yahan ajax ke use se request send ki post.jsp par jisse jo bhi jsp me hoga wo profile page pr show hojaega load hone ke baad.
            $.ajax({
                url: "load_post.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $('#loader').hide();
                    $('#post-container').show();
                    $('#post-container').html(data);
                    $(temp).addClass('active');
                }
            });
        }
        ;
        $(document).ready(function () {
            // all post wale ko blue karne ke liye uska ref nikala
            let allPostRef = $('.c-link')[0];
            getPosts(0, allPostRef);
        });
    </script>
</body>
</html>
