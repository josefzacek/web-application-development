<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.XML" %>


<script runat="server">
    Protected Sub Page_Load(sender As Object, e As System.EventArgs)
        Dim fs
        fs = Server.CreateObject("Scripting.FileSystemObject")

        If (fs.FileExists("c:\josef_net_project\Account\current_stock.xml")) = True Then
         
            If Not Page.IsPostBack Then
                Dim mycountries = New DataSet
                mycountries.ReadXml(MapPath("current_stock.xml"))
                GridView1.DataSource = mycountries
                GridView1.DataBind()
            End If
         
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
        <strong>Not woking</strong></p>
    <p class="style2">
        Clicking on delete link cause redirect to default error page</p>
</div>

 <div style="float:right; width: 80%;">
<h2>Delete XML content page</h2>

<h1><asp:label id="lbl1" runat="server" /></h1>

<asp:GridView ID="GridView1" runat="server" width="100%" >
<Columns>
      <asp:CommandField ShowDeleteButton="True" />
</Columns>
</asp:GridView>

</div>
</asp:Content>

