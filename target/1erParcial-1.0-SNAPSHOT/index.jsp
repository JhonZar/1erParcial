<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.models.Producto"%>
<%
    if (session.getAttribute("listaProducto") == null) {
        ArrayList<Producto> lisaux = new ArrayList<Producto>();
        session.setAttribute("listaProducto", lisaux);
    }
    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("listaProducto");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>1er Parcial</title>
    </head>
    <body>
    <center>
        <h3>SEGUNDO PARCIAL TEM-742</h3>
        <h4>Nombre: Jhonatan Luis Zarzuri Chauca</h4>
        <h4>Carnet: 9076430 LP</h4>
        <h1>Gestor de productos</h1>
        <a href="MainServlet?op=nuevo">Nuevo producto</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>DESCRIPCION</th>
                <th>CANTIDAD</th>
                <th>PERCIO</th>
                <th>CATEGORIA</th>
                <th></th>
            </tr>
            <%
                if (lista != null) {
                    for (Producto prod : lista) {
            %>
            <tr>
                <td><%= prod.getId()%></td>
                <td><%= prod.getDescripcion()%></td>
                <td><%= prod.getCantidad()%></td>
                <td><%= prod.getPrecio()%></td>
                <td><%= prod.getCategoria()%></td>
              
                <td>
                    <a href="MainServlet?op=editar&id=<%= prod.getId()%>">Editar</a>
                    <a href="MainServlet?op=eliminar&id=<%= prod.getId()%>" onclick="return(confirm('esta seguro de eliminar?'))">Eliminar</a>
                </td>

            </tr>
            <%       }
                }
            %>
        </table>
    </center>
</body>
</html>
