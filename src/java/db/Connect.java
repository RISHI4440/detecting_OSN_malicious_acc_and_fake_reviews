/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Rohit
 */
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Mangesh
 */
public class Connect {

    public static Connection getConnection() throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "root");
        return  con;
    }
}
