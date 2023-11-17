package com.emergentes.controller;

import com.emergentes.bean.BeanContacto;
import com.emergentes.entidades.Contacto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanContacto daoContacto = new BeanContacto();
        int id;
        Contacto c = new Contacto();

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

        switch (action) {

            case "add":
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactoedit.jsp").forward(request, response);

                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                c = daoContacto.buscar(id);
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactoedit.jsp").forward(request, response);

                break;

            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoContacto.eliminar(id);
                response.sendRedirect("MainController");

                break;

            case "view":

                List<Contacto> lista = daoContacto.listarTodos();

                request.setAttribute("contactos", lista);
                request.getRequestDispatcher("Contacto.jsp").forward(request, response);
            default:
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BeanContacto daocontacto = new BeanContacto();
        Contacto c = new Contacto();
        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNombre((request.getParameter("nombre")));
        c.setCorreo((request.getParameter("correo")));
        c.setTelefono((request.getParameter("telefono")));

        if (c.getId() == 0) {
            System.out.println("registro nuevo");
            daocontacto.insertar(c);
        }
        else{
            daocontacto.editar(c);
        }
        response.sendRedirect("MainController");

    }



    private void mostrar() {
        BeanContacto dao = new BeanContacto();

        List<Contacto> lista = dao.listarTodos();

        for (Contacto item : lista) {
            System.out.println(item.toString());
        }
    }

}
