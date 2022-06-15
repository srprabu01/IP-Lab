<%-- 
    Document   : checkOut
    Created on : 29 May, 2022, 3:50:12 PM
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
                int id,qty,instock=0;

                rs=st.executeQuery("select cartItems from USERTABLE where name='"+name+"' and password='"+pwd+"'");
                while(rs.next())
                {
                     cartItems=rs.getString(1).split(",");
                }
                
                for(int items=0; items<cartItems.length-1;items++)
                {
                    Ibook=cartItems[items].split(":");
                    id=Integer.parseInt(Ibook[0]);
                    qty=Integer.parseInt(Ibook[1]);
                    
                    rs=st.executeQuery("select instock from Book where id="+id);
                    
                    while(rs.next())
                    {
                        instock=rs.getInt(1);
                    }
                    instock-=qty;
                    st.executeUpdate("update Book set instock="+instock+" where id="+id);
                    
                }
                st.executeUpdate("update usertable set cartItems='' where name='"+name+"' and password='"+pwd+"'");
                out.println("<center><h1>Cart Checked out successfully..!!</h1><h2>Thank you Visit Again..!!</h2></center>");
            %>
        </div>
    </body>
</html>

