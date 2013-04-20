<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="DAL_display.aspx.vb" Inherits="DAL_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class='aside' 
        style="border: thin dotted #C0C0C0; padding: 0px 10px 10px 10px; width: 16%; height:auto; float: left">
    <h2 class="style2">
        Instructions
    </h2>
    <p class="style2">
        <strong>Data Access Layer</strong> connected to stock table.</p>
    <p class="style2">
        Table below allows <strong>adding</strong>, <strong>editing</strong> and <strong>
        deleting</strong> records in stock table.</p>
</div>

 <div style="float:right; width: 80%;">
        <h1>
            DAL - Displaying all stock</h1>
        <p>
            <asp:GridView ID="GridView1" runat="server"
             CssClass="DataWebControlStyle" Width="100%">
               <HeaderStyle CssClass="HeaderStyle" />
               <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
             </p>
        <p>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
                DataKeyNames="StockID" DataSourceID="ObjectDataSource1" Width="295px">
                <EditItemTemplate>
                    StockID:
                    <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' style="margin-left: 34px" />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                        style="margin-left: 72px" />
                    <br />
                    Stock_level:
                    <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                        Text='<%# Bind("Stock_level") %>' style="margin-left: 37px" />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    StockID:
                    <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' 
                        style="margin-left: 48px" />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' style="margin-left: 24px" />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                        style="margin-left: 62px" />
                    <br />
                    Stock_level:
                    <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                        Text='<%# Bind("Stock_level") %>' style="margin-left: 27px" />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    StockID:
                    <asp:Label ID="StockIDLabel" runat="server" Text='<%# Eval("StockID") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    Stock_level:
                    <asp:Label ID="Stock_levelLabel" runat="server" 
                        Text='<%# Bind("Stock_level") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetStock" 
                TypeName="DataSet1TableAdapters.StockTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_StockID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StockID" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="String" />
                    <asp:Parameter Name="Stock_level" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Price" Type="String" />
                    <asp:Parameter Name="Stock_level" Type="Int32" />
                    <asp:Parameter Name="Original_StockID" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
             </p>
    </div>

</asp:Content>

