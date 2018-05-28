<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resultat.aspx.cs" Inherits="Esondage2018.View.Resultat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 429px;
        }
        .auto-style3 {
            width: 483px;
        }
        .auto-style4 {
            width: 429px;
            height: 37px;
        }
        table tr,td, table td * {
    vertical-align: top;
            }
        .auto-style5 {
            width: 292px;
        }
    </style>

</head>
<body background="images/bdsky.jpg">
    <form id="form1" runat="server">
    <div>
    <table align="right" ID="Table1" runat="server">
                    <tr><td class="auto-style9">
                                <asp:Button ID="Button4" runat="server" BorderColor="#FF9933" BackColor="#660033" CausesValidation="false" UseSubmitBehavior="false" ForeColor="#FF9933" Height="51px" Text="S'inscrire" Width="330px" Font-Bold="True" Font-Italic="True" Font-Size="Large"  OnClick="Button4_Click" />
                            </td><td class="auto-style10">
                            <asp:Button ID="Button5" runat="server" BorderColor="#FF9933" BackColor="#660033" CausesValidation="false" UseSubmitBehavior="false" ForeColor="#FF9933" Height="51px" Text="S'authentifier" Width="330px" style="margin-top: 0px; margin-bottom: 0px" Font-Bold="True" Font-Italic="True" Font-Size="Large" OnClick="Button5_Click" />
                        </td></tr>
                </table>
        <asp:Label ID="Label25" runat="server" ForeColor="#FFCC00" Text="Bonjour " style="text-align:left"></asp:Label>
                <asp:Label ID="Label26" runat="server" ForeColor="#FFCC00" style="text-align:left"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Red" OnClick="LinkButton2_Click">(Déconnexion)</asp:LinkButton>
        
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">

        </asp:ScriptManager>
        <br />

        
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
        </asp:Timer>

        
        <br />
        <center><asp:Panel ID="Panel2" runat="server" BackImageUrl="images/SONDAGE.png" Height="121px" Width="1094px">
                </asp:Panel></center>

    </div>
    <table style="width:116%;">
        <tr>
            <td class="auto-style3">
                <table style="margin-top: 0px">
                     <tr>
                            <td class="auto-style4">

                                <asp:Label ID="Label1" runat="server"  ForeColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ></asp:Label>
                                <asp:Label ID="Label2" runat="server"  ForeColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ></asp:Label>

                                <br />

                                <br /><br />
                                <table><tr><td><asp:Label ID="Label27" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label>

                                           </td>
                                    <td class="auto-style5"><asp:Label ID="Label28" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"/></td></tr>

                                
                                    <tr>
                                        <td><asp:Label ID="Label4" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label5" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label6" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label7" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label8" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label9" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label10" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label11" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label12" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label13" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label14" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label15" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label16" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label17" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label18" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label19" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label20" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                        <td class="auto-style5"><asp:Label ID="Label21" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label22" runat="server"   ForeColor="#660033" Font-Italic="True" Font-Size="X-Large"></asp:Label>
                                            <br />
                                            <asp:Button ID="Button2"   BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" runat="server" Text="Partager" OnClick="Button2_Click" />
                                        </td>
                                        <td class="auto-style5"><asp:Label ID="Label23" runat="server"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="TextBox2" runat="server" Width="322px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                     </tr>
                    <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label3" runat="server"  ForeColor="#FF9933" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text="Ecrire un commentaire : "></asp:Label>

                                <br />
                                <br />

                                <asp:TextBox ID="TextBox1" runat="server" Height="47px" Width="427px"></asp:TextBox>
                                <br />
                                <br />

                               <center> <asp:Button ID="Button1" runat="server"   BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  BorderStyle="Double" Height="41px" Text="Envoyer" Width="235px" OnClick="Button1_Click" /></center>

                                <br />
                                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" ForeColor="#FF9933"></asp:Label>
                                <br />
                                <br />
                                <br />

                            </td>
                     </tr>

                </table>
            </td>
            <td>
               <asp:Button ID="btn" runat="server"   BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  BorderStyle="Double" Height="41px" Text="Voir le graphe" Width="235px" OnClick="btn_Click" /> <asp:Panel ID="panel1" runat="server"><iframe src="piechart/pie<%=kloo%>.html" style="height: 877px; width: 703px; margin-right: 0px; margin-top: 0px" frameBorder="0"></iframe> </asp:Panel>
            </td>
        </tr>
       
    </table>
    </form>
    </body>
</html>
