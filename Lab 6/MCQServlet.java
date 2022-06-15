/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBPrograms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kirthana Balasubramanian
 */
@WebServlet(name = "MCQServlet", urlPatterns = {"/MCQServlet"})
public class MCQServlet extends HttpServlet {

    Connection con;
    Statement st;
    ResultSet rs;
    {
        try {
            //connection establishment
            //driver name,username,pwd-->parameters
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/MyDatabase", "Kirthana", "12345");
            
            //connecting
            st=con.createStatement();
        } catch (Exception ex) {
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
        try(PrintWriter out = response.getWriter()){
            Cookie c[]=request.getCookies();
            String rollno=c[0].getValue();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title></title>");
            out.println("</head>");
            
            if(request.getParameter("todo2")!=null || request.getParameter("rank")!=null)
            {
                rs=st.executeQuery("select * from STUDENT  order by scores desc");
                out.println("<body><center><table border=1 ><tr><th>RANK</th><th>ID</th><th>ROLL NUMBER</th><th>NAME</th><th>SCORES</th></tr>");
                int i=1;
                while(rs.next())
                {
                    out.println("<tr><td>"+(i++)+"</td><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getDouble(4)+"</td></tr>");
                }
            }
            
            if(request.getParameter("todo1")!=null)
            {
                rs=st.executeQuery("select * from STUDENT where rollno='"+rollno+"'");
                out.println("<body><center><table border=1 ><tr><th>ID</th><th>ROLL NUMBER</th><th>NAME</th><th>SCORES</th></tr>");
                while(rs.next())
                {
                    out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getDouble(4)+"</td></tr>");
                }
            }
 
            out.println("</table>\n</center>\n</body>\n</html>");
        }
        catch(Exception ex)
        {
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        
        try(PrintWriter out = response.getWriter())  {
            String name=request.getParameter("name");
            String rollno=request.getParameter("rollno");
            String q1=request.getParameter("q1");
            String q2=request.getParameter("q2");
            String q3=request.getParameter("q3");
            String q4[]=request.getParameterValues("q4");
            String q5=request.getParameter("q5");
            double scores=0;
            
            //question1
            if(q1.equals("True"))
            {
                scores+=5;
            }
           
            //question2
            if(q2.equalsIgnoreCase("Java Servlet"))
            {
                scores+=5;
            }
            
            //question3
            if(q3.equalsIgnoreCase("Server"))
            {
                scores+=5;
            }
            //question4
            if(q4[0].equals("Cookies") && q4[1].equals("HttpSession"))
            {
                scores+=5;
            }
            //question5
            if(q5.equals("option4"))
            {
                scores+=5;
            }

            
            
            //insert query            
            String insert="insert into STUDENT (rollno,name,scores) values('"+rollno+"','"+name+"',"+scores+")";
            st.executeUpdate(insert);
            Cookie c=new Cookie("rollno",rollno);
            response.addCookie(c);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title></title>");
            out.println("</head>");
            out.println("<body><center><h1>Check your Score and your Rank here..!!</h1>");
            out.println("<form method='get' action='http://localhost:8080/MCQ/MCQServlet'>\n"
                    + "\n<input type='submit' value='View my Score' name='todo1'>"
                    + "\n<input type='submit' value='View my Rank' name='todo2'>"
                    + "\n</form>"
                    + "\n</body>"
                    + "\n</center>"
                    + "\n</html>");
            
            
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

}
