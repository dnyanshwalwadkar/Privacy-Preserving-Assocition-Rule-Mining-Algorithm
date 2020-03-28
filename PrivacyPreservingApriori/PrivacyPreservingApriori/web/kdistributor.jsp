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
                    <div class="logo"><center style="font-size: 25px;color: white">Cost-Effective Authentic and Anonymous Data Sharing with Forward Security</center></div>
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
        <div class="main-content-wrapper">
            <div>
                <img src="images/keyd.png" width="170px;" height="300px;" style="float: left;margin-top: 20px;margin-left: 20px" />
            </div>
            <div class="right-column" style="margin-left: 50px">
                <div class="right-col-content mar-top">
                    <div class="right-col-content-title  ">
                        <h1>PKG Login</h1>
                    </div>
                    <form action="laction.jsp" method="post">
                        <ul class="login">
                            <li>User Name :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="text" name="uname" id="text" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>Password :</li>
                            <li class="login-field-bg">
                                <label>
                                    <input type="password" name="upass" id="test" required="" class="login-input-textfield" />
                                </label>
                            </li>
                            <li>
                                <input type="hidden" value="3" name="status"/>
                                <div class="submit"><input type="submit" value="Submit" /></div>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
