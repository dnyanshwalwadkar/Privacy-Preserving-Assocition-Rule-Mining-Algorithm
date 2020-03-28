<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ces.pjct.action.Dbconnection"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String vname = null;
    String name = request.getParameter("uname");
    System.out.println("The username in Laction "+name);
    String pass = request.getParameter("upass");
    System.out.println("The password in Laction "+pass);
    int status =Integer.parseInt(request.getParameter("status"));
    System.out.println("The status in Laction "+status);
    try {
        switch (status) {
            case 1:
                try {
                    con = Dbconnection.getConnection();
                    st = con.createStatement();
                    rs = st.executeQuery("select * from reg where email='"+name+"' AND pass='"+pass+"'");
                    if(rs.next())
                    {
                        response.sendRedirect("ohome.jsp?msg=success");
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("name", rs.getString("name"));
                    }
                    else
                    {
                        response.sendRedirect("owner.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                vname ="DCenter";
                try{
                    if(name.equalsIgnoreCase(vname)&&pass.equalsIgnoreCase(vname))
                    {
                        response.sendRedirect("dhome.jsp?msg=success");
                    }
                    else
                    {
                        response.sendRedirect("dcenter.jsp?msgg=failed");
                    }
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                break;
            case 3:
                vname ="PKG";
                try{
                    
                    if(name.equalsIgnoreCase(vname)&&pass.equalsIgnoreCase(vname))
                    {
                        response.sendRedirect("phome.jsp?msg=success");
                    }
                    else
                    {
                        response.sendRedirect("kdistributor.jsp?msgg=failed");
                    }
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>