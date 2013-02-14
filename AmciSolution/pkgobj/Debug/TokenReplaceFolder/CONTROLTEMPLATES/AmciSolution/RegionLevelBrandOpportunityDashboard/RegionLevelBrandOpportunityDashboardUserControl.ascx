<%@ Assembly Name="AmciSolution, Version=1.0.0.0, Culture=neutral, PublicKeyToken=440ea07d0cb818b2" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegionLevelBrandOpportunityDashboardUserControl.ascx.cs" Inherits="AmciSolution.RegionLevelBrandOpportunityDashboard.RegionLevelBrandOpportunityDashboardUserControl" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="MSChart" %>
<SharePoint:ScriptLink ID="ScriptLink1" Name="/_layouts/1033/AMCI/Scripts/niceforms.js" runat="server" />
<SharePoint:ScriptLink ID="ScriptLink2" Name="/_layouts/1033/AMCI/Scripts/jquery-1.2.6.js" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration2" Name="/_layouts/1033/AMCI/Styles/NewTab.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration3" Name="/_layouts/1033/AMCI/Styles/Controls.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration4" Name="/_layouts/1033/AMCI/Styles/login.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration5" Name="/_layouts/1033/AMCI/Styles/igoogle-classicNew.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration6" Name="/_layouts/1033/AMCI/Styles/radcalendar.css" runat="server" After="corev4.css" />
<script type="text/javascript">
    $(document).ready(function () {
        var str1 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: black; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);">&nbsp;</td>' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q1</strong></td></tr>';
        $('#<%=gvTopBrandsKeyLaunches1.ClientID%> tr:first').before(str1);

        var str2 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q2</strong></td></tr>';
        $('#<%=gvTopBrandsKeyLaunches2.ClientID%> tr:first').before(str2);

        var str3 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q3</strong></td></tr>';
        $('#<%=gvTopBrandsKeyLaunches3.ClientID%> tr:first').before(str3);

        var str4 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q4</strong></td></tr>';
        $('#<%=gvTopBrandsKeyLaunches4.ClientID%> tr:first').before(str4);

    });
 </script>
   <style>
   .CenterAlign
   {
       text-align:center;
   }
 </style>
 

<table style="padding-left:25px;">
<tr>
<td style="font-family:Times New Roman; font-size:13pt;font-weight:bold;">
 Region: &nbsp; <asp:DropDownList ID="cmbRegion" Height="25px" AutoPostBack="true" OnSelectedIndexChanged="cmbRegion_SelectedIndexChanged" runat="server" Width="300px"></asp:DropDownList>

  <b>Calendar Year</b>  :&nbsp; <asp:DropDownList ID="cmbFiscalYear" AutoPostBack="true"  Height="25px"  OnSelectedIndexChanged="cmbYear_SelectedIndexChanged" runat="server" Width="300px"></asp:DropDownList>

 <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

   <asp:Button ID="btnLive" runat="server" Text="Live"   BackColor="Green" OnClick="btnLive_Click"      />
    <asp:Button ID="btnInside" runat="server" Text="Inside"  BackColor="Red" OnClick="btnInside_Click"    />
    <asp:Button ID="btnTest" runat="server" Text="Testing"   BackColor="Red" OnClick="btnTesting_Click"      /><br />
   

    

</td>
</tr>
<tr>
 <td style="font-family:Times New Roman; padding-left:30px; font-size:11pt;font-weight:bold;">
        
    Filter Criteria for Chart :- Region :<asp:Label ID="lblRegion" runat="server"></asp:Label> & Year :<asp:Label ID="lblYearChart" runat="server"></asp:Label>
       
    </td>
</tr>

<tr>
<td>
 
       <MSChart:Chart ID="chRegionLevelBrandOpportunity"
                      runat="server" Height="350px" Width="1300px" ChartType="Column"
                      BorderDashStyle="Solid" BackSecondaryColor="White">
         <Titles>
         
          <MSChart:Title Text="Total Brand Opportunity Score Division-Level" Font="Times New Roman, 20pt, style=Bold"></MSChart:Title>
         </Titles>

         <legends>
        
                 </legends>
                 <borderskin skinstyle="Emboss"></borderskin>
    <Series>
        <MSChart:Series ChartType="Column"  Name="Default">
        </MSChart:Series>
    </Series>
    <ChartAreas>
        <MSChart:ChartArea  Name="ChartArea1">
        </MSChart:ChartArea>
           
             

    </ChartAreas>
</MSChart:Chart>

</td>
</tr>


</table>

<table width="1210px">
 <tr>
    <td style="font-family:Times New Roman; text-decoration:underline; font-size:16pt;font-weight:bold;text-align:center;">
           
    	 Top Brands and Key Launches <br />
         

    </td>
</tr>

<tr>
 <td style="font-family:Times New Roman; padding-left:30px; font-size:11pt;font-weight:bold;">
        
    Filter Criteria for Grid :- Year :<asp:Label ID="lblGridYear" runat="server"></asp:Label>
       
    </td>
</tr>

     <tr>
           <td id="TDYear" runat="server"  style="text-align:center; margin-left:5px; width:250px; height:30px; background-color:#6b7a99;">
           <asp:Label ID="lblYear" Font-Bold="false" ForeColor="White" Font-Size="12pt" runat="server"></asp:Label>
           </td>
           </tr>
</table>
<table width="100%" style="margin-top:-9px;">
         
            <tr>
            <td style="vertical-align:top;width:310px;"">
       
        <asp:GridView ID="gvTopBrandsKeyLaunches1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvTopBrandsKeyLaunches1_RowDataBound" Width="310px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                              <asp:TemplateField HeaderText="Rank">
                                               <ItemStyle Width="30px" Height="40px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:BoundField HeaderText="Brand Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Width="20px" />
                                              <asp:TemplateField HeaderText="Brand">
                                                <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                                  <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="70px" />
                                              
                                             
                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;width:290px;"">
        <div style="margin-left:-35px;vertical-align:top; ">
         <asp:GridView ID="gvTopBrandsKeyLaunches2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="290px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
  <asp:BoundField HeaderText="Brand Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Height="40px"  ItemStyle-Width="20px" />
                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="80px" />
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                             
                                            

                                                <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Height="40px"   ItemStyle-Width="40px" />
                                              
                                             
                                              
                                             </Columns>
        </asp:GridView>
       </div>
        </td>


            <td style="vertical-align:top;width:300px;">
            <div style="margin-left:-68px;vertical-align:top;width:200px;">
         <asp:GridView ID="gvTopBrandsKeyLaunches3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="300px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                               <asp:BoundField HeaderText="Brand Oop. Score" ItemStyle-CssClass="CenterAlign" ItemStyle-Height="40px" DataField="Value" ItemStyle-Width="20px" />
                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="80px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                               <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Height="40px"  ItemStyle-Width="50px" />
                                             
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;width:330px">
            <div style="margin-left:-120px;vertical-align:top;">
         <asp:GridView ID="gvTopBrandsKeyLaunches4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                  
                                    <asp:BoundField HeaderText="Brand Oop. Score" ItemStyle-CssClass="CenterAlign"  ItemStyle-Height="40px" DataField="Value" ItemStyle-Width="5px" />
                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="80px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>                                           
                                            
                                              <asp:BoundField HeaderText="Vehicle" ItemStyle-Height="40px" DataField="Model" ItemStyle-Width="70px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>
