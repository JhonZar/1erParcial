<%@page import="com.emergentes.models.Producto"%>
<%
    Producto reg = (Producto) request.getAttribute("miobjprod");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
    <center>
        <h1>Registro de productos</h1>

        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= reg.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>DESCRIPCION</td>
                    <td><input type="text" name="descripcion" value="<%= reg.getDescripcion()%>"></td>
                </tr>
                <tr>
                    <td>CANTIDAD</td>
                    <td><input type="number" name="cantidad" value="<%= reg.getCantidad()%>"></td>
                </tr>
                <tr>
                    <td>PRECIO</td>
                    <td><input type="number" name="precio" value="<%= reg.getPrecio()%>"></td>
                </tr>
                <tr>
                    <td>CATEGORIA</td>
                    <td><input type="text" name="categoria" value="<%= reg.getCategoria()%>"></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
