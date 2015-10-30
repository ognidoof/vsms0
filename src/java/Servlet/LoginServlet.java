/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joel
 */
@WebServlet(name="LoginServlet", urlPatterns={"/LoginServlet"})
public class LoginServlet {
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

            Supplier supplier = loginSupplier(username, password);
            Vendor vendor = loginVendor(username, password);
            
            //destination
            String url = "index.jsp";
            
            if(vendor == null && supplier == null){
                //redirect to login page with error
                request.setAttribute("errMsg", "Invalid E-mail or Password entered.");
            }else if(vendor != null && supplier ==null){
                //redirect to vendor home
                url = "VendorMain.jsp";
                session.setAttribute("currentVendor", vendor);
                request.setAttribute("errMsg", null);
            }else if(vendor == null && supplier != null){
                //redirect to supplier home
                url = "SupplierMain.jsp";
                session.setAttribute("currentVendor", supplier);
                request.setAttribute("errMsg", null);
            }else{
                request.setAttribute("errMsg", "Invalid E-mail or Password entered.");
            }
            //redirects to respective page
            RequestDispatcher view = request.getRequestDispatcher(url);
            view.forward(request, response);
            
        } finally {
            out.close();
        }
    }
    
    private Vendor loginVendor(String username, String password){
        boolean check = false;
        
        Vendor v = userDAO.retrieve(username);
        
        if(v != null){
            String checkPW = v.getPassword();
            
            if(checkPW.equals(password)){
                check = true;
            }
        }
        
        if(check){
            return v;
        }
        return null;
    }
    
    private Supplier loginSupplier(String username, String password){
        boolean check = false;
        
        Supplier s = userDAO.retrieve(username);
        
        if(s != null){
            String checkPW = s.getPassword();
            
            if(checkPW.equals(password)){
                check = true;
            }
        }
        
        if(check){
            return s;
        }
        return null;
    }
}
