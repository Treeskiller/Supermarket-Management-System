<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/1
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>-->
<html>

<head>
    <meta charset="UTF-8">
	<title>Transaction detail</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            font-style: sans-serif;
			background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }

        body {
            width: 100%;
            height: 100%;
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            background-image: linear-gradient(to bottom right, #A9EBB3, #9FDEF5);
        }

        #Credit {
            position: absolute;
            top: 50%;
            left: 35%;
            margin: -150px 0 0 -150px;
            width: 700px;
            height: 300px;
        }

        #Credit h1 {
            color: #fff;
            text-shadow: 0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }

        h1 {
            font-size: 2em;
            margin: 0.67em 0;
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

        .conbut {
            width: 300px;
            min-height: 40px;
            display: block;
            background-color: #f7a470;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: auto;
            position: absolute;
            right: 0px;
            bottom: 0px;
        }

        /*pop up window*/

        #background-pop {
            display: block;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        #div-pop {
            background: #F0F0F0;
            width: 600px;
            z-index: 2;
            margin: 12% auto;
            overflow: auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 18px;
            line-height: 24px;
            border: 5px solid rgb(200, 200, 200);
            border-radius: 20px;
        }



        h3 {
            background-color: rgb(200, 200, 200);
            position: relative;
            top: -10px;
            left: -1px;
            padding: 10px;
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 30px;
        }

        .close-button {
            margin: auto;
            width: 160px;
            position: relative;
            padding: 5px;
            bottom: 10px;
            font-size: 18px;
            text-align: center;
            border: 2px solid rgb(60, 60, 60);
            border-radius: 10px;
            box-shadow: 1px 1px 1px #2b2a2a;
        }

        .close-button:hover {
            cursor: pointer;
            background-color: rgb(160, 160, 160);
        }


        /**********************/

        #DOWN {
            text-align: center;
        }

        #back {
            position: relative;
            left: 112px;
            font-size: 30px;
        }
    </style>
</head>

<body id="body">


<div id="Credit">
    <h1 id="UP" font-weight: bold;></h1>
    <p id="DOWN" style="color: green; font-size: 24px; font-weight: bold; ">Transaction
        ID:${list.get(0).transactionID}</p>
    <p id="Daily" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
    <p id="Enter" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
    <p id="Food" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
</div>

<div id="background-pop">
    <div id="div-pop">
        <h3>Transaction detail</h3>
        <div id="info" style="padding-bottom: 20px;">
            <ul>
                <li>
                    Daily Necessities (Conversion rate of points:0.35):${list.get(0).dailyNecessities}
                </li>
                <li>
                    Entertainment (Conversion rate of points:0.43):${list.get(0).entertainment}
                </li>
                <li>
                    Food (Conversion rate of points:0.37):${list.get(0).food}
                </li>
                <li>
                    New Point bring in: ${list.get(0).creditStatus}
                </li>
            </ul>
        </div>

        <div class="close-button" onclick="redirect()">Close</div>
    </div>
</div>

<form action="findByEmail" method="post">
    <input id="h1" type="hidden" name="email" value=${users.get(0).email} />
    <input id="h2" type="hidden" name="password" value=${users.get(0).password} />
    <input  class="but" type="submit" value="Return your profile"  />
</form>

<form action="toCredit" method="post">
    <input type="hidden" name="email"  value=${users.get(0).email} /><br/>
    <input type="hidden" name="password" value=${users.get(0).password} /><br/>
    <input type="submit"  class="conbut" value="Search Another Transaction"/><br/>
</form>


<script>
    var up = document.getElementById('UP');
    var down = document.getElementById('DOWN');
    var IID = document.getElementById("inputID");
    var daily = document.getElementById('Daily');
    var enter = document.getElementById('Enter');
    var food = document.getElementById('Food');
    up.innerHTML =
        'Click button to Simulate Transaction';

    function randomStr(len, arr) {
        var ans = '';
        for (var i = len; i > 0; i--) {
            ans +=
                arr[Math.floor(Math.random() * arr.length)];
        }
        return ans;
    }

    function Fun1() {
        //con.style.display=block;
        var id = randomStr(20, '12345789abcdefgh');
        down.innerHTML = "Transaction ID:" + id;
        var dailyvalue = Math.floor(Math.random() * (300 - 30)) + 30;
        daily.innerHTML = dailyvalue;
        console.log(daily.innerHTML);
        console.log(dailyvalue);
        var entervalue = Math.floor(Math.random() * (300 - 30)) + 30;
        enter.innerHTML = entervalue;
        var foodvalue = Math.floor(Math.random() * (300 - 30)) + 30;
        food.innerHTML = foodvalue;
        console.log(id);
        var a = 202;
        a.toString()
        $.ajax({
            url: 'user/credit',
            type: 'GET',
            traditional: true,
            async: true,
            dataType: 'json',
            data: { "transactionID": id, "dailyNecessities": encodeURIComponent(dailyvalue), "entertainment": encodeURIComponent(entervalue), "food": encodeURIComponent(foodvalue) }
        })
        IID.style.display = "block";
    }
    function transmit() {
        var searchID = document.getElementById("inputID");
        var IDContent = searchID.value;
        $.ajax({
            url: 'user/searchDetail',
            type: 'GET',
            traditional: true,
            async: true,
            dataType: 'json',
            data: { "transactionID": IDContent }
        })

    }
    var div = document.getElementById('background-pop');//得到窗口对象
    var close = document.getElementById('close-button');//得到关闭对象
    /*close.onclick = function close() {//点击右上角的x，关闭窗口
        window.location.href="generate.jsp";
    }*/
    function redirect() {
        div.style.display = "none";
    }

</script>
</body>

</html>