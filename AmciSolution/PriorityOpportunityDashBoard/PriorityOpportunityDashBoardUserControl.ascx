<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriorityOpportunityDashBoardUserControl.ascx.cs" Inherits="AmciSolution.PriorityOpportunityDashBoard.PriorityOpportunityDashBoardUserControl" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="MSChart" %>
<SharePoint:ScriptLink ID="ScriptLink1" Name="/_layouts/1033/AMCI/Scripts/niceforms.js" runat="server" />
<SharePoint:ScriptLink ID="ScriptLink2" Name="/_layouts/1033/AMCI/Scripts/jquery-1.2.6.js" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration2" Name="/_layouts/1033/AMCI/Styles/NewTab.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration3" Name="/_layouts/1033/AMCI/Styles/Controls.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration4" Name="/_layouts/1033/AMCI/Styles/login.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration5" Name="/_layouts/1033/AMCI/Styles/igoogle-classicNew.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration6" Name="/_layouts/1033/AMCI/Styles/radcalendar.css" runat="server" After="corev4.css" />
   <style>
   .CenterAlign
   {
       text-align:center;
   }
 </style>

<table>
<tr>
    <td>
    <h3 style="font-family:Times New Roman; font-size:20pt; font-weight:bold;">
    Priority and Opportunity Segmentation
    </h3>
    
      
    </td>
</tr>
    <tr>
    <td>
         <asp:Image runat="server" Visible="true" ID="LIVETopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" /> &nbsp; <b>Top Priority </b> 
         <asp:Image runat="server" Visible="true" ID="Image1" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" /> &nbsp; <b>High Opportunity </b> 
         <asp:Image runat="server" Visible="true" ID="LIVEMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" /> &nbsp; <b>Monitor </b> 
         <asp:Image  runat="server" Visible="true" ID="LIVELowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" /> &nbsp; <b>Low Priority </b> 
   </td>
    </tr>
    <tr>
        <td>
           <asp:GridView ID="gvPriorityOpportunity" runat="server"  
                                              AutoGenerateColumns="False" 
                                               EnableModelValidation="True" CssClass="igoogle-classic" 
                                               OnRowDataBound="gvPriorityOpportunity_RowDataBound"  
                                               AllowPaging="false"
                                              Width="577px">
                                              <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
                                             
                                              <Columns>
                                              <asp:TemplateField HeaderText="Rank">
                                              <ItemStyle Width="20px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblSno" runat="server"></asp:Label>
                                              </ItemTemplate>
                                              
                                              </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblBrandName" runat="server" Text='<%#Eval("Brand_name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 
                                              
                                                <asp:TemplateField HeaderText="Pure Brand Score">
                                              <ItemStyle Width="90px" CssClass="CenterAlign" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblPureBrandScore" ItemStyle-CssClass="CenterAlign" runat="server" Text='<%#Eval("PureBrandScore")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="LIVE">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                               

                                              <asp:Image runat="server" Visible="false" ID="LIVETopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVEHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVEMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVELowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />


                                              <asp:Label ID="lblLiveBudget" Visible="false" runat="server" Text='<%#Eval("LiveBudget")%>'></asp:Label>
                                              <asp:Label ID="lblLiveRelationship" Visible="false" runat="server" Text='<%#Eval("LiveRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                              
                                                <asp:TemplateField HeaderText="INSIDE">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                               <asp:Image runat="server" Visible="false" ID="INSIDETopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDEHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDEMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDELowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />

                                              <asp:Label ID="lblInsideBudget" Visible="false" runat="server" Text='<%#Eval("InsideBudget")%>'></asp:Label>
                                              <asp:Label ID="lblInsideRelationship" Visible="false" runat="server" Text='<%#Eval("InsideRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="TESTING">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              <asp:Image runat="server" Visible="false" ID="TESTINGTopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGLowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />

                                               <asp:Label ID="lblTestingBudget" Visible="false" runat="server" Text='<%#Eval("TestingBudget")%>'></asp:Label>
                                              <asp:Label ID="lblTestingRelationship" Visible="false" runat="server" Text='<%#Eval("TestingRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  


                                               <asp:TemplateField HeaderText="Overall">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              <asp:Image runat="server" Visible="false" ID="GroupTopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="GroupHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="GroupMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="GroupLowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />

                                               <asp:Label ID="lblGroupBudget" Visible="false" runat="server" Text='<%#Eval("BudgetSum")%>'></asp:Label>
                                              <asp:Label ID="lblGroupRelationship" Visible="false" runat="server" Text='<%#Eval("RelationshipSum")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  

                                               
                                              </Columns>
    </asp:GridView>
          

        </td>
      <%-- <td>
           <asp:GridView ID="gvPriorityOpportunityGroup" runat="server"  
                                              AutoGenerateColumns="False" 
                                               EnableModelValidation="True" CssClass="igoogle-classic" 
                                               OnRowDataBound="gvPriorityOpportunityGroup_RowDataBound"  
                                               AllowPaging="false"
                                              Width="577px">
                                              <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
                                             
                                              <Columns>
                                              <asp:TemplateField HeaderText="Rank">
                                              <ItemStyle Width="20px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblSno" runat="server"></asp:Label>
                                              </ItemTemplate>
                                              
                                              </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblBrandName" runat="server" Text='<%#Eval("Brand_name")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 
                                              
                                                <asp:TemplateField HeaderText="Pure Brand Score">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblPureBrandScore" runat="server" Text='<%#Eval("PureBrandScore")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="LIVE">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                               

                                              <asp:Image runat="server" Visible="false" ID="LIVETopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVEHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVEMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="LIVELowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />


                                              <asp:Label ID="lblLiveBudget" Visible="false" runat="server" Text='<%#Eval("LiveBudget")%>'></asp:Label>
                                              <asp:Label ID="lblLiveRelationship" Visible="false" runat="server" Text='<%#Eval("LiveRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                              
                                                <asp:TemplateField HeaderText="INSIDE">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                               <asp:Image runat="server" Visible="false" ID="INSIDETopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDEHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDEMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="INSIDELowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />

                                              <asp:Label ID="lblInsideBudget" Visible="false" runat="server" Text='<%#Eval("InsideBudget")%>'></asp:Label>
                                              <asp:Label ID="lblInsideRelationship" Visible="false" runat="server" Text='<%#Eval("InsideRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="TESTING">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              <asp:Image runat="server" Visible="false" ID="TESTINGTopPriority" ImageUrl="/_layouts/1033/AMCI/Images/TopPriority.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGHighOppartunity" ImageUrl="/_layouts/1033/AMCI/Images/HighOppartunity.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGMonitor" ImageUrl="/_layouts/1033/AMCI/Images/Monitor.png" />
                                              <asp:Image runat="server" Visible="false" ID="TESTINGLowPriority" ImageUrl="/_layouts/1033/AMCI/Images/LowPriority.png" />

                                               <asp:Label ID="lblTestingBudget" Visible="false" runat="server" Text='<%#Eval("TestingBudget")%>'></asp:Label>
                                              <asp:Label ID="lblTestingRelationship" Visible="false" runat="server" Text='<%#Eval("TestingRelationship")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                               
                                              </Columns>
    </asp:GridView>
          

        </td> --%>
    </tr>
</table>