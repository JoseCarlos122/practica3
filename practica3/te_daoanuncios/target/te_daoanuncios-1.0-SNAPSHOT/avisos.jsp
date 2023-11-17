<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Aviso> avisos = (List<Aviso>)request.getAttribute("avisos");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LISTADO DE AVISOS</h1>
        <p><a href="AvisoController?action=add">Nuevo</a></p>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Contenido</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${avisos}">
            <tr>
                <td>${item.id}</td>
                <td>${item.titulo}</td>
                <td>${item.contenido}</td>
                <td><a href="AvisoController?action=edit&id=${item.id}">Editar</a></td>
                <td><a href="AvisoController?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro'))">Eliminar</a></td>
            </tr>               
            </c:forEach>                       
        </table>
    </body>
</html>