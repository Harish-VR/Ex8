<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Connection c =DriverManager.getConnection("jdbc:derby://localhost:1527/Harish");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT count(order_id) from app");%>
       
        <%while(rs.next())
        {%>
        <table>
            <tr><th>Number of Orders</th></tr<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP Page</title>
</head>
<body>
<% Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/ip_8");
Statement st=c.createStatement();
ResultSet rs=st.executeQuery("select * from orders");
%>
<table border="2" style="border-collapse: collapse">
<tr><th>ORDER_ID</th><th>CUSTOMER_NAME</th><th>PRODUCT_NAME</th><th
>Quantity</th><th>UNIT_PRICE</th></tr>
<% while(rs.next()){ %>
<tr><td> <% out.println(rs.getInt(1));%></td>
<td> <% out.println(rs.getString(2));%></td>
<td> <% out.println(rs.getString(3));%></td>
<td> <% out.println(rs.getInt(4));%></td>
<td> <% out.println(rs.getDouble(5));%></td>
</tr>
<% }
%>
</table><br><br>
<%
ResultSet res=st.executeQuery("select * from orders");
int totalorder=0;
while (res.next()) {
totalorder++;
}

ResultSet resu=st.executeQuery("select * from orders");
int totalRevenue=0;
while (resu.next()) {
int quantity = resu.getInt("quantity");
double unitPrice = resu.getDouble("unit_price");
totalRevenue += quantity * unitPrice;
}
ResultSet r=st.executeQuery("select * from orders");
int totalOrders=0,averageOrderValue=0;
while (r.next()) {
int quantity = r.getInt("quantity");
double unitPrice = r.getDouble("unit_price");
totalRevenue += quantity * unitPrice;
totalOrders++;
}
if (totalOrders > 0) {
averageOrderValue = totalRevenue / totalOrders;
}
%>
<table border="2" style="border-collapse: collapse">
<tr><th>Total Orders</th><th>Total Revenue</th><th>Average Revenue</th></tr>
<tr><td> <%= totalorder %></td><td><%= totalRevenue %></td><td><%=
averageOrderValue %></td></tr>
</table>
</body>
</html>>
            <tr><td><%out.println(rs.getString(1));%>
                </td></tr>
           
           
        </table>
        <%}%>
       
        <% ResultSet rs1=st.executeQuery("SELECT sum(quantity*unit_price) from app");%>
         
        <%while(rs1.next())
        {%>
        <table>
            <tr><th>Sum of value</th></tr>
            <tr><td><%out.println(rs1.getString(1));%>
                </td></tr>
           
           
        </table>
        <%}%>
       
        <% ResultSet rs2=st.executeQuery("SELECT avg(quantity*unit_price) from app");%>
         
        <%while(rs2.next())
        {%>
        <table>
            <tr><th>Average of value</th></tr>
            <tr><td><%out.println(rs2.getString(1));%>
                </td></tr>
           
           
        </table>
        <%}%>
    </body>
</html>