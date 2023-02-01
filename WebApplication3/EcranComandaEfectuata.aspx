<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EcranComandaEfectuata.aspx.vb" Inherits="WebApplication3.EcranComandaEfectuata" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sumar Comanda</title>
    <style type="text/css">
        #titlu {
            font-family:'Times New Roman';
            font-style: italic;
            font-weight: bold;
        }
        body {
            font-size: 130%;
            background-color:pink;
            background-image: url("blurred-busy-restaurant-background-free-photo.jfif");
            background-size: 100%;
            color: papayawhip;
            font-weight: bold;
        }
        #Label1, #Button1 {
            margin-left: 80%;
        }
        table {
          width: 60%;
          border-collapse: collapse;
          font-size: 0.9em;
          margin: 25px 0;
          min-width: 400px;
          padding: 12px 15px;
        }
    </style>
</head>
<body style="height: 553px">
    <form id="form1" runat="server">
        <br />
        <h1 id="titlu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sumar Comanda</h1>
        <br/>
        <div>
        </div>
        <center>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableHeaderCell BackColor="#CC6600" ForeColor="#FFFFCC">Produs</asp:TableHeaderCell>
                    <asp:TableHeaderCell BackColor="#CC6600" ForeColor="#FFFFCC">Pret Total Produse</asp:TableHeaderCell>
                </asp:TableRow>
            </asp:Table>
        </center>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
        <asp:LinkButton ID="Button1" runat="server" Text="Pagina Principala" href="EcranPrincipal.aspx"/>
    </form>
</body>
</html>
