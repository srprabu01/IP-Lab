/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPrograms;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kirthana Balasubramanian
 */
@WebServlet(name = "bookServlet", urlPatterns = {"/bookServlet"})
public class bookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    HashMap<String,Book> map=new HashMap<>();
    Book book;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        response.setContentType("text/html;charset=UTF-8");
        int copies=Integer.parseInt(request.getParameter("copies"));
        try(PrintWriter out = response.getWriter()){
            if(copies<=book.stock)
            {
                book.stock-=copies;
                out.println("<center><h2>"+"Order Details"+ "</h2>");
                out.println("<table border=2 width='300px' height='300px' style='cell-padding:2%;text-align:center;background-color:#98FB98;font-size:large;'><tr><td colspan='2'>Receipt</td>");
                out.println("<tr><td>Title</td><td>"+book.title+"</td>");
                out.println("<tr><td>Author</td><td>"+book.author+"</td>");
                out.println("<tr><td>Price per book</td><td>"+book.price+"</td>");
                out.println("<tr><td><b>Total cost</b></td><td><b>"+(copies*book.price)+"</b></td></table></center>");
            }
            else
            {
                out.println("<center><div style='border:5px solid red;width:450px;height:250px;background-color:#ffcccb;text-align:center;'>");
                out.println("<p style='color:red;font-size:xx-large;'>Sorry, the requested number of copies is not available:( !! </p>");
                out.println("<button style='border-radius:2%;background-color:white;' onclick=location.href='http://localhost:8080/Servlets/BookMgmt/index.html'>Back to home page</button>");
                out.println("</div></center>");       
            }
        }
        
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
        response.setContentType("text/html;charset=UTF-8");
        book=new Book("AuthX","AAA",550.50,"XA Publisher",20);
        map.put(book.title, book);
        
        book=new Book("AuthY","BBB",333.50,"YB Publisher",15);
        map.put(book.title, book);
        
        book=new Book("AuthZ","CCC",480.90,"ZC Publisher",18);
        map.put(book.title, book);
        
        book=new Book("AuthW","DDD",460,"WD Publisher",20);
        map.put(book.title, book);
        
        book=new Book("AuthV","EEE",699,"VE Publisher",10);
        map.put(book.title, book);

        
        //get details
        String bName=request.getParameter("bName");
        String author=request.getParameter("author");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            if(map.containsKey(bName))
            {
                book=map.get(bName);
                if(book.author.equals(author))
                {
                    out.println("<center><h2>"+"Book Details"+ "</h2>");
                    out.println("<table border=2 width='300px' height='300px' style='cell-padding:2%;text-align:center;background-color:#98FB98;font-size:large;'><tr><td>Title</td><td>"+book.title+"</td>");
                    out.println("<tr><td>Author</td><td>"+book.author+"</td>");
                    out.println("<tr><td>Price</td><td>"+book.price+"</td>");
                    out.println("<tr><td><b>Stock available</b></td><td><b>"+book.stock+"</b></td></table><br>");
                    out.println("<form method='get' action='http://localhost:8080/Servlets/bookServlet'>");
                    out.println("Enter number of copies <input type='number' autofocus name='copies'><br><br>");
                    out.println("<input type='submit' value='Get copies'></center>");
                                       
                }
                else
                {
                    out.println("<center><div style='border:5px solid red;width:450px;height:250px;background-color:#ffcccb;text-align:center;'>");
                    out.println("<p style='color:red;font-size:xx-large;'>Sorry, the requested book is not available:( !! </p>");
                    out.println("<button style='border-radius:2%;background-color:white;' onclick=location.href='http://localhost:8080/Servlets/BookMgmt/index.html'>Back to home page</button>");
                    out.println("</div></center>");
                }
            }
            else
            {
                out.println("<center><div style='border:5px solid red;width:450px;height:250px;background-color:#ffcccb;text-align:center;'>");
                out.println("<p style='color:red;font-size:xx-large;'>Sorry, the requested book is not available:( !! </p>");
                out.println("<button style='border-radius:2%;background-color:white;' onclick=location.href='http://localhost:8080/Servlets/BookMgmt/index.html'>Back to home page</button>");
                out.println("</div></center>");
            }
            out.println("</body>");
            out.println("</html>");
        }
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
