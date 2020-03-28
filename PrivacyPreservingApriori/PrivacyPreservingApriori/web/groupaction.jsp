<%@page import="java.sql.ResultSet"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    String email = (String) session.getAttribute("email");
    String gid = request.getParameter("gid");
    String gname = request.getParameter("gname");
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    int i;
    try {
      con = Dbconnection.getConnection();
      st = con.createStatement();
      rs = st.executeQuery("select * from sgroup where gname = '"+gname+"' AND gid='"+gid+"'");
      if(rs.next())
      {
          i = rs.getInt("ncount");
          if(i<=5)
          {
              int j = st.executeUpdate("insert into request values('" + email + "','" + gid + "','" + gname + "','Waiting','No')");
              if(j!=0)
              {
                  i=i+1;
                  st.executeUpdate("update sgroup set ncount='"+i+"' where gname = '"+gname+"' AND gid='"+gid+"' ");
                  response.sendRedirect("joingroup.jsp?msg=success");
              }
          }
          else
          {
             response.sendRedirect("joingroup.jsp?msgg=failed");
          }
      }
    } catch (Exception ex) {
        ex.printStackTrace();
    }


%>