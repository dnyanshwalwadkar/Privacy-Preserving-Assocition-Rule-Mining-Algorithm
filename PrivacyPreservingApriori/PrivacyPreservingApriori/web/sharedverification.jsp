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
            $(function (){
                $("#searchLink").click(function (){
                    var data = $('#search').val();
                    var url ="https://www.google.co.in/?gfe_rd=cr&ei=i-_KVe6rGufI8AfjsYqYBw&gws_rd=ssl#q="+data;
                    window.open(url,'_blank');
                    $("#search").val("");
                });
            });
            
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Permission Granted');</script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Access Denied');</script>    
        <%}
        %>

        <div class="header-wrapper">
            <div class="menu">
                <ul>
                    <li><a href="dhome.jsp" class="active">Home</a></li>
                    <li><a href="gcreation.jsp">Groups Creation</a></li>
                    <li><a href="agroup.jsp">Activate Group</a></li>
                    <li><a href="activegroup.jsp">Activated Group</a></li>
                    <li><a href="sharedverification.jsp">Shared to Cloud</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
            <div class="clearing"></div>
            <div class="logo-search-wrapper">
                <div class="logo-search-container"><br />
                    <div class="logo"><center style="font-size: 25px;color: white">Privacy Preserving Association Rule Mining</center></div>
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
           
            </div>
        </div>
        <div class="main-content-wrapper" style="width: 1000px;">
            <div class="right-column">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                    <h1 style="font-size: 25px;margin-left: 100px;">Access Permission for Shared Files </h1><br />
                    <table border="1" width="500px" style="text-align: center">
                        <tr>
                            <th>User ID</th>
                            <th>File Name</th>
                            <th>Group Name</th>
                            <th>Secret Key</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <%
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = Dbconnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from files where status='No'");
                                    while (rs.next()) {%>
                            <td><%=rs.getString("uid")%></td>
                            <td><%=rs.getString("fname")%></td>
                            <td><%=rs.getString("gname")%></td>
                            <td><%=rs.getString("skey")%></td>
                            <td><a href="sharedpermission.jsp?<%=rs.getString("uid")%>,<%=rs.getString("fname")%>,<%=rs.getString("gname")%>,<%=rs.getString("skey")%>" style="text-decoration: none">Accept</a></td>
                        </tr> 
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
