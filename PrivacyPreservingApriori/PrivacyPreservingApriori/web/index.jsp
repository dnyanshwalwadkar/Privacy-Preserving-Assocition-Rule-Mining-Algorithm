<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Privacy Preservation Association Rule Mining</title>
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
                    <li><a href="index.jsp" class="active">Home</a></li>
                    <li><a href="owner.jsp">Data Owner </a></li>
                    <li><a href="dcenter.jsp">Data Center</a></li>
                    <li><a href="kdistributor.jsp">Key Distributor</a></li>
                </ul>
            </div>
            <div class="clearing"></div>
            <div class="logo-search-wrapper">
                <div class="logo-search-container"><br />
                    <div class="logo"><center style="font-size: 25px;color: white">Privacy Preserving Association Rule Mining </center></div>
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
        <div class="main-content-wrapper" style="width: 1000px;">
            <div class="right-column">
                <div class="right-col-content mar-top" style="width: 900px;font-size: 20px;padding-right: 10px;">
                    <label>Abstract :</label>
                    <p style="text-align: justify">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With the increasing use and development of cloud computing, preserving privacy of data has been getting lot of attention and need improvement in increase in data. Many researchers are working towards the encryption mechanism of this cloud data, out of which recently privacy preserving association rule mining algorithm has been proposed to support data security. However this algorithm had additional overhead by inserting fake items and can?t hide the data frequency.  Hence we are proposing privacy preservation association rule mining algorithm for encrypted data in cloud computing. For association rule mining algorithm, we will be using Apriori algorithm and also to verify that two encrypted text have the same plain text, we also propose secure plaintext equality test protocol. Hence our proposed algorithm can guarantee both data privacy and query privacy, while concealing data frequency.
                    </p>
                </div>
            </div>
        </div>
        <div class="copyrights" style="padding: 30px;"></div>
    </body>
</html>
