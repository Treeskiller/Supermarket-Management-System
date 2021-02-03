<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/6
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List All</title>

    <style type="text/css">
        html {
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }


        h3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 20px;
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

        a {
            color: black;
            text-decoration-line: none;
        }

        .button {
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;
            text-align: center;
            border: 2px solid rgb(0, 0, 64);
            background-color: rgb(138, 180, 248);
            box-shadow: 1px 1px 3px grey;
        }

        .button:hover {
            cursor: pointer;
            background-color: rgb(109, 165, 255);
            box-shadow: 2px 2px 3px grey;
        }
        .message {
            font-family: Arial, Helvetica, sans-serif;
            position: relative;
            height: 100px;
            margin-top: 200px;
            animation: fadeInLow 2500ms;
        }
       


    </style>

</head>
<body>
<div class="message">
    <h3>Find all success</h3>

    <table border="1">
        <tr>
            <td>User Email</td>
            <td>User Name</td>
            <td>User Password</td>
            <td>User Point</td>
            <td>User Sex}</td>
            <td>User Level</td>
            <td>User Address</td>
        </tr>
        <c:forEach items="${list}" var="user">
            <tr>
                <td>${user.email}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.point}</td>
                <td>${user.level}</td>
                <td>${user.sex}</td>
                <td>${user.address}</td>
            </tr>
            <br>
        </c:forEach>
    </table>
    <br/>

</div>


</body>
</html>

