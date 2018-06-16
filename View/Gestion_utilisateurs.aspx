<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion_utilisateurs.aspx.cs" Inherits="Esondage2018.View.Gestion_utilisateurs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        
    <title>E-sondage 2018</title>
    <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <%--<script type="text/javascript">
        $(function () {
            $("[id*=TextBox4]").on("keyup", function () {
                $("[id*=Button7]")[0].click();
                $("[id*=TextBox4]").focus();
            });
        });
    </script>--%>

<!--     <style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>
    <style type="text/css">
        .auto-style9 {
            width: 334px;
            height: 61px;
        }
        .auto-style10 {
            width: 312px;
            height: 61px;
        }
    </style>
    <style type="text/css">
        
        table
        {
            border:0px solid #ccc;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
        }
        .cssgridview { /* ça fonctionne */
            background-color : green;
        }
    </style>-->
    <link rel="stylesheet" type="text/css" href="../Content/Styles.css" />

    
</head>
<body>
    <form id="form2" runat="server">
        <header class="sthead">
            <div class="lhead">
                <a href="http://localhost:54719/View/Index.aspx" title="makeSurvey, add an user, Home" /><img class="stlogo" alt="flocalhost:54719/View/Index.aspx" src="../Picture/logo.png"/></a>
            </div>

            <div class="rhead">
        	    <div id="recherche" > <!-- method="post" -->
                    <asp:TextBox ID="searchField" runat="server" class="sinput" placeholder="User or poll ..."></asp:TextBox>
                    <asp:Button ID="search" runat="server" class="loupe" PostBackUrl="~/View/SearchResults.aspx" />
        	    </div>

                <asp:ImageButton  ID="log" runat="server" class="rslogo" ImageUrl="~/Picture/log.png" OnClick="log_Click" />
                <a id="mngRsh" runat="server" href="http://google.com" title="Manage user and polls"><img class="rslogo" alt="google.com" src="../Picture/wrench.png"/></a>
                <a href="http://google.com" title="Profile"><img class="rslogo" alt="google.com" src="../Picture/user.png"/></a>
                <a href="http://facebook.com" title="Like our Facebook page"><img class="rslogo" alt="facebook.com" src="../Picture/facebook_logo.png"/></a>
                <a href="http://twitter.com" title="Follow us on Twitter"><img class="rslogo" alt="twitter.com" src="../Picture/twitter_logo.png"/></a>
            </div>
        </header>
        <section id="scGesu" class="bdrLayout center">
            <article id="artResGesu" class="artLayout center">
                <div id="posTitleGesu">
                    <asp:Label ID="titleGesu" runat="server" class="pageTitle">Manage users</asp:Label>
                </div>
            <!--<p>
                <table align="right" ID="Table1" runat="server">
                    <tr><td class="auto-style9">
                                <asp:Button ID="Button4" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des utilisateurs" Width="330px" Font-Bold="True" Font-Italic="True" Font-Size="Large" CausesValidation="False" UseSubmitBehavior="false" OnClick="Button4_Click" />
                            </td><td class="auto-style10">
                            <asp:Button ID="Button5" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des sondages" Width="330px" style="margin-top: 0px; margin-bottom: 0px" Font-Bold="True" Font-Italic="True" UseSubmitBehavior="false" Font-Size="Large" CausesValidation="False" OnClick="Button5_Click" />
                        </td></tr>
                </table></center>
                <asp:Label ID="Label14" runat="server" ForeColor="#FFCC00" Text="Bonjour " style="text-align:left"></asp:Label>
                <asp:Label ID="Label15" runat="server" ForeColor="#FFCC00" style="text-align:left"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Red" OnClick="LinkButton2_Click">(Déconnexion)</asp:LinkButton>
                <br />
            </p>
            <center>
                <br />
                <br />
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#660033" Text="Nom : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Height="25px"  Width="235px" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#660033" Text="Email : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Height="25px"  Width="235px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#660033" Text="Mot de passe : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Height="25px"  Width="235px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:CheckBox ID="CheckBox1" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#660033" Text="" />
                        </td>
                        <td align="left">
                                                        <asp:Label ID="Label4" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#660033" Text="Admin"></asp:Label>

                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="Button6" runat="server"  BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  OnClick="Button6_Click" Text="Ajouter" Font-Bold="True" Font-Italic="True" Height="39px" Width="145px" />
                </p>
                <br />
                <p>-->
                <div id="rshGesu" class="center">
                    <asp:TextBox ID="TextBox4" runat="server" Height="31px" Width="134px"  ></asp:TextBox>
                    <asp:Button ID="Button7" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" OnClick="Button7_Click" Text="Recherche par nom" Height="36px" Width="134px" />
                </div>    
                <div class="gridSpace">        
                        <asp:GridView ID="GridView1" DataKeyNames="Id" PageSize="3" emptydatatext="No data available." runat="server" AutoGenerateColumns="False"  BorderStyle="Double" CellPadding="3" CellSpacing="3" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AllowPaging="True" AllowSorting="True" class="dataRes center">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"  ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TypeUser" HeaderText="admin" SortExpression="TypeUser" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                                <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                            </Columns>
                            <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="10"/>

        <pagerstyle backcolor="LightBlue"
          height="30px"
          verticalalign="Bottom"
          horizontalalign="Center"/>
                        </asp:GridView>
                        
    
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id],[TypeUser], [email], [nom], [pass] FROM [utilisateur] order by nom" DeleteCommand="delete from utilisateur where Id = @Id" UpdateCommand="Update utilisateur SET TypeUser = @TypeUser, email = @email , nom = @nom  , pass = @pass WHERE Id = @Id"></asp:SqlDataSource>
                    </div>
                    <!--<p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>-->
            </article>
        </section>
    </form>
</body>
</html>

