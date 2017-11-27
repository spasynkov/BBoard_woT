<%@ page import="Classes.LoginInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background: url("css/BulletinBoard_background.jpg") repeat-y 50% 0 #e3e3e3;
            color: #434445;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            height: 100%;
            line-height: 1.3;
            margin: 0 auto;
            min-width: 1000px;
            position: relative;
            width: 100%;
        }

        .b-header {
            height: 151px;
            background: url("css/BulletinBoard_header.jpg") no-repeat 50% 0;
            /*color: white;*/
            /*font-size: 200%;*/
        }

        .b-header_content {
            padding-left: 45px;
            padding-right: 45px;
            max-width: 1170px;
            margin-left: auto;
            margin-right: auto;
            position: relative;
        }

        .b-logo {
            color: #c1c1c1;
            font: 21px WarHelios, "Arial Narrow", arial, sans-serif;
            display: block;
            min-height: 92px;
            letter-spacing: 1.7px;
            margin: 0 auto;
            position: relative;
            text-align: center;
            text-transform: uppercase;
            text-shadow: 1px 0 1px rgba(0, 0, 0, 0.93), 0 0 10px rgba(255, 0, 6, 0.22);
            top: 13px;
            width: 172px;
        }

        .b-logo span {
            color: #cd000e;
            display: block;
            font-size: 11px;
        }
        .b-content {
            padding-left: 45px;
            padding-right: 45px;
            max-width: 1170px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 11px;
            position: relative;
        }
        .gw-frame-1 {
            background-color: rgba(255,255,255,0.33);
            border: 1px solid rgba(0,0,0,0.12);
            border-radius: 3px;
            box-shadow: 0 0 0 1px rgba(255,255,255,0.6) inset, 0 0 7px rgba(0,0,0,0.13), 0 0 0 rgba(0,0,0,0.1);
            margin: 0 17px 17px 0;
            padding: 10px;
            position: relative;
            transition: box-shadow 0.1s;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>

    <title>Доска объявлений</title>
</head>

<body>
<h1 class="b-header">
    <div class="b-header_content">
        <a class="b-logo" href="http://localhost:8080/BulletinBoard/">
            <img src="css/wg_logo.png" alt="Wargaming.net">
            <span>LOOKING FOR WG</span>
        </a>
    </div>
    <%--Логотип сюда попозже--%>
</h1>

<h2>
    <div class="b-content">

<%
    //    if (request.getAttribute("LoginInfo") != null) {
    LoginInfo loginInfo = (LoginInfo) request.getAttribute("LoginInfo");
    if (loginInfo != null) {
        if (loginInfo.getStatus().equalsIgnoreCase("ok")) {

            out.println(loginInfo.getNickname());
            out.println(loginInfo.getAccount_id());
            out.println("До: " + loginInfo.getExpires_at());
            out.println(loginInfo.getAccess_token());
        } else {
        }

    }
//    else {
//        out.println("<p style=\"color: red;\">Возникла какая-то ошибка. Извините</p>");
//        out.println(request.getAttribute("LoginInfo"));
//        out.println("");
//    }
%>


<form action="MakeAd" method="post">
    <p>
        <select size="1" multiple name="duration_time">
            <option disabled>Время действия</option>
            <option selected value="15 min">15</option>
            <option value="30 min">30</option>
            <option value="45 min">45</option>
        </select>
    <p>Текст объявления
        <textarea name="AdText" cols="225" rows="4" maxlength="225"></textarea>
    </p>
    <p><input type="reset" value="Очистить"></p>
    <p><input type="submit" value="Отправить"></p>
</form>

<div class="gw-frame-1" style="overflow: hidden !important">
    <div style="float: left; margin-right: 10px">
        <div class="floatleft"><img alt="Kidd_logo.png" src="http://wiki.gcdn.co/images/thumb/e/e9/Kidd_logo.png/200px-Kidd_logo.png" width="200" height="113" srcset="http://wiki.gcdn.co/images/thumb/e/e9/Kidd_logo.png/300px-Kidd_logo.png 1.5x, http://wiki.gcdn.co/images/thumb/e/e9/Kidd_logo.png/400px-Kidd_logo.png 2x"></div> <h3 style="margin-top: 0px"> <span class="mw-headline" id="Kidd">Kidd</span></h3>
        <p>В Премиум магазин прибыло новое пополнение — Не упустите возможность добавить тихоокеанского «корсара» в свою коллекцию!
        </p>
        <div style="float: right"><b><a target="_blank" rel="nofollow noreferrer noopener" class="external text" href="https://ru.wargaming.net/shop/wows/main/">Перейти&nbsp;»</a></b></div>
    </div>
</div>

<table border="1">
    <caption>Текущие объявления</caption>
    <tr>
        <th>Автор</th>
        <th>Время создания</th>
        <th>Текст</th>
        <th>Теги</th>
    </tr>
    <tr>
        <% if (request.getAttribute("AdActual") != null) {
            ArrayList<String> adList = (ArrayList<String>) request.getAttribute("AdActual");
            int inc = 0;
            out.println("<tr>");
            for (int i = 0; i < adList.size(); i++) {
                inc++;
                out.println("<td>" + adList.get(i) + "</td>");
                if (inc % 4 == 0 && i != 0)
                    out.println("</tr><tr>");
            }
            out.println("</tr>");
        } else {
            out.println("<tr><td>Доска пока пуста...</td><td></td><td></td><td></td></tr>");
        }
        %>
    </tr>
</table>
</div>

<%--<a href="/logout">Выйти</a>--%>
</h2>
</body>
</html>