<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VehicleLaunchOpportunityDashboardUserControl.ascx.cs" Inherits="AmciSolution.VehicleLaunchOpportunityDashboard.VehicleLaunchOpportunityDashboardUserControl" %>
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
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="4"><strong>Q1</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterLive1.ClientID%> tr:first').before(str1);

        var str2 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q2</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterLive2.ClientID%> tr:first').before(str2);

        var str3 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q3</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterLive3.ClientID%> tr:first').before(str3);

        var str4 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q4</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterLive4.ClientID%> tr:first').before(str4);


        var str11 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="4"><strong>Q1</strong></td></tr>';
        $('#<%=gvVehicleLaunchOpportunityQuarter1.ClientID%> tr:first').before(str11);

        var str22 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q2</strong></td></tr>';
        $('#<%=gvVehicleLaunchOpportunityQuarter2.ClientID%> tr:first').before(str22);

        var str33 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q3</strong></td></tr>';
        $('#<%=gvVehicleLaunchOpportunityQuarter3.ClientID%> tr:first').before(str33);

        var str44 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q4</strong></td></tr>';
        $('#<%=gvVehicleLaunchOpportunityQuarter4.ClientID%> tr:first').before(str44);


        var str11 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="4"><strong>Q1</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterTesting1.ClientID%> tr:first').before(str11);

        var str22 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q2</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterTesting2.ClientID%> tr:first').before(str22);

        var str33 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q3</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterTesting3.ClientID%> tr:first').before(str33);

        var str44 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q4</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterTesting4.ClientID%> tr:first').before(str44);

        var str11 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="4"><strong>Q1</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterInside1.ClientID%> tr:first').before(str11);

        var str22 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q2</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterInside2.ClientID%> tr:first').before(str22);

        var str33 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q3</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterInside3.ClientID%> tr:first').before(str33);

        var str44 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="3"><strong>Q4</strong></td></tr>';
        $('#<%=gvDivisionVehicleLaunchOpportunityQuarterInside4.ClientID%> tr:first').before(str44);

    });
 </script>
  <style>
   .CenterAlign
   {
       text-align:center;
   }
 </style>
 <table>
    <tr>
        
        <td style="font-family:Times New Roman; padding-left:30px; font-size:13pt;font-weight:bold;">
         <b>calendar Year</b>  :&nbsp; <asp:DropDownList ID="cmbFiscalYear" AutoPostBack="true"  Height="25px"  OnSelectedIndexChanged="cmbYear_SelectedIndexChanged" runat="server" Width="300px"></asp:DropDownList>
    
       
    </td>
    <td style="font-family:Times New Roman; font-size:13pt;font-weight:bold;">
 Region: &nbsp; <asp:DropDownList ID="cmbRegion" Height="25px" AutoPostBack="true" OnSelectedIndexChanged="cmbRegion_SelectedIndexChanged" runat="server" Width="300px"></asp:DropDownList>
 <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
</td>
    </tr>
     
 </table>

<table width="1273px">

<tr>
    <td style="font-family:Times New Roman; text-decoration:underline; font-size:16pt;font-weight:bold;text-align:center;">
           
    	Overall Vehicle Launch Opportunity by Quarter
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
            <td style="vertical-align:top;width:330px;"">
       
        <asp:GridView ID="gvVehicleLaunchOpportunityQuarter1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvVehicleLaunchOpportunityQuarter1_RowDataBound" Width="330px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>  
                                            <asp:TemplateField HeaderText="Rank">
                                                         <ItemStyle Width="30px" Height="40px" />
                                                          <ItemTemplate>
                                                          <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Brand">
                                                       <ItemStyle Width="30px" />
                                                      <ItemTemplate>
                                                      <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                                      </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="80px"  />

                                           
                                              <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="55px" />
                                             
                                              
                                                  
                                              
                                             
                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;width:290px;"">
        <div style="margin-left:-16px;vertical-align:top; ">
         <asp:GridView ID="gvVehicleLaunchOpportunityQuarter2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="290px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>

                                <asp:TemplateField HeaderText="Brand">
                                               <ItemStyle Width="50px"  Height="40px" />  
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:BoundField HeaderText="Vehicle" DataField="Model"  ItemStyle-Height="40" ItemStyle-Width="25px" />
                                                 <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="5px" />
                                               </Columns>
        </asp:GridView>
       </div>
        </td>


            <td style="vertical-align:top;width:330px;">
             <div style="margin-left:-32px;vertical-align:top;width:200px;">
         <asp:GridView ID="gvVehicleLaunchOpportunityQuarter3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                               
                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="65px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                               <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="25px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;width:325px">
             <div style="margin-left:-50px;vertical-align:top;">
         <asp:GridView ID="gvVehicleLaunchOpportunityQuarter4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                              <asp:TemplateField HeaderText="Brand">
                                               <ItemStyle  Width="45px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>   
                                            
                                                                                      
                                            
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="2px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>
    


<table width="1273px">
<tr>
    <td style="font-family:Times New Roman;text-decoration:underline; font-size:16pt;font-weight:bold;text-align:center;">
           
    	 Live Vehicle Launch Opportunity by Quarter
    </td>
</tr>

 


     <tr>
           <td id="TDLive" runat="server"  style="text-align:center; margin-left:5px; width:250px; height:30px; background-color:#6b7a99;">
           <asp:Label ID="lbYearlLive" Font-Bold="false" ForeColor="White" Font-Size="12pt" runat="server"></asp:Label>
           </td>
           </tr>
</table>
<table width="100%" style="margin-top:-9px;">
         
        <tr>
            <td style="vertical-align:top;width:330px;"">
       
        <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterLive1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvDivisionVehicleLaunchOpportunityQuarterLive1_RowDataBound" Width="330px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>  
                                            <asp:TemplateField HeaderText="Rank">
                                                          <ItemStyle Width="30px" Height="40px" />
                                                          <ItemTemplate>
                                                          <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Brand">
                                                      <ItemStyle Width="30px" />
                                                      <ItemTemplate>
                                                      <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                                      </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="80px" />

                                           
                                              <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="55px" />
                                             
                                              
                                                  
                                              
                                             
                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;width:290px;">
        <div style="margin-left:-16px;vertical-align:top; ">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterLive2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="290px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>

                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="50px"  Height="40px" />  
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Height="40" ItemStyle-Width="25px" />
                                                 <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="5px" />
                                               </Columns>
        </asp:GridView>
       </div>
        </td>


            <td style="vertical-align:top;width:330px;">
            <div style="margin-left:-32px;vertical-align:top;width:200px;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterLive3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                               
                                               <asp:TemplateField HeaderText="Brand" >
                                              <ItemStyle  Width="65px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                               <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="25px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;width:325px">
            <div style="margin-left:-50px;vertical-align:top;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterLive4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                              <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="45px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>   
                                            
                                                                                      
                                            
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="2px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>






    <table width="1273px">
<tr>
    <td style="font-family:Times New Roman;text-decoration:underline; font-size:16pt;font-weight:bold;text-align:center;">
           
    	 Inside Vehicle Launch Opportunity by Quarter
    </td>
</tr>

 


     <tr>
           <td id="TD1" runat="server"  style="text-align:center; margin-left:5px; width:250px; height:30px; background-color:#6b7a99;">
           <asp:Label ID="lblYearInside" Font-Bold="false" ForeColor="White" Font-Size="12pt" runat="server"></asp:Label>
           </td>
           </tr>
</table>
<table width="100%" style="margin-top:-9px;">
         
        <tr>
            <td style="vertical-align:top;width:330px;"">
       
        <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterInside1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvDivisionVehicleLaunchOpportunityQuarterInside1_RowDataBound" Width="330px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>  
                                            <asp:TemplateField HeaderText="Rank">
                                                          <ItemStyle Width="30px" Height="40px" />
                                                          <ItemTemplate>
                                                          <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Brand">
                                                      <ItemStyle Width="30px" />
                                                      <ItemTemplate>
                                                      <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                                      </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="80px" />

                                           
                                              <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Width="55px" />
                                             
                                              
                                                  
                                              
                                             
                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;width:290px;">
        <div style="margin-left:-16px;vertical-align:top; ">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterInside2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="290px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>

                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="50px"  Height="40px" />  
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Height="40" ItemStyle-Width="25px" />
                                                 <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Width="5px" />
                                               </Columns>
        </asp:GridView>
       </div>
        </td>


            <td style="vertical-align:top;width:330px;">
            <div style="margin-left:-32px;vertical-align:top;width:200px;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterInside3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                               
                                               <asp:TemplateField HeaderText="Brand" >
                                              <ItemStyle  Width="65px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                               <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="25px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;width:325px">
            <div style="margin-left:-50px;vertical-align:top;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterInside4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                              <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="45px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>   
                                            
                                                                                      
                                            
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Width="2px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>



    <table width="1273px">
<tr>
    <td style="font-family:Times New Roman;text-decoration:underline; font-size:16pt;font-weight:bold;text-align:center;">
           
    	 Testing Vehicle Launch Opportunity by Quarter
    </td>
</tr>

 


     <tr>
           <td id="TD2" runat="server"  style="text-align:center; margin-left:5px; width:250px; height:30px; background-color:#6b7a99;">
           <asp:Label ID="lblYearTesting" Font-Bold="false" ForeColor="White" Font-Size="12pt" runat="server"></asp:Label>
           </td>
           </tr>
</table>
<table width="100%" style="margin-top:-9px;">
         
        <tr>
            <td style="vertical-align:top;width:330px;"">
       
        <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterTesting1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvDivisionVehicleLaunchOpportunityQuarterTesting1_RowDataBound" Width="330px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>  
                                            <asp:TemplateField HeaderText="Rank">
                                                          <ItemStyle Width="30px" Height="40px" />
                                                          <ItemTemplate>
                                                          <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Brand">
                                                      <ItemStyle Width="30px" />
                                                      <ItemTemplate>
                                                      <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                                      </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="80px" />

                                           
                                              <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="55px" />
                                             
                                              
                                                  
                                              
                                             
                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;width:290px;">
        <div style="margin-left:-16px;vertical-align:top; ">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterTesting2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="290px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>

                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="50px"  Height="40px" />  
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                </asp:TemplateField>
                                                 <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Height="40" ItemStyle-Width="25px" />
                                                 <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="5px" />
                                               </Columns>
        </asp:GridView>
       </div>
        </td>


            <td style="vertical-align:top;width:330px;">
            <div style="margin-left:-32px;vertical-align:top;width:200px;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterTesting3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                               
                                               <asp:TemplateField HeaderText="Brand" >
                                              <ItemStyle  Width="65px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                               <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign" DataField="Value" ItemStyle-Width="25px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;width:325px">
            <div style="margin-left:-50px;vertical-align:top;">
         <asp:GridView ID="gvDivisionVehicleLaunchOpportunityQuarterTesting4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="330px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                              <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="45px" Height="40px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("Brand_Name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>   
                                            
                                                                                      
                                            
                                              <asp:BoundField HeaderText="Vehicle" DataField="Model" ItemStyle-Width="30px" />
                                               <asp:BoundField HeaderText="Vehicle Oop. Score" ItemStyle-CssClass="CenterAlign"  DataField="Value" ItemStyle-Width="2px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>