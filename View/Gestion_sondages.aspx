<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion_sondages.aspx.cs" Inherits="Esondage2018.View.Gestion_sondages" EnableEventValidation = "false"%>

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
        <section id="scGess" class="bdrLayout center">
            <article id="artResGess" class="artLayout center">
                <div id="posTitleGess">
                    <asp:Label ID="titleGess" runat="server" class="pageTitle">Manage polls</asp:Label>
                </div>

    
        <!--<asp:Panel ID="Panel1" runat="server" DefaultButton="">
            <p>
                <table align="right" ID="Table1" runat="server">
                    <tr><td class="auto-style9">
                                <asp:Button ID="Button4" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des utilisateurs" Width="330px" Font-Bold="True" Font-Italic="True" Font-Size="Large" OnClick="Button4_Click"  />
                            </td><td class="auto-style10">
                            <asp:Button ID="Button5" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="Gestion des sondages" Width="330px" style="margin-top: 0px; margin-bottom: 0px" Font-Bold="True" Font-Italic="True" Font-Size="Large" OnClick="Button5_Click" />
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
                
                <br />
                <p>-->
                    <div id="rshGess" class="center">
                        <asp:TextBox ID="TextBox4" runat="server" Height="31px" Width="134px"  ></asp:TextBox>
                        <asp:Button ID="Button7" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" OnClick="Button7_Click" Text="Recherche par question" Height="31px" Width="215px" />
                    </div>

                    <div class="gridSpace"> <!--AutoGenerateDeleteButton="True" AutoGenerateEditButton="True"--> 
                        <asp:GridView ID="GridView1" 
                            onrowcommand="CustomersGridView_RowCommand" 
                            DataKeyNames="Id" 
                            PageSize="11"  
                            emptydatatext="No data available." 
                            runat="server" 
                            AutoGenerateColumns="False"
                            BackColor="#FF9900"
                            BorderColor="#FF3300" 
                            BorderStyle="Double" 
                            CellPadding="3" 
                            CellSpacing="3" 
                            DataSourceID="SqlDataSource1" 
                            ForeColor="Maroon" 
                            HorizontalAlign="Center" 
                            AutoGenerateDeleteButton="True" 
                            AutoGenerateEditButton="True" 
                            AllowPaging="True" 
                            AllowSorting="True" 
                            Width="654px" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            class="dataRes center"
                        >
                            
                            
                            
                            <Columns>
                                <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" />
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"  ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:ButtonField Text="Voir"  CommandName="Select" ItemStyle-Width="30" />
                            </Columns>
                            <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="10"/>

        <pagerstyle backcolor="LightBlue"
          height="30px"
          verticalalign="Bottom"
          horizontalalign="Center"/>
                        </asp:GridView>
                        
    
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id],[question] FROM [poll] order by question" DeleteCommand="delete from poll where Id = @Id" UpdateCommand="Update poll SET question = @question WHERE Id = @Id"></asp:SqlDataSource>
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
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>-->
                </p>
                <!--</asp:Panel>-->
    </form>
</body>
</html>
