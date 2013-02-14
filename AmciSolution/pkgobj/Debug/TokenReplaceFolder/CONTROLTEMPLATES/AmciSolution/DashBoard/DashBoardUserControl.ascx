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


<script type="text/javascript">
    $(document).ready(function () {
        var str = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: black; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);">&nbsp;</td>' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>AMCI-Live</strong></td>' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>AMCI-Inside</strong></td>' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>AMCI-Testing</strong></td></tr>';
        $('#<%=gvOpportunityScoreDivision.ClientID%> tr:first').before(str);


        var str1 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: black; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);">&nbsp;</td>' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>Q1</strong></td></tr>';
        $('#<%=gvQ1.ClientID%> tr:first').before(str1);



        var str2 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>Q2</strong></td></tr>';
        $('#<%=gvQ2.ClientID%> tr:first').before(str2);





        var str3 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>Q3</strong></td></tr>';
        $('#<%=gvQ3.ClientID%> tr:first').before(str3);


        var str4 = '<tr style="background-color: #6b7a99; font-family:Arial;font-size:x-Small;font-weight:bold; border:none; COLOR: white;">' +
        '<td align="center" style="background-color:  #6b7a99; color: white; font-weight: bold; border-right: 2px solid rgb(255, 255, 255); border-top: 2px solid rgb(255, 255, 255); border-left: 2px solid rgb(255, 255, 255);" colspan="2"><strong>Q4</strong></td></tr>';
        $('#<%=gvQ4.ClientID%> tr:first').before(str4);

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
<td>
 
       <MSChart:Chart ID="chBrandScoreOpportunityChart"
                      runat="server" Height="350px" Width="1300px" ChartType="Column"
                      BorderDashStyle="Solid" BackSecondaryColor="White">
         <Titles>
         
          <MSChart:Title Text="Group-Level Brand Opportunity Score" Font="Arial, 20pt, style=Bold"></MSChart:Title>
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
               <AxisY Title="Group Score">
               </AxisY>
               <AxisX Interval="1" Title="Brand">
               </AxisX>
        </MSChart:ChartArea>



      

           
             

    </ChartAreas>
</MSChart:Chart>

</td>
</tr>


</table>

<table>
    <tr>
        <td style="vertical-align:top;">
         <p style="font-family:Arial;font-size:20pt;font-weight:bold">Brand Opportunity Score by Division-Level</p>
        </td>
        <td style="padding-left:150px;vertical-align:top;">
         <p style="font-family:Arial;font-size:20pt;font-weight:bold">Brand Opportunity Score by Division and Quarter </p> <br />
           <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label> 
      <b>calendar Year</b>  :&nbsp; 
      <asp:DropDownList ID="cmbFiscalYear" AutoPostBack="true" OnSelectedIndexChanged="cmbYear_SelectedIndexChanged" runat="server" Width="300px">
     
      </asp:DropDownList>
    <asp:Button ID="btnLive" runat="server" Text="Live"   BackColor="Green" OnClick="btnLive_Clik"     />
    <asp:Button ID="btnInside" runat="server" Text="Inside"  BackColor="Red" OnClick="btnInside_Click"   />
    <asp:Button ID="btnTest" runat="server" Text="Testing"   BackColor="Red" OnClick="btnTest_Click"     /><br />
        </td>
    </tr>
</table>


<table>
    <tr>
        <td style="vertical-align:top; padding-top:10px;">
       
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
                                              
                                              <asp:Label ID="lblB1"  runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 
                                              
                                              <asp:TemplateField HeaderText="Opp. Score">
                                                  <ItemStyle Width="50px" CssClass="CenterAlign" /> 
                                              <ItemTemplate>
                                                 <asp:Label ID="lblv1"  runat="server"  Text='<%#Eval("Value")%>' ></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB2" runat="server" Text='<%#Eval("BrandName2")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                              
                                                <asp:TemplateField HeaderText="Opp. Score">
                                              <ItemStyle Width="50px"  CssClass="CenterAlign"/>
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblv6"  runat="server" Text='<%#Eval("Value2")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField> 

                                                <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="70px" />
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB3" runat="server" Text='<%#Eval("BrandName3")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>  
                                               <asp:TemplateField HeaderText="Opp. Score">
                                              <ItemStyle Width="50px" CssClass="CenterAlign" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblv4"  runat="server" Text='<%#Eval("Value3")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              </Columns>
    </asp:GridView></td>

        <td style="vertical-align:top;">
        <table width="100%">
         
        
        <tr>
        
        <td  colspan="4">

      <%--  Buttons--%>
       
    </td>
           </tr>
            <tr>
            <td style="vertical-align:top;">
        
        <asp:GridView ID="gvQ1" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic" 
        OnRowDataBound="gvQ1_RowDataBound" Width="270px">
            <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  
                                              <asp:TemplateField HeaderText="Rank">
                                               <ItemStyle Width="20px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblSerialNo" runat="server"></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Brand">
                                                <ItemStyle Width="60px" />
                                              <ItemTemplate>
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                                   <asp:BoundField HeaderText="Opp. Score" DataField="Value" ItemStyle-Width="20px"/>
                                          
                                             



                                             
                                              
                                              


                                             </Columns>
        </asp:GridView>
       </td>
            <td style="vertical-align:top;">
        <div style="margin-left:-16px;vertical-align:top; ">
         <asp:GridView ID="gvQ2" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="200px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  

                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="110px" />
                                              <ItemTemplate>
                                             
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                             
                                              <asp:BoundField HeaderText="Opp. Score" DataField="Value" ItemStyle-Width="20px" />


                                             
                                              
                                             </Columns>
        </asp:GridView>
       </div>
        </td>
            <td style="vertical-align:top;">
            <div style="margin-left:-08px;vertical-align:top;">
         <asp:GridView ID="gvQ3" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="200px"> 
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />
       <Columns>
                                  

                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle Width="110px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                              <asp:BoundField HeaderText="Opp. Score" DataField="Value" ItemStyle-Width="20px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>
            <td style="vertical-align:top;">
            <div style="margin-left:-08px;vertical-align:top;">
         <asp:GridView ID="gvQ4" runat="server" AutoGenerateColumns="false" CssClass="igoogle-classic"
         Width="200px">
           <AlternatingRowStyle CssClass="alt-row-style" />
                                               <SelectedRowStyle CssClass="row-select" />  
       <Columns>
                                  

                                               <asp:TemplateField HeaderText="Brand">
                                              <ItemStyle  Width="70px" />
                                              <ItemTemplate>
                                              
                                              <asp:Label ID="lblB" runat="server" Text='<%#Eval("BrandName")%>'></asp:Label>
                                              </ItemTemplate>
                                              </asp:TemplateField>                                           
                                              <asp:BoundField HeaderText="Opp. Score" DataField="Value" ItemStyle-Width="20px" />
                                             </Columns>
        </asp:GridView>
         </div>
        </td>

        </tr>
    </table>



        </td>
    </tr>
</table>
