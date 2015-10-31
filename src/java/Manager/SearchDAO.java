/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Supplier;
import Manager.ConnectionManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TC
 */

public class SearchDAO {

    public ArrayList<Supplier> Search(String inputStr) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement itemStatement = null;
        
        ResultSet rs = null;
        ResultSet itemRs = null;
        
        String query="";
        Supplier s = null;

        ArrayList<Supplier> resultsList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM supplier WHERE lower(supplier_name) LIKE" + "'%" + inputStr.toLowerCase() + "%' OR lower(supplier_name) SOUNDS LIKE '%" +inputStr.toLowerCase() +"%'");
            //pstmt = conn.prepareStatement("SELECT name, password, gender FROM user WHERE " + "name = ?");
            //pstmt.setString(1, username);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                String supName = rs.getString("supplier_name");
                ArrayList<String> items = new ArrayList<String>();
                String category = rs.getString("supplier_type");
                String desc = rs.getString("supplier_description");
                String supplier_id=rs.getString("supplier_id");
                
                query = "select * from ingredient where supplier_id=?";
                itemStatement = conn.prepareStatement(query);
                itemStatement.setString(1,supplier_id);
                itemRs=itemStatement.executeQuery();
                while(itemRs.next()){
                    String itemName=itemRs.getString("ingredient_name");
                    items.add(itemName);
                }
                
                
                s = new Supplier(supplier_id, supName, items, category, desc);
                resultsList.add(s);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try{
                itemStatement.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            ConnectionManager.close(conn, pstmt, rs);
        }

        return resultsList;
    }
}
