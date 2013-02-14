<%@ Assembly Name="AmciSolution, Version=1.0.0.0, Culture=neutral, PublicKeyToken=440ea07d0cb818b2" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="lkptTablesUserControl.ascx.cs" Inherits="AmciSolution.lkptTables.lkptTablesUserControl" %>
<style type="text/css">
         body
        {
        	font-family:Arial;
        	background-color: #EEEEEE;
        	font-size:11px;
        	}
    #maindiv
    {
    	width:960px;
    	height:auto;
    	margin:10px auto;
    	}
        
        .style2
        {
            width: 212px;
        }
        
        .style3
        {
            width: 164px;
        }
        
    </style>
    <script language="javascript">

        function ValidateForm() {



            if (document.getElementById('<%= txtTitle.ClientID %>').value == "") {
                alert("Please enter Title");
                document.getElementById('<%= txtTitle.ClientID %>').focus();
                return false;
            }


        }
    </script>

    <div id="maindiv" style="background-color:#EDF8D1; border:2px groove black;">
    <fieldset style="  border:1px solid #EDF8D1; text-align:center" >
    <legend style="color:Black; font-size:18pt; font-weight:bold; width: 900px; text-align:center">Lookup Management</legend>
    <table style="width:800px;margin:0px auto;">
    
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td align="right" style="font-weight: bold;">Select Lookup</td>
    <td class="style2">
        <asp:DropDownList ID="cmbTable" runat="server" Height="23px" 
            Width="210px" BackColor="#B7BF86" ForeColor="White" >
        </asp:DropDownList>
    </td>
    <td align="left" style="font-weight: bold" class="style3">
        <asp:ImageButton ID="btnFind" runat="server" 
            ImageUrl="/_layouts/1033/AMCI/Images/find.png" onclick="btnFind_Click" /></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td align="right" style="font-weight: bold">Title</td>
    <td class="style2">
        <asp:TextBox ID="txtTitle" runat="server" Height="18px" Width="207px" 
            BackColor="#B7BF86" ForeColor="White" 
            ></asp:TextBox>
    </td>
    <td align="right" style="font-weight: bold" class="style3">Short Description</td>
    <td class="style2">
        <asp:TextBox ID="txtShortDesc" runat="server" Height="18px" 
            Width="210px" BackColor="#B7BF86" ForeColor="White" ></asp:TextBox>
    </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    <td align="right"  style="font-weight: bold;">Long Description</td>
    <td colspan="3">
        <asp:TextBox ID="txtLongDesc" runat="server" Height="100px" 
            Width="595px" TextMode="MultiLine" BackColor="#B7BF86" 
            ForeColor="White" ></asp:TextBox></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
       <tr><td colspan="4" align="center">
        <asp:ImageButton ID="btnSave" runat="server" 
            ImageUrl="/_layouts/1033/AMCI/Images/save.png" onclick="btnSave_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btnReset" runat="server" 
            ImageUrl="/_layouts/1033/AMCI/Images/Reset.png" onclick="btnReset_Click" />
        </td></tr>
        <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4"><div Id="Horizontalbar" runat="server" style="width:100%; height:1px; margin:0px auto; background-color:#DCDACE"></div></td></tr>
     <tr><td>&nbsp;</td></tr>
     <tr> 
     <td>&nbsp;</td>
     <td colspan="3">
        <asp:DataGrid ID="dgTableListing" runat="server" border="2" PageSize="25" 
                valign="top" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None"
             emptydatatext="There are no data records to display."
             OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand" 
             Width="100%">
          <Columns>   
	            <asp:templatecolumn headertext="S.no">       
                    <itemtemplate>                   
                        <%# (dgTableListing.PageSize * dgTableListing.CurrentPageIndex) + Container.ItemIndex + 1%>
                    </itemtemplate> 
                    <HeaderStyle BackColor="#eaf2dd" forecolor="#000000"  Font-Bold="True"></HeaderStyle> <ItemStyle   Width="100" VerticalAlign="Top" />                
               </asp:templatecolumn>  
               <asp:BoundColumn HeaderText="ID" DataField="ID"></asp:boundcolumn>
                             
               
                <asp:BoundColumn HeaderText="Title" DataField="Title">
                        <HeaderStyle BackColor="#eaf2dd"  forecolor="#000000" Font-Bold="True" ></HeaderStyle>
	            </asp:BoundColumn>

                <asp:BoundColumn HeaderText="Description" DataField="ShortDesc">
                        <HeaderStyle BackColor="#eaf2dd"  forecolor="#000000" Font-Bold="True" ></HeaderStyle>
	            </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Long Desc" DataField="LongDesc">
                        <HeaderStyle BackColor="#eaf2dd"  forecolor="#000000" Font-Bold="True" ></HeaderStyle>
	            </asp:BoundColumn>

                
                   <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit">
                   <HeaderStyle BackColor="#eaf2dd"  forecolor="#000000" Font-Bold="True" ></HeaderStyle>
                   </asp:EditCommandColumn>
                   <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete">
                   <HeaderStyle BackColor="#eaf2dd"  forecolor="#000000" Font-Bold="True" ></HeaderStyle>
                   </asp:ButtonColumn>
                             

           </Columns>
          <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
           <AlternatingItemStyle BackColor="White" />
           <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" Font-Name="Arial"   Font-Size="Smaller"/>
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#ffffff" Font-Name="Arial Font-Size="Small"/>
       </asp:DataGrid>
     </td></tr>
       <tr><td> <asp:HiddenField ID="hdnTableName" runat="server" />
            <asp:HiddenField ID="hdnID" runat="server" />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td></tr>
    </table>
        </fieldset>
    </div>
