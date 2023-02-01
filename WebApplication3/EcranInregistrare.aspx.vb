Imports System.Data.SqlClient

Public Class EcranAdaugareInBaza
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_Inregistrare_Click(sender As Object, e As EventArgs) Handles btn_Inregistrare.Click
        Dim cn As New SqlConnection
        cn.ConnectionString = "Data Source=.;Initial Catalog=master;Integrated Security=True"
        cn.Open()
        Dim cmd As New SqlCommand
        cmd.Connection = cn
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "Select * from Utilizatori"
        Dim adp As New SqlDataAdapter
        adp.SelectCommand = cmd
        Dim dtVanzatori As New DataTable
        adp.Fill(dtVanzatori)

        Dim gasit As Boolean

        For Each row In dtVanzatori.Rows
            If row("NumeUtilizator").ToString = tb_Email.Text Then
                gasit = True
            End If
        Next

        If gasit = False Then
            Dim insertUtilizatorCommand As New SqlCommand("Insert into Utilizatori (NumeUtilizator, Parola, Blocat, DataCrearii) values ('" & tb_Email.Text & "', '" & Request("tb_Parola").ToString & "', 0, GETDATE())", cn)

            insertUtilizatorCommand.ExecuteNonQuery()

            Dim SelectUtilizatorIdCommand As New SqlCommand("Select IdUtilizator From Utilizatori where NumeUtilizator='" & tb_Email.Text & "'", cn)
            Dim idUtilizator As Integer = SelectUtilizatorIdCommand.ExecuteScalar

            Dim insertCommand As New SqlCommand("Insert into Clienti (Nume, Prenume, Telefon, email, Adresa, Localitate, IdUtilizator) values ('" & tb_Nume.Text & "', '" & tb_Prenume.Text & "',
                                                                    '" & tb_Telefon.Text & "', '" & tb_Email.Text & "', '" & tb_Adresa.Text & "', '" & ddl_Localitate.SelectedValue & "', '" & idUtilizator.ToString & "')", cn)

            If (tb_Nume.Text = "" Or tb_Prenume.Text = "" Or tb_Telefon.Text = "" Or tb_Email.Text = "" Or tb_Adresa.Text = "" Or Request("tb_Parola").ToString = "") Then
                MsgBox("Introduceti valori in casute!")
            Else
                insertCommand.ExecuteNonQuery()
                cn.Close()
                MsgBox("V-ati inregistrat cu succes!", MsgBoxStyle.Information, "Succes")
                Server.Transfer("EcranLogin.aspx")
            End If
        Else
            MsgBox("Acest email exista deja in baza noastra de date!")
        End If


    End Sub

    Protected Sub tb_Nume_TextChanged(sender As Object, e As EventArgs) Handles tb_Nume.TextChanged

    End Sub
End Class