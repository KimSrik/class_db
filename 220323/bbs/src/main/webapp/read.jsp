<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹게시판</title>
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
        .clearfix::after{
            content: '';
            display: block;
            clear: both;
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 36px 16px;
        }
        .sec-tit{
            margin-bottom: 32px;
            font-weight: 700;
            font-size: 32px;
            color: #333;
            text-align: center;
        }
        .table{
            border-top: 2px solid #333;
            border-bottom: 2px solid #333;
            margin-bottom: 20px;
        }
        .n-tit, .n-content{
            padding: 20px 0;
        }
        .n-tit{
            border-bottom: 1px solid #333;
        }
        #noticeTit, #noticeContent{
            width: 100%;
            padding: 16px;
            font-size: 20px;
        }
        #noticeTit{
            font-weight: 700;
            border: none;
        }
        #noticeContent{
            height: 300px;
            border: none;
        }
        
        .g-btn{
            display: flex;
            flex-flow: row nowrap;
            justify-content: flex-end;
        }
        button{
            margin-left: 16px;
            border-radius: 8px;
            padding: 8px;
            background-color: darkgreen;
            font-weight: 500;
            font-size: 20px;
            color: #fff;
        }
        button:first-child{
            background-color: darkred;
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
                                <li class="logo"><a href="./main.jsp">게시판 만들기</a></li>
                                <li><a href="./main.jsp">메인</a></li>
                                <li><a href="./notice.jsp" class="active">게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-right">
                            <ul>
                                <li><a href="./login.jsp">로그인</a></li>
                                <li><a href="#" style="display:none">로그아웃</a></li>
                                <li><a href="./join.jsp">회원가입</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <section class="sec main-sec">
            <div class="container">
                <div class="contents clearfix">
                    <div class="sec-tit">글읽기</div>
                    <div class="table">
                        <div class="n-tit">
                            제목
                            <br>
                            <input type="text" name="noticeTit" id="noticeTit" value="문의드립니다." disabled>
                        </div>
                        <div class="n-content">
                            내용
                            <br>
                            <textarea name="noticeContent" id="noticeContent" disabled>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, quam veniam explicabo atque minima accusantium consequatur magnam tempore. Blanditiis deleniti sapiente unde, et sint vel est voluptate nobis dolorum fuga!
                                Laudantium sit consectetur libero soluta voluptas fugiat repudiandae dolor eaque, cupiditate mollitia veritatis laboriosam! Odit eveniet corrupti quasi, dolore eum sunt vitae voluptas, voluptates illo, repellendus inventore id harum sint.
                            </textarea>
                            
                        </div>
                        
                    </div>               
                    <div class="g-btn">
                        <button class="button"><a href="./update.jsp">수정</a></button>  
                        <button class="button">삭제</button>  
                    </div>
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