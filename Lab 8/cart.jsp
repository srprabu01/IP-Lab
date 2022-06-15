<%-- 
    Document   : cart
    Created on : 29 May, 2022, 11:14:36 AM
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
            <a href="catalogue.jsp">Catalogue</a>
            <a href="#" id="currentPage">Cart</a>
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
                String cartItems[]=null,Ibook[];
                int id,qty,price,tqty=0,tprice=0;

                rs=st.executeQuery("select cartItems from USERTABLE where name='"+name+"' and password='"+pwd+"'");
                while(rs.next())
                {
                     cartItems=rs.getString(1).split(",");
                }
                out.println("<center>");
                out.println("<table border=1 style='text-align:center'><tr><th>Book Name</th><th>Price</th><th>Quantity</th><th>Amount</th></tr>");
                out.println("<form action='http://localhost:8080/BookShop/checkOut.jsp'>");
                for(int items=0; items<cartItems.length-1;items++)
                {
                    Ibook=cartItems[items].split(":");
                    id=Integer.parseInt(Ibook[0]);
                    qty=Integer.parseInt(Ibook[1]);
                    tqty+=qty;
                    
                    rs=st.executeQuery("select title,price from Book where id="+id);
                    
                    while(rs.next())
                    {
                        price=qty*rs.getInt(2);
                        tprice+=price;
                        out.println("<tr ><td>"+rs.getString(1)+"</td><td>Rs."+rs.getInt(2)+"/-</td><td>"+qty+"</td><td>Rs."+price+"/-</td></tr>");
                    }
                    
                }
                out.println("<tr style='font-size:larger;font-weight:bolder;'><td></td><td>Total</td><td>"+tqty+"</td><td>"+tprice+"/-</td></tr>");
                out.println("</table>");
                out.println("<br><br><input type='submit' value='Checkout'>");
                out.println("</form>");
                
                
                out.println("</center>");

            %>
        </div>
    </body>
</html>
