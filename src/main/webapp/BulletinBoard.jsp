<%@ page import="Classes.LoginInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>

    <title>Доска объявлений</title>
</head>

<body>
<%
//    if (request.getAttribute("LoginInfo") != null) {
        LoginInfo loginInfo = (LoginInfo) request.getAttribute("LoginInfo");
        if (loginInfo!=null){
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
    <textarea name="AdText" cols="225" rows="4" maxlength="225"></textarea></p>
    <p><input type="reset" value="Очистить"></p>
    </p>
    <p><input type="submit" value="Отправить"></p>
</form>

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
                if (inc%4==0 && i != 0)
                    out.println("</tr><tr>");
            }
            out.println("</tr>");
        }else {
            out.println("<tr><td>Доска пока пуста...</td><td></td><td></td><td></td></tr>");
        }
        %>
    </tr>
</table>


<a href="/logout">Выйти</a>
</body>
</html>