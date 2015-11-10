/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import Entity.Supplier;
import Entity.Vendor;
import Entity.*;
import Manager.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joel
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //retrieves input from user from Login Page
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //create a new session
            HttpSession session = request.getSession();

            String supplier_id = loginSupplier(username, password);
            String vendor_id = loginVendor(username, password);

            //hard code supplier for now "FreshFoodz"
            if (username.equals("FreshFoodz")) {
                supplier_id = "FreshFoodz";
            }
            //destination
            String url = "LoginMain.jsp";

            if (vendor_id == null && supplier_id == null) {
                //redirect to login page with error
                request.setAttribute("errMsg", "Invalid E-mail or Password entered.");
            } else if (vendor_id != null && supplier_id == null) {
                //redirect to vendor home
                url = "welcome.jsp";
                session.setAttribute("currentVendor", vendor_id);
                request.setAttribute("errMsg", null);
                //MenuManager menuManager = new MenuManager();
                Menu menu = MenuManager.populateMenu(vendor_id);//defaultMenu();
                MenuManager.createConnection();
                session.setAttribute("menu", menu);
                session.setAttribute("orders", OrderDAO.populateOrder());
                //session.setAttribute("orders", OrderDAO.populateOrder());
                session.setAttribute("eorders", OrderDAO.populateEmergencyOrder());
            } else if (vendor_id == null && supplier_id != null) {
                //redirect to supplier home
                url = "ChatSupplier.jsp";
                session.setAttribute("currentSupplier", supplier_id);
                request.setAttribute("errMsg", null);
            } else {
                request.setAttribute("errMsg", "Invalid E-mail or Password entered.");
            }
            //redirects to respective page
            RequestDispatcher view = request.getRequestDispatcher(url);
            view.forward(request, response);

        } finally {
            out.close();
        }
    }

    private String loginVendor(String username, String password) {
        //boolean check = false;

        String v_id = userDAO.retrieveVendor(username, password);

        return v_id;
    }

    private String loginSupplier(String username, String password) {
        //boolean check = false;

        String s_id = userDAO.retrieveSupplier(username, password);

        return s_id;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
