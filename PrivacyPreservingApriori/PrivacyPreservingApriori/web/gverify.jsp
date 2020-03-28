<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    Connection con = null;
    Statement st = null;
    String gid = request.getParameter("gid");
    String gname = request.getParameter("gname");
    String gkey = request.getParameter("gkey");
    try{
        con = Dbconnection.getConnection();
        st  = con.createStatement();
        int i = st.executeUpdate("insert into sgroup values('"+gname+"','"+gid+"','"+gkey+"','No',0)");
        if(i!=0)
        {
            response.sendRedirect("gcreation.jsp?msg=success");
        }
        else    
        {
            response.sendRedirect("gcreation.jsp?msgg=failed");
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
%>