<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EcranInregistrare.aspx.vb" Inherits="WebApplication3.EcranAdaugareInBaza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inregistrare</title>
    <style type="text/css">
        #titlu {
            font-family:'Times New Roman';
            font-style: italic;s
            font-weight: bold;
        }
        body {
            background-color:pink;
            background-image: url("blurred-busy-restaurant-background-free-photo.jfif");
            background-size: 100%;
            color: papayawhip;
            font-weight: bold;
        }
        .auto-style1 {
            margin-left: 42px;
        }
        .auto-style2 {
            margin-left: 64px;
        }
        .auto-style3 {
            margin-left: 62px;
        }
        .auto-style4 {
            height: 403px;
            margin-top: 129px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h1 id="titlu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inregistrare</h1>
        <center class="auto-style4">
            <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label>
            <asp:TextBox ID="tb_Nume" runat="server" style="margin-left: 86px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_Nume" CssClass="Eroare" ErrorMessage="Numele este obligatoriu de completat!">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tb_Nume" CssClass="Eroare" ValidationExpression="[a-zA-Z]{3,}" ErrorMessage="Numele trebuie sa aiba cel putin 3 caractere!">!</asp:RegularExpressionValidator>
            <br />
            <br />
            Prenume<asp:TextBox ID="tb_Prenume" runat="server" CssClass="auto-style2"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_Prenume" CssClass="Eroare" ValidationExpression="[a-zA-Z]{3,}" ErrorMessage="Parola trebuie sa aiba cel putin 3 caractere!">!</asp:RegularExpressionValidator>
            <br />
            <br />
            Parola<input id="tb_Parola" runat="server" type="password" class="auto-style1"></input>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tb_Parola" CssClass="Eroare" ValidationExpression="[a-zA-Z0-9]{3,}" ErrorMessage="Parola trebuie sa aiba cel putin 3 caractere!">!</asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_Parola" CssClass="Eroare" ErrorMessage="Parola este obligatorie!">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Telefon<asp:TextBox ID="tb_Telefon" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_Telefon" CssClass="Eroare" ErrorMessage="Telefonul este obligatoriu de completat!">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Email<asp:TextBox ID="tb_Email" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_Email" CssClass="Eroare" ErrorMessage="Email-ul este obligatoriu de completat!">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Adresa<asp:TextBox ID="tb_Adresa" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_Adresa" CssClass="Eroare" ErrorMessage="Adresa este obligatorie!">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Localitate<asp:DropDownList ID="ddl_Localitate" runat="server" CssClass="auto-style3">
                <asp:ListItem>Buzau</asp:ListItem>
                <asp:ListItem>Bucuresti</asp:ListItem>
                <asp:ListItem>Craiova</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_Localitate" CssClass="Eroare" ErrorMessage="Localitatea este obligatorie!">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btn_Inregistrare" runat="server" Text="Inregistrare" />
            <br />
        </center>
    </form>
</body>
</html>
