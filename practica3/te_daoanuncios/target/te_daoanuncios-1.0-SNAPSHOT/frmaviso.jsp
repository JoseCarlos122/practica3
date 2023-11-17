<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Aviso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Aviso aviso = (Aviso)request.getAttribute("aviso");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>NUEVO REGISTRO</h1>
        <form action="AvisoController" method="post">
            <input type="hidden" name="id" value="${aviso.id}" />
            <table>
                <tr>
                    <td>Titulo:</td>
                    <td><input type="text" name="titulo" value="${aviso.titulo}"/></td>
                </tr>
                <tr>
                    <td>Contenido:</td>
                    <td><textarea name="contenido" rows="4" cols="20">${aviso.contenido}</textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"/></td>
                </tr>              
            </table>            
        </form>
<%--<c:if test="a" var="a" >
</c:if>  --%>
    </body>
</html>