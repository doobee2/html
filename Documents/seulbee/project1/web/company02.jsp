<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::연혁</title>
    <%@ include file="head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        @font-face {
            font-family: 'HakgyoansimWoojuR';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
    .text-box {
    align-items: center;
    width: 1200px;
    padding: 20px;
    margin: 0 auto;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.8s, transform 0.4s;
    display: block;
    }
    .text-box:hover {
    background-color: #ffed88;
    transform: scale(1.05);
    }
    .text-box-content {
    margin-left: 20px;
    }
    .title {
    font-family: SBAggroB;
    font-size: 50px;
    font-weight: bold;
    }
    .content {
    font-family: HakgyoansimWoojuR;
    font-size: 20px;
    color: #555;
    margin-top: 5px;
    }
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>회사소개</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/company01.jsp"> 회사소개 </a> &gt; <span> 연혁 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">연혁</h2>
            </div>
        </section>

        <div class="text-box">
            <div class="title">2024</div>
            <div class="text-box-content">
                <div class="content">
                    이곳에 <br>
                    그로우앤조이의 연혁을 적어주세요! <br>
                </div>
            </div>
        </div>

        <div class="text-box">
            <div class="title">2023</div>
            <div class="text-box-content">
                <div class="content">
                    08.17. 2023 올해의 브랜드 최우수상 수상 <br>
                    08.16. 그로우앤조이 홈페이지 오픈<br>
                    08.01. 교육서비스 개발 시작<br>
                    07.31. 교육브랜드 그로우앤조이(Grow&Joy) 설립<br>

                </div>
            </div>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>
