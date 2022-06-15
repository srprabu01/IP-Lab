<%-- 
    Document   : catalogue
    Created on : 26 May, 2022, 8:41:44 PM
    Author     : Kirthana Balasubramanian
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
            <a href="#" id="currentPage">Catalogue</a>
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

            session.setAttribute("genre", "General");
            if(request.getParameter("Fiction")!=null)
            {
                rs=st.executeQuery("select * from Book where genre='Fiction'");  
                session.setAttribute("genre","Fiction");
            }
            else if(request.getParameter("Non-Fiction")!=null)
            {
                rs=st.executeQuery("select * from Book where genre='Non-Fiction'");
                session.setAttribute("genre","Non-Fiction");
            }
            else{
                rs=st.executeQuery("select * from Book");
                
            }
            out.println("<center><table border=1 style='text-align:center'><tr><th>ID</th><th>COVER PICTURE</th><th>DETAILS</th><th>PRICE</th><th>OPTION</th></tr>");
            out.println("<form action='http://localhost:8080/BookShop/specificCart.jsp'>");
            while(rs.next())
            {
                out.println("<tr ><td>"+rs.getInt(1)+"</td><td><img width=100px height=120px src='Images/"+rs.getString(2)+"'/></td><td><p>Title:"+rs.getString(3)+"</p><p>Author:"+rs.getString(4)+"</p></td><td>Rs."+rs.getInt(5)+"/-</td><td><input type='submit' name='"+rs.getInt(1)+"' value='Add to Cart'></td></tr>");
            }
            out.println("</form>");
            out.println("</table>\n</center>");
            
        %>
        </div>
    </body>
</html>
