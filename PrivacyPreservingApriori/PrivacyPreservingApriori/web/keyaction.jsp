<%@page import="java.sql.ResultSet"%>
<%@page import="com.ces.pjct.action.Mail"%>
<%@page import="java.util.UUID"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String msg = null;
    String data[] = request.getQueryString().split(",");
    String uid = data[0];
    System.out.println("The User ID in Keyaction " + uid);
    String gid = data[1];
    System.out.println("The Group ID in Keyaction " + gid);
    String gname = data[2];
    System.out.println("The Group Name in Keyaction " + gname);
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from sgroup where gid='" + gid + "' AND gname='" + gname + "' ");
        if (rs.next()) {
            msg = "Mail Id :" + uid + "\n\nSecret Key :" + rs.getString("gaccess");

            int i = st.executeUpdate("update request set status='Yes',pkey='" + rs.getString("gaccess") + "' where uid='" + uid + "' AND gid='" + gid + "' AND gname ='" + gname + "'");
            if (i != 0) {
                Mail m = new Mail();
                m.secretMail(msg, "testjpinfotech@gmail.com", uid);
                response.sendRedirect("keydisturb.jsp?msg=success");
            } else {
                response.sendRedirect("keydisturb.jsp?msgg=failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }


%>