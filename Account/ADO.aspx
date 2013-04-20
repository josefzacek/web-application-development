<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>


<script runat="server">
    Sub Page_Load(sender As Object, e As EventArgs)
        'Create a connection string
        Dim connString As String
        connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=|DataDirectory|josef_db.mdb;"
    
        'Open a connection
        Dim objConnection As OleDbConnection
        objConnection = New OleDbConnection(connString)
        objConnection.Open()
    
        'Specify the SQL string
        Dim strSQL As String = "SELECT name, address, phone, email, website FROM Suppliers"
    
        'Create a command object
        Dim objCommand As OleDbCommand
        objCommand = New OleDbCommand(strSQL, objConnection)

        'Get a datareader
        Dim objDataReader As OleDbDataReader
        objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)

        'Do the DataBinding
        dgResults.DataSource = objDataReader
        dgResults.DataBind()
    
        'Close the datareader/db connection
        objDataReader.Close()
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
        ADO.net connection to suppliers table displaying relevand details.</p>
    <p class="style2">
        Table below allows <strong>adding</strong>, <strong>editing</strong> and <strong>
        deleting</strong> records in suppliers table.</p>
</div>

 <div style="float:right; width: 80%;">

<h2>ADO - connection to supliers table</h2>
    <asp:DataGrid id="dgResults" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" >
        <AlternatingItemStyle BackColor="White" />
        <EditItemStyle BackColor="#fff" />
        <FooterStyle BackColor="#009B48" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#009B48" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataGrid>

<h2>Modify supliers table</h2>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/App_Data/josef_db.mdb" 
            DeleteCommand="DELETE FROM [Suppliers] WHERE (([SupplierID] = ?))" 
            InsertCommand="INSERT INTO [Suppliers] ([supplierID], [Name], [Address],[Email], [Phone], [Website]) VALUES (?, ?, ?, ?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Suppliers] ORDER BY [SupplierID]" 
            UpdateCommand="UPDATE [Suppliers] SET [Name] = ?, [Address] = ?,  [Email] = ?, [Phone] = ?, [Website] = ? WHERE (([SupplierID] = ?))">

            <DeleteParameters>
                <asp:Parameter Name="original_SupplierID" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Website" Type="String" />
                <asp:Parameter Name="original_Website" Type="String" />
            </DeleteParameters>

            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" /> 
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
            </InsertParameters>

            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="original_SupplierID" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Website" Type="String" />
                <asp:Parameter Name="original_website" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>

        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="SupplierID" 
            DataSourceID="AccessDataSource1" Height="50px" Width="100%">
            <FieldHeaderStyle Font-Bold="True" ForeColor="#000000" />
            <Fields>
                <asp:BoundField DataField="SupplierID" HeaderText="SuplierID" ReadOnly="True" SortExpression="SupplierID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </div>
</asp:Content>

