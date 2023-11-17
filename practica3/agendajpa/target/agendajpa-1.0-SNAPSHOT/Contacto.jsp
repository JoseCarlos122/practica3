<%@page import="com.emergentes.entidades.Contacto"%>
<%@page import="java.util.List"%>
<%
    List<Contacto> lista = (List<Contacto>) request.getAttribute("contactos");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CONTACTOS</h1>

        <a href="MainController?action=add">Nuevo</a> 

        <table border="2" cellspacing="2" class="table table-dark table-striped" >
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Telefono</th>
                <th colspan="2">Acciones</th>



            </tr>
            <%
                for (Contacto item : lista) {


            %>

            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getCorreo()%></td>
                <td><%= item.getTelefono()%></td>
                <td><a href="MainController?action=edit&id=<%= item.getId()%>">Editar</a></td>
                <td><a href="MainController?action=dele&id=<%= item.getId()%>" onclick="return(confirm('Eliminar??'))">Eliminar</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </body>
</html>
