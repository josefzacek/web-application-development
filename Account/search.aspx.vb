Imports System.Data.OleDb
Partial Class search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function SearchCustomers(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As OleDbConnection = New OleDbConnection
        conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=|DataDirectory|josef_db.mdb;"
        Dim cmd As OleDbCommand = New OleDbCommand
        cmd.CommandText = "select Description from Stock where" & _
        " Description like @SearchText + '%'"
        cmd.Parameters.AddWithValue("@SearchText", prefixText)
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As OleDbDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("Description").ToString)
        End While
        conn.Close()
        Return customers
    End Function

End Class
