/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.*;
import Manager.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.resource.spi.ConnectionManager;

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
    
    public String retrieveSupplier(String username, String password){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        //Supplier supplierToReturn = null;
        String sup_id = null;
        String sup_uname = null;
        String sup_password = null;
        final String TBLNAME = "supplier_credentials";
        try {
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE supplier_username = ? and supplier_password = ? ";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();
            
            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {
                sup_uname = rs.getString("supplier_username");
                sup_password = rs.getString("supplier_password");
                sup_id = rs.getString("supplier_id");
                //supplierToReturn = new Supplier(uname, password);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql, "username=" + username);
        } finally {
            //conn.close();
            ConnectionManager.close(conn, stmt, rs);
        }
        if(username.equals(sup_uname) && password.equals(sup_password)){
            return sup_id;
        }else{
            return sup_id;
        }
    }
    
    public String retrieveVendor(String username, String password){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        //Vendor vendorToReturn = null;
        String ven_id = null;
        String ven_uname = null;
        String ven_password = null;
        
        final String TBLNAME = "vendor_credentials";
        try {   
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE vendor_username = ? and vendor_password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();
            
            //Retrieves the administrator info from database and create a new admin object to return
            while (rs.next()) {
                ven_id = rs.getString("vendor_id");
                ven_uname = rs.getString("vendor_username");
                ven_password = rs.getString("vendor_password");
                //vendorToReturn = new Vendor(uname, password, vendor_id);
            }
        } catch (SQLException e) {
            handleSQLException(e, sql, "username=" + username);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }
        
        if(username.equals(ven_uname) && password.equals(ven_password)){
            return ven_id;
        }else{
            return ven_id;
        }
    }
    /*
    public Supplier retrieveSupplier(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Supplier supplierToReturn = null;
        final String TBLNAME = "supplier_credentials";
        try {   
            
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE supplier_username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            rs = stmt.executeQuery();
            
            //Retrieves the supplier info from database and create a new supplier object to return
            while (rs.next()) {

                String uname = rs.getString("supplier_username");
                String password = rs.getString("supplier_password");
                

                supplierToReturn = new Supplier(uname, password);

            }
            

        } catch (SQLException e) {

            handleSQLException(e, sql, "username=" + username);

        } finally {

            //conn.close();
            ConnectionManager.close(conn, stmt, rs);
        }

        return supplierToReturn;

    }
    
    public Vendor retrieveVendor(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "";
        Vendor vendorToReturn = null;
        final String TBLNAME = "vendor_credentials";
        try {   
            
            //creates the connection to database
            conn = ConnectionManager.getConnection();
            
            //Parse the SQL query and execute it
            sql = "SELECT * FROM " + TBLNAME + " WHERE vendor_username = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            rs = stmt.executeQuery();
            
            //Retrieves the administrator info from database and create a new admin object to return
            while (rs.next()) {

                String uname = rs.getString("vendor_username");
                String password = rs.getString("vendor_password");
                String vendor_id = rs.getString("vendor_id");

                vendorToReturn = new Vendor(uname, password, vendor_id);

            }
            

        } catch (SQLException e) {

            handleSQLException(e, sql, "username=" + username);

        } finally {

            ConnectionManager.close(conn, stmt, rs);

        }

        return vendorToReturn;

    }
    */
}
