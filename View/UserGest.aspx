<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGest.aspx.cs" Inherits="Esondage2018.View.UserGest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-sondage 2018</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!--===============================================================================================-->
    <link href="Content/Styles.css" rel="stylesheet" />
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

    <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>

    <script runat="server">
        void CustomersGridView_RowCommand(Object sender, GridViewCommandEventArgs e) {
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if(e.CommandName=="Select") {
                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);    

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = GridView1.Rows[index];
                TableCell contactName = selectedRow.Cells[2];
                string contact = contactName.Text;
                
                // Display the selected author.
                Response.Redirect("v"+contact+".aspx");
            }
        }
    </script>

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
                        <asp:TextBox ID="TextBox4" runat="server" class="sinput" placeholder="Mots-clefs ..."></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" class="loupe" PostBackUrl="~/View/SearchResults.aspx" />
        	        </div>

                    <asp:ImageButton  ID="Button19" runat="server" class="rslogo" ImageUrl="~/Picture/log.png" OnClick="LinkButton2_Click" />
                    <a href="http://google.com" title="Profile"><img class="rslogo" alt="google.com" src="../Picture/user.png"/></a>
                    <a href="http://facebook.com" title="Like our Facebook page"><img class="rslogo" alt="facebook.com" src="../Picture/facebook_logo.png"/></a>
                    <a href="http://twitter.com" title="Follow us on Twitter"><img class="rslogo" alt="twitter.com" src="../Picture/twitter_logo.png"/></a>
                </div>
            </header>
    <!--<center>
        <p>
            <table align="right" ID="Table1" runat="server">
                <tr>
                    <td class="auto-style9">
                        <asp:Button ID="Button4" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des utilisateurs" Width="330px" Font-Bold="True" Font-Italic="True" Font-Size="Large" CausesValidation="False" UseSubmitBehavior="false" OnClick="Button4_Click" />
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="Button5" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des sondages" Width="330px" style="margin-top: 0px; margin-bottom: 0px" Font-Bold="True" Font-Italic="True" UseSubmitBehavior="false" Font-Size="Large" CausesValidation="False" OnClick="Button5_Click" />
                    </td>
                </tr>

            </table>
        </p>
    </center>
                
    <asp:Label ID="Label14" runat="server" ForeColor="#FFCC00" Text="Bonjour " style="text-align:left"></asp:Label>
    <asp:Label ID="Label15" runat="server" ForeColor="#FFCC00" style="text-align:left"></asp:Label>
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Red" OnClick="LinkButton2_Click">(Déconnexion)</asp:LinkButton>
    <br />
    <br />
    <br />
    <br />
    <br />-->


    <center>
        <section id="sAdd">
            <div class="ugnom wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
                <span class="ugsp label-input100" runat="server">Name</span>
                <asp:TextBox ID="TextBox3" runat="server" class="ugsp input100" placeholder="Enter the name"></asp:TextBox></td>
                <span class="focus-input100" data-symbol="&#xf105;"></span>
            </div>

            <div class="ugnom wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <span class="ugsp label-input100" runat="server">E-mail</span>
                <asp:TextBox ID="TextBox1" runat="server" class="ugsp input100" placeholder="Enter the mail"></asp:TextBox>
                <span class="focus-input100" data-symbol="&#xf105;"></span>
            </div>

            <div class="ugnom wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <span class="ugsp label-input100" runat="server">Password</span>
                <asp:TextBox ID="TextBox2" runat="server" class="ugsp input100" placeholder="Enter the password"></asp:TextBox>
                <span class="focus-input100" data-symbol="&#xf105;"></span>
            </div>
        </section>
    </center>

    <div id="admin" class="cadre">
        <asp:CheckBox ID="CheckBox1" class="chk" runat="server"/>
        <span class="chk ugsp">Admin</span>
    </div>  

    <asp:Button ID="add" class="ugsp cadre" runat="server" OnClick="Button6_Click" Text="Add"/>
                
    <!--<center>

                <p>
                </p>
                <br />
                <p>

                    <div>
                        
                        <asp:GridView ID="GridView1" DataKeyNames="Id" PageSize="3" emptydatatext="No data available." runat="server" AutoGenerateColumns="False"  BorderColor="#FF3300" BorderStyle="Double" CellPadding="3" CellSpacing="3" DataSourceID="SqlDataSource1" ForeColor="Maroon" HorizontalAlign="Center" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AllowPaging="True" AllowSorting="True" CssClass="cssgridview">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"  ItemStyle-CssClass="cssgridview" HeaderStyle-CssClass="cssgridview">
                                <HeaderStyle CssClass="cssgridview" />
                                <ItemStyle CssClass="cssgridview" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TypeUser" HeaderText="admin" SortExpression="TypeUser" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                                <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                            </Columns>
                            <pagersettings mode="Numeric" position="Bottom" pagebuttoncount="10"/>
                            <pagerstyle backcolor="LightBlue" height="30px" verticalalign="Bottom" horizontalalign="Center"/>
                        </asp:GridView>
                        

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id],[TypeUser], [email], [nom], [pass] FROM [utilisateur] order by nom" DeleteCommand="delete from utilisateur where Id = @Id" UpdateCommand="Update utilisateur SET TypeUser = @TypeUser, email = @email , nom = @nom  , pass = @pass WHERE Id = @Id"></asp:SqlDataSource>
                    </div>
                </p>
            </center>-->




    </form>
</body>
</html>
