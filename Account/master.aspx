<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="master.aspx.vb" Inherits="master" %>

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
        Master page contain detail of customers and oreders related to each customer.</p>
    <p class="style2">
        Customer details can be sorted by <strong>CustomerID</strong>, <strong>Firstname</strong>,
        <strong>Lastname</strong>, <strong>City</strong>, <strong>Email</strong>, <strong>Telephone</strong> </p>
    <p class="style2">
        Clicking on select link beside each customer will show relevant order detail to 
        selected customer. 
    </p>
    <p class="style2">
       If customer did not place an order the area bellow remains blank.</p>
</div>

 <div style="float:right; width: 80%;">
    <h2>
        Master page</h2>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/josef_db.mdb" 
        SelectCommand="SELECT * FROM [Customers] ORDER BY [CustomerID]">
        </asp:AccessDataSource>
        <h3>Customers details</h3>
        <asp:GridView ID="customers_view" runat="server" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="CustomerID" DataSourceID="AccessDataSource1" 
            ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
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
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#009b48" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#009b48" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <PagerStyle BackColor="#009b48" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
    <hr />
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/josef_db.mdb" 
        SelectCommand="SELECT [OrderID], [CustomerID], [Item], [Cost] FROM [Orders] WHERE ([CustomerID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="customers_view" Name="CustomerID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>

    <h3>Orders details</h3>

    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="OrderID" DataSourceID="AccessDataSource2" 
        ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                SortExpression="OrderID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                SortExpression="CustomerID" />
            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#009b48" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#009b48" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />

    </div>
</asp:Content>

