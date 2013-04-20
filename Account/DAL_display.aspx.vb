
Partial Class DAL_display
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim stockAdapter As New DataSet1TableAdapters.StockTableAdapter
        GridView1.DataSource = stockAdapter.GetStock()
        GridView1.DataBind()

    End Sub
End Class



