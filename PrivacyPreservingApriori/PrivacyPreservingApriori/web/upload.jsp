<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
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
        <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('File Upload Successfully');</script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Please Enter Correct Group Key');</script>   
        <%}
        %>
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
                   String logo = null;
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
            <div class="right-column" style="margin-left: 200px;">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                    <%
//                        String email = (String) session.getAttribute("email");
//                        Connection con = null;
//                        Statement st = null;
//                        ResultSet rs = null;
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs = st.executeQuery("select * from request where status='Yes' and uid='" + email + "'");
                            if (rs.next()) {%>
                    <div class="right-col-content-title  ">
                        <h1>File Upload Here</h1>
                    </div>
                    <form action="Upload" method="post" enctype="multipart/form-data">
                        <ul class="login">
                            <li>File Name :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="text" name="fname" id="text" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>Group Key :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="password" name="skey" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <input type="hidden" value="<%=rs.getString("gname")%>" name="gname" />
                            <li>Browse  File:</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="file" name="file" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>
                                <input type="submit" value="Submit" class="submit"/>
                            </li>
                        </ul>
                    </form>
                    <%} else {%>
                    <center>
                        <h1 style="font-size: 20px;">You don't have permission for file upload</h1>
                        <h2>Please  Join Group and Get Secret Key</h2>
                    </center>
                    <%}
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
