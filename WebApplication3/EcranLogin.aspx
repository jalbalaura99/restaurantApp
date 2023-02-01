<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EcranLogin.aspx.vb" Inherits="WebApplication3.EcranLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autentificare</title>
    <style type="text/css">
        #titlu {
            font-family:'Times New Roman';
            font-style: italic;
            font-weight: bold;
        }
        body {
            background-color:pink;
            background-image: url("blurred-busy-restaurant-background-free-photo.jfif");
            background-size: 100%;
            color: papayawhip;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h1 id="titlu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Autentificare</h1>
        <center>
            <asp:Label ID="lb_Email" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="tb_Email" runat="server" style="margin-left: 25px"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Parola" runat="server" Text="Parola"></asp:Label>
            <input id="tb_Parola" runat="server" type="password" style="margin-left: 50px"></input>
            <br /><br />
            <asp:Button ID="btn_Trimite" runat="server" Text="Autentificare" BorderStyle="Groove" />
            <br /><br />
            <asp:Button ID="btn_Inregistrare" runat="server" BorderStyle="Dashed" Text="Inregistrare" />

        </center>
    </form>
</body>
</html>
