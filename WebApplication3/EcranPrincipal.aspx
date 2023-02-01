<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EcranPrincipal.aspx.vb" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Online</title>
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
        .auto-style1 {
            margin-left: 0px;
        }
        .auto-style2 {
            margin-left: 80%;
        }
        .auto-style3 {
            margin-left: 11px;
        }
    </style>
</head>
<body style="height: 642px">
    <form id="form1" runat="server">
        <br />
        <h1 id="titlu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aplicatie Simulator Pret<asp:Button ID="btn_Profil" runat="server" Text="Info Profil" Width="84px" CssClass="auto-style2" />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style3" Text="Schimba contul" />
        </h1>
        <br/>
        <h2 class="auto-style2">Pret: <asp:Label ID="valoareComanda" runat="server" Text="Label">0</asp:Label> RON<br />
            <asp:Label ID="CosProduse" runat="server" Text="" Visible="false"></asp:Label>
        </h2>
        
        <center>
            <div>
                <br />
                Selectati o categorie de produse:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddl_CategorieProduse" runat="server" DataSourceID="sqlDS_Categorie" Height="16px" Width="209px" AutoPostBack="True" DataTextField="DenumireCategorie" DataValueField="CodCategorie">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlDS_Categorie" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT * FROM [CategoriiMarfuri]"></asp:SqlDataSource>
                <br />
                <br />
                Lista produse din categoria selectata:<br />
                <asp:SqlDataSource ID="sqlDS_Produse" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [IdMarfa], [DenumireMarfa], [Cantitate_per_unitate_masura], [Descriere], [PretMinVanzare], [Imagine] FROM [Marfuri] WHERE ([CodCategorie] = @CodCategorie)" DeleteCommand="DELETE FROM [Marfuri] WHERE [IdMarfa] = @IdMarfa" InsertCommand="INSERT INTO [Marfuri] ([DenumireMarfa], [Cantitate_per_unitate_masura], [Descriere], [PretMinVanzare], [Imagine]) VALUES (@DenumireMarfa, @Cantitate_per_unitate_masura, @Descriere, @PretMinVanzare, @Imagine)" UpdateCommand="UPDATE [Marfuri] SET [DenumireMarfa] = @DenumireMarfa, [Cantitate_per_unitate_masura] = @Cantitate_per_unitate_masura, [Descriere] = @Descriere, [PretMinVanzare] = @PretMinVanzare, [Imagine] = @Imagine WHERE [IdMarfa] = @IdMarfa">
                    <DeleteParameters>
                        <asp:Parameter Name="IdMarfa" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DenumireMarfa" Type="String" />
                        <asp:Parameter Name="Cantitate_per_unitate_masura" Type="String" />
                        <asp:Parameter Name="Descriere" Type="String" />
                        <asp:Parameter Name="PretMinVanzare" Type="Decimal" />
                        <asp:Parameter Name="Imagine" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_CategorieProduse" Name="CodCategorie" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DenumireMarfa" Type="String" />
                        <asp:Parameter Name="Cantitate_per_unitate_masura" Type="String" />
                        <asp:Parameter Name="Descriere" Type="String" />
                        <asp:Parameter Name="PretMinVanzare" Type="Decimal" />
                        <asp:Parameter Name="Imagine" Type="String" />
                        <asp:Parameter Name="IdMarfa" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="sqlDS_Produse" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IdMarfa" PageSize="5">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="IdMarfa" HeaderText="IdMarfa" InsertVisible="False" ReadOnly="True" SortExpression="IdMarfa" Visible="False" />
                    <asp:BoundField DataField="DenumireMarfa" HeaderText="DenumireMarfa" SortExpression="DenumireMarfa" />
                    <asp:BoundField DataField="Cantitate_per_unitate_masura" HeaderText="Cantitate_per_unitate_masura" SortExpression="Cantitate_per_unitate_masura" />
                    <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                    <asp:BoundField DataField="PretMinVanzare" HeaderText="PretMinVanzare" SortExpression="PretMinVanzare" />
                    <asp:BoundField DataField="Imagine" HeaderText="Imagine" SortExpression="Imagine" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerSettings FirstPageText="Prima Pagina" LastPageText="Ultima Pagina" Mode="NumericFirstLast" NextPageText="Pagina Urmatoare" Position="TopAndBottom" PreviousPageText="Pagina Anterioara" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />
            <asp:Button ID="btn_Sumar" runat="server" Text="Afiseaza Sumar Comanda" OnClientClick="btn_Sumar_Click" BorderStyle="Double" CssClass="auto-style1" />
            <br />
            <br />
            <div id="AdaugaProduse" visible="false">
                <br />
                <br />
                Adauga Produs in lista de produse aferenta categoriei alese:<br />
                <br />
                <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="sqlDS_Produse" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="IdMarfa" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DefaultMode="Insert" ForeColor="Black" GridLines="None" Enabled="False">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <Fields>
                        <asp:BoundField DataField="IdMarfa" HeaderText="IdMarfa" InsertVisible="False" ReadOnly="True" SortExpression="IdMarfa" />
                        <asp:BoundField DataField="DenumireMarfa" HeaderText="DenumireMarfa" SortExpression="DenumireMarfa" />
                        <asp:BoundField DataField="Cantitate_per_unitate_masura" HeaderText="Cantitate_per_unitate_masura" SortExpression="Cantitate_per_unitate_masura" />
                        <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                        <asp:BoundField DataField="PretMinVanzare" HeaderText="PretMinVanzare" SortExpression="PretMinVanzare" />
                        <asp:BoundField DataField="Imagine" HeaderText="Imagine" SortExpression="Imagine" />
                        <asp:CommandField CancelText="Anulare" InsertText="Adauga" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                </asp:DetailsView>
            </div>
                </div>
        </center>
    </form>
</body>
</html>
