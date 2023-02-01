Imports System.Data.SqlClient

Public Class WebForm1
    Inherits System.Web.UI.Page

    Dim PretComanda As Double
    Dim ProduseAdaugate As New Dictionary(Of String, Double)
    Dim AgentClient As Integer
    Protected Sub btn_Profil_Click(sender As Object, e As EventArgs) Handles btn_Profil.Click

    End Sub

    Protected Sub sqlDS_Produse_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        PretComanda = Double.Parse(valoareComanda.Text) + Double.Parse(GridView1.SelectedRow.Cells(5).Text)
        If Session.Item("ProduseAdaugate") IsNot Nothing Then
            ProduseAdaugate = Session.Item("ProduseAdaugate")
        End If

        If ProduseAdaugate.ContainsKey(GridView1.SelectedRow.Cells(2).Text) Then
            ProduseAdaugate(GridView1.SelectedRow.Cells(2).Text) = ProduseAdaugate(GridView1.SelectedRow.Cells(2).Text) * 2
        Else
            ProduseAdaugate.Add(GridView1.SelectedRow.Cells(2).Text, Double.Parse(GridView1.SelectedRow.Cells(5).Text))
        End If
        Session.Item("ProduseAdaugate") = ProduseAdaugate
        valoareComanda.Text = PretComanda.ToString
        'CosProduse.Text = ProduseAdaugate.ToString
    End Sub

    Protected Sub btn_Adauga_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btn_Sumar_Click(sender As Object, e As EventArgs) Handles btn_Sumar.Click
        Dim sumarComdanda As String = ""
        ProduseAdaugate = Session.Item("ProduseAdaugate")
        For Each s In ProduseAdaugate
            sumarComdanda += s.Key + " in valoare de&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + s.Value.ToString + "<br />"
        Next
        Session.Add("sumar", ProduseAdaugate)
        Response.Redirect("EcranComandaEfectuata.aspx?Parameter=" + valoareComanda.Text)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("EcranLogin.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString.Count > 0 Then
            AgentClient = Integer.Parse(Request.QueryString.Get(0).ToString())
            If AgentClient = 1 Then
                DetailsView1.Enabled = True
            End If
        End If
    End Sub
End Class