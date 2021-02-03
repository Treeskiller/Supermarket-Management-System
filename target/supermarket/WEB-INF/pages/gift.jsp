<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/5/16
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>Gift</title>
    <style type="text/css">
        html {
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }

        body {
            background-image: linear-gradient(to bottom right, #A9EBB3, #9fdef5);
        }

        h1 {
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 42px;
            background-color: rgba(255, 255, 255, 0.7);
            border: 2px;
            padding: 10px;
            opacity: 0.8;
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

        a:link {
            color: rgb(253, 2, 2);
        }

        a:visited {
            color: rgb(2, 253, 2);
        }

        a:hover {
            color: rgb(2, 2, 253);
        }

        a:active {
            color: rgb(253, 2, 240);
        }

        table {
            width: 100%;
            font-family: Tahoma, Geneva, sans-serif;
            border-collapse: collapse;
            background-color: #ffffff;
            opacity: 0.8;
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

        h3 {
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.6);
            font-size: 24px;
        }

        input {
            width: 200px;
            height: 30px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            line-height: 10px;
            color: white;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: #4a77d4;
            border: 1px solid #3762bc;
            box-shadow: 1px 1px 3px grey;
        }

        input[type=submit]:hover {
            cursor: pointer;
            background-color: #f7a470;
            box-shadow: 2px 2px 3px grey;
        }

    </style>
</head>

<body>

    <script language="javascript">
        function firm() {
            if (window.confirm("Are you sure to exchange?")) {

            } else {
                return false;
            }
        }
    </script>
    <h1>Find gift success</h1>

    <h3>Your point</h3>
    ${point}
    <br />
    <h3>Gift list</h3>

    <!--create gift table-->
    <table border="1">
        <tr>
            <td>Gift Name</td>
            <td>Gift Point</td>
            <td>Gift Price</td>
            <td>Gift Number</td>
            <td>Gift Picture</td>
            <td>Exchange</td>
        </tr>
        <c:forEach items="${list}" var="gift">

            <tr>
                <td>${gift.name}</td>
                <td>${gift.point}</td>
                <td>${gift.price}</td>
                <td>${gift.number}</td>
                <td> <img src="${pageContext.request.contextPath}/images/${gift.name}.jpg" alt="${gift.name}"
                        width="200" height="200"></td>

                <td>
                    <c:choose>
                        <c:when test="${point>=gift.point}">
                            <form action="exchangeGift" method="post">
                                <input type="hidden" name="email" value=${email} /><br />
                                <input type="hidden" name="password" value=${password} /><br />
                                <input type="hidden" name="name" value=${gift.name} /><br />
                                <input type="hidden" name="number" value=${gift.number} /><br />
                                <input type="submit" value="select" onclick="return firm()" /><br />
                            </form>
                        </c:when>
                        <c:otherwise>
                            <p>Your point is not enough</p>
                        </c:otherwise>
                    </c:choose>
                </td>

            </tr>
            <br>
        </c:forEach>
    </table>
    <br />


    <br>

    <p>More gifts will be displayed in the future</p>
    <form action="findByEmail" method="post">
        <input type="hidden" name="email" value=${email} /><br />
        <input type="hidden" name="password" value=${password} /><br />

        <input type="submit" value="Return your profile" /><br />
    </form>
</body>
<script>
    /*var transactionID = document.getElementById("transactionID");
    function randomStr(len, arr) {
        var ans = '';
        for (var i = len; i > 0; i--) {
            ans +=
                arr[Math.floor(Math.random() * arr.length)];
        }
        return ans;
    }
    var id = randomStr(20, '12345789abcdefgh');
    transactionID.value = id;
    console.log(transactionID.value);*/
</script>

</html>

