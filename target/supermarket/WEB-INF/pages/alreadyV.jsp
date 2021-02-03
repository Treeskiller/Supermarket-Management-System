<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/2
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
  <title>Already Verified</title>
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

    .banner,
    .otherInfo {
      text-align: center;
      border: 1px solid red;
    }

    .banner {
      position: absolute;
      top: 0;
      left: 0;
      width: 320px;
      height: 80px;
    }

    .message {
      position: relative;
      overflow: hidden;
      width: 100%;
      text-align: center;
      margin-top: 300px;
      animation: fadeInLow 2500ms;
    }

    h1 {
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

    .otherInfo {
      z-index: -1;
      opacity: 0.7;
      position: fixed;
      bottom: 0;
      width: fit-content;
      margin: auto;
      padding: 10px;
      background-color: white;
    }

    form {
      margin: auto;
    }

    /*
    input {
      width: fit-content;
      padding: 10px 50px;
      border-radius: 10px;
      text-align: center;
      border: 1px solid #3762bc;
      background-color: rgb(138, 180, 248);
      box-shadow: 1px 1px 3px grey;
    }

    input:hover {
      cursor: pointer;
      background-color: rgb(109, 165, 255);
      box-shadow: 2px 2px 3px grey;
    }*/

    #form {
      position: absolute;
      top: 80%;
      left: 50%;
      margin: -150px 0 0 -150px;
    }

    input {
      width: 278px;
      margin-bottom: 10px;
      outline: none;
      padding: 10px;
      font-size: 13px;
      color: black;
      box-shadow: 1px 1px 3px grey;
      border-top: 1px solid #312E3D;
      border-left: 1px solid #312E3D;
      border-right: 1px solid #312E3D;
      border-bottom: 1px solid #56536A;
      border-radius: 4px;
      background-color: rgb(138, 180, 248);
      ;
    }

    input[type=submit]:hover {
      cursor: pointer;
      background-color: rgb(109, 165, 255);
      box-shadow: 2px 2px 3px grey;
    }

    /*
    .but {
      width: fit-content;
      margin: 10% auto;
      padding: 10px 50px;
      border-radius: 10px;
      text-align: center;
      border: 2px solid rgb(0, 0, 64);
      background-color: rgb(138, 180, 248);
      box-shadow: 1px 1px 3px grey;
    }*/
  </style>
</head>

<body>


  <div class="message">
    <h1>You have already verified your email.</h1>
  </div>

  <div id="form">
    <form action="findByEmail" method="post">
      <input id="h1" type="hidden" name="email" value=${email} />
      <input id="h2" type="hidden" name="password" value=${password} />
      <input type="submit" value="Return to your profile" />
    </form>
  </div>



</body>

</html>