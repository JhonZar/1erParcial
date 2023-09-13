package com.emergentes.controller;

import com.emergentes.models.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op=request.getParameter("op");
        Producto objper=new Producto();
        int id,pos;
        HttpSession ses=request.getSession();
        ArrayList<Producto> lista=(ArrayList<Producto>)ses.getAttribute("listaProducto");
        switch(op){
            case "nuevo":
                request.setAttribute("miobjprod", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarPorIndice(request, id);
                objper=lista.get(pos);
                request.setAttribute("miobjprod", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarPorIndice(request, id);
                if (pos>=0) {
                    lista.remove(pos);
                }
                request.setAttribute("listaProducto", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaProducto");
        Producto objpro = new Producto();
        objpro.setId(id);
        objpro.setDescripcion(request.getParameter("descripcion"));
        objpro.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        objpro.setPrecio(Integer.parseInt(request.getParameter("precio")));
        objpro.setCategoria(request.getParameter("categoria"));
        if (id == 0) {
            int idNuevo = obtenerId(request);
            objpro.setId(idNuevo);
            lista.add(objpro);
        } else {
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objpro);
        }
        request.setAttribute("listaProducto", lista);
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses=request.getSession();
        ArrayList<Producto>lista=(ArrayList<Producto>) ses.getAttribute("listaProducto");
        
        int pos=-1;
        if (lista!=null) {
            for (Producto prod : lista) {
                ++pos;
                if (prod.getId()==id) {
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista=(ArrayList<Producto>) ses.getAttribute("listaProducto");
        
        int idn=0;
        for (Producto producto : lista) {
            idn=producto.getId();
        }
        return idn+1;
    }

}
