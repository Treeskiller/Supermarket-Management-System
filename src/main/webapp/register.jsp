<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Register</title>

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

        #register {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width: 300px;
            height: 300px;
        }

        #register h1 {
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
            height: 18px;
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
    </style>
</head>

<body>

    <div id="register">
        <h1>Register</h1>
        <form action="user/save" method="post" id="registSubmit">
            <input type="text" required="required" name="email" id="email" placeholder="Email Address" onchange="checkEmail()" />
            <input type="text" required="required" onchange="x()" id="usname" name="username" placeholder="Username" />
            <input type="text" required="required" name="password" placeholder="Password" />
            <input type="text" name="sex" placeholder="Sex" />
            <input type="text" name="address" placeholder="Address" />
            <input class="but" type="submit" value="Save" />
        </form>
        <input class="but" id="reg" type="button" value="Login" onclick="window.open('index.jsp') " />
    </div>


    <script>
        var email=document.getElementById("email");
        var userName = document.getElementById("usname");
        function x() {
            if (userName.value == "Fuck") {
                userName.value = "";
                alert("Please input valid and polite name");
                return;
            }
        }

    </script>

    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#email").focus();
        });
        var hadoop = function () {
            // 异步验证用户是否重复
            if ($.trim($("#email").val()) == "") {
                $("#message").html("email can not be null");
                $("#email").focus();
            } else {
                $.ajax({
                    type: "post",
                    url: "user/checkRepeat",
                    data: "email=" + $("#email").val(),
                    success: function (data) {
                        alert(data);
                    }
                });
            }
        };
        function checkEmail(){
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test(email.value))
            {
                alert('提示\n\n请输入有效的E_mail！');
                myreg.focus();
                return false;
            }

        }
    </script>


</body>

</html>
