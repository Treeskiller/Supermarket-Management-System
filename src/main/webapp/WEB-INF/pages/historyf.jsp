<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/2
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>History</title>
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

        h1 {
            animation: fadeInLow 2500ms;
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
            margin: auto;
            position: absolute;
            left: 0px;
            bottom: 0px;
        }
    </style>
</head>
<body>
<h1 style="position: absolute;left: 30%; top:35%">You have no history about credit updating</h1>
<form action="findByEmail" method="post">
    <input id="h1" type="hidden" name="email" value=${email} />
    <input id="h2" type="hidden" name="password" value=${password} />
    <input  class="but" type="submit" value="Return your profile"  />
</form>
</body>
</html>

