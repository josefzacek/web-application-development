<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs)

        Dim strConnection As String
        Dim strSQL As String
        Dim objDataSet As New DataSet()
        Dim objConnection As OleDbConnection
        Dim objAdapter As OleDbDataAdapter

        ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
                        "Data Source=|DataDirectory|josef_db.mdb;"
        strSQL = "SELECT StockID, Description, Price, Stock_level FROM Stock;"

        ' open the connection and set the command
        objConnection = New OleDbConnection(strConnection)
        objAdapter = New OleDbDataAdapter(strSQL, objConnection)

        ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Stock")
        ' create an XML file called Employees and fill this with our data
        objDataSet.WriteXml(Server.MapPath("current_stock.xml"))
        ' add a link to our web page to the XML file created
        'Response.Write("<a href='display_XML.aspx'>View XML file</a>")
          
          
        lbl1.Text = "XML file has been created"
     
    End Sub
      
      
    Protected Sub Button2_Click(sender As Object, e As System.EventArgs)
        Dim file
        file = Server.CreateObject("Scripting.FileSystemObject")

        If (file.FileExists("c:\josef_net_project\Account\current_stock.xml")) = True Then
              
        
            Dim fs, f
            fs = Server.CreateObject("Scripting.FileSystemObject")
            f = fs.GetFile("C:\josef_net_project\Account\current_stock.xml")
            f.Delete()
            f = Nothing
            fs = Nothing
          
            lbl1.Text = "XML file has been deleted"
          
        Else
            
            lbl1.Text = "current_stock.xml file does not exist."
        End If
          
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class='aside' 
        style="border: thin dotted #C0C0C0; padding: 0px 10px 10px 10px; width: 16%; height:auto; float: left">
    <h2 class="style2">
        Instructions
    </h2>
    <p class="style2">
        Please click<strong> Create &quot;current_stock.xml&quot; file</strong> button to create 
        current_stock.xml file from stock table contained in database</p>
    <p class="style2">
        Please click<strong> Delete &quot;current_stock.xml&quot; file</strong> button to delete 
        current_stock.xml file from system</p>
</div>

 <div style="float:right; width: 80%;">
<h2>Create "current_stock.xml" file</h2>

<h1><asp:label id="lbl1" runat="server" /></h1>

    <asp:Button ID="Button1" 
            runat="server" onclick="Button1_Click" 
            Text="Create &quot;current_stock.xml&quot; file" />
      
       
    <br />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        Text="Delete &quot;current_stock.xml&quot; file" />
  </div>    
</asp:Content>

