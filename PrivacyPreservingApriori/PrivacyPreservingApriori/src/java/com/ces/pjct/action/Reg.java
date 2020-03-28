/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ces.pjct.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Reg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
            Statement st = null;
            ResultSet rs = null;
//            String name;
//            String pass = null;
////            String dob = null;
//            String email = null;
//            String mob = null;
////            String loc = null;
//            String ip = null;
//            Date newDate = null;
//            /*Date Format*/
//            SimpleDateFormat formatter = new SimpleDateFormat("YYY-MM-DD");
            /*To get System IP*/
            String ip = InetAddress.getLocalHost().getHostAddress();
            System.out.println("System IP " + ip);
                 try {
                    String name=request.getParameter("rname");
                     String pass=request.getParameter("rpass");
                     String email=request.getParameter("email");
                     String mob=request.getParameter("mob");
                     System.out.println("Name "+name+" Pass "+pass+" Email "+email+" mobile "+mob);
                                con = Dbconnection.getConnection();
                                st = con.createStatement();
                                rs = st.executeQuery("select * from reg where email='" + email + "' AND ipaddress='" + ip + "' ");
                                if (rs.next()) {
                                    response.sendRedirect("ureg.jsp?msgg1=failed");
                                } else {
                                    con = Dbconnection.getConnection();
                                    pstm = con.prepareStatement("insert into reg (name, pass,email, mob, ipaddress)values(?,?,?,?,?)");
                                    pstm.setString(1, name);
                                    pstm.setString(2, pass);
                                    pstm.setString(3, email);
                                    pstm.setString(4, mob);
                                    pstm.setString(5, ip);
                                    int i = pstm.executeUpdate();
                                    if (i == 1) {
                                        response.sendRedirect("ureg.jsp?msg=success");
                                    } else {
                                        response.sendRedirect("ureg.jsp?msgg=failed");
                                    }
                                    con.close();
                                }

                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        }
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
