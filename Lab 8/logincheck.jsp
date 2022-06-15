<%-- 
    Document   : logincheck.jsp
    Created on : 26 May, 2022, 6:33:09 PM
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
        <title>LoginRegister Page</title>
    </head>
    <body>
        <%

            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:derby://localhost:1527/MyDatabase","Kirthana","12345");
            st=c.createStatement();
            if(request.getParameter("loginSubmit")!=null)
            {
                String name=request.getParameter("uname");
                String pwd=request.getParameter("password");
                session.setAttribute("name",name);
                session.setAttribute("pwd",pwd);
                boolean flag=true;
                ResultSet rs=st.executeQuery("select * from USERTABLE");
                while(rs.next())
                {
                    if(name.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
                    {
                        flag=false;
                        response.sendRedirect("http://localhost:8080/BookShop/catalogue.jsp");
                    }
                }
                if(flag)
                {
                    response.sendRedirect("registration.html");
                }
            }
            else if(request.getParameter("registerSubmit")!=null)
            {
                String name=request.getParameter("name");
                String pwd=request.getParameter("password");
                st.executeUpdate("insert into USERTABLE(name,password) values('"+name+"','"+pwd+"')");
                response.sendRedirect("login.html");
            }
            else
            {
                out.println("Wrong");
            }
        %>
    </body>
</html>
