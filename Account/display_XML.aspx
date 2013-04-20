<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    Sub Page_Load()
        Dim fs
        fs = Server.CreateObject("Scripting.FileSystemObject")

        If (fs.FileExists("c:\josef_net_project\account\current_stock.xml")) = True Then
                 
            If Not Page.IsPostBack Then
                Dim mycdcatalog = New DataSet
                mycdcatalog.ReadXml(MapPath("current_stock.xml"))
                cdcatalog.DataSource = mycdcatalog
                cdcatalog.DataBind()
            End If
        
        Else
            
            lbl1.Text = "current_stock.xml file does not exist."
        End If
        
        
    End Sub
    

    Protected Sub cdcatalog_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs)

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
        This page displays content stored in<strong> current_stock.xml</strong> file.</p>
    <p class="style2">
        If <strong>current_stock.xml</strong> file is not present, warning message will 
        appear.</p>
</div>

 <div style="float:right; width: 80%;">
<h2>Display XML content page</h2>
    

    <h1><asp:label id="lbl1" runat="server" /></h1>

    <asp:Repeater id="cdcatalog" runat="server" 
        onitemcommand="cdcatalog_ItemCommand">

    <HeaderTemplate>
    <table border="1" width="100%" style='border-collapse: collapse;'>
    <tr style='color:White;background-color:#009b48;font-weight:bold;'>
    <th>Stock ID</th>
    <th>Desctiption</th>
    <th>Price</th>
    <th>Stock level</th>

    </tr>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
    <td><%#Container.DataItem("STOCKID")%></td>
    <td><%#Container.DataItem("DESCRIPTION")%></td>
    <td><%#Container.DataItem("PRICE")%></td>
    <td><%#Container.DataItem("STOCK_LEVEL")%></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    </div>
</asp:Content>

