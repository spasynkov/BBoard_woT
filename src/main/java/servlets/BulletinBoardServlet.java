package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        System.out.println("BBget");

        System.out.println("request: "+request.getRequestURL().toString());

        System.out.println("URL: "+request.getRequestURL());
        System.out.println(request.getParameter("status"));
        response.setContentType("text/html");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("hello.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("BulletinBoard.html");
        if (dispatcher != null) {
            dispatcher.forward(request, response);
        }



    }

}
