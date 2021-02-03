<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/26
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Repeat Email</title>
	

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
            margin-top: 200px;
            animation: fadeInLow 2500ms;
        }

        h3 {
            font-size: 48px;
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

        .
        form {
            margin: auto;
        }
    

        #form {
            position: absolute;
            top: 80%;
            left: 50%;
            margin: -150px 0 0 -150px;
        }


        .but {
            width: fit-content;
            margin-top: 40%;
            padding: 10px 50px;
            border-radius: 10px;
            text-align: center;
            border: 2px solid rgb(0, 0, 64);
            background-color: rgb(138, 180, 248);
            box-shadow: 1px 1px 3px grey;
        }

    </style>
</head>
<body>

<div class="message">
<h3>This email is already exist, please register again.</h3>
<p><a class="but" href="javascript:history.back(-1)">Return register</a></p>
</div>

</body>


</html>
