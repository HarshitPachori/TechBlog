<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
    <title>Sorry ! something went wrong...</title>
</head>
<body>
    <div class="container text-center">
        <img src="img/error.png" alt="error" class="img-fluid"/>
        <h3 class="display-3">Sorry ! Something went wrong ...</h3>
        <a href="index.jsp" class="btn btn-lg primary-background text-white mt-3">Home</a>
    </div>
</body>
</html>
