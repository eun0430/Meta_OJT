<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에서 사용하는 meta tag -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <title>Main Page</title>

    <style>
        .nav-link {
            font-size: larger;
            font-weight: bold;
            float: left;
            color: black;
        }

        .login-input {
            font-weight: bold;
            font-size: larger;
        }
        
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">
                <img src="MD.png" alt="" width="120" height="40" class="navbar-brand">
            </a>
            <li style="list-style-type:none; float: left;""> 
                <a class="nav-link" href="http://www.metanetdigital.co.kr/" target="_blank" >Home</a>
            </li>
            <li style="list-style-type:none; float: left;">
                <a class="nav-link" href="#" > POST </a>
            </li>

            <form class="d-flex">
                <button onClick="location.href='login.jsp'" class="btn btn-outline-dark" type="button" style="margin: 5px;">로그인</button>
                <button onClick="location.href='newmembers.jsp'" class="btn btn-secondary" type="button" style="margin: 5px;">회원가입</button>
            </form>
        </div>
    </nav>
    

    <h2 style="font-weight: bolder; text-align: center; margin-top: 20px;"> 최하은 웹 페이지 구현 </h2>
</body>
</html>