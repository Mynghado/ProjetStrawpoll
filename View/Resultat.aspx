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
        <header class="sthead">
            <div class="lhead">
                <a href="http://localhost:54719/View/Index.aspx" title="makeSurvey, add an user, Home" /><img class="stlogo" alt="flocalhost:54719/View/Index.aspx" src="../Picture/logo.png"/></a>
            </div>

            <div class="rhead">
        	    <div id="recherche" > <!-- method="post" -->
                    <asp:TextBox ID="TextBox4" runat="server" class="sinput" placeholder="User or poll ..."></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" class="loupe" PostBackUrl="~/View/SearchResults.aspx" />
        	    </div>

                <asp:ImageButton  ID="Button19" runat="server" class="rslogo" ImageUrl="~/Picture/log.png" OnClick="LinkButton2_Click" />
                <a href="http://google.com" title="Profile"><img class="rslogo" alt="google.com" src="../Picture/user.png"/></a>
                <a href="http://facebook.com" title="Like our Facebook page"><img class="rslogo" alt="facebook.com" src="../Picture/facebook_logo.png"/></a>
                <a href="http://twitter.com" title="Follow us on Twitter"><img class="rslogo" alt="twitter.com" src="../Picture/twitter_logo.png"/></a>
            </div>
        </header>

        <section id="scRes">
            <article id ="textRes">
                <div>
                    <asp:Label ID="titleRes" runat="server" class="pageTitle"></asp:Label>
                </div>
                <table id="resRes">
                    <tr>
                        <th id="chTabRes" class="thRes">Choice</th>
                        <th id="nbVotTabRes" class="thRes">Voting</th>
                    </tr>
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
                </table>
                
                <asp:Button ID="Button2" runat="server" class="ugsp cadre" OnClick="btn_Click" Text="Show piechart"/>
                <asp:Button ID="btCom" runat="server" class="ugsp cadre" OnClick="btCom_Click" Text="Post a comment"></asp:Button>

                <asp:TextBox ID="TextBox1" runat="server" class="txtZone"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" class="ugsp cadre" OnClick="Button1_Click" Text="Send"></asp:Button>


            </article>

            
            <article id="pieCtnRes">
                <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                    
                    <asp:Panel ID="panel1" runat="server"><iframe src="piechart/pie<%=kloo%>.html" class="pieUszRes"></iframe></asp:Panel>

                </div>
            </article>
        </section>


    <table>
        <tr>
            <td class="auto-style3">



            <asp:TextBox ID="TextBox2" runat="server" Width="322px"></asp:TextBox>
                            </td>
                     </tr>
                    <tr>
                            <td class="auto-style2">
                                <!--<asp:Label ID="Label3" runat="server"  ForeColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text="Ecrire un commentaire : "></asp:Label>
                                -->
                                <br />
                                <br />

                                <!--<asp:TextBox ID="TextBoxXX" runat="server" Height="47px" Width="427px"></asp:TextBox>
                                <br />-->
                                <br />

                               <!--<center> <asp:Button ID="ButtonR1" runat="server"   BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  BorderStyle="Double" Height="41px" Text="Envoyer" Width="235px" OnClick="Button1_Click" /></center>
                                -->
                                <br />
                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#FF9933"></asp:Label>
                                <br />
                                <br />
                                <br />

                            </td>
                     </tr>

                </table>
            </td>
            <!--<td>
               <asp:Button ID="btn" runat="server"   BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  BorderStyle="Double" Height="41px" Text="Voir le graphe" Width="235px" OnClick="btn_Click" /> 
               <asp:Panel ID="panel2" runat="server"><iframe src="piechart/pie<%=kloo%>.html" style="height: 877px; width: 703px; margin-right: 0px; margin-top: 0px" frameBorder="0"></iframe> </asp:Panel>
            </td>-->
        </tr>
       
    </table>
    </form>
    </body>
</html>
