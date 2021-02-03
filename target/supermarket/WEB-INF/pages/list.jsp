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
    <title>${list.get(0).username}'s Personal Info</title>
    <!--<base target="_blank" />-->
    <style>
        html{
            width: 100%;
            height: 900px;
            margin: 0;
            font-family: Arial,Helvetica,sans-serif;
            background-image: linear-gradient(to bottom right,#A9EBB3,#9FDEF5);
            background-size:100%;
        }
        body{
            width: 100%;
            height: 100%;
            margin: 0;
        }


        h2 {
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 64px;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 10px;
            border: 2px;
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
            width: 100%;
            font-family: Tahoma, Geneva, sans-serif;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.7);
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

        input[type=submit] {
            margin: auto;
            width: 30%;
            width: 290px;
            background-color: rgb(138, 180, 248);
            font-size: 15px;
            color: white;
            padding: 10px;
            border: 1px solid #3762bc;
            border-radius: 4px;
            box-shadow: 1px 1px 3px grey;
            cursor: pointer;
        }

        input[type=submit]:hover {
            box-shadow: 2px 2px 3px grey;
            background-color: #3762bc;
        }

        input[type=button] {
            margin: auto;
            width: 30%;
            width: 290px;
            background-color: rgb(138, 180, 248);
            font-size: 15px;
            color: white;
            padding: 10px;
            border: 1px solid #3762bc;
            border-radius: 4px;
            box-shadow: 1px 1px 3px grey;
            cursor: pointer;
            background-color:#f7a470;
        }

        input[type=button]:hover {
            box-shadow: 2px 2px 3px grey;
            background-color: #3762bc;
        }


        #form {
            position: absolute;
            top: 550px;
            left: 50%;
            margin: -150px 0 0 -150px;

        }
    </style>
</head>

<body>

    <h2>Welcome, ${list.get(0).username}!</h2>

    <!--$ means reading the data, the content in the {} is Java code-->
    <div id="personalInfo">
        <table>
            <tr>
                <th>My Account</th>
            </tr>
            <!--First row-->
            <tr>
                <td>Email:</td>
                <td>${list.get(0).email}</td>
                <td>Sex:</td>
                <td>${list.get(0).sex}</td>
            </tr>
            <!--Second row-->
            <tr>
                <td>Point:</td>
                <td>${list.get(0).point}</td>

                <td>Address:</td>
                <td>${list.get(0).address}</td>
            </tr>
            <!--Third row-->
            <tr>
                <td>Experience:</td>
                <td>${list.get(0).experience}</td>
                <td>Level:</td>
                <td>${(list.get(0).experience-list.get(0).experience%100)/100}</td>
            </tr>
            <!--Fourth row-->
            <tr>
                <td>Current experience next level:</td>
                <td><progress value=${list.get(0).experience%100} max="100"></progress>
                <td>
            </tr>
        </table>
    </div>
    <br />
    <div id="form">
        <input type="hidden" id="balance" name="Balance" value=${list.get(0).balance}>
        <input type="hidden" id="flag" name="flag" value="${list.get(0).bindFlag}">
        <form action="edit" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="submit" value="edit" /><br />
        </form>

        <form action="findGift" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input type="hidden" name="point" value=${list.get(0).point} />
            <input type="submit" value="findGift" /><br />
        </form>

        <form action="bindPayment" method="post">
            <input type="hidden" name="email" id="emailUser" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input id="bind" type="submit" value="Bind Payment" /><br />
        </form>

        <form action="renewMembership" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input type="submit" value="Renew Membership" /><br />
        </form>

        <form action="toCredit" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input type="submit" value="Credit Conversion" /><br />
        </form>

        <form action="toCreditHistory" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input type="submit" value="Credit Updating History " /><br />
        </form>

        <form action="toVerify" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input id="vemail" type="submit" value="Verify Email " /><br />
        </form>

        <form action="toResetPP" method="post">
            <input type="hidden" name="email" value=${list.get(0).email} />
            <input type="hidden" name="password" value=${list.get(0).password} />
            <input id="rpp" type="submit" value="Reset Payment Password " /><br />
        </form>
        <input type="button" value="Log Out " onclick="logout()"/><br />
    </div>
</body>
<script>
    var balance = document.getElementById("balance");
    var bind = document.getElementById("bind");
    var flag = document.getElementById("flag");
    var vemail = document.getElementById("vemail");
    var rpp = document.getElementById("rpp");
    /*if(flag.value=="true"){
        vemail.setAttribute("disabled",true);
        rpp.removeAttribute("disabled");
    }
    else {
        rpp.setAttribute("disabled",true);
    }*/
    function logout(){
        if (window.confirm("Are you sure to log out our system?")) {
            location="http://localhost:8080/supermarket/";
        } else {
            return false;
        }
    }
</script>

</html>
