<%-- 
    Document   : Agregar
    Created on : 02/02/2018, 01:11:48 PM
    Author     : Joel
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
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
        <div class="container">
            <h1>Agregar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" name="txtID" class="form-control"/>
                <br>
                Nombre:
                <input type="text" name="txtNombre" class="form-control"/>
                <br>
                Cantidad:
                <input type="text" name="txtCantidad" class="form-control"/>
                <br>
                Precio:
                <input type="text" name="txtPrecio" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>
<%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost/perifericosdb";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       String id,nombre,cantidad,precio;
       id=request.getParameter("txtID");
       nombre=request.getParameter("txtNombre");    
       cantidad=request.getParameter("txtCantidad");
       precio=request.getParameter("txtPrecio");  
       if(id!=null && nombre!=null){
           ps=con.prepareStatement("insert into dbperifericos(Id,Nombre,Cantidad,Precio)values('"+id+"','"+nombre+"','"+cantidad+"','"+precio+"')");
           ps.executeUpdate();
           JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
           response.sendRedirect("index.jsp");
           
       }
       
       
%>