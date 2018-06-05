<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Esondage2018.View.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-sondage 2018</title>
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
<body>
    <form id="form1" runat="server">
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
                <a href="http://google.com" title="Profile"><img class="rslogo" alt="google.com" src="../Picture/user.png"/></a>
                <a href="http://facebook.com" title="Like our Facebook page"><img class="rslogo" alt="facebook.com" src="../Picture/facebook_logo.png"/></a>
                <a href="http://twitter.com" title="Follow us on Twitter"><img class="rslogo" alt="twitter.com" src="../Picture/twitter_logo.png"/></a>
            </div>
        </header>


        <!--<asp:Panel ID="Panel1" runat="server" DefaultButton="" BackImageUrl="images/bdsky.jpg">
        <center>
            <p>
                <table align="right" ID="Table1" runat="server">
                    <tr><td class="auto-style9">
                                <asp:Button ID="Button4" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="S'inscrire" Width="330px" CausesValidation="false" UseSubmitBehavior="false" Font-Bold="True" Font-Italic="True" Font-Size="Large" OnClick="Button4_Click1" />
                            </td><td class="auto-style10">
                            <asp:Button ID="Button5" runat="server" BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933" Height="51px" Text="S'authentifier" Width="330px" CausesValidation="false" UseSubmitBehavior="false" style="margin-top: 0px; margin-bottom: 0px" Font-Bold="True" Font-Italic="True" Font-Size="Large" OnClick="Button5_Click" />
                        </td></tr>
                </table>
        </center>
                <asp:Label ID="Label14" runat="server" ForeColor="#FFCC00" Text="Bonjour " style="text-align:left"></asp:Label>
                <asp:Label ID="Label15" runat="server" ForeColor="#FFCC00" style="text-align:left"></asp:Label>
                <br />
            </p>
            <p>
                &nbsp;</p>
            <center>
            <asp:Panel ID="Panel2" runat="server" BackImageUrl="images/SONDAGE.png" Height="121px" Width="1094px">
                <br />
                <br />
            </asp:Panel>-->
        <section id="scAddSurvey">
            <div id="csQues" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
                <asp:TextBox ID="TextBox1" runat="server" class="quesInd genInd txtPosInd input100" placeholder="Type the question here"></asp:TextBox>
            </div>
            
            <div id="csAns1" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox2" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns2" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox3" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
                <!--<i class="fa fa-plus"></i>-->
            </div>

            <div id="csAns3" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox4" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns4" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox5" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns5" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox6" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns6" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox7" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns7" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox8" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns8" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox9" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns9" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox10" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>

            <div id="csAns10" runat="server" class="posInd wrap-input100 validate-input m-b-23" data-validate ="Ce champ est obligatoire">
                <asp:TextBox ID="TextBox11" runat="server" class="repInd genInd txtPosInd input100" placeholder="Enter a poll answer"></asp:TextBox>
            </div>


            <div id="addWrapInd" class="wrap-login100-form-btn">
			    <div class="login100-form-bgbtn"></div>
				<button id="btAddInd" runat="server" class="login100-form-btn" onserverclick="LinkButton1_Click">New answer</button>
            </div>
            <!--<p>
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FF9933" OnClick="LinkButton1_Click" Font-Bold="True" Font-Italic="True" Font-Size="X-Large">Ajouter un choix</asp:LinkButton>
            </p>-->

            <article id="artParamInd">
                <div class="divDdlInd">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="ddlInd" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>IP duplication</asp:ListItem>
                        <asp:ListItem>Ip not duplication</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="DropDownList2" runat="server" class="ddlInd">
                        <asp:ListItem>Choix multiple</asp:ListItem>
                        <asp:ListItem>Un seul choix</asp:ListItem>
                    </asp:DropDownList>
                </div>
            
                <!--<asp:Button ID="Button1" runat="server"  BorderColor="#FF9933" ValidationGroup="Group1" BackColor="#660033" ForeColor="#FF9933"  Width="181px" Height="85px" OnClick="Button1_Click" TabIndex="1" Text="Créer un sondage" Font-Bold="True" Font-Italic="True" Font-Size="Large"/>
                
               
                </p>
                <br/>
                </asp:Panel>-->
                <asp:Label ID="Label13" runat="server" ForeColor="#6600CC"></asp:Label>


                <!--<div id="admin" class="cadre">
                    <asp:CheckBox ID="CheckBox1" class="chk" runat="server"/>
                    <span class="chk ugsp">Admin</span>
                </div>-->


                <div id="createWrapInd" class="wrap-login100-form-btn">
			        <div class="login100-form-bgbtn"></div>
				    <button id="btCreateInd" runat="server" class="login100-form-btn" onserverclick="Button1_Click">Create</button>
                </div>
            </article>
        </section>
    </form>
</body>
</html>
