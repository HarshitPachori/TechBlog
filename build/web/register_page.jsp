<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <stylesheet" href="css/mystyle.css"/><link rel="stylesheet" href="css/mystyle.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</style>
<title>Register Page</title>
</head>
<body>
    <!--navbar-->
    <%@include file="normal_navbar.jsp" %>
    <main class="primary-background primary-background " style="padding-bottom: 90px;padding-top: 20px;">
        <div class="container">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="reg-card-header card-header text-center  text-white ">
                        <span class="fa fa-user-circle fa-3x"></span>
                        <h4>Register Here</h4>
                    </div>
                    <div class="card-body">
                        <form id="reg-form" action="RegisterServlet" method="POST">
                            <div class="mb-1">
                                <label for="user_name" class="form-label">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>
                            <div class="mb-1">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input name ="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                            </div>
                            <div class="mb-1">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                            </div>
                            <div class="mb-1">
                                <label for="gender" class="form-label">Select Gender  </label>
                                <br>
                                <input type="radio"  id="gender" name ="gender" value="male">   Male
                                <input type="radio"  id="gender" name ="gender" value="female">   Female
                            </div>
                            <div class="form-group">
                                <textarea id="id" name="about" class="form-control" rows="3"  placeholder="Enter something about yourself"></textarea>
                            </div>
                            <div class="mb-1 form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">agree terms & conditions</label>
                            </div>
                            <br>
                            <div class="container text-center" id="loader" style="display: none">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait...</h4>
                            </div>
                            <div class="container text-center">
                                <button id="submit_button" type="submit" class="btn btn-outline-light">Register</button>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        $(document).ready(function () {
            console.log("loaded...")
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);
                $('#loader').show();
                $('#submit_button').hide();

                // send register servlet
                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                        $('#loader').hide();
                        $('#submit_button').show();
                        if (data.trim() === 'done') {
                            swal("Registered successfully... we are going to redirect to login page")
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                        } else {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR)

                        $('#loader').hide();
                        $('#submit_button').show();
                        swal("Something went wrong...try again");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>
