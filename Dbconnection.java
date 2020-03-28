/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ces.pjct.action;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author java2
 */
public class Dbconnection {
    public static Connection con = null;
    public static Connection getConnection()
    {
       try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cost_effective","root","root");
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
        return con;
    }
}
