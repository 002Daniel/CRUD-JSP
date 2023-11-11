<%-- 
    Document   : login
    Created on : 28/10/2023, 04:18:48 PM
    Author     : mejia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <link href="stylelogin.css" rel="stylesheet" type="text/css"/> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
         
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <div class="container col-lg-3">
    <form action="index.jsp" onsubmit="return validarFormulario()">
        <div class="form-group">
            <h1>Bienvenido</h1>
        </div>
        <div class="form-group">
            <label>Usuario:</label>
            <input class="form-control" type="text" name="txtnom" id="txtnom" placeholder="Nombres">
            <span id="errorNombres" style="color: red;"></span>
        </div>
        <div class="form-group">
          <label>Contraseña:</label>
          <input type="password" name="txtcontrasena" id="txtcontrasena" placeholder="Ingrese su contrasena" class="form-control">
          <span id="errorCorreo" style="color: red;"></span>
        </div>
        <input class="btn btn-danger btn-block" type="submit" name="acccion" value="Ingresar">
    </form>
</div>
        
        
    </body>
</html>
