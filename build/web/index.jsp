<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        
        <link href="STYLELO.css" rel="stylesheet" type="text/css"/> 
        <title>JSP Page</title>
    </head>
    <a href="index.jsp"></a>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost/perifericosdb";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from dbperifericos");
            //Creamo la Tabla:     
        %>
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">New Add</button>
            <div style="padding-left: 800px">                   
                
                <form class="form">
                    <input  type="text" class="form-control" name="txtBuscar"/>   
                    <input  class="btn btn" type="submit" value="Buscar">  
                </form>          
                
                <% 
                    
                    String nombuscar= request.getParameter("txtBuscar");
                    if (nombuscar!=null) {
                            smt = con.createStatement();
                            rs=smt.executeQuery("select * from dbperifericos where Nombre LIKE"+"'%"+nombuscar+"%' ORDER BY Nombre ASC");
                            
                        }else{
                        System.err.print("ERROR");
                    }
                %>
            </div>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th>Nombres</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Precio</th>
                            
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("Id")%></td>
                            
                            <td><%= rs.getString("Nombre")%></td>
                            <td class="text-center"><%= rs.getString("Cantidad")%></td>
                            <td class="text-center"><%= rs.getString("Precio")%></td>
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-primary">Editar</a>
                                <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger">Delete</a>
                            
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 10009; width: 1000px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registroooo</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>ID PRODUCTO</label> 
                                <input type="text" name="txtid" class="form-control"/><br>
                                <label>NOMBRE PRODUCTO:</label> 
                                <input type="text" name="txtnom" class="form-control"/><br>
                                <label>STOCK PRODUCTO:</label> 
                                <input type="text" name="txtcantidad" class="form-control"/><br>
                                <label>PRECIO PRODUCTO:</label> 
                                <input type="text" name="txtprecio" class="form-control"/><br>
                                                                   
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                String id,nombre,cantidad,precio;
                id=request.getParameter("txtid");
                nombre=request.getParameter("txtnom");    
                cantidad=request.getParameter("txtcantidad");
                precio=request.getParameter("txtprecio"); 
                if (id != null && nombre != null) {
                    ps=con.prepareStatement("insert into dbperifericos(Id,Nombre,Cantidad,Precio)values('"+id+"','"+nombre+"','"+cantidad+"','"+precio+"')");
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");

                }
            %>
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>
