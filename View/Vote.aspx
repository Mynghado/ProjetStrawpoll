<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="Esondage2018.View.Vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body background="images/bdsky.jpg" >
    <center>
        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">LinkButton</asp:LinkButton>
        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
        <asp:Panel ID="Panel2" runat="server" BackImageUrl="images/bdsky.jpg" Width="288px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Question : "></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
    
        <asp:CheckBoxList id="checkboxlist1" runat="server" Font-Italic="True"> 
         <asp:ListItem></asp:ListItem>
         <asp:ListItem></asp:ListItem>  
         <asp:ListItem></asp:ListItem>     
         <asp:ListItem></asp:ListItem>
         <asp:ListItem></asp:ListItem>  
         <asp:ListItem></asp:ListItem>
            <asp:ListItem></asp:ListItem>
         <asp:ListItem></asp:ListItem>  
         <asp:ListItem></asp:ListItem>
          <asp:ListItem></asp:ListItem>       
</asp:CheckBoxList>


        <br />
        <asp:Button ID="Button1" runat="server"  BorderColor="#FF9933" BackColor="#660033" ForeColor="#FF9933"  Width="163px" Height="37px" Text="Voter" OnClick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" BackColor="#660033" BorderColor="#FF9933" Width="163px" Height="37px" ForeColor="#FF9933" OnClick="Button2_Click" Text="Partager" />
        <asp:TextBox ID="TextBox2" runat="server" Width="322px"></asp:TextBox>
        <br />
        <asp:Button ID="Button4" runat="server" Text="Button" />
        <asp:Button ID="Button5" runat="server" Text="Button" />
        <br />
        <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="Label"></asp:Label>
    </div>

        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem Text="a" Value="a"></asp:ListItem>
        <asp:ListItem Text="b" Value="b"></asp:ListItem>
        <asp:ListItem Text="c" Value="c"></asp:ListItem>
        <asp:ListItem Text="d" Value="d"></asp:ListItem>
        <asp:ListItem Text="e" Value="e"></asp:ListItem>
        <asp:ListItem Text="f" Value="f"></asp:ListItem>
        <asp:ListItem Text="g" Value="g"></asp:ListItem>
        <asp:ListItem Text="h" Value="h"></asp:ListItem>
        <asp:ListItem Text="i" Value="i"></asp:ListItem>
        <asp:ListItem Text="j" Value="j"></asp:ListItem>
    </asp:RadioButtonList>
        
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    </form>
        </asp:Panel>
    </center>
</body>
</html>
