<%-- 
    Document   : cartUpdate
    Created on : 29 May, 2022, 2:27:21 PM
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

            String name=(String)session.getAttribute("name");
            String pwd=(String)session.getAttribute("pwd");
            String id=(String)session.getAttribute("id");
            
            String qty=request.getParameter("qty");
            String cartItems="";
            
            rs=st.executeQuery("select cartItems from USERTABLE where name='"+name+"' and password='"+pwd+"'");
            while(rs.next())
            {
                cartItems=rs.getString(1);
            }
            cartItems+=id+":"+qty+",";
            st.executeUpdate("update USERTABLE set cartItems='"+cartItems+"' where name='"+name+"' and password='"+pwd+"'");
            out.println("<center><h1>Added to Cart Successfully..!!</h1></center>");
        
        %>
        </div>
    </body>
</html>
