<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.XML" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    Sub Page_Load()
        Dim fs
        fs = Server.CreateObject("Scripting.FileSystemObject")

        If (fs.FileExists("c:\josef_net_project\account\current_stock.xml")) = True Then
                 
            lbl1.Text = "New record will be added to current_stock.xml file"
        Else
            
            lbl1.Text = "current_stock.xml file does not exist."
        End If
        
        
    End Sub


    Sub btnWriteXML_OnClick(sender As Object, e As EventArgs)
        Dim fs
        fs = Server.CreateObject("Scripting.FileSystemObject")

        If (fs.FileExists("c:\josef_net_project\Account\current_stock.xml")) = True Then
          
          
            Dim xmlfile As New ConfigXmlDocument
            'loading our xml
            xmlfile.Load(Server.MapPath("current_stock.xml"))
            'creating tages
         
          
            Dim itemTag As XmlElement = xmlfile.CreateElement("Stock")
            Dim stockid As XmlElement = xmlfile.CreateElement("StockID")
            Dim description As XmlElement = xmlfile.CreateElement("Description")
            Dim price As XmlElement = xmlfile.CreateElement("Price")
            Dim stock_level As XmlElement = xmlfile.CreateElement("Stock_level")
 
            'create informaiton that goes into the tages
            Dim theNameText As XmlText = xmlfile.CreateTextNode(stockidfield.Text)
            Dim theEmailText As XmlText = xmlfile.CreateTextNode(descriptionfield.Text)
            Dim theTelText As XmlText = xmlfile.CreateTextNode(pricefield.Text)
            Dim theqnoText As XmlText = xmlfile.CreateTextNode(stockfield.Text)
 
            'append the textnode to elements tages
            stockid.AppendChild(theNameText)
            description.AppendChild(theEmailText)
            price.AppendChild(theTelText)
            stock_level.AppendChild(theqnoText)
 
            'appent all the information to the winners tage
            itemTag.AppendChild(stockid)
            itemTag.AppendChild(description)
            itemTag.AppendChild(price)
            itemTag.AppendChild(stock_level)
 
            'now we are going to add thewinnerstag to the document element which is the root element (winnners)
            xmlfile.DocumentElement.AppendChild(itemTag)
 
            'now we are going to save the xml file
            xmlfile.Save(Server.MapPath("current_stock.xml"))
          
         
            lbl1.Text = "New XML record added"
        Else
            
            lbl2.Text = "You must create current_stock.xml file to proceed."
              
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
        If <strong>current_stock.xml</strong> file is <strong>pressent</strong>, new 
        record will be <strong>added</strong>.</p>
    <p class="style2">
        If <strong>current_stock.xml</strong> file is <strong>not pressent</strong>,
        <strong>warning message will appear</strong> to promt you to create xml file 
        before adding new record.</p>
</div>

 <div style="float:right; width: 80%;">

    <h2>ADD XML record</h2>

<h1><asp:label id="lbl1" runat="server" /></h1>
<h1 style="color:red"><asp:label id="lbl2" runat="server" /></h1>

    <p style="text-align:left"><strong>Create new record</strong></p>

      <table>
        <tr>    
           <td>Stock id:</td> 
           <td><asp:Textbox id="stockidfield" runat="server" width="200" visible="True" ></asp:Textbox></td>
        </tr>
        <tr>
            <td>Description: </td> 
            <td><asp:Textbox id="descriptionfield" runat="server"  visible="True" width="200"/></td>
        </tr>
        <tr>
            <td>Price:</td> 
            <td><asp:Textbox id="pricefield" runat="server" width="200" visible="True"></asp:Textbox></td>
        </tr>
        <tr>
            <td>Stock level</td>
            <td><asp:TextBox ID="stockfield" runat="server" Width="200" Visible="True" ></asp:TextBox></td>
        </tr>
       
     </table>

<asp:Button id="btnWriteXML" text="Write XML Document" OnClick="btnWriteXML_onClick" runat="server" />

</div>
</asp:Content>

