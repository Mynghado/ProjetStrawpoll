<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resultat.aspx.cs" Inherits="Esondage2018.View.Resultat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Content/Styles.css" />
<!--===============================================================================================-->

    <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>

</head>
<body background="images/bdsky.jpg">
    <form id="form1" runat="server">
        <!--<header class="sthead">
            <div class="lhead">
                <a href="http://localhost:54719/View/Index.aspx" title="makeSurvey, add an user, Home" /><img class="stlogo" alt="flocalhost:54719/View/Index.aspx" src="../Picture/logo.png"/></a>
            </div>

            <div class="rhead">
        	    <div id="recherche" >
                    <asp:TextBox ID="searchField" runat="server" class="sinput" placeholder="User or poll ..."></asp:TextBox>
                    <asp:Button ID="search" runat="server" class="loupe" PostBackUrl="~/View/SearchResults.aspx" />
        	    </div>

                <asp:ImageButton  ID="log" runat="server" class="rslogo" ImageUrl="~/Picture/log.png" OnClick="log_Click" />
                <a href="http://google.com" title="Profile"><img class="rslogo" alt="google.com" src="../Picture/user.png"/></a>
                <a href="http://facebook.com" title="Like our Facebook page"><img class="rslogo" alt="facebook.com" src="../Picture/facebook_logo.png"/></a>
                <a href="http://twitter.com" title="Follow us on Twitter"><img class="rslogo" alt="twitter.com" src="../Picture/twitter_logo.png"/></a>
            </div>
        </header>-->

        <section id="scRes">
            <article id ="artTextRes" class="bdrLayout center">
                <div id="posTitleRes">
                    <asp:Label ID="titleRes" runat="server" class="pageTitle"></asp:Label>
                </div>
                <table id="tabRes" class="dataRes center">
                    <thead>
                        <tr>
                            <th id="chTabRes">Choice</th>
                            <th id="nbVotTabRes">Voting</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><asp:Label ID="Label4" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label5" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label6" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label7" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label8" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label9" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label10" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label11" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label13" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label14" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label15" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label16" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label17" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label18" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label19" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label20" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label21" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label22" runat="server"></asp:Label></td>
                            <td><asp:Label ID="Label23" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>

                <div id ="comRes">
                    <!--<div id="showWrapRes" class="wrap-login100-form-btn">
			            <div class="login100-form-bgbtn"></div>
				        <button id="btShowRes" runat="server" class="login100-form-btn" onserverclick="btShowRes_Click">Show piechart</button>
                    </div>-->
                    <div id="comWrapRes" runat="server" class="wrap-login100-form-btn">
			            <div class="login100-form-bgbtn"></div>
				        <button id="btComRes" runat="server" class="login100-form-btn" onserverclick="btComRes_Click">Post a comment</button>
                    </div>
                </div>
                
                <div class="txtZone">
                    <textarea id="comAreaRes" runat="server" rows="3" cols="10"></textarea>
                </div>

                <div id="sendWrapRes" runat="server" class="wrap-login100-form-btn">
			        <div class="login100-form-bgbtn"></div>
				    <button id="btSendRes" runat="server" class="login100-form-btn" onserverclick="btSendRes_Click">Send</button>
                </div>

                <div id="posComRes">
                    <asp:Label ID="Label24" runat="server"></asp:Label>
                </div>
            </article>

            
            <article id="pieCtnRes">
                <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="20000"></asp:Timer>
                    
                    <div id="panel1" runat="server" type="hidden"><iframe src="piechart/pie<%=kloo%>.html" class="pieUszRes" type="hidden"></iframe></div>
                </div>
            </article>
        </section>
    </form>
</body>
</html>
