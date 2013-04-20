<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="search" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        Enter at least one character to <strong>search for product</strong> in our 
        database otherwise your query will not be processed.</p>
    <p class="style2">
        You can search by <strong>product description</strong> or <strong>product price</strong>.</p>
    <p class="style2">
        Entering first letter of product stored in database will start<strong> AJAX</strong> 
        functionality to help you redefine your search.
    </p>
    <p class="style2">
        If your search does not match any product in our database the area bellow search 
        form remain blank.</p>
</div>

 <div style="float:right; width: 80%;">
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/josef_db.mdb" 
        SelectCommand="SELECT * FROM [Stock] WHERE (([Description] LIKE '%' + ? + '%') OR ([Price] LIKE '%' + ? + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="search_box" Name="Description2" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="search_box" Name="Price" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
</asp:AccessDataSource>
    <h2>
        Search page</h2>
    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        


Search by <strong>description</strong> or <strong>price</strong><br />
<asp:TextBox ID="search_box" runat="server"></asp:TextBox>

   

     <asp:AutoCompleteExtender ID="search_box_AutoCompleteExtender" runat="server" 
        TargetControlID="search_box" ServiceMethod="SearchCustomers" MinimumPrefixLength="1"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" 
></asp:AutoCompleteExtender>



<asp:Button ID="search_button" runat="server" Text="Search" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="search_box" 
        ErrorMessage="You must enter at least one character to process your query!" 
        Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StockID" 
    DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
    Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
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
    <PagerStyle BackColor="#009b48" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>


</div>
</asp:Content>

