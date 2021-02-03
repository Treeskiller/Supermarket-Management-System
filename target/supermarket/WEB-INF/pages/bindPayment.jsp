<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/29
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<title>BindPayment</title>
	
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

        #Bind {
            position: absolute;
            top: 50%;
            left: 40%;
            margin: -150px 0 0 -150px;
            width: 500px;
            height: 300px;
        }

        #Bind h1 {
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
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color:rgb(0,0,0);
          
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: rgb(255,255,255);
        }

        .but {
            width: 275px;
            min-height: 40px;
            display: block;
            background-color: #d4ba4a;
            border: 1px solid ##d4ba4a;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: auto;
            position: absolute;
            left: 420px;
            top: 225px;
        }

        .conbut {
            width: 330px;
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
        }
        #warning{
            width: 300px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: #f50632;
            text-shadow: 1px 1px 1px;
            position: absolute;
            left: -194px;
            top: 108px;
        }
        #warning2{
            width: 300px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: #f50632;
            text-shadow: 1px 1px 1px;
            position: absolute;
            left: -172px;
            top: 203px;
        }
        #warning3{
            width: 300px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: #f50632;
            text-shadow: 1px 1px 1px;
            position: absolute;
            left: -172px;
            top: 250px;
        }
    </style>
</head>

<body style="text-align:center;" id="body">
<div id="Bind">
    <h1 id="UP" font-weight: bold;>Bind your payment way</h1>
    <form action="savebinding" method="post">
    <input required="required" type="text"  id="inputName" name="Name" placeholder="Real Name" >
    <input required="required" type="text" id="cardNumber" name='creditCardNumber' placeholder="Credit Card Number" onchange="checkValid()">
    <p id="warning" style="display: none;">Invalid Credit Card Number </p>
    <input  required="required" type="text" name="paymentPassword" placeholder="Payment Password">
    <input required="required" id="phone" type="text" name="phoneNumber" placeholder="Phone Number" onchange="checkValid2()">
    <p id="warning2" style="display: none;">Invalid phone Number </p>
    <input type="button" id="send"  class="but" value="Send Verification Code"  onclick="sendPhoneNumber()">
    <input type="text" name="veriCode" required="required" id="veriCode" placeholder="Verification Code" onchange="testCode()">
    <p id="warning3" style="display: none;">Invalid Verification Code</p>
        <input type="hidden" id="userEmail" width="1px" height="1px" name="email" value=${email} /><br/>
        <input type="hidden" name="password" width="1px" height="1px" value=${password} /><br/>
    <input type="submit" id="confirm" class="conbut" value="Binding payment" disabled="disabled">
    </form>
</div>



<script>
    console.log("cao");
    var getCode;
    var up = document.getElementById('UP');
    var number=document.getElementById("cardNumber");
    var warnmessage=document.getElementById("warning");
    var button1=document.getElementById('send');
    var button2=document.getElementById('confirm');
    var smartphone=document.getElementById("phone");
    var warn2=document.getElementById("warning2");
    var warn3=document.getElementById("warning3");
    var counter;
    function checkValid(){
        var pattern = /^([1-9]{1})(\d{14}|\d{18})$/;
        var cdnumber=number.value;

        if (!pattern.test(cdnumber)) {
            warnmessage.style.display="block";
            button1.setAttribute("disabled",true);
            //button2.setAttribute("disabled",true);
        }
        else{
            warnmessage.style.display="none";
            button1.removeAttribute('disabled');
            //button2.removeAttribute('disabled');
        }
    }

    /*function Fun1() {
        $.ajax({
            url: 'user/credit',
            type: 'GET',
            traditional:true,
            async:true,
            dataType: 'json',
            data: {"transactionID":id,"dailyNecessities": encodeURIComponent(dailyvalue), "entertainment": encodeURIComponent(entervalue), "food": encodeURIComponent(foodvalue),"CreditStatus":credit}
        })
        con.style.display = "block";
        IID.value="";
        IID.style.display="block";
    }*/
    function checkValid2(){
        var myreg = /^[1][3,4,5,7,8,9][0-9]{9}$/;
        var phnumber=smartphone.value;
        if (!myreg.test(phnumber)) {
            warn2.style.display="block";
            button1.setAttribute("disabled",true);
            //button2.setAttribute("disabled",true);
        }
        else{
            warn2.style.display="none";
            button1.removeAttribute('disabled');
            //button2.removeAttribute('disabled');
        }
    }
    function sendPhoneNumber(){
        counter=0;
        var randomCode=Math.floor(Math.random() *9999 + 100);
        getCode=randomCode;
        var phonumber=smartphone.value;
        var emailAccount=document.getElementById("userEmail");
        console.log(phonumber);
        console.log(randomCode);
        $.ajax({
            url: 'phonecode',
            type: 'GET',
            traditional:true,
            async:true,
            dataType: 'json',
            data: {"phonenumber":phonumber,"code":randomCode,"email":emailAccount.value}
        })
    }
    function testCode() {
        var testCode=document.getElementById("veriCode");
        console.log("In test is: "+getCode)
        console.log(counter)
        if(counter>=3){
            alert("Please re-send verification code to your phone");
            button2.setAttribute("disabled",true);
        }
        if (testCode.value==getCode){
            button2.removeAttribute('disabled');
            warn3.style.display="none";
        }
        else {
            warn3.style.display="block";
            //alert("Incorrect Verification Code. Binding failed")
            counter++;

        }


    }

</script>
</body>
</html>
