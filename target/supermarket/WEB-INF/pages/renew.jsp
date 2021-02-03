<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/1
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title></title>

    <meta charset="UTF-8">
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

        #Renew {
            position: absolute;
            top: 60%;
            left: 40%;
            margin: -150px 0 0 -150px;
            width: 500px;
            height: 300px;
        }

        #Renew h1 {
            color: #fff;
            text-shadow: 0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }

        h1 {
            font-size: 2em;
            margin: 0.67em 0;
            position: relative;
            left: 20px;
        }

        input{
            width: 305px;
            height: 15px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: rgb(0,0,0);
            box-shadow: 1px 1px 3px grey;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            background-color: rgb(255,255,255);
        }
		.conbut1 {
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
            margin: 10px 85px;
        }

        .conbut2 {
            width: 330px;
            min-height: 40px;
            display: block;
            background-color: #f7a470;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 10px 85px;
        }
        #tip1{
            position: absolute;
            top: 10%;
            left: 30%;
        }

        #tip2{
            position: absolute;
            top: 20%;
            left: 30%;
        }
        #mlength{
            position: relative;
            left: 87px;
        }
        #paypass{
            position: relative;
            left: 87px;
        }
        #tip3{
            position: absolute;
            left: 314px;
            top: 84px;
            font-size: 40px;
            color: #448043
        }
        #tip4{
            position: absolute;
            left: 314px;
            top: 335px;
            font-size: 40px;
            color: #7c8043
        }
        #tip5{
            width: 300px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: #f50632;
            text-shadow: 1px 1px 1px;
            position: absolute;
            left: 428px;
            top: 106px;
        }

    </style>
</head>
<body>
<input id="paymentInfo" type="hidden" value=${list.get(0).paymentPassword}></input>
<h1 id="tip3"> The membership fee is 30 RMB per month</h1>
<h1 id="tip4"> You need to bind your payment way first</h1>
<form action="bindPayment" method="post">
    <input type="hidden" name="email" id="emailUser" width="1px" height="1px" value=${list.get(0).email} /><br/>
    <input type="hidden" name="password" width="1px" height="1px" value=${list.get(0).password} /><br/>
<input id="bindp"type="submit" name="bindPayment" class="conbut"  style="position: absolute; left: 500px;top: 460px; height: 45px;"value="Bind Payment">
</form>
<h1 id="tip1">Your Balance is: <span id="balance">${list.get(0).balance}</span></h1>
<h1 id="tip2">Your membership length is:<span id="memberlength">${list.get(0).memberLength}</span></h1>
<div id="Renew">
    <h1 id="UP" font-weight: bold;>Renew your membership</h1>
    <form action="saveRenew" method="post">
    <input required="required" type="text"  id="mlength" name="fmemberLength" placeholder="Membership Length" >
        <input  type="hidden"  id="rmlength" width="1px" height="1px" name="memberLength"  >
    <input required="required" type="text" id="paypass" name='paymentPassword' placeholder="Payment Password" onchange="checkPPS()">
        <input type="hidden" id="leftBalance" width="1px" height="1px" name="Balance">
        <p id="tip5" style="display: none">Incorrect Payment Password</p>
        <input type="hidden" name="email"  width="1px" height="1px" value=${list.get(0).email} /><br/>
        <input type="hidden" name="password" width="1px" height="1px" value=${list.get(0).password} /><br/>
    <input type="submit" id="confirm" class="conbut1" value="Renew Membership">
    </form>
    <form action="findByEmail" method="post">
        <input id="h1" type="hidden" name="email" width="1px" height="1px" value="${list.get(0).email}" />
        <input id="h2" type="hidden" name="password"  width="1px" height="1px" value="${list.get(0).password}" />
        <input type="submit" name="backList" class="conbut2" style="background-color: #d4544a"value="Return To Profile">
    </form>

</div>
</body>
<script >
    var renew=document.getElementById('Renew');
    var balance=document.getElementById('balance');
    var balanceValue=balance.innerHTML;
    var Tip1=document.getElementById('tip1');
    var Tip2=document.getElementById('tip2');
    var Tip3=document.getElementById('tip3');
    var Tip4=document.getElementById('tip4');
    var pp=document.getElementById('bindp');
    var ppInfo=document.getElementById('paymentInfo');
    var paypass=document.getElementById('paypass');
    var confirm=document.getElementById('confirm');
    var Tip5=document.getElementById('tip5');
    var rmlength=document.getElementById('rmlength');
    var currentLe=document.getElementById('memberlength');
    var mlength=document.getElementById('mlength');
    var leftBalance=document.getElementById('leftBalance');
    var totalBalance=document.getElementById('balance');
    console.log(balanceValue);
    if(balanceValue==-1){
        renew.style.display="none";
        Tip1.style.display="none";
        Tip2.style.display="none";
        Tip3.style.top="280px";
    }
    else{
        Tip3.style.display="none";
        Tip4.style.display="none";
        pp.style.display="none";
    }
    function checkPPS(){
        if(ppInfo.value!=paypass.value){
            confirm.setAttribute('disabled',true);
            Tip5.style.display="block";
        }
        else {
            confirm.removeAttribute('disabled',true);
            Tip5.style.display="none";
            rmlength.value=Number(currentLe.innerHTML)+Number(mlength.value);
            console.log(rmlength.value);
            leftBalance.value=totalBalance.innerHTML-30*(mlength.value);
            console.log(leftBalance.value);

        }
    }
</script>
</html>

