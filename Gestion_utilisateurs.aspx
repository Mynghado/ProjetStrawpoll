<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion_utilisateurs.aspx.cs" Inherits="Esondage2018.View.Gestion_utilisateurs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
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
<body  background="images/bdsky.jpg">
    <form id="form2" runat="server">
    
        <asp:Panel ID="Panel1" runat="server" DefaultButton="" BackImageUrl="images/bdsky.jpg">
        <center>
            <p>
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
                <p>
                    <asp:TextBox ID="TextBox4" runat="server" Height="31px" Width="134px"  ></asp:TextBox>
                    <asp:Button ID="Button7" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" OnClick="Button7_Click" Text="Recherche par nom" Height="36px" Width="134px" />
                    <div>
                        
                        <asp:GridView ID="GridView1" DataKeyNames="Id" PageSize="3" emptydatatext="No data available." runat="server" AutoGenerateColumns="False"  BorderColor="#FF3300" BorderStyle="Double" CellPadding="3" CellSpacing="3" DataSourceID="SqlDataSource1" ForeColor="Maroon" HorizontalAlign="Center" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AllowPaging="True" AllowSorting="True" CssClass="cssgridview">
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
                </p>
            </center>
                </asp:Panel>
    </form>
</body>
</html>

