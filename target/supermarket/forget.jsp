<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/2
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>

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

        .message {
            text-align: center;
            animation: fadeInLow 1500ms;
        }

        @keyframes fadeInLow {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Firefox */
        @-moz-keyframes fadeInLow {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Safari and Chrome */
        @-webkit-keyframes fadeInLow {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Opera */
        @-o-keyframes fadeInLow {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
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
            height: 30px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: grey;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: white;
        }

        input[type=button]:hover {
            cursor: pointer;
            background-color: #f7a470;
            box-shadow: 2px 2px 3px grey;
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
        }

        .but:hover{
            cursor: pointer;
            background-color: #3762bc;
            box-shadow: 2px 2px 3px grey;
        }

        #sendBtn{
            color: white;
            line-height: 10px;
            background-color:#4a77d4; 
        }

        #sendBtn:hover{
            cursor: pointer;
            background-color: #f7a470;
            box-shadow: 2px 2px 3px grey;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>

    <div id="register">
        <div class="message">
            <h1>Reset Password</h1>
        </div>
        <form action="user/resetpwd" method="post">
            <input required="required" type="text" name="email" id="email" placeholder="Email Address" />

            <input id="sendBtn" type="button" name="confirm" value="Send Verification Code" onclick="sendEmail()" />
            
            <input required="required" type="text" name="password" placeholder="New Password" />
            <input required="required" type="text" onchange="x()" id="vcode" name="vericode" placeholder="Verification Code" />
            <p id="tip12" style="display: none;position: absolute; left: 96%;top:60%;width: 300px; font-size:20px; color:crimson ">Incorrect Verification Code</p>
            <input id="reset" class="but" type="submit" value="Reset" />
        </form>
        <input class="but" type="button" value="Login" onclick="window.open('index.jsp') " />

    </div>

</body>
<script>
    var randomCode = Math.floor(Math.random() * 9999 + 100);
    var rebu = document.getElementById("reset");
    var tip12 = document.getElementById("tip12");
    function sendEmail() {
        var email = document.getElementById("email").value;
        $.ajax({
            url: 'user/emailcode',
            type: 'GET',
            traditional: true,
            async: true,
            dataType: 'json',
            data: { "email": email, "code": randomCode }
        })
    }
    var vcode = document.getElementById("vcode");
    function x() {
        if (vcode.value != randomCode) {
            rebu.setAttribute("disabled", true);
            tip12.style.display = "block";
        }
        else {
            rebu.removeAttribute("disabled");
            tip12.style.display = "none";
        }
    }
</script>

</html>
