

<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="crash.aspx.vb" Inherits="crash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style3
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class='aside' 
        style="border: thin dotted #C0C0C0; padding: 0px 10px 10px 10px; width: 16%; height:auto; float: left">
    <h2 class="style3">
        Instructions
    </h2>
    <p class="style3">
        <strong>Crash page</strong> is containg link to <strong>non-existing page.</strong></p>
    <p class="style3">
        Clicking this link will <strong>cause error which is handled by application</strong> 
        and user is redirected to <strong>specified error page</strong></p>
</div>

 <div style="float:right; width: 80%;">
    <h2>Click link to cause error</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<h2 style="text-align:center;">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="abcdefg" 
        ForeColor="#009B48">Click me to cause an error</asp:HyperLink>
</h2>

</div>
</asp:Content>

