
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        <script>alert('Group Joined Successfully');</script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Group Occupied');</script>
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
                            <li class="search-button"><a href="#" id="searchLink" ><img src="images/search-icon.png" alt="themedemic" /></a></li>
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
                                            }
                %>
              
            </div>
        </div>
        <div class="main-content-wrapper" style="width: 1000px;">
            <div class="right-column"  style="margin-left: 250px;">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                    <div class="right-col-content-title  ">
                        <h1>Group Join</h1>
                    </div>
                    <form action="groupaction.jsp" method="post">
                        <ul class="login">
                            <%
                                
                                
                                
                                  try
                                  {
                                    con = Dbconnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from sgroup where status='Yes' AND ncount between 0 AND 4");
                                    while (rs.next()) {%>
                            <li>Group ID :</li>
                            <li class="login-field-bg">
                                <label>
                                    <select name="gid">
                                        <option>Select Group ID</option>
                                        <option><%=rs.getString("gid")%></option>
                                    </select>
                                </label>
                            </li>
                            <li>Group Name :</li>
                            <li class="login-field-bg">
                                <label>
                                    <select name="gname">
                                        <option>Select Group Name</option>
                                        <option><%=rs.getString("gname")%></option>
                                    </select>
                                </label>
                            </li>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                            <li>
                                <div class="submit"><input type="submit" value="Join Group" /></div>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
