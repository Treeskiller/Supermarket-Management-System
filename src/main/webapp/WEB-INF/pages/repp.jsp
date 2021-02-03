<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/2
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <title>Reset Payment Password</title>
    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
            margin: 0;
            min-height:100vh;
        }

        body {
            width: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
            background-size: 100%;
        }

        input {
            width: 300px;
            height: 40px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #fff;
            text-shadow: 1px 1px 1px;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: #2D2D3F;
        }

        .input1 {
            width: 300px;
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

        #tip11 {
            width: 300px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: #f50632;
            text-shadow: 1px 1px 1px;
        }

        .message {
            position: relative;
            overflow: hidden;
            width: 100%;
            text-align: center;
            margin-top: 150px;
        }

        h1 {
            font-size: 48px;
            /*text-shadow: 1px 1px 5px black;*/
        }

        .but {
            width: 300px;
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
    </style>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
    <div class="message">
        <h1>Reset your Payment Password </h1>
    </div>
    
    <input type="button" class="but" name="confirm" value="Send Verification Code" style="position: absolute; left: 40%;top:45%"
        onclick="sendEmail()">
    <input type="text" id="veriCode" name="veriCode" placeholder="Verification Code"
        style="position: absolute; left: 40%;top:51%" class="input1" onchange="checkCode()">
    <p id="tip11" style="display: none;position: absolute; left: 60%;top:48%">Incorrect Verification Code</p>
    <form action="updatePP" method="post">
        <input type="hidden" name="email" value=${email}>
        <input type="hidden" name="password" value=${password}>
        <input type="text" required="required" name="paymentPassword" placeholder="paymentPassword"
            style="position: absolute; left: 40%;top:57%">
        <input id="subbutton" class="but" type="submit" name="verify" value="Verify" style="position: absolute; left: 40%;top :63%"
            disabled="disabled">
    </form>
    <form action="findByEmail" method="post">
        <input type="hidden" name="email" value=${email} id="email">
        <input type="hidden" name="password" value=${password} id="password">
        <input class="but" type="submit" name="return" value="Return To Profile" style="position: absolute; left: 0px;bottom :0px">
    </form>


</body>
<script>
    var randomCode = Math.floor(Math.random() * 9999 + 100);
    function sendEmail() {
        var email = document.getElementById("email").value;
        $.ajax({
            url: 'emailcode',
            type: 'GET',
            traditional: true,
            async: true,
            dataType: 'json',
            data: { "email": email, "code": randomCode }
        })
    }
    function checkCode() {
        var vericode = document.getElementById("veriCode").value;
        var tip1 = document.getElementById("tip11");
        var subbutton = document.getElementById("subbutton");
        if (vericode != randomCode) {
            tip1.style.display = "block";
            subbutton.setAttribute("disabled", true);
        }
        else {
            tip1.style.display = "none";
            subbutton.removeAttribute("disabled");
        }
    }
</script>

</html>