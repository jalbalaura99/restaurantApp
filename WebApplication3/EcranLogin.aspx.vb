Imports System.Data.SqlClient

Public Class EcranLogin
    Inherits System.Web.UI.Page

    Protected Sub btn_Inregistrare_Click(sender As Object, e As EventArgs) Handles btn_Inregistrare.Click
        Response.Redirect("EcranInregistrare.aspx")
    End Sub

    Protected Sub btn_Trimite_Click(sender As Object, e As EventArgs) Handles btn_Trimite.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=.;Initial Catalog=master;Integrated Security=True"
        cn.Open()
        Dim cmd As New SqlCommand
        cmd.Connection = cn
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "Select * from Utilizatori"
        Dim adp As New SqlDataAdapter
        adp.SelectCommand = cmd
        Dim dtUtilizatori As New DataTable
        adp.Fill(dtUtilizatori)

        Dim gasit As Boolean
        For Each row In dtUtilizatori.Rows
            If row("NumeUtilizator").ToString = tb_Email.Text Then
                If row("Parola").ToString = Request("tb_Parola").ToString Then
                    Dim AgentSauClient As Integer
                    Dim selectInAgenti As New SqlCommand("Select * from Agenti where IdUtilizator='" & row("IdUtilizator").ToString & "'", cn)

                    If selectInAgenti.ExecuteScalar > 0 Then
                        AgentSauClient = 1
                        MsgBox("Autentificare incheiata cu succes pentru agent!")
                    Else
                        AgentSauClient = 2
                        MsgBox("Autentificare incheiata cu succes pentru client!")
                    End If

                    Server.Transfer("EcranPrincipal.aspx?Parameter=" + AgentSauClient.ToString)
                    Exit For
                Else
                    MsgBox("The password is incorrect!")
                End If
            End If
        Next

    End Sub
End Class