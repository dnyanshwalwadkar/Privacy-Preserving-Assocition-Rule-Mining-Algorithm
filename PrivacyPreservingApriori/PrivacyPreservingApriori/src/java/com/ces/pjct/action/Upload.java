/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ces.pjct.action;

import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
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
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.net.ftp.FTPClient;


/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    final String filepath="D:/";
           
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        
            
            Connection con;
            Statement st = null;
            ResultSet rs = null;
            PreparedStatement pstm = null;
            String fileName = null;
            String sKey = null;
            String gName = null;
              FTPClient client = new FTPClient();
    FileInputStream fis = null;
           
            String email = (String) request.getSession().getAttribute("email");
           
           try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
//                MultipartRequest request1=new MultipartRequest(request, filepath);
//                File file1=request1.getFile("file");
//                System.out.println("file1 = " + file1);
//                String  fileName=request.getParameter("fname");
//                String sKey=request.getParameter("skey");
//                String gName=request.getParameter("gname");
//                System.out.println("fileName = " + fileName);
//                System.out.println("sKey = " + sKey);
//                System.out.println("gName = " + gName);
//                BufferedReader br=new BufferedReader(new FileReader(filepath+fileName));
//            StringBuffer sb=new StringBuffer();
//            String temp=null;
//            
//            while(( temp=br.readLine())!=null){
//               sb.append(temp);               
//           }        
         //   System.out.println("sb = " + sb.toString());
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
               
                try {
                    List<FileItem> fields = upload.parseRequest(request);
                    Iterator<FileItem> it = fields.iterator();
                    if (!it.hasNext()) {
                        return;
                    }
                    while (it.hasNext()) {
                        FileItem fileItem = it.next();
                       // System.out.println("fileItem = " + fileItem);
                       
                        switch (fileItem.getFieldName()) {
                            case "fname":
                                fileName = fileItem.getString();
                                System.out.println("File Name in Upload :" + fileName);
                                break;
                            case "skey":
                                sKey = fileItem.getString();
                                System.out.println("Secret Key in Upload :" + sKey);
                                break;
                            case "gname":
                                gName = fileItem.getString();
                                System.out.println("The Group Name in Upload :" + gName);
                                break;
                            default:
                                break;
                        }
                         File file1=new File(fileName);
                           fileItem.write(file1);
                           System.out.println("file1 = " + file1);
                        boolean isFormField = fileItem.isFormField();
                        if (isFormField) {
                        } else {
                            try {
                                con = Dbconnection.getConnection();
                                st = con.createStatement();
                                rs = st.executeQuery("select * from sgroup where gaccess='" + sKey + "' AND gname='" + gName + "'");
                                if (rs.next()) {
                                    pstm = con.prepareStatement("insert into files(uid, fname, gname, skey, file, status)values(?,?,?,?,?,?)");
                                    pstm.setString(1, email);
                                    pstm.setString(2, fileName);
                                    pstm.setString(3, gName);
                                    pstm.setString(4, sKey);
                                    pstm.setString(5, fileItem.getString());
                                    pstm.setString(6, "No");
                                    int i = pstm.executeUpdate();
                                /////////////////////////////////////////////////////    
                                      client.connect("ftp.drivehq.com");

            client.login("masstech1", "mass");
            System.out.println("Connected to drive HQ");
            client.enterLocalPassiveMode();
            //String filename = "/home/ibn/Desktop/report.txt";
            fis = new FileInputStream(file1);
            System.out.println("111");
            System.out.println(fileItem.getName());
            client.storeFile("  /pp/" + fileItem.getName(), fis);
            System.out.println("222");
            client.logout();
            fis.close();
                                    if (i != 0) {
                                        response.sendRedirect("upload.jsp?msg=success");
                                      
                                   
                                   
                                    }
                                } else {
                                    response.sendRedirect("upload.jsp?msgg=failed");
                                }
                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        }
                    }
                } catch (FileUploadException e) {
                        } 
                        catch (Exception ex) {
                    Logger.getLogger(Reg.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
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
