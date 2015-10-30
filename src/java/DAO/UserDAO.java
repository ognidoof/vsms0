/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.resource.spi.ConnectionManager;

/**
 *
 * @author Joel
 */
public class UserDAO {
    


    
    private void handleSQLException(SQLException e, String sql, String... parameters) {

        String msg = "Unable to access data. SQL : " + sql + "\n";

        for (String para : parameters) {

            msg += para + "\n";

        }

        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, msg, e);
        throw new RuntimeException(msg, e);

    }
    
    public Supplier retrieveSupplier(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Supplier supplierToReturn = null;
        String TBLNAME = "supplier_credentials";
        try {   
            
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            rs = stmt.executeQuery();
            
            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {

                String uname = rs.getString("username");
                String password = rs.getString("password");
                

                supplierToReturn = new Supplier(uname, password);

            }
            

        } catch (SQLException e) {

            handleSQLException(e, sql, "username=" + username);

        } finally {

            ConnectionManager.close(conn, rs, stmt);

        }

        return supplierToReturn;

    }
    
    public Vendor retrieveVendor(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Vendor vendorToReturn = null;
        String TBLNAME = "vendor_credentials";
        try {   
            
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            rs = stmt.executeQuery();
            
            //Retrieves the administrator info from database and create a new admin object to return
            while (rs.next()) {

                String uname = rs.getString("username");
                String password = rs.getString("password");
                

                vendorToReturn = new Vendor(uname, password);

            }
            

        } catch (SQLException e) {

            handleSQLException(e, sql, "username=" + username);

        } finally {

            ConnectionManager.close(conn, rs, stmt);

        }

        return vendorToReturn;

    }
}
