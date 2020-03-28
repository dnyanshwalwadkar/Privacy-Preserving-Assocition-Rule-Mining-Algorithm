<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String[] data = request.getQueryString().split(",");
    Connection con = null;
    Statement st = null;
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        int i = st.executeUpdate("update files set status='Yes' where uid='" + data[0] + "' AND  fname='" + data[1] + "' AND  gname='" + data[2] + "' AND  skey='" + data[3] + "'");
        if (i != 0) {
            response.sendRedirect("sharedverification.jsp?msg=success");
        }
        else
        {
            response.sendRedirect("sharedverification.jsp?msgg=failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>