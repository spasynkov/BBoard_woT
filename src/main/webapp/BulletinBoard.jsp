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
    <link rel="stylesheet" href="Styles.css"/>
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

        <div class="b_ad">
            <div class="b_ad_right_side">
                <p><a href="https://worldoftanks.ru/ru/community/accounts/$$$ACC_ID-$$$NICKNAME/">$$$NICKNAME</a></p>
            </div>
            <div class="b_ad_left_side">
                <div class="b_ad_text">
                    <p>$$$TEXT_MESS
                    </p>
                </div>
                <div class="b_ad_time_cr" style="float: right">
                    <p>$$$TIME_AGO</p>
                </div>
                <div class="b-button_right">
                    <span id="respond" onclick = "doAction(this)"  class="b-button-txt">ОТКЛИК</span>
                </div>
            </div>

        </div>

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
<script type="text/javascript" src="JsFunctions.js"></script>
</html>