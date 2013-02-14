<%@ Assembly Name="AmciSolution, Version=1.0.0.0, Culture=neutral, PublicKeyToken=440ea07d0cb818b2" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashBoardUserControl.ascx.cs" Inherits="AmciSolution.DashBoard.DashBoardUserControl" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="MSChart" %>
<SharePoint:ScriptLink ID="ScriptLink1" Name="/_layouts/1033/AMCI/Scripts/niceforms.js" runat="server" />


<SharePoint:ScriptLink ID="ScriptLink2" Name="/_layouts/1033/AMCI/Scripts/jquery-1.2.6.js" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration2" Name="/_layouts/1033/AMCI/Styles/NewTab.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration3" Name="/_layouts/1033/AMCI/Styles/Controls.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration4" Name="/_layouts/1033/AMCI/Styles/login.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration5" Name="/_layouts/1033/AMCI/Styles/igoogle-classicNew.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration6" Name="/_layouts/1033/AMCI/Styles/radcalendar.css" runat="server" After="corev4.css" />





<table style="padding-left:25px;">
<tr>
<td>
 
       <MSChart:Chart ID="chBrandScoreOpportunityChart"
                      runat="server" Height="350px" Width="1300px" ChartType="Column"
                      BorderDashStyle="Solid" BackSecondaryColor="White">
         <Titles>
         
          <MSChart:Title Text="Launch-Weighted Brand Opportunity Score Distibution" Font="Times New Roman, 20pt, style=Bold"></MSChart:Title>
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

<table>
    <tr>
        <td>
           <asp:GridView ID="gvOpportunityScoreDivision" runat="server" AllowPaging="True" 
                                              AutoGenerateColumns="False" 
                                               EnableModelValidation="True" CssClass="igoogle-classic" 
                                             
                                               PageSize="10" OnRowDataBound="gvOpportunityScoreDivision_RowDataBound"  
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
                                              
                                              <asp:Label ID="lblB1" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 
                                              
                                                <asp:TemplateField HeaderText="Brand Opp. Score">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblv1" runat="server" Text='<%#Eval("Value")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB2" runat="server" Text='<%#Eval("BrandName2")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                              
                                                <asp:TemplateField HeaderText="Brand Opp. Score">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblv6" runat="server" Text='<%#Eval("Value2")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB3" runat="server" Text='<%#Eval("BrandName3")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                               <asp:TemplateField HeaderText="Brand Opp. Score">
                                              <ItemStyle Width="50px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblv4" runat="server" Text='<%#Eval("Value3")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              </Columns>
    </asp:GridView>
         
        </td>
        <td>
        
        </td>
    </tr>
</table>
