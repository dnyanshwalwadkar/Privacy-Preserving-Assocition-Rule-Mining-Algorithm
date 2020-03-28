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
        
        <div class="header-wrapper">
            <div class="menu">
                <ul>
                    <li><a href="dhome.jsp" class="active">Home</a></li>
                    <li><a href="gcreation.jsp">Groups Creation</a></li>
                    <li><a href="agroup.jsp">Activate Group</a></li>
                    <li><a href="activegroup.jsp">Activated Group</a></li>
                    <li><a href="sharedverification.jsp">Shared to Cloud</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
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
                            <li class="search-button"><a href="#" id="searchLink" ><img src="images/search-icon.png" alt="themedemic" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="banner" style="background-image: url('images/dcenter.jpg')">
            </div>
        </div>
        <div class="main-content-wrapper" style="width: 1000px;">
            <div class="right-column">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
