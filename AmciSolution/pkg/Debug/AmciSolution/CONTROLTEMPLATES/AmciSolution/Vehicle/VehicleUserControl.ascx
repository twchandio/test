<%@ Assembly Name="AmciSolution, Version=1.0.0.0, Culture=neutral, PublicKeyToken=440ea07d0cb818b2" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VehicleUserControl.ascx.cs" Inherits="AmciSolution.Vehicle.VehicleUserControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"  %>
<SharePoint:ScriptLink ID="ScriptLink1" Name="/_layouts/1033/AMCI/Scripts/niceforms.js" runat="server" />
<SharePoint:ScriptLink ID="ScriptLink2" Name="/_layouts/1033/AMCI/Scripts/jquery-1.2.6.js" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration2" Name="/_layouts/1033/AMCI/Styles/NewTab.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration3" Name="/_layouts/1033/AMCI/Styles/Controls.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration4" Name="/_layouts/1033/AMCI/Styles/login.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration5" Name="/_layouts/1033/AMCI/Styles/igoogle-classic.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration6" Name="/_layouts/1033/AMCI/Styles/radcalendar.css" runat="server" After="corev4.css" />
<style type="text/css">
        #Containerdiv{width: 870px; margin:0px auto;  background-color:#EDF8D1; border:2px groove black;}
    
        .style1
        {
            height: 59px;
        }
    
        .style2
        {
            width: 140px;
            font-family:Arial;
            font-weight:bold;
        }
        body 
        {
        	font-family:Arial;
        	font-size:11px;
        	font-weight:bold;
        	}
    
    </style>

 <div style="width: 890px; margin:0px auto;  background-color:#EDF8D1; border:2px groove black;">
   <ajaxtoolkit:tabcontainer ID="tbMain" runat="server" CssClass="Tab">
   <ajaxToolkit:TabPanel ID="pnlListing" runat="server">
     <HeaderTemplate>
          Vehicle Management
     
</HeaderTemplate>
     <ContentTemplate>
     <table width="100%">
      <tr>
       <td align="left" style="width:600px;">
             Brand
            <asp:TextBox ID="txtBrandName" Width="210px" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="Search" />
    </td>
    <td  align="right">
       <asp:Button ID="btnAddNewRecord" OnClick="btnAddNew_Click" runat="server" Text="Add New Vehicle" 
             />
    </td>
     </tr>
     </table>
     <table width="100%">
     <tr>
    <td>
    <asp:GridView ID="gvListing" runat="server" AllowPaging="True" 
                                              AutoGenerateColumns="False" CssClass="igoogle igoogle-classic" 
                                              DataKeyNames="VLTHeaderID" EnableModelValidation="True" 
                                              OnPageIndexChanging="gvListing_PageIndexChanging" 
                                              PageSize="20" 
                                              Width="100%">
                        <AlternatingRowStyle CssClass="alt-data-row" />
                        <Columns>
                       
                        <asp:BoundField HeaderText="Brand" DataField="Brand_Name" />
                        <asp:BoundField HeaderText="Model" DataField="Model" />
                        <asp:BoundField HeaderText="Activity" DataField="Activity" />
                        <asp:BoundField HeaderText="Ward Segmentation" DataField="WardSegmentation" />
                         <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                             <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="/_layouts/1033/AMCI/Images/editRecord.png" ToolTip="Edit Record" OnClick="btnEdit_Click" />
                        </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                             <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/_layouts/1033/AMCI/Images/DeleteRed.png" ToolTip="Edit Record" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                        </asp:GridView>

</td> 
</tr>
<tr>
<td>
    <asp:HiddenField ID="hdnBrandID" runat="server" />
    <asp:Label ID="txtBrandID" runat="server" Visible="False"></asp:Label>
</td>
</tr>
 </table>
</ContentTemplate>

</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="pnlGrid" runat="server">
 <HeaderTemplate> 
    Vehicle Profile
</HeaderTemplate>
<ContentTemplate>
  <div id="Containerdiv" >
   <table style="width:100%">
   
  
   <tr>
   <td 
           style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" 
           class="style1">
    <b style="margin-left:300px;"><asp:Label ID="lblBrandOperation" runat="server" Text=""></asp:Label></b></td>
   <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1">
    <asp:ImageButton ID="btnAddnew" runat="server"  ImageUrl="/_layouts/1033/AMCI/Images/add new.png" OnClick="btnAddnew_Click"/>
    </td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Horizontalbar" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   </table>
    <table style=" width:100%">
    
    <tr><td colspan="4">
    <table style="width:750px; height:auto; margin:0px auto">
    <tr>
    <td align="right">Region</td>
    <td >
        <asp:DropDownList ID="cmbRegion" runat="server" Height="23px" Width="216px" BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
        
        </asp:DropDownList>
    </td>
    <td align="right" class="style2">Brand</td>
    <td>
        <asp:DropDownList ID="cmbBrand" runat="server" Height="23px" Width="216px" BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
            
        </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
    
     <td align="right">Model</td><td>
        
        
        <asp:TextBox ID="txtModel" runat="server"  Height="13px" Width="208px" BackColor="#B7BF86" ForeColor="White"></asp:TextBox>
        
        </td>

    
    
    
        <td align="right">Quarter</td><td><asp:DropDownList ID="cmbQuarter" runat="server" Height="23px" Width="216px" 
            BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
             
        </asp:DropDownList></td>
    </tr>
      <tr>
    <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
    
    <td align="right">Calendar Year</td><td><asp:DropDownList ID="cmbCalenderYear" runat="server" Height="23px" Width="216px" 
            BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
            
        </asp:DropDownList></td>
    
    <td align="right">Activty</td><td><asp:DropDownList ID="cmbActivity" runat="server" Height="23px" Width="216px" 
            BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
           
        </asp:DropDownList></td>
        
    </tr>
     <tr>
    <td colspan="4">&nbsp;</td>
    </tr>
    <tr><td align="right">Calendar Month</td><td><asp:DropDownList ID="cmbCalendarMonth" runat="server" Height="23px" Width="216px" 
            BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
           
        </asp:DropDownList></td>

        <td align="right">Significance Rating</td><td><asp:DropDownList ID="cmbRating" runat="server" Height="23px" Width="216px" 
            BackColor="#B7BF86" ForeColor="White">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
         
        </asp:DropDownList></td>


      
    </tr>

     <tr>
    <td colspan="4">&nbsp;</td>
    </tr>
     <tr>
       <td align="right">Timinig Factor</td><td>
          <asp:TextBox ID="txtTimmingFactor" runat="server" Height="13px" Width="208px" ></asp:TextBox>
        </td>
     <td align="right">Ward Segmentation</td><td><asp:TextBox ID="txtWardSegmentation" runat="server" Height="13px" Width="208px" BackColor="#B7BF86" ForeColor="White"></asp:TextBox></td>
       
    </tr>


    <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
    <td align="right">Global</td><td>
        <asp:RadioButtonList ID="rdbGlobal" runat="server" RepeatDirection="Horizontal">
            
        </asp:RadioButtonList>
    </td><td align="right">Source Info/Client Info</td><td>
        <asp:RadioButtonList ID="rdbSourceInfo" runat="server" 
            RepeatDirection="Horizontal">
           
        </asp:RadioButtonList>
    </td>
    </tr>
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
    <td align="right">Confidential Info</td><td colspan="3">
        <asp:TextBox ID="txtConfidentialInfo" runat="server" Height="48px" 
            TextMode="MultiLine" Width="616px" BackColor="#B7BF86" ForeColor="White"></asp:TextBox></td>
    </tr>
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
    <td align="right">Relevant Notes</td><td colspan="3">
        <asp:TextBox ID="txtRelevantNotes" runat="server" Height="48px" 
            TextMode="MultiLine" Width="616px" BackColor="#B7BF86" ForeColor="White"></asp:TextBox></td>
    </tr>
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
    <td align="right">Product Information Steps</td><td colspan="3">
        <asp:TextBox ID="txtProductInformation" runat="server" Height="48px" 
            TextMode="MultiLine" Width="616px" BackColor="#B7BF86" ForeColor="White"></asp:TextBox></td>
    </tr>
     <tr>
    <td colspan="4" align="center">
        <asp:ImageButton ID="btnSave" runat="server" OnClick="btnSave_Click" ImageUrl="/_layouts/1033/AMCI/Images/save.png" />&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btnReset" runat="server" ImageUrl="/_layouts/1033/AMCI/Images/Reset.png" OnClick="btnReset_Click" />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <asp:HiddenField ID="hdnVehicleID" runat="server" />
         </td>
    </tr>
    </table></td></tr>
    <tr>
    <td colspan="4"><div Id="Div1" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
    </tr>
    <tr><td colspan="4">
        <asp:GridView ID="GridView1" runat="server" 
             Width="100%">
        </asp:GridView>
    </td></tr>
    </table>
    </div>

</ContentTemplate>
</ajaxToolkit:TabPanel>



<ajaxToolkit:TabPanel ID="VehicleLaunchOpportunity" runat="server">
 <HeaderTemplate> 
    Vehicle Launch Opportunity
</HeaderTemplate>
<ContentTemplate>
  <div id="Div2" >
   <table style="width:100%">
   <tr>
   <td 
           style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" 
           class="style1">
    <b style="margin-left:300px;"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></b></td>
    <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1">
    </td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Div3" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   </table>
 
    <table style=" width:100%">
     <tr><td colspan="4">
     <table style="width:750px; height:auto; margin:0px auto">


       <tr>
             <td align="left" style="font-weight:bold;width:250px;">Brand </td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblBrandName" runat="server" Text=""> </asp:Label></td>
       </tr>
       <tr>
             <td align="left" style="font-weight:bold;">Model </td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblModel" runat="server" Text=""> </asp:Label></td>
       </tr>
      
       <tr>
             <td align="left" style="font-weight:bold;">Live Opportunity Score </td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblLiveOpportunityScore" runat="server" Text=""> </asp:Label></td>
       </tr>
                    
       <tr>
             <td align="left" style="font-weight:bold;">Inside Opportunity Score </td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblInsideOpportunityScore" runat="server" Text=""> </asp:Label></td>
       </tr>
       <tr>
             <td align="left" style="font-weight:bold;">Testing Opportunity Score</td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblTestingOpportunityScore" runat="server" Text=""> </asp:Label></td>
       </tr>
       <tr>
             <td align="left" style="font-weight:bold;">Total Vehicle Opportunity Score </td>
             <td align="left" style="font-weight:bold;"><asp:Label ID="lblTotalVehicleOpportunityScore" runat="server" Text=""> </asp:Label></td>
       </tr>
       </table>
       </td>
       </tr>
       </table>
       </div>
    </ContentTemplate>
    </ajaxToolkit:TabPanel>
   </ajaxtoolkit:tabcontainer>
  </div>


    
