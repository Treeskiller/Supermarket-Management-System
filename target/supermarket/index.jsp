<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/8
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
            margin: 0;
        }

        body {
            width: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
            background-size: 100%;
        }

        #login {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width: 300px;
            height: 300px;
        }

        #login h1 {
            color: #fff;
            text-shadow: 0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }

        h1 {
            font-size: 2em;
            margin: 0.67em 0;
        }

        input {
            width: 278px;
            height: 40px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #fff;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: #2D2D3F;
        }

        .but {
            width: 275px;
            min-height: 40px;
            display: block;
            background-color: #4a77d4;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 0;
            box-shadow: 1px 1px 3px grey;
        }

        .but:hover {
            cursor: pointer;
            background-color: #3762bc;
            box-shadow: 2px 2px 3px grey;
        }

        #reg {
            width: 275px;
            min-height: 40px;
            display: block;
            background-color: #f7a470;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 0;
            box-shadow: 1px 1px 3px grey;
        }

        #reg:hover {
            background-color: #ff9858;
            box-shadow: 2px 2px 3px grey;
        }

        #click {
            position: absolute;
            top: 130px;
            left: 300px;
            width: 150px;
            height: 30px;
            padding: 3px;
            text-align: center;
            line-height: 30px;
            font-size: 15px;
            background-color: #4a77d4;
            border-radius: 5px;
            border: 1px solid #3762bc;
            box-shadow: 1px 1px 3px grey;
        }

        #click:hover {
            cursor: pointer;
            background-color: #3762bc;
            box-shadow: 2px 2px 3px grey;
        }

        a {
            color: #fff;
            text-decoration-line: none;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>

    <div id="login">
        <h1>Login</h1>
        <form action="user/findByEmail" method="post">
            <input type="text" required="required" name="email" placeholder="Email Address" />
            <input id="ps" type="password" name="password" placeholder="password" required="required" />
            <div id="click" onclick=ps()><a id="btn" >Show Password</a></div>
            <input class="but" type="submit" value="Login" />
        </form>
        <input class="but" id="reg" type="button" value="Register" onclick="window.open('register.jsp') " />
        <input class="but" type="button" style="position: relative;top:15px;" value="Forget Password"
            onclick="window.open('forget.jsp') " />
    </div>


</body>
<script>
    var isshow = true;
    
    function ps() {
        var v = document.getElementById("ps");
        if (isshow) {
            v.type = "text";
            isshow = false;
            document.getElementById("btn").innerHTML = ("Hide Password");

        } else {
            v.type = "password";
            isshow = true;
            document.getElementById("btn").innerHTML = ("Show Password");

        }
    };


</script>

</html>
