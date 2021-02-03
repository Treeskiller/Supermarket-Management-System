<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            box-shadow: 1px 1px 3px grey;
            background-color: #2D2D3F;
        }



        .but {
            width: 275px;
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
            box-shadow: 1px 1px 3px grey;
        }

        .but:hover {
            cursor: pointer;
            background-color: #3762bc;
            box-shadow: 2px 2px 3px grey;
        }

        .conbut {
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
            right: 0px;
            bottom: 0px;
        }

        .conbut1 {
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

        .conbut1:hover,
        .conbut:hover {
            cursor: pointer;
            background-color: #f7a470;
            box-shadow: 2px 2px 3px grey;
        }
    </style>
</head>

<body style="text-align:center;" id="body">
    <input type="hidden" name="email" id="userEmail" value=${list.get(0).email}>
    <input type="hidden" name="password" id="password" value=${list.get(0).password}>
    <input type="hidden" name="point" id="userPoint" value=${list.get(0).point}>

    <input type="hidden" name="experience" id="userExperience" value=${list.get(0).experience}>


    <div id="Credit">
        <h1 id="UP" font-weight: bold;></h1>
        <input type="button" onclick="Fun1()" class="but" value="Simulate Transaction"></input>
        <p id="DOWN" style="color: green; font-size: 24px; font-weight: bold; "></p>
        <p id="Daily" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
        <p id="Enter" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
        <p id="Food" style="color: green; font-size: 24px; font-weight: bold;visibility: hidden;"></p>
    </div>
    <form action="findByEmail" method="post">
        <input type="hidden" name="email" value=${list.get(0).email}>
        <input type="hidden" name="password" value=${list.get(0).password}>
        <input type="submit" class="conbut1" value="Return to Profile">
    </form>
    <form action="searchDetail" method="post">
        <input required="required" type="text" id="inputID" name="transactionID" placeholder="transactionID"
            style="position: absolute;right: 0px;bottom: 30px;">
        <input type="hidden" name="email" width="1px" height="1px" value=${list.get(0).email}>
        <input type="hidden" name="password" width="1px" height="1px" value=${list.get(0).password}>
        <input type="submit" id="convert" class="conbut" value="Credit Conversion">
    </form>

    <script>
        var up = document.getElementById('UP');
        var down = document.getElementById('DOWN');
        var con = document.getElementById("convert");
        var IID = document.getElementById("inputID");
        var daily = document.getElementById('Daily');
        var enter = document.getElementById('Enter');
        var food = document.getElementById('Food');
        var emailO = document.getElementById("userEmail");
        var psO = document.getElementById("password")
        var password = psO.value;
        var email = emailO.value;
        var cpoint = document.getElementById("userPoint");
        var cexperience = document.getElementById("userExperience");
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
            var credit = Math.floor(0.035 * dailyvalue + 0.043 * entervalue + 0.037 * foodvalue);
            console.log(cpoint.value);
            var point = credit + (Number)(cpoint.value);
            console.log(point);
            cpoint.value = point;
            var experience = credit + (Number)(cexperience.value);
            cexperience.value = experience;
            $.ajax({
                url: 'credit',
                type: 'GET',
                traditional: true,
                async: true,
                dataType: 'json',
                data: { "transactionID": id, "dailyNecessities": encodeURIComponent(dailyvalue), "entertainment": encodeURIComponent(entervalue), "food": encodeURIComponent(foodvalue), "CreditStatus": credit, "email": email, "password": password, "point": point, "experience": experience }
            })
            con.style.display = "block";
            IID.value = "";
            IID.style.display = "block";
        }

    </script>
</body>

</html>