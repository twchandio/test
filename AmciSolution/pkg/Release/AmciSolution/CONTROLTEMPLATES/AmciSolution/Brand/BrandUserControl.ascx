<%@ Assembly Name="AmciSolution, Version=1.0.0.0, Culture=neutral, PublicKeyToken=440ea07d0cb818b2" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"  %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BrandUserControl.ascx.cs" Inherits="AmciSolution.Brand.BrandUserControl" %>
<SharePoint:ScriptLink ID="ScriptLink1" Name="/_layouts/1033/AMCI/Scripts/niceforms.js" runat="server" />
<SharePoint:ScriptLink ID="ScriptLink2" Name="/_layouts/1033/AMCI/Scripts/jquery-1.2.6.js" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration2" Name="/_layouts/1033/AMCI/Styles/NewTab.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration3" Name="/_layouts/1033/AMCI/Styles/Controls.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration4" Name="/_layouts/1033/AMCI/Styles/login.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration5" Name="/_layouts/1033/AMCI/Styles/igoogle-classic.css" runat="server" After="corev4.css" />
<SharePoint:CssRegistration ID="CssRegistration6" Name="/_layouts/1033/AMCI/Styles/radcalendar.css" runat="server" After="corev4.css" />
<style type="text/css">
        body
        {
        	background-color:#c0c0c0;
        	font-size:11px;
        	font-family:Arial;
        	}
        	.elementscolor{ background-color:#B7BF86;
        	               Color:White;}
        .style2
        {
            width: 215px;
        }
        .style3
        {
            width: 118px;
        }
       .style4
        {
            width: 144px;
        }
        
  
        
        .style5
        {
            width: 101px;
        }
                
       
       /* CSS from older **/ 
         body
         {
           font-family : Arial, Helvetica, sans-serif;
           font-size: 13px;
         }

        .content, .contentA
         {
            padding: 10px;
            /*width: 370px;*/
         }

        .left
         {
            width: 150px;
            float: left;
            padding: 7px 0px 0px 7px;
            min-height: 24px;
         }

        .right
         {
            width: 200px;
            float: left;
            padding: 5px;
            min-height: 24px;
         }
         .clear
          {
            float: none;
            clear: both;
            height: 0px;
           }
           
        .row
         {
           background-color: transparent;
           display: block;
           min-height: 32px;
         }

        .text
         {
            width: 186px;
         }
        .ruler
        {
            width: 400px;
            border-bottom: dashed 1px #dcdcdc;
        }

       tr:focus
        {
           background-color: #fcfcf0;
        }

        td
         {
            vertical-align: top;
         }
         
        .over
          {
             background-color: #e6e2af;
          }
        .out
         {
            background-color: transparent;
         }

        .red
          {
            color: #FF0000;
          }
          
           .cssPager span {  font-size:18px;}    
           .cssPager td
            {
                  padding-left: 4px;     
                  padding-right: 4px;    
            }
       
          
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.content .left, .content input, .content textarea, .content select').focus(function () {
                $(this).parents('.content').addClass("over");
            }).blur(function () {
                $(this).parents('.content').removeClass("over");
            });
            $('.contentA .left, .contentA input, .contentA textarea, .contentA select').focus(function () {
                $(this).parents('.row').addClass("over");
            }).blur(function () {
                $(this).parents('.row').removeClass("over");
            });
        });
     </script>
     <script type="text/javascript">
       function ValidateForm() 
         {

         }
     </script>
     <div style="width: 890px; margin:0px auto;  background-color:#EDF8D1; border:2px groove black;">
     <ajaxtoolkit:tabcontainer ID="tbMain" runat="server" ActiveTabIndex="0" CssClass="Tab">
     <ajaxToolkit:TabPanel ID="pnlListing" runat="server">
     <HeaderTemplate>
          Brand Management
     
</HeaderTemplate>
     <ContentTemplate>
     <table style="width:100%">
   
  
   <tr>
   <td 
           style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" 
           class="style1">
    <b style="margin-left:300px;"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></b></td>
   <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1">
   
    </td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Div4" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   
   
   
   
   </table>
     <table width="100%">
      <tr>
       <td align="left" style="width:600px;">
            Brand Name
            <asp:TextBox ID="txtBrandName" Width="210px" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </td>
    <td  align="right">
       <asp:Button ID="btnAddNew" runat="server" Text="Add new brand" onclick="btnAddNew_Click" />
     </td>
     </tr>
     </table>
     <table width="100%">
     <tr>
    <td>
    <asp:GridView ID="gvListing" runat="server" AllowPaging="True" 
                                              AutoGenerateColumns="False" CssClass="igoogle igoogle-classic" 
                                              DataKeyNames="BrandID" EnableModelValidation="True" 
                                              OnPageIndexChanging="gvListing_PageIndexChanging" 
                                              PageSize="10" 
                                              PagerStyle-CssClass="cssPager"
                                              Width="100%">
    <AlternatingRowStyle CssClass="alt-data-row"/>
        <Columns>
        <asp:BoundField HeaderText="Brand Name" DataField="Brand_Name" />
        <asp:BoundField HeaderText="OEM" DataField="OEM" />
        <asp:BoundField HeaderText="Core Brand Values" DataField="Brand_CoreValues" />
        
         <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>

            <asp:ImageButton runat="server" ImageUrl="/_layouts/1033/AMCI/Images/editRecord.png" ToolTip="Edit Record" OnClick="btnEdit_Click"   ID="btnEdit" />
            </ItemTemplate>

            
        
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>

            <asp:ImageButton runat="server" ImageUrl="/_layouts/1033/AMCI/Images/DeleteRed.png" ToolTip="Delete Record" OnClick="btnDelete_Click" Visible="true"   ID="btnDelete" />
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
    <asp:Label ID="txtBrandStakeHolderID" runat="server" Visible="False"></asp:Label>
</td>
</tr>
 </table>
</ContentTemplate>

</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="pnlGrid" runat="server">
  <HeaderTemplate> 
     
    Brand Profile
</HeaderTemplate>
<ContentTemplate>
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
   <td colspan="2"><div Id="Div2" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
  </table>
  <table style=" width:100%; margin:0px auto;">
      <tr>
         <td colspan="4" align="center">
            <h1>
                <asp:Label ID="lblBrandOperation" runat="server"></asp:Label>
            </h3>
        </td>
        </tr>
      <tr>
      <td valign="middle" class="style3" align="right" style="font-weight: bold">Brand
      </td>
      <td class="style2">
          <asp:TextBox ID="txtBrand" runat="server"  
              Width="210px" CssClass="elementscolor"></asp:TextBox>
        </td>

        
    <td align="right" class="style4" style="font-weight: bold">OEM</td>
        <td class="style5">
            <asp:TextBox ID="txtOEM" runat="server" CssClass="elementscolor" Width="207px"></asp:TextBox>
        </td>
       
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    
         <td valign="middle" class="style3" align="right" style="font-weight: bold">Brand Logo 
        </td>
        <td class="style2">
           
          <asp:FileUpload ID="upldBrandLogo" runat="server" Width="203px" 
            Font-Size="10pt" CssClass="elementscolor" />
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4"><div Id="Horizontalbar" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td></tr>
     <tr>
     <td align="right" style="font-weight: bold">Core Brand Values</td>
     <td class="style2">
         <asp:TextBox ID="txtCorBrandValues" runat="server" Height="84px" 
             TextMode="MultiLine" Width="211px" CssClass="elementscolor"></asp:TextBox></td>
             <td class="style4" align="right" style="font-weight: bold">Brand Level Objectives</td>
     <td align="left" class="style5">
         <asp:TextBox ID="txtBrandLevelObjectives" runat="server" Height="84px" TextMode="MultiLine" 
             Width="210px" CssClass="elementscolor"></asp:TextBox>
         </td>
     </tr>
     <tr><td>&nbsp;</td></tr>
     <tr>
     <td align="right" style="font-weight: bold">Key Partnership</td>
     <td class="style2">
         <asp:TextBox ID="txtKeyPartnership" runat="server" Height="84px" 
             TextMode="MultiLine" Width="210px" CssClass="elementscolor"></asp:TextBox></td>
             <td class="style4" align="right" style="font-weight: bold">AMCI Business Development</td>
     <td align="left" class="style5" >
         <asp:TextBox ID="txtBusinessDevelopment" runat="server" Height="84px" TextMode="MultiLine" 
             Width="210px" CssClass="elementscolor"></asp:TextBox>
         </td>
     </tr>
    <tr><td colspan="4"><div Id="Div1" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td></tr>
     <tr>
     <td align="right" style="font-weight: bold">Fiscal Year</td>
     <td class="style2">
         <asp:DropDownList ID="cmbFiscalYear" runat="server" Height="23px" 
             Width="210px" CssClass="elementscolor">
         </asp:DropDownList>
     </td>
     <td align="right" style="font-weight: bold">Buying Method</td><td>
         <asp:DropDownList ID="cmbBuyingMethod" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList>
     </td>
     </tr>
     <tr><td>&nbsp;</td></tr>
     <tr>
     <td align="right" style="font-weight: bold">Key Stakeholders</td>
     <td align="left" class="style2">
         <asp:TextBox ID="txtKeyStakeholder" runat="server" Height="84px" 
             ReadOnly="True" TextMode="MultiLine" Width="210px" 
             CssClass="elementscolor"></asp:TextBox>
     </td>
      <td align="right" style="font-weight: bold">Purchase Influencers</td><td>
         <asp:TextBox ID="txtPurchaseInfluencers" runat="server" Height="84px" 
             ReadOnly="True" TextMode="MultiLine" Width="210px" 
             CssClass="elementscolor"></asp:TextBox>
     </td>
     </tr>
     <tr><td></td></tr>
     <tr><td colspan="4" align="center">
         <asp:ImageButton ID="btnSave" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/next.png" onclick="btnSave_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:ImageButton ID="btnReset" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/Reset.png" onclick="btnReset_Click" />
         </td></tr>
          <tr><td>&nbsp;</td></tr>
           <tr><td> 
                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td></tr>
   </table>
</ContentTemplate>
</ajaxToolkit:TabPanel>


<ajaxToolkit:TabPanel ID="RelationshipAndBudget" runat="server">
  <HeaderTemplate> 
     Brand Relationship and Budget
</HeaderTemplate>
<ContentTemplate>
<table style="width:100%">
 <tr>
   <td 
     style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" class="style1">
    <b style="margin-left:300px;"><asp:Label ID="Label4" runat="server" Text=""></asp:Label></b></td>
    <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1">
   
    </td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Div5" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   </table>
   <table style="margin:0px auto;table-layout:fixed;width:383px;">
     <tr>
         <td align="left" style="font-weight:bold;">Brand </td>
        <td align="left" style="font-weight:bold;"><asp:Label ID="lblBrandName1" runat="server" Text=""></asp:Label></td>
       </tr>
      <tr>
         <td align="left" style="font-weight:bold;">Live Relationship</td>
         <td><asp:DropDownList ID="cmbLiveRelationship" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList>
             </td>
      </tr>

       <tr>
         <td align="left" style="font-weight:bold;">Live Budget</td>
         <td><asp:DropDownList ID="cmbLiveBudget" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList></td>
      </tr>

        <tr>
         <td align="left" style="font-weight:bold;">Inside Relationship</td>
         <td><asp:DropDownList ID="cmbInsideRelationship" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList></td>
      </tr>

        <tr>
         <td align="left" style="font-weight:bold;">Inside Budget
         <td><asp:DropDownList ID="cmbInsideBudget" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList></td>
      </tr>

       <tr>
         <td align="left" style="font-weight:bold;">Testing Relationship</td>
         <td><asp:DropDownList ID="cmbTestingRelationship" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList></td>
      </tr>
        <tr>
         <td align="left" style="font-weight:bold;">Testing Budget</td>
         <td><asp:DropDownList ID="cmbTestingBudget" runat="server" Height="21px" 
             Width="211px" CssClass="elementscolor">
         </asp:DropDownList></td>
      </tr>
       <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
     </tr>

     <tr><td colspan="2" align="center">
         <asp:ImageButton ID="btnSaveRelationAndBudget" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/next.png" onclick="btnSaveRelationAndBudget_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:ImageButton ID="btnResetRelationAndBudget" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/Reset.png" onclick="btnResetRelationAndBudget_Click" />
         </td></tr>
   </table>
</ContentTemplate>
</ajaxToolkit:TabPanel>




<ajaxToolkit:TabPanel ID="BrandScore" runat="server">
  <HeaderTemplate> 
     Brand Score
</HeaderTemplate>
<ContentTemplate>
<table style="width:100%">
  <tr>
   <td 
           style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" 
           class="style1">
    <b style="margin-left:300px;"><asp:Label ID="Label5" runat="server" Text=""></asp:Label></b></td>
   <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1"></td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Div6" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   </table>
     <table style="margin:0px auto;table-layout:fixed;width:383px;">
         <tr>
             <td align="left" style="font-weight:bold;">Brand </td>
            <td align="left" style="font-weight:bold;">
                <asp:Label ID="lblBrandName3" runat="server" Text=""> </asp:Label></td>

         </tr>
       <tr>
           <td align="left" style="width:50px;font-weight:bold;">Live Score</td>
           <td align="left"><asp:Label ID="lblLiveScore" runat="server" Text=""> </asp:Label></td>
        </tr>
         <tr>
           <td align="left" style="width:50px;font-weight:bold;">Inside Score</td>
           <td align="left"><asp:Label ID="lblInsideScore" runat="server" Text=""> </asp:Label></td>
        </tr>
         <tr>
           <td align="left" style="width:50px;font-weight:bold;">Testing Score</td>
           <td align="left"><asp:Label ID="lblTestingScore" runat="server" Text=""> </asp:Label></td>
        </tr>
         <tr>
           <td align="left" style="width:50px;font-weight:bold;">Total Brand Score</td>
           <td align="left"><asp:Label ID="lblTotalBrandScore" runat="server" Text=""> </asp:Label></td>
        </tr>

        <tr><td   align="center" colspan="2">
         <asp:ImageButton ID="btnBrandScore" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/next.png" onclick="btnBrandScore_Click" />
           
         </td></tr>
          <tr>
           <td>&nbsp;</td>
          </tr>
      </table>
    </ContentTemplate>
  </ajaxToolkit:TabPanel>


<ajaxToolkit:TabPanel ID="Stackholders" runat="server">
  <HeaderTemplate> 
     Stackholders
</HeaderTemplate>
<ContentTemplate>
<table style="width:100%">
  <tr>
   <td 
           style=" font-weight: bold; background:url(/_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt; margin-left:200px;" 
           class="style1">
    <b style="margin-left:300px;"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></b></td>
   <td align="center" style=" font-weight: bold; background:url(_layouts/1033/AMCI/Images/headerbg.png) repeat-x;font-family:Arial; font-size:18pt;" class="style1"></td>
   </tr>
   <tr>
   <td colspan="2"><div Id="Div3" runat="server" style=" width:100%; height:1px; margin:10px auto; background-color:#DCDACE"></div></td>
   </tr>
   </table>
     <table style="margin:0px auto;table-layout:fixed;width:383px;">
         <tr>
          <td align="left" style="font-weight:bold;">Brand </td>
               <td align="left" style="font-weight:bold;"><asp:Label ID="lblBrandName2" runat="server" Text=""> </asp:Label></td>
             
         </tr>
       <tr>
         <td align="left" style="width:50px;font-weight:bold;">Department</td>
         <td align="left"><asp:TextBox ID="txtDepartment" runat="server" CssClass="elementscolor"></asp:TextBox></td>
        
       </tr>

        <tr>
         <td align="left" style="font-weight:bold;">Name</td>
         <td align="left"><asp:TextBox ID="txtName" runat="server" CssClass="elementscolor"></asp:TextBox></td>
        
       </tr>
       <tr>
           <td align="left" style="font-weight:bold;">Title</td>
           <td align="left"><asp:TextBox ID="txtTitle" runat="server" CssClass="elementscolor"></asp:TextBox></td>
          
       </tr>
       <tr>
           <td align="left" style="font-weight:bold;">Purchase Influencer <asp:CheckBox ID="chkPurchaseInfluencer" runat="server" /></td>
        </tr>
        <tr><td   align="center" colspan="2">
         <asp:ImageButton ID="btnSaveStakeholder" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/Save.png" onclick="btnSaveStakeholder_Click" />
            &nbsp;&nbsp;
         <asp:ImageButton ID="btnResetStakeholder" runat="server" 
             ImageUrl="/_layouts/1033/AMCI/Images/Reset.png" onclick="btnResetStakeholder_Click" />
         </td></tr>
          <tr>
           <td>&nbsp;</td>
          </tr>
          <tr>
           <td>&nbsp;</td>
          </tr>
          <tr>
           <td align="center"">
               <asp:GridView ID="dgStakeholderListing" runat="server" AllowPaging="True" 
                                              AutoGenerateColumns="False" CssClass="igoogle igoogle-classic" 
                                              DataKeyNames="BrandStakeHolderID" EnableModelValidation="True" 
                                              OnPageIndexChanging="dgStakeholderListing_PageIndexChanging" 
                                              OnRowDataBound="dgStakeholderListing_RowDataBound"
                                              PageSize="7"  
                                              Width="100%">
    <AlternatingRowStyle CssClass="alt-data-row" />
        <Columns>
        
         <asp:BoundField HeaderText="Stakeholder" DataField="StakeholderName" />
        <asp:BoundField HeaderText="Department" DataField="StakeholderDepartment" />
        <asp:BoundField HeaderText="Title" DataField="Title" />
         <asp:TemplateField HeaderText="Purchase Influencer">
            <ItemTemplate>
             <asp:Label ID="lblPurchase" runat="server"></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
         
           <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
            <asp:Label ID="lblPurchaseInfluencer" Visible="false" runat="server" Text='<%# Eval("PurchaseInfluencer") %>'></asp:Label>
            <asp:ImageButton runat="server" ImageUrl="/_layouts/1033/AMCI/Images/editRecord.png" ToolTip="Edit Record" OnClick="btnEditStack_Click"   ID="btnEdit" />
            </ItemTemplate>

            
        
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>

            <asp:ImageButton runat="server" ImageUrl="/_layouts/1033/AMCI/Images/DeleteRed.png" ToolTip="Delete Record" OnClick="btnDeleteStack_Click"   ID="btnDelete" />
            </ItemTemplate>

            
        
        </asp:TemplateField>

       </Columns>
    </asp:GridView>
           </td>
          </tr>


     </table>
</ContentTemplate>
</ajaxToolkit:TabPanel>
</ajaxtoolkit:tabcontainer>
</div>
