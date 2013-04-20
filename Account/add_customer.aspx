<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="add_customer.aspx.vb" Inherits="add_customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class='aside' 
        style="border: thin dotted #C0C0C0; padding: 0px 10px 10px 10px; width: 16%; height:auto; float: left">
    <h2 class="style2">
        Instructions
    </h2>
    <p class="style2">
        This page allow you to<strong> add new customer</strong> details and store them in database</p>
    <p class="style2">
        When adding new customer, <strong>CustomerID must be unique </strong> </p>
</div>

 <div style="float:right; width: 80%;">

    <h2>
    Add customer</h2>
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/App_Data/josef_db.mdb" 
            DeleteCommand="DELETE FROM [Customers] WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL)) AND (([Firstname] = ?) OR ([Firstname] IS NULL AND ? IS NULL)) AND (([Surname] = ?) OR ([Surname] IS NULL AND ? IS NULL)) AND (([City] = ?) OR ([City] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Telephone] = ?) OR ([Telephone] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Customers] ORDER BY [CustomerID] DESC" 
            
            
            UpdateCommand="UPDATE [Customers] SET [Firstname] = ?, [Surname] = ?, [City] = ?, [Email] = ?, [Telephone] = ? WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL)) AND (([Firstname] = ?) OR ([Firstname] IS NULL AND ? IS NULL)) AND (([Surname] = ?) OR ([Surname] IS NULL AND ? IS NULL)) AND (([City] = ?) OR ([City] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Telephone] = ?) OR ([Telephone] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="CustomerID" 
            DataSourceID="AccessDataSource1" Height="50px" Width="100%">
            <FieldHeaderStyle Font-Bold="True" ForeColor="#0000CC" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                    SortExpression="Telephone" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>

    </div>
</asp:Content>

