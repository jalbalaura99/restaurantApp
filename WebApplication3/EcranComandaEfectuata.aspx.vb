Public Class EcranComandaEfectuata
    Inherits System.Web.UI.Page

    Dim ProduseCumparate As String
    Dim Pret As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = "Valoarea totala: " + Request.QueryString.Get(0).ToString

        Dim sumar As New Dictionary(Of String, Double)
        sumar = Session("sumar")
        For Each s In sumar
            Dim denumire As New TableCell
            denumire.Text = s.Key
            Dim pretTotal As New TableCell
            pretTotal.Text = s.Value
            Dim row As New TableRow

            row.Cells.Add(denumire)
            row.Cells.Add(pretTotal)
            Table1.Rows.Add(row)
        Next
    End Sub

End Class