/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPrograms;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kirthana Balasubramanian
 */
@WebServlet(name = "grossPayServlet", urlPatterns = {"/grossPayServlet"})
public class grossPayServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //getting details
        String name=request.getParameter("name");
        String empid=request.getParameter("empid");
        double basicPay=Double.parseDouble(request.getParameter("basicPay"));
        double hra=Double.parseDouble(request.getParameter("hra"));
        double da=basicPay/2;
        double grossPay=basicPay+hra+da;
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet grossPayServlet</title>");            
            out.println("</head>");
            out.println("<body style='background-color:#99ccff'>");
            out.println("<center><h2>"+"Employee's Gross Pay"+ "</h2>");
            out.println("<table border=2 width='300px' height='400px' style='cell-padding:2%;text-align:center;background-color:white;'><tr><td>Name</td><td>"+name+"</td>");
            out.println("<tr><td>Employee ID</td><td>"+empid+"</td>");
            out.println("<tr><td>Basic Pay</td><td>"+basicPay+"</td>");
            out.println("<tr><td>HRA</td><td>"+hra+"</td>");
            out.println("<tr><td>DA</td><td>"+da+"</td>");
            out.println("<tr><td><b>Gross Pay</b></td><td><b>"+grossPay+"</b></td></table></center>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
