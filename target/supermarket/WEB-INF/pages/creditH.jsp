<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/2
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CreditsHistory</title>
	<style type="text/css">
        html {
			background-image: linear-gradient(to bottom right, #A9EBB3, #9fdef5);
			font-family: Arial, Helvetica, sans-serif;
        }
		body {
		background-image: linear-gradient(to bottom right, #A9EBB3, #9fdef5);
		}


		h1 {
			margin-top:120px;
			text-align: center;
			font-family: Arial, Helvetica, sans-serif;
			font-size: 30px;
			background-color: #ffffff;
			border: 2px;
			opacity:0.8;
			animation: fadeInLow 4s;
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
		table {
			border:1px;
			width: 100%;
			font-family: Tahoma, Geneva, sans-serif;
			border-collapse: collapse;
			background-color: #ffffff;
			opacity:0.8;
            position: absolute;
            left: 0%;
            top: 30%;
            margin-bottom: 200px;
		}

		th {
			padding-left: 10px;
			font-size: 32px;
			text-align: left;
		}

		tr {
			text-align: left;
		}

		td {
			width: fit-content;
			text-align: left;
			padding: 10px;
		}

        form {
            font-family: Arial, Helvetica, sans-serif;
			position: fixed;
			bottom: 0;
			width: fit-content;
			margin: auto;
			padding: 10px;
            text-align: center;
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
			position: absolute;
            left: 0px;
            bottom: 0px;
        }
    </style>
</head>
<body>
<h1 > The Credit History is as follows:</h1>
<table border="1">
    <tr>
        <td>Transaction ID</td>
        <td>Daily Necessities</td>
        <td>Entertainment</td>
        <td>Food</td>
        <td>Credit Status</td>
        <td>Transaction Time</td>
    </tr>
<c:forEach items="${History}" var="credit">

    <tr>
    <td>${credit.transactionID}</td>
    <td>${credit.dailyNecessities}</td>
    <td>${credit.entertainment}</td>
    <td>${credit.food}</td>
    <td>${credit.creditStatus}</td>
    <td>${credit.transactionTime}</td>
    </tr>
    <br>
</c:forEach>
</table>


<form action="findByEmail" method="post">
    <input id="h1" type="hidden" name="email" value=${email} />
    <input id="h2" type="hidden" name="password" value=${password} />
    <input  class="but" type="submit" value="Return your profile"  />
</form>

</body>
</html>