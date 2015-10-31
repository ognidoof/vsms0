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
/*
public class SearchDAO {

    public ArrayList<Supplier> Search(String inputStr) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Supplier s = null;

        ArrayList<Supplier> resultsList = new ArrayList<>();

        try {
            conn = ConnectionManager.getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM supplier WHERE lower(supplier_name) LIKE" + "'%" + inputStr.toLowerCase() + "%' OR lower(supplier_name) SOUNDS LIKE '%" +inputStr.toLowerCase() +"%'");
            //pstmt = conn.prepareStatement("SELECT name, password, gender FROM user WHERE " + "name = ?");
            //pstmt.setString(1, username);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                String supName = rs.getString(2);
                ArrayList<String> items = new ArrayList<String>();
                String category = rs.getString(3);
                String desc = rs.getString(4);
                s = new Supplier(supName, items, category, desc);
                resultsList.add(s);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ConnectionManager.close(conn, pstmt, rs);
        }

        return resultsList;
    }

}
*/