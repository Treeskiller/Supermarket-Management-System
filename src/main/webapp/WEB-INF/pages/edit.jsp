<!DOCTYPE html>

<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/27
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit info</title>

    <style type="text/css">
        html {
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }

        h1 {
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 40px;
            margin-top: 110px;

            /*text-shadow: 1px 1px 5px black;*/
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

        form {
            font-family: Arial, Helvetica, sans-serif;
            margin-top:3%;
            margin-bottom:5%;
            margin-right:0;
            text-align: center;
        }

        input {
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;
            border: 2px solid rgb(0, 0, 64);
            background-color: rgb(255,255,255);
            box-shadow: 1px 1px 3px grey;
        }

        input:hover {
            cursor: pointer;
            background-color: rgb(255,255,255);
            box-shadow: 2px 2px 3px grey;
        }

        textarea {
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;

            border: 2px solid rgb(0, 0, 64);
            background-color: rgb(255,255,255);
            box-shadow: 1px 1px 3px grey;
        }

        textarea:hover {
            cursor: pointer;
            background-color: rgb(255,255,255);
            box-shadow: 2px 2px 3px grey;
        }
        .but1{
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;
            border: 2px solid rgb(0, 0, 64);
            background-color: #4a77d4;
            box-shadow: 1px 1px 3px grey;

        }
        .but2{
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;
            border: 2px solid rgb(0, 0, 64);
            background-color: #f7a470;
            box-shadow: 1px 1px 3px grey;

        }
        a {
            color: black;
            text-decoration-line: none;
        }



    </style>
</head>
<body>
<div class="message">
    <h1>Edit your information</h1>
</div>

<div class="form">
<form action="update" method="post">

    <input type="text"  onchange="x()" id="usname" name="username" placeholder="Username"  />
	<br/>
    <input type="text" name="password" placeholder="Password"/>
	<br/>
    <input type="text" name="sex" placeholder="Sex"/>
	<br/>
    <input type="text" name="address"placeholder="Address" />
	<br/>
    <input type="hidden" name="email" value=${email} />
	<br/>
    <input class="but1" type="submit" value="Save"/>
</form>
</div>

<div class="abandon">
    <h1>Abandon your membership</h1>
</div>

<div class="form">
	<form action="delete" method="post">
		<input type="hidden" name="email" value=${email} /><br/>
		<input class="but2" type="submit" value="Abandon"/>
	</form>
</div>

<script >
    var userName=document.getElementById("usname");
    function x() {
        if(userName.value=="Fuck"){
            userName.value="";
            alert("Please input valid and polite name");
            return;
        }
    }

</script>
</body>
</html>

