<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Cost_Effective_Sharing</title>
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css' />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script>
            $(function () {
                $("#searchLink").click(function () {
                    var data = $('#search').val();
                    var url = "https://www.google.co.in/?gfe_rd=cr&ei=i-_KVe6rGufI8AfjsYqYBw&gws_rd=ssl#q=" + data;
                    window.open(url, '_blank');
                    $("#search").val("");
                });
            });

        </script>
    </head>
    <body>
        <div class="header-wrapper">
            <div class="menu">
                <ul>
                    <li><a href="ohome.jsp" class="active">Home</a></li>
                    <li><a href="upload.jsp">Upload Files </a></li>
                    <li><a href="sharedfiles.jsp">Shared Files</a></li>
                    <li><a href="joingroup.jsp">Joined Group</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
            <div class="clearing"></div>
            <div class="logo-search-wrapper">
                <div class="logo-search-container"><br />
                    <div class="logo"><center style="font-size: 25px;color: white">Privacy Preservation Association Rule Mining</center></div>
                    <div class="search">
                        <ul>
                            <li class="search-input">
                                <input type="text" id="search" class="search-input-textfield" />
                            </li>
                            <li class="search-button"><a href="#" id="searchLink"><img src="images/search-icon.png" alt="themedemic" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
      
                <%
                    
                    int i = 1;
                    String email = session.getAttribute("email").toString();
                    System.out.println("Email " + email);
                    Connection con = Dbconnection.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from reg where email='" + email + "'");
                    while (rs.next()) {
                        
                %>
              
                <%
                    }
                %>
            </div>
        </div>
        <div class="main-content-wrapper" style="width: 1000px;">
            <div class="right-column">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                    <%
//                        String email = session.getAttribute("email").toString();
//                        Connection con = null;
//                        Statement st = null;
//                        ResultSet rs = null;
                        ResultSet rs1 = null;
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs1 = st.executeQuery("select * from request where uid='" + email + "' AND status='Yes'");
                            if (rs1.next()) {%>
                    <h2 style="margin-left: 180px;font-size: 25px">Shared File Details</h2><br />
                    <table border="1" style="text-align: center;margin-left: 130px;">
                        <tr>
                            <th>Email</th>
                            <th>File Name</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <%rs = st.executeQuery("select * from files where status='Yes' AND gname='" + rs1.getString("gname") + "' AND skey='" + rs1.getString("pkey") + "'");
                                while (rs.next()) {%>
                            <td><%=rs.getString("uid")%></td>
                            <td><%=rs.getString("fname")%></td>
                            <td><a href="download.jsp?<%=rs.getString("uid")%>,<%=rs.getString("fname")%>,<%=rs.getString("gname")%>,<%=rs.getString("skey")%>" style="text-decoration: none">Download</a></td>
                        </tr>   
                        <%}

                        } else {%>
                        <center>
                            <h1 style="font-size: 20px;">You don't have permission for file download</h1>
                            <h2>Please  Join Group and Get Secret Key</h2>
                        </center>
                        <%}
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
