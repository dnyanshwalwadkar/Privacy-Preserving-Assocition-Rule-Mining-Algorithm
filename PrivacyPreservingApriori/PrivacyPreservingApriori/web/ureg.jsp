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
            if(request.getParameter("msg")!=null)
            {%>
            <script>alert('Registration Successfully');</script>  
            <%}
            if(request.getParameter("msgg")!=null)
            {%>
            <script>alert('Registration Failed');</script>  
            <%}
            if(request.getParameter("msgg1")!=null)
            {%>
            <script>alert('Already Exist User');</script>  
            <%}
        %>
        <div class="header-wrapper">
            <div class="menu">
                <ul>
                    <li><a href="index.jsp" class="active">Home</a></li>
                    <li><a href="owner.jsp">Data Owner </a></li>
                    <li><a href="dcenter.jsp">Data Center</a></li>
                    <li><a href="kdistributor.jsp">Key Distributor</a></li>
                </ul>
            </div>
            <div class="clearing"></div>
            <div class="logo-search-wrapper">
                <div class="logo-search-container"><br />
                    <div class="logo"><center style="font-size: 25px;color: white">Privacy Preserving Association Rule Mining</center></div>
                    <div class="search">
                        <ul>
                            <li class="search-input">
                                <input type="text" id="search" lass="search-input-textfield" />
                            </li>
                            <li class="search-button"><a href="#" id="searchLink"><img src="images/search-icon.png" alt="themedemic" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
           
            </div>
        </div>
        <div class="main-content-wrapper">
            <div class="right-column" style="margin-left: 250px">
                <div class="right-col-content mar-top">
                    <div class="right-col-content-title  ">
                        <h1>Sign Up Page</h1>
                    </div>
                    <form action="Reg" method="post">
                        <ul class="login">
                            <li>Name :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="text" name="rname" id="text" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>Password :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="password" name="rpass" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                           
                            <li>Email :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="email" name="email" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>Mobile :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="text" name="mob" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                           
                            <li>
                                <input type="submit" value="Submit" class="submit"/>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
