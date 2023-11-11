<%-- 
    Document   : Editar
    Created on : 02/02/2018, 03:33:51 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost/perifericosdb";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from dbperifericos where Id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" name="txtid" class="form-control" value="<%= rs.getInt("Id")%>"/>
                Nombre
                <input type="text" name="txtnom" class="form-control" value="<%= rs.getString("Nombre")%>"/><br>
                Stock:
                <input type="text" name="txtcantidad" class="form-control" value="<%= rs.getString("Cantidad")%>"/><br>
                Precio:
                <input type="text" name="txtprecio" class="form-control" value="<%= rs.getString("Precio")%>"/><br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="index.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
       String Idpro,nombre,cantidad,precio;
       Idpro=request.getParameter("txtid");
       nombre=request.getParameter("txtnom");
       cantidad=request.getParameter("txtcantidad");
       precio=request.getParameter("txtprecio");
       
       if(Idpro != null && nombre!=null){
           ps=con.prepareStatement("update dbperifericos set Nombre='"+nombre+"', Cantidad='"+cantidad+"' , Precio='"+precio+"' where Id="+Idpro);
           ps.executeUpdate();
           response.sendRedirect("index.jsp");
       }
       
            
%>
