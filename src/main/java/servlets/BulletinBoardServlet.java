package servlets;

import Classes.LoginInfo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/BulletinBoard")
public class BulletinBoardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(request, response);
        System.out.println("BBpost");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!request.getParameterMap().isEmpty()) {     // если есть параметры
            System.out.println("1");
            String status = request.getParameter("status");
            if (status != null && !status.isEmpty()) { //и статус не пуст
                System.out.println("2");

                if (status.equalsIgnoreCase("ok")) {
                    System.out.println("3");

                    LoginInfo loginInfo = new LoginInfo(
                            request.getParameter("status"),
                            request.getParameter("access_token"),
                            new Date(Long.parseLong(request.getParameter("expires_at")) * 1000),
                            Long.parseLong(request.getParameter("account_id")),
                            request.getParameter("nickname")
                    );
                    request.setAttribute("LoginInfo", loginInfo);
                    System.out.println("5");

                    //редиректим только если есть параметры и статус ОК
                    response.sendRedirect("/BulletinBoard");
                    System.out.println("6");

                    return;//сюда без параметров уже не попасть
                } else if ("error".equalsIgnoreCase(status)) {
                    System.out.println("4");

//                    processingError(request);    // обрабатываем ошибки
                    // проскакиваем блок else и выскакиваем во вьюху, строка с ошибкой будет там видна

                    LoginInfo loginInfo = new LoginInfo(
                            request.getParameter("status"),
                            request.getParameter("code"),
                            request.getParameter("message")
                    );
                }
//                    response.sendRedirect("/ErrorAuth");

            }
//            request.setAttribute("LoginInfo", loginInfo);
        }


        response.setContentType("text/html");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("hello.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("BulletinBoard.jsp");
        if (dispatcher != null) {
            dispatcher.forward(request, response);
        }
    }

}
