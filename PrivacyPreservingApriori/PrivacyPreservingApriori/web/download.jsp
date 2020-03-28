<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String[] data = request.getQueryString().split(",");
    try {
        con = Dbconnection.getConnection();
        st = con.createStatement();
        String strQuery = "select * from files where uid='"+data[0]+"' AND fname='"+data[1]+"' AND gname='"+data[2]+"' AND skey='"+data[3]+"'";
        ResultSet rs1 = st.executeQuery(strQuery);
        Blob blob;
        rs1 = st.executeQuery(strQuery);
        if (rs1.next()) {
            blob = rs1.getBlob("file");
            String fileName = rs1.getString("fname");
            InputStream readImg = blob.getBinaryStream();
            int len = readImg.available();
            byte[] rb = new byte[len];
            int index = readImg.read(rb, 0, len);
            st.close();
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            response.getOutputStream().write(rb, 0, len);
            response.getOutputStream().flush();
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
