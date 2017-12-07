package servlets;

import Classes.Database;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RespondsList")
public class RespondsListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
//        super.doPost(req, resp);
//        doGet(req,resp);
        System.out.println("RespondsList_POST");
        int advertId = Integer.parseInt(req.getParameter("AdId"));
        System.out.println("advertId= " + advertId);
        try {
            ArrayList<String> responds = Database.getRespondsList(advertId);
            PrintWriter outStream = resp.getWriter();
            resp.setContentType("text/html"); // FIXME: 07.12.2017 уходит но не приходит...
            System.out.println(responds.toString());
            outStream.write(responds.toString());


            outStream.flush();
            outStream.close();
            System.out.println("SUCCESS!");
        } catch (SQLException e) {
            System.out.println("Ошибка получения списка откликов. Объявление ID=" + advertId);
            e.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("RespondsList_GET");
        doPost(request, response);

//        String userName = request.getParameter("userName").trim();
//        if(userName == null || "".equals(userName))
//            userName = "Guest";
//
//        String content = "Привет, " + userName;
//        response.setContentType("text/plain");
//
//        OutputStream outStream = response.getOutputStream();
//        outStream.write(content.getBytes("UTF-8"));
//        outStream.flush();
//        outStream.close();
    }
}