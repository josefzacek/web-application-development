<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    Private i, j As Integer
    Private strOutput As String = ""
    Public xmldoc As New XmlDataDocument()
   
    Sub Page_Load(Sender As Object, e As EventArgs)
        If Not Page.IsPostBack Then
            GetData()
            BindControl()
        End If
    End Sub
   
    Sub UpdateBtn_Click(Sender As Object, e As EventArgs)
        Dim StockID As TextBox
        Dim Description As TextBox
        Dim Stock_level As TextBox
        Dim Price As TextBox


        GetData()
        'update data
        For i = 0 To DataGrid1.Items.Count - 1
            StockID = DataGrid1.Items(i).FindControl("StockID")
            Description = DataGrid1.Items(i).FindControl("Description")
            Stock_level = DataGrid1.Items(i).FindControl("Stock_level")
            Price = DataGrid1.Items(i).FindControl("Price")
      
            xmldoc.DataSet.Tables(0).Rows(i)("stockid") = StockID.Text
            xmldoc.DataSet.Tables(0).Rows(i)("description") = Description.Text
            xmldoc.DataSet.Tables(0).Rows(i)("stock_level") = Stock_level.Text
            xmldoc.DataSet.Tables(0).Rows(i)("price") = Price.Text
        Next
      
        Try
            xmldoc.Save(Server.MapPath("current_stock.xml"))
        Catch
            output.Text = "Error updating data"
        End Try
      
        BindControl()
    End Sub
   
    Sub GetData()
        Try
            xmldoc.DataSet.ReadXml(Server.MapPath("current_stock.xml"))
        Catch ex As Exception
            output.Text = "current_stock.xml file does not exist"
        End Try
    End Sub
   
    
    
    
    Sub BindControl()
        
        Dim fs
        fs = Server.CreateObject("Scripting.FileSystemObject")

        If (fs.FileExists("c:\josef_net_project\Account\current_stock.xml")) = True Then
            DataGrid1.DataSource = xmldoc.DataSet
            DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
            DataGrid1.DataBind()
        
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
        This page allows you to update records in <strong>current_stock.xml</strong> 
        file. </p>
    <p class="style2">
        After updating records please <strong>click update button</strong> in top right 
        corner to record chnges made.</p>
</div>

 <div style="float:right; width: 80%;">
<h2>Edit XML content page</h2>
   <asp:Label id="output" runat="server" />

 
   <h1><asp:label id="lbl1" runat="server" /></h1>
   
   <div style="float:right">
   <asp:Button id="update" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update XML" />
  </div>



   <asp:DataGrid id="DataGrid1" runat="server" 
      GridLines="None" 
      HeaderStyle-BackColor="#cccc99"
      ItemStyle-BackColor="#ffffff"
      AlternatingItemStyle-Backcolor="#cccccc" 
      AutogenerateColumns="False" CellPadding="4" ForeColor="#333333" 
       Width="100%" >
<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
      <Columns>
         <asp:TemplateColumn HeaderText="Stock ID" >
            <ItemTemplate>
               <asp:TextBox id="StockID" runat="server" 
                  Text='<%# Container.DataItem("stockid") %>' />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Description">
            <ItemTemplate>
               <asp:TextBox id="Description" runat="server" 
                  Text='<%# Container.DataItem("description") %>' 
                  width="175px" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Price">
            <ItemTemplate>
               <asp:TextBox id="Price" runat="server" 
                  Text='<%# Container.DataItem("price") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Stock level">
            <ItemTemplate>
               <asp:TextBox id="Stock_level" runat="server" 
                  Text='<%# Container.DataItem("stock_level") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>
      </Columns>     
       <EditItemStyle BackColor="#2461BF" />
       <FooterStyle BackColor="#009b48" Font-Bold="True" ForeColor="White" />

<HeaderStyle BackColor="#009b48" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle BackColor="#EFF3FB"></ItemStyle>
       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
       <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
   </asp:DataGrid>

   </div>
</asp:Content>

