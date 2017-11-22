<%@ page import="Classes.LoginInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>

    <title>Страница входа</title>
</head>

<body>
<%
    if (request.getAttribute("LoginInfo") != null) {
        LoginInfo loginInfo = (LoginInfo) request.getAttribute("LoginInfo");
        if (loginInfo.getStatus().equalsIgnoreCase("ok")){

            out.println(loginInfo.getNickname());
            out.println(loginInfo.getAccount_id());
            out.println("До: "+loginInfo.getExpires_at() );
            out.println(loginInfo.getAccess_token());
        }else {
        }

    } else {
        out.println("<p style=\"color: red;\">Возникла какая-то ошибка. Извините</p>");
        out.println(request.getAttribute("LoginInfo"));
        out.println("");
    }
%>
<a href="/logout">Выйти</a>
</body>
</html>