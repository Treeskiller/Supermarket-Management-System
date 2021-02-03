<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/23
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forget</title>

    <style type="text/css">
        html {
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }


        p {
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

      

        .but {
            width: fit-content;
            padding: 10px 50px;
            border-radius: 10px;

            border: 2px solid rgb(0, 0, 64);
            background-color: rgb(138, 180, 248);
            box-shadow: 1px 1px 3px grey;
        }

        form {
            font-family: Arial, Helvetica, sans-serif;
            margin-top:15%;
            margin-bottom:23%;
            margin-right:40%;
            text-align: right;
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

        #form {

        }

    </style>

</head>
<body>
<div id="form">
    <form action="mailto:1183881653@qq.com" enctype="text/plain">


        Subject: <input name="subject" type="text"><br>
        c  c：<input name="cc" type="text"><br>
        bcc：<input name="bcc" type="text"><br>
        body：<textarea name="body"></textarea><br>
        <input type="text" name="mail" value="Your mail" size="20"><br/>
        <input class="but" value="submit" type="submit">

    </form>
</div>

</body>
</html>