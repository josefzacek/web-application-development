<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="stock.aspx.vb" Inherits="stock" %>

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
        This page connect to stock table and displays all data relevant to product.</p>
    <p class="style2">
        Data can be sorted by <strong>StockID</strong>, <strong>Description</strong>,
        <strong>Price</strong> and <strong>Stock Level</strong>.</p>
    <p class="style2">
        10 records are displayed at a time, for more records please click the paginate 
        link bellow</p>
    <p class="style2">
        To see details please click select llink on left hand side.</p>
    <p class="style2">
        When addding, editing records, <strong>all records must be present</strong>.</p>
    <p class="style2">
        <strong>Price</strong> value must be between <strong>500 and 5000</strong></p>
    <p class="style2">
        <strong>Stock level</strong> value must be between <strong>1 and 99</strong></p>
</div>

 <div style="float:right; width: 80%;">
    <h2>
    Stock page</h2>
    <h3>Stock details</h3>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/josef_db.mdb" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Stock] ORDER BY [StockID]">
    </asp:AccessDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StockID" 
        DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
        Width="100%" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" 
                SortExpression="StockID" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Stock_level" HeaderText="Stock_level" 
                SortExpression="Stock_level" />
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
        ConflictDetection="CompareAllValues" DataFile="~/App_Data/josef_db.mdb" 
        DeleteCommand="DELETE FROM [Stock] WHERE (([StockID] = ?))" 
        InsertCommand="INSERT INTO [Stock] ([StockID], [Description], [Price], [Stock_level]) VALUES (?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Stock] WHERE ([StockID] = ?)" 
        UpdateCommand="UPDATE [Stock] SET [Description] = ?, [Price] = ?, [Stock_level] = ? WHERE (([StockID] = ?))">
        <DeleteParameters>
            <asp:Parameter Name="original_StockID" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="String" />
            <asp:Parameter Name="original_Price" Type="String" />
            <asp:Parameter Name="original_Stock_level" Type="Int32" />
            <asp:Parameter Name="original_Stock_level" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StockID" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock_level" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="StockID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock_level" Type="Int32" />
            <asp:Parameter Name="original_StockID" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="String" />
            <asp:Parameter Name="original_Price" Type="String" />
            <asp:Parameter Name="original_Stock_level" Type="Int32" />
            <asp:Parameter Name="original_Stock_level" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="StockID" 
        DataSourceID="AccessDataSource2" Width="100%">
        <EditItemTemplate>
            StockID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="StockIDLabel1" runat="server" Font-Bold="True" 
                ForeColor="#0000CC" Text='<%# Eval("StockID") %>' />
            <br />
            Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' Width="200px" />
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="DescriptionTextBox" ErrorMessage="Required Field" 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                Width="200px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="PriceTextBox" ErrorMessage="Required Field" 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;
            <asp:RangeValidator ID="RangeValidator3" runat="server" 
                ControlToValidate="PriceTextBox" 
                ErrorMessage="Please enter value between 500 and 5000 " ForeColor="#CC0000" 
                MaximumValue="5000" MinimumValue="500" Type="Integer"></asp:RangeValidator>
            <br />
            Stock_level:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                Text='<%# Bind("Stock_level") %>' Width="200px" />
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="Stock_levelTextBox" ErrorMessage="Required Field" 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RangeValidator ID="RangeValidator4" runat="server" 
                ControlToValidate="Stock_levelTextBox" 
                ErrorMessage="Please enter value between 1 and 99" ForeColor="#CC0000" 
                MaximumValue="99" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            StockID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' 
                Width="200px" />
            &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="StockIDTextBox" ErrorMessage="Please fill out this field " 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
            &nbsp;<br />Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' Width="200px" />
            &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="DescriptionTextBox" 
                ErrorMessage="Please fill out this field" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                Width="200px" />
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="PriceTextBox" ErrorMessage="Please fill out this field " 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="PriceTextBox" 
                ErrorMessage="Please enter value between 500 and 5000" ForeColor="#CC0000" 
                MaximumValue="5000" MinimumValue="500" Type="Integer"></asp:RangeValidator>
            <br />
            Stock_level:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                Text='<%# Bind("Stock_level") %>' Width="200px" />
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="Stock_levelTextBox" 
                ErrorMessage="Please fill out this field" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                ControlToValidate="Stock_levelTextBox" 
                ErrorMessage="Please enter value between 1 and 99 " ForeColor="#CC0000" 
                MaximumValue="99" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            StockID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="StockIDLabel" runat="server" Font-Bold="True" 
                Font-Italic="False" Text='<%# Eval("StockID") %>' Width="200px" />
            <br />
            Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="DescriptionLabel" runat="server" Font-Bold="True" 
                Text='<%# Bind("Description") %>' Width="200px" />
            <br />
            Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="PriceLabel" runat="server" Font-Bold="True" 
                Text='<%# Bind("Price") %>' Width="200px" />
            <br />
            Stock_level:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Stock_levelLabel" runat="server" Font-Bold="True" 
                Text='<%# Bind("Stock_level") %>' Width="200px" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <RowStyle HorizontalAlign="Left" />
    </asp:FormView>
    <br />
   
    </div>
</asp:Content>

