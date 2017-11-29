<%@ page import="Classes.LoginInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%!
//    https://stackoverflow.com/questions/826932/declaring-functions-in-jsp
    public String doStylizeAd(String accId, String nickN, String cr_date, String text, String tags) {
        return ("" +
                "       <div class=\"b_ad\">\n" +
                "            <div class=\"b_ad_right_side\">\n" +
                "                <p><a href=\"https://worldoftanks.ru/ru/community/accounts/" + accId + "-" + nickN + "/\">" + nickN + "</a></p>\n" +
                "            </div>\n" +
                "            <div class=\"b_ad_left_side\">\n" +
                "                <div class=\"b_ad_text\">\n" +
                "                    <p>" + text + "\n" +
                "                    </p>\n" +
                "                </div>\n" +
                "                <div class=\"b_ad_time_cr\" style=\"float: right\">\n" +
                "                    <p>" + cr_date + "</p>\n" +
                "                </div>\n" +
                "                <div class=\"b-button_right\">\n" +
                "                    <span class=\"b-button-txt\">(!)Откликнуться</span>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n"
        );
    }
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background: url("css/BulletinBoard_background.jpg") repeat-y 50% 0 #e3e3e3;
            color: #434445;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
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

        .b_ad {
            background-color: rgba(255, 255, 255, 0.33);
            border: 1px solid rgba(0, 0, 0, 0.12);
            border-radius: 3px;
            box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.6) inset, 0 0 7px rgba(0, 0, 0, 0.13), 0 0 0 rgba(0, 0, 0, 0.1);
            margin: 0 17px 5px 0;
            padding: 10px;
            position: relative;
            transition: box-shadow 0.1s;
            overflow: hidden !important;
        }

        .b_ad_right_side {
            float: right;
            width: 10%;
            height: auto;
            background: #888;
        }

        .b_ad_left_side {
            overflow: hidden;
            height: auto;
        }

        .b_ad_text {
            margin-right: 5%;
            font-size: 12px;
        }

        .b-button_right {
            border: medium none;
            background: url("css/small-orange-button.png") no-repeat 100% 0;
            color: #fff;
            cursor: pointer;
            float: left;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif !important;
            font-weight: 700;
            height: 27px;
            line-height: 27px;
            margin: 0 -20px 0 2px;
            padding: 0 5px 1px;
            position: relative;
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            border-radius: 2px;
            text-shadow: rgba(0, 0, 0, 0.4) 0 -1px 0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.6);
        }

        .b_ad_time_cr {
            line-height: 18px;
            font-size: 12px;
            color: #777;
            margin-right: 5%;
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
                <textarea name="AdText" cols="100" rows="4" maxlength="225"></textarea>
            </p>
            <p><input type="reset" value="Очистить"></p>
            <p><input type="submit" value="Отправить"></p>
        </form>

        <%--<div class="b_ad">--%>
        <%--<div class="b_ad_right_side">--%>
        <%--<p><a href="https://worldoftanks.ru/ru/community/accounts/$$$ACC_ID-$$$NICKNAME/">$$$NICKNAME</a></p>--%>
        <%--</div>--%>
        <%--<div class="b_ad_left_side">--%>
        <%--<div class="b_ad_text">--%>
        <%--<p>$$$TEXT_MESS--%>
        <%--</p>--%>
        <%--</div>--%>
        <%--<div class="b_ad_time_cr" style="float: right">--%>
        <%--<p>$$$TIME_AGO</p>--%>
        <%--</div>--%>
        <%--<div class="b-button_right">--%>
        <%--<span class="b-button-txt">+Добавить</span>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--</div>--%>

                <% if (request.getAttribute("AdActual") != null) {
                    ArrayList<String> adList = (ArrayList<String>) request.getAttribute("AdActual");
//                    int inc = 0;
//                    out.println("<tr>");
                    for (int i = 0; i < adList.size(); i += 5) { //каждое 5ое - новое обьявление
                        out.println(doStylizeAd(adList.get(i)
                                , adList.get(i + 1)
                                , adList.get(i + 2)
                                , adList.get(i + 3)
                                , adList.get(i + 4)
                        ));
//                        account_id,nickname,to_char(cr_date,'dd/mm/yyyy hh24:mi:ss'),text,tags
//                        inc++;
//                        out.println("<td>" + adList.get(i) + "</td>");
//                        if (inc % 4 == 0 && i != 0)
//                            out.println("</tr><tr>");
                    }
//                    out.println("</tr>");
                } else {
                    out.println("Доска пока пуста...");
                }
                %>

        </table>
    </div>

    <%--<a href="/logout">Выйти</a>--%>
</h2>
</body>
</html>