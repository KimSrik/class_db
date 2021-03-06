<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>μΉκ²μν</title>
    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        ul, ol, li{
            list-style: none;
        }
        a{
            color: inherit;
            text-decoration: none;
        }
        img{
            width: 100%;
            vertical-align: top;
        }

        .header{
            background-color: #a0a0a0;
        }
        .header .container{
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 16px;
        }
        .gbl-nav, .gbl-nav ul{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between;
            align-items: flex-end;
        }
        .nav-left li{
            margin-right: 32px;
        }
        .nav-right li{
            margin-left: 32px;
        }
        .nav-left li.logo{
            font-size: 32px;
            font-weight: 700;
            color: #fff;
        }
        .gbl-nav ul li{
            font-size: 24px;
            font-weight: 500;
            color: #333;
        }
        .gbl-nav ul li:hover a{
            color: #fff;
        }
        .active{
            background-color: lightgreen !important;
            color: #fff !important;
        }


        .main-sec .container{
            width: 100%;
        }
        .main-sec .contents{
            display: flex;
            flex-flow: column nowrap;
            justify-content: center;
            align-items: center;
            height: 800px;
            padding: 0 200px;
            background-image:url('./images/main.jpg');
            background-position: center 80%;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .contents-tit{
            font-weight: 900;
            font-size: 100px;
            text-align: center;
            margin-bottom: 50px;
        }
        .contents-txt{
            font-weight: 500;
            font-size: 28px;
        }

        .footer{
            background-color: #999;
        }
        address{
            padding: 20px;
            font-weight: 700;
            font-size: 24px;
            color: #fff;
            text-align: center;
        }

    </style>
</head>
<body>
    <div class="wrap">
        <header class="header">
            <div class="container">
                <div class="nav">
                    <ul class="gbl-nav">
                        <li class="nav-left">
                            <ul>
                                <li class="logo"><a href="./main.jsp">κ²μν λ§λ€κΈ°</a></li>
                                <li><a href="./main.jsp" class="active">λ©μΈ</a></li>
                                <li><a href="./notice.jsp">κ²μν</a></li>
                            </ul>
                        </li>
                        <li class="nav-right">
                            <ul>
                                <li><a href="./login.jsp">λ‘κ·ΈμΈ</a></li>
                                <li><a href="#" style="display:none">λ‘κ·Έμμ</a></li>
                                <li><a href="./join.jsp">νμκ°μ</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <section class="sec main-sec">
            <div class="container">
                <div class="contents">
                    <div class="contents-tit">νμν©λλ€.</div>
                    <div class="contents-txt">λ‘κ·ΈμΈ ν κ²μν μμ±μ΄ κ°λ₯ν©λλ€.</div>
                    <div class="contents-txt" style="display:none">μμ λ‘­κ² κ²μν κΈ°λ₯μ μ¬μ©ν  μ μμ΅λλ€.</div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <address>
                    Copyright KIM
                </address>
            </div>
        </footer>
    </div>
</body>
</html>