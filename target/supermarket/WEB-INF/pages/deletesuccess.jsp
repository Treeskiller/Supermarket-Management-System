<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/27
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Operation success</title>

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
            position: relative;
            overflow: hidden;
            width: 100%;
            text-align: center;
            margin-top: 300px;
            animation: fadeInLow 2500ms;
        }

        h1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 48px;
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
            margin: 10% auto;
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

   
    </style>
	
</head>
<body>

<div class="message">
    <h1>You abandoned your membership successfully.</h1>
</div>

<div class="button">
    <a href="http://localhost:8080/supermarket/">Back</a>
</div>

</body>
</html>

