<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    Connection con = null;
    Statement  st = null;
    String[] data = request.getQueryString().split(",");
    try{
        con = Dbconnection.getConnection();
        st = con.createStatement();
        int i =st.executeUpdate("update  sgroup set status='Yes' where gname='"+data[0]+"' AND  gid ='"+data[1]+"' AND gaccess='"+data[2]+"'");
        if(i != 0)
        {
            response.sendRedirect("agroup.jsp?msg=success");
        }
        else
        {
            response.sendRedirect("agroup.jsp?msgg=failed");
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }

%>