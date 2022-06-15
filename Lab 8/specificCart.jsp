<%-- 
    Document   : specificCart
    Created on : 29 May, 2022, 10:51:59 AM
    Author     : Kirthana Balasubramanian
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Get your favourite books here..!!</h1>
        <nav>
            <a href="home.html">Home</a>
            <a href="login.html" >Login</a>
            <a href="registration.html">Registration</a>
            <a href="catalogue.jsp" id="currentPage">Catalogue</a>
            <a href="cart.jsp">Cart</a>
        </nav>
        <div id="leftbox">
            <ul>
                <form action="http://localhost:8080/BookShop/catalogue.jsp">
                    <li><input type="submit" name="Fiction" value="Fiction"></li>
                    <li><input type="submit" name="Non-Fiction" value="Non-Fiction"></li>
                    <li><input type="submit" name="Drama" value="Drama"></li>
                    <li><input type="submit" name="Poetry" value="Poetry"></li>
                    <li><input type="submit" name="FolkTale" value="FolkTale"></li>
                    <li><input type="submit" name="Horror" value="Horror"></li>
                </form>
            </ul>
        </div>
        <div id="rigthbox">
        <%
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:derby://localhost:1527/MyDatabase","Kirthana","12345");
            st=c.createStatement();
            ResultSet rs;

         
            String genre=(String)session.getAttribute("genre");

            if(genre.equals("Fiction"))
            {
                if(request.getParameter("1")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=1");
                    session.setAttribute("id","1");

                }
                else if(request.getParameter("2")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=2");
                    session.setAttribute("id","2");
                }
                else
                {
                    rs=st.executeQuery("select * from Book where id=3");
                    session.setAttribute("id","3");
                }
            }
            else
            {
                if(request.getParameter("4")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=4");
                    session.setAttribute("id","4");

                }
                else if(request.getParameter("5")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=5");
                    session.setAttribute("id","5");
                }
                else
                {
                    rs=st.executeQuery("select * from Book where id=6");
                    session.setAttribute("id","6");
                }
            }
            out.println("<center>");
            out.println("<form action='http://localhost:8080/BookShop/cartUpdate.jsp'>");
            while(rs.next())
            {
                out.println("<h2>"+rs.getString(3).toUpperCase()+" by "+rs.getString(4)+"</h2>");
                out.println("<h3>Rs."+rs.getInt(5)+"/-</h3>");
                out.println("<img width=200px height=250px src='Images/"+rs.getString(2)+"'/><br><br>");
                out.println("<h3>Enter quantity</h3><input type=number max="+rs.getInt(6)+" min=1 name='qty'><br><br>");
            }
            out.println("<input type='submit' name='cart' value='Add to Cart'>");
            out.println("</form>");
            out.println("</center>");


        %>
        </div>
    </body>
</html>
