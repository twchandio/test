using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using ITSec.DataAccessLayer.DataAccess;
namespace AmciSolution.Brand
{
    public partial class BrandUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtBrandID.Text == "" || txtBrandID.Text== "0")
            {
                btnSaveStakeholder.Enabled = false;
                btnResetStakeholder.Enabled = false;
            }
            if (!IsPostBack)
            {
                btnSave.Attributes.Add("OnClick", "return ValidateForm();");
                btnSaveStakeholder.Attributes.Add("OnClick", "return ValidateForm1();");
                btnPrint.Attributes.Add("OnClick", "PrintForm();");
                FillInitialValues();
               // FetchAllValuesByID(1);
                FillGrid();
              //  txtBrandID.Text = "1";
                FillStakeholderGrid();
            }
        }
        private void FillInitialValues()
        {
            try
            {
                  //oClsWrapperClass.FetchValuesInCombo("LIVE", cmbDivision, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_Division", lblMessage, "Record Not Found");
                  //cmbDivision.Items.Insert(0, "Select...");
                 // oClsWrapperClass.FetchValuesInCombo("LIVE", cmbFiscalYear, "Title", "ID", "lkpt_FiscalYear", "Usp_get_FiscalYear", lblMessage, "Record Not Found");
                  // cmbFiscalYear.Items.Insert(0, "Select...");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbBuyingMethod, "Title", "ID", "lkpt_BuyingMethod", "Usp_get_BuyingMethod", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbLiveRelationship, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbLiveBudget, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbInsideRelationship, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbInsideBudget, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbTestingRelationship, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbTestingBudget, "Title", "ID", "lkpt_AMCIDivision", "Usp_get_BrandScoring", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbPriority, "Title", "ID", "lkpt_Priority", "Usp_get_Priority", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbDepartmentOwner, "Title", "ID", "lkpt_DepartmentOwner", "Usp_get_DepartmentOwner", lblMessage, "Record Not Found");

                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbStartFiscalMonth, "Title", "ID", "lkpt_Month", "Usp_get_Month", lblMessage, "Record Not Found");
                  oClsWrapperClass.FetchValuesInCombo("LIVE", cmbEndFiscalMonth, "Title", "ID", "lkpt_Month", "Usp_get_Month", lblMessage, "Record Not Found");


                  lblBrandOperation.Text = "Add New Brand";
                  lblBrandOperation.Font.Bold = true;
                  tbMain.TabIndex = 0; 
                  //cmbBuyingMethod.Items.Insert(0, "Select...");
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            if ((txtBrandID.Text == "0") || (txtBrandID.Text == ""))
            {
               SaveBrandProfile();
            }
          else
            {
                UpdateBrandProfile();
            }
           // tbMain.ActiveTab = tbMain.Tabs[2];

            
        }

        protected void btnSaveStakeholder_Click(object sender, ImageClickEventArgs e)
        {
            if (txtBrandStakeHolderID.Text == "0" || txtBrandStakeHolderID.Text == "")
            {
                SaveStakeholder();
            }
            else
            {
                UpdateStakeholder();
            }
            
        }

        protected void btnResetStakeholder_Click(object sender, ImageClickEventArgs e)
        {
            resetStakeholder();
        }

        protected void btnResetLivingStrategicBrief_Click(object sender, ImageClickEventArgs e)
        {
            resetLivingStrategicBrief();
        }

        void resetLivingStrategicBrief()
        {
            cmbDepartmentOwner.SelectedIndex=0;
            cmbPriority.SelectedIndex = 0;
            txtAMCIOpportunity.Text = "";
            txtSituationLandscape.Text = "";
            txtClientObjectives.Text = "";
            txtTheAsk.Text="";
            txtTargetAudience.Text = "";
            txtCompetitors.Text = "";
            txtSuccessMeasures.Text = "";
            txtKnowledgeKeyPoints.Text = "";
            txtActionsToGainBusiness.Text = "";
            txtEffectiveDate.Text = "";

        }

        void resetStakeholder()
        {
            txtBrandStakeHolderID.Text = "0";
            txtDepartment.Text = "";
            txtName.Text = "";
            txtTitle.Text = "";
            chkPurchaseInfluencer.Checked = false;
        }

        protected void btnSaveRelationAndBudget_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                object[] paramValues = new object[] 
                                           {    
                                                txtBrandID.Text,
                                                cmbLiveRelationship.SelectedItem.Text,
                                                cmbLiveBudget.SelectedItem.Text,
                                                cmbInsideRelationship.SelectedItem.Text,
                                                cmbInsideBudget.SelectedItem.Text,
                                                cmbTestingRelationship.SelectedItem.Text,
                                                cmbTestingBudget.SelectedItem.Text
                                               
                                            };
                oStructResult = oClsWrapperClass.Add("LIVE", "usp_update_BrandScoreByBrandID", paramValues);
            }
            catch (Exception ee)
            {   //Exception Message
                lblMessage.Text = ee.Message.ToString();
            }
            if (oStructResult.intCode == 1)
            {
                FetchBrandScoreCalculationByBrandID();
                FillStakeholderGrid();
                txtBrandStakeHolderID.Text = "";
                resetStakeholder();
                //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been Updated successfully');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }

            }
        }
           
        protected void btnSaveLivingStrategicBrief_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                object[] paramValues = new object[] 
                                           {    
                                                txtBrandID.Text,
                                                cmbPriority.SelectedValue,
                                                txtEffectiveDate.Text,
                                                txtAMCIOpportunity.Text,
                                                txtSituationLandscape.Text,
                                                txtClientObjectives.Text,
                                                cmbDepartmentOwner.SelectedValue,
                                                txtTheAsk.Text,
                                                txtTargetAudience.Text,
                                                txtCompetitors.Text,
                                                txtSuccessMeasures.Text,
                                                txtKnowledgeKeyPoints.Text,
                                                txtActionsToGainBusiness.Text

                                               
                                            };
                oStructResult = oClsWrapperClass.Add("LIVE", "usp_update_LivingStrategicBriefByBrandID", paramValues);
            }
            catch (Exception ee)
            {   //Exception Message
                lblMessage.Text = ee.Message.ToString();
            }
            if (oStructResult.intCode == 1)
            {
                FetchBrandScoreCalculationByBrandID();
                FillStakeholderGrid();
                txtBrandStakeHolderID.Text = "";
                resetStakeholder();
                //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been Updated successfully');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }
               
            }


            //tbMain.ActiveTab = tbMain.Tabs[3];
        }
        protected void btnResetRelationAndBudget_Click(object sender, ImageClickEventArgs e)
        {
            cmbLiveRelationship.SelectedIndex=0;
            cmbLiveBudget.SelectedIndex=0;
            cmbInsideRelationship.SelectedIndex=0;
            cmbInsideBudget.SelectedIndex=0;
            cmbTestingRelationship.SelectedIndex=0;
            cmbTestingBudget.SelectedIndex = 0;
        }



        private void SaveStakeholder()
        {
            object[] ParamValues = new object[]{
                                                txtBrandID.Text,
                                                txtDepartment.Text,
                                                txtName.Text,
                                                txtTitle.Text,
                                                (chkPurchaseInfluencer.Checked==true?1:2),
                                                null
                                               };
            oStructResult = oClsWrapperClass.Add("live", "usp_add_BrandStackholder", ParamValues);
            if (oStructResult.intCode == 1)
            {
                resetStakeholder();
                FillStakeholderGrid();
                btnSaveStakeholder.Enabled = true;
                btnResetStakeholder.Enabled = true;
                //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been saved successfully');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }
            }
        }

        private void UpdateStakeholder()
        {
            try
            {
                object[] paramValues = new object[] 
                                           {    txtBrandStakeHolderID.Text,
                                                txtBrandID.Text,
                                                txtDepartment.Text,
                                                txtName.Text,
                                                txtTitle.Text,
                                                (chkPurchaseInfluencer.Checked==true?1:2)
                                               
                                            };
                oStructResult = oClsWrapperClass.Add("LIVE", "usp_update_BrandStackholderByBrandStakeHolderID", paramValues);
            }
            catch (Exception ee)
            {   //Exception Message
                lblMessage.Text = ee.Message.ToString();
            }
            if (oStructResult.intCode == 1)
            {
                FillStakeholderGrid();
                txtBrandStakeHolderID.Text = "";
                resetStakeholder();
                //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been Updated successfully');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }

            }

        }

      private void SaveBrandProfile()
      {
          object[] ParamValues = new object[]{
                                                txtOEM.Text,                      
                                                txtBrand.Text,                           
                                                upldBrandLogo.PostedFile.FileName,
                                                txtCorBrandValues.Text,           
                                                txtBrandLevelObjective.Text,
                                                cmbStartFiscalMonth.SelectedValue,
                                                cmbEndFiscalMonth.SelectedValue,
                                                cmbBuyingMethod.SelectedValue,    
                                                //cmbDivision.SelectedValue,       
                                                txtKeyPartnership.Text,          
                                                txtBusinessDevelopment.Text,  
                                                txtProductLineActivity.Text, 
                                                txtPastAMCIProgramsOfNote.Text,
                                                null
                                               };
          oStructResult = oClsWrapperClass.Add("live", "usp_add_Brand", ParamValues);
          
          if (oStructResult.intCode == 1)
          {
              txtBrandID.Text = oStructResult.intPkCode.ToString();
              FillGrid();
              lblBrandName1.Text = txtBrand.Text;
              lblBrandName2.Text = txtBrand.Text;
              lblBrandName3.Text = txtBrand.Text;
              //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
              String csName = "ButtonClickScript";
              Type csType = this.GetType();
              ClientScriptManager cs = Page.ClientScript;
              if (!cs.IsClientScriptBlockRegistered(csType, csName))
              {
                 String csText = "<script language='javascript'>alert('Record has been saved successfully');</script>";
                 cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
              }
          }
      }

      private void UpdateBrandProfile()
      {
          //txtProductLineActivity.Text,
          try
          {
                 object[] paramValues = new object[] 
                                           {    txtBrandID.Text,
                                                txtOEM.Text,                      
                                                txtBrand.Text,                           
                                                upldBrandLogo.PostedFile.FileName,
                                                txtCorBrandValues.Text,           
                                                txtBrandLevelObjective.Text,     
                                                cmbStartFiscalMonth.SelectedValue,     
                                                cmbEndFiscalMonth.SelectedValue,
                                                cmbBuyingMethod.SelectedValue,    
                                               // cmbDivision.SelectedValue,       
                                                txtKeyPartnership.Text,          
                                                txtBusinessDevelopment.Text,  
                                                txtProductLineActivity.Text, 
                                                txtPastAMCIProgramsOfNote.Text
          };
                 oStructResult = oClsWrapperClass.Add("LIVE", "usp_Update_BrandByBrandID", paramValues);
          }
          catch (Exception ee)
          {   //Exception Message
              lblMessage.Text = ee.Message.ToString();
          }
          if (oStructResult.intCode == 1)
          {
              lblBrandName1.Text = txtBrand.Text;
              lblBrandName2.Text = txtBrand.Text;
              lblBrandName3.Text = txtBrand.Text;
              FillGrid();
              //txtHdnBankID.Value = oStructResult.intPkCode.ToString();
              String csName = "ButtonClickScript";
              Type csType = this.GetType();
              ClientScriptManager cs = Page.ClientScript;
              if (!cs.IsClientScriptBlockRegistered(csType, csName))
              {
                  String csText = "<script language='javascript'>alert('Record has been Updated successfully');</script>";
                  cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
              }

          }

      }

      protected void btnBrandScore_Click(object sender, ImageClickEventArgs e)
      {
        //  tbMain.ActiveTab = tbMain.Tabs[4];
      }


        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
           /* cmbDivision.SelectedIndex = 0;
            txtBrand.Text = "";
            txtOEM.Text = "";
            txtCorBrandValues.Text = "";
            txtBrandLevelObjectives.Text = "";
            txtKeyPartnership.Text = "";
            txtBusinessDevelopment.Text = "";
            cmbFiscalYear.SelectedIndex = 0;
            cmbBuyingMethod.SelectedIndex = 0;
            txtKeyStakeholder.Text = "";
            txtPurchaseInfluencers.Text = "";*/

            ClearForm();

        }

        private void FillGrid()
        {
            oStructResult = oClsWrapperClass.GetAllRecords("live", "usp_GetAllBrands", "Brand");
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                {
                    gvListing.DataSource = oStructResult.dstResult.Tables["Brand"];
                    gvListing.DataBind();
                }
                else
                {
                    gvListing.DataSource = null;
                    gvListing.DataBind();
                }
            }
        }

        private void FetchAllValuesByID(int BrandID)
        {
            WebControl[] arrWebcontrol = new WebControl[] { txtBrandID,  txtBrand, txtOEM, upldBrandLogo, txtCorBrandValues, txtBrandLevelObjective, txtKeyPartnership, txtBusinessDevelopment, cmbStartFiscalMonth,cmbEndFiscalMonth, cmbBuyingMethod };
            String[] arrFieldNames = new String[] { "BrandID", "Brand_Name", "OEM", "Brand_logo_Image", "Brand_CoreValues", "Brand_Objectives", "KeyPartnership", "AMCIBusinessDev", "StartFiscalMonthID", "EndFiscalMonthID", "BuyingMethodID" };
            String[] arrDBFieldNames = new String[] { "BrandID"};
            Object[] objDBFieldValues = new Object[] {BrandID};
            oStructResult = oClsWrapperClass.FetchSingleValues("LIVE", arrWebcontrol, arrFieldNames, "Brand", "AMCI_Get_BrandByBrandID", lblMessage, "No Rec Found", arrDBFieldNames, objDBFieldValues);
            txtBrandID.Text = BrandID.ToString();
            if (oStructResult.intCode == 1)
            { 
            
            }

        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.DeleteByID("live", "usp_DeleteBrand", new object[] { gvListing.DataKeys[gvRow.RowIndex].Value.ToString() });
            if (oStructResult.intCode == 1)
            {
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been deleted.');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }
                FillGrid();
            }
        }


        protected void btnDeleteStack_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.DeleteByID("live", "usp_DeleteBrandStackHolder", new object[] { dgStakeholderListing.DataKeys[gvRow.RowIndex].Value.ToString() });
            if (oStructResult.intCode == 1)
            {
                String csName = "ButtonClickScript";
                Type csType = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsClientScriptBlockRegistered(csType, csName))
                {
                    String csText = "<script language='javascript'>alert('Record has been deleted.');</script>";
                    cs.RegisterClientScriptBlock(csType, csName, csText.ToString());
                }
                FillStakeholderGrid();
            }
        }



        

        protected void btnEditStack_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "AMCI_Get_BrandStackHolderByID", "BrandStackHolder", new object[] { dgStakeholderListing.DataKeys[gvRow.RowIndex].Value.ToString() });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["BrandStackHolder"].Rows.Count > 0)
                {
                    DataTable tbl = oStructResult.dstResult.Tables["BrandStackHolder"];
                    txtDepartment.Text = tbl.Rows[0]["Department"].ToString();
                    txtName.Text = tbl.Rows[0]["Name"].ToString();
                    txtTitle.Text = tbl.Rows[0]["Title"].ToString();
                    txtBrandStakeHolderID.Text = tbl.Rows[0]["BrandStakeHolderID"].ToString();
                    if (tbl.Rows[0]["PurchaseInfluencer"].ToString() == "1")
                    {
                        chkPurchaseInfluencer.Checked = true;
                    }
                    else
                    {
                        chkPurchaseInfluencer.Checked = false;
                    }
                     


                }
            }

        }



        private void GetKeyStackHolder()
        {
            txtKeyStakeholder.Text = "";

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetKeyStackHolder", "Brand", new object[] { txtBrandID.Text });
            if (oStructResult.intCode == 1)
            {   
                if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                {
                    for (int i = 0; i < oStructResult.dstResult.Tables["Brand"].Rows.Count; i++)
                    {
                        txtKeyStakeholder.Text = txtKeyStakeholder.Text + oStructResult.dstResult.Tables["Brand"].Rows[i]["Name"].ToString() + "\n\r";
                    }
 
                }
                else
                {
                    txtKeyStakeholder.Text = "N/A";
                }

            }
        }


        private void GetPurchaseInfluencers()
        {
            txtPurchaseInfluencers.Text = "";
            
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetPurchaseInfluencers", "Brand", new object[] {txtBrandID.Text});
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                {
                    if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                    {
                        for (int i = 0; i < oStructResult.dstResult.Tables["Brand"].Rows.Count; i++)
                        {
                            txtPurchaseInfluencers.Text = txtPurchaseInfluencers.Text + oStructResult.dstResult.Tables["Brand"].Rows[i]["Name"].ToString() + "\n\r";
                        }

                    }

                    
                }
                else
                {
                    txtPurchaseInfluencers.Text = "N/A";
                }

            }
        }
        
        private void FetchBrandScoreByBrandID()
        {
            WebControl[] arrWebcontrol = new WebControl[] { txtBrandID, cmbLiveRelationship, cmbLiveBudget, cmbInsideRelationship, cmbInsideBudget, cmbTestingRelationship, cmbTestingBudget, lblLiveScore, lblInsideScore, lblTestingScore, lblTotalBrandScore};
            String[] arrFieldNames = new String[] { "BrandID", "LiveRelationship", "LiveBudget", "InsideRelationship", "InsideBudget", "TestingRelationship", "TestingBudget", "LiveScore", "InsideScore", "TestingScore", "TotalBrandScore" };
            String[] arrDBFieldNames = new String[] { "BrandID" };
            Object[] objDBFieldValues = new Object[] { txtBrandID.Text };
            oStructResult = oClsWrapperClass.FetchSingleValues("LIVE", arrWebcontrol, arrFieldNames, "Brand", "AMCI_Get_BrandByBrandID", lblMessage, "No Rec Found", arrDBFieldNames, objDBFieldValues);
            if (oStructResult.intCode == 1)
            {
              

            }

        }

        private void FetchBrandScoreCalculationByBrandID()
        {
            WebControl[] arrWebcontrol = new WebControl[] { txtBrandID, lblLiveScore, lblInsideScore, lblTestingScore, lblTotalBrandScore };
            String[] arrFieldNames = new String[] { "BrandID", "LiveScore", "InsideScore", "TestingScore", "TotalBrandScore" };
            String[] arrDBFieldNames = new String[] { "BrandID" };
            Object[] objDBFieldValues = new Object[] { txtBrandID.Text };
            oStructResult = oClsWrapperClass.FetchSingleValues("LIVE", arrWebcontrol, arrFieldNames, "Brand", "AMCI_Get_BrandScoreCalculationByBrandID", lblMessage, "No Rec Found", arrDBFieldNames, objDBFieldValues);
            if (oStructResult.intCode == 1)
            {


            }

        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnSaveStakeholder.Enabled = true;
            btnResetStakeholder.Enabled = true;
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "AMCI_Get_BrandByBrandID", "Brand", new object[] { gvListing.DataKeys[gvRow.RowIndex].Value.ToString() });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                {
                    lblBrandOperation.Text = "Edit Brand";
                    lblBrandOperation.Font.Bold = true;
                    DataTable tbl = oStructResult.dstResult.Tables["Brand"];
                    tbMain.ActiveTabIndex = 1;

                    txtBrandID.Text = tbl.Rows[0]["BrandID"].ToString();
                    // cmbDivision.SelectedValue = tbl.Rows[0]["AMCI_DivisionID"].ToString(); 
                    txtBrand.Text = tbl.Rows[0]["Brand_Name"].ToString();
                    txtOEM.Text = tbl.Rows[0]["OEM"].ToString();
                    txtCorBrandValues.Text = tbl.Rows[0]["Brand_CoreValues"].ToString();
                    txtBrandLevelObjective.Text = tbl.Rows[0]["Brand_Objectives"].ToString();
                    txtKeyPartnership.Text = tbl.Rows[0]["KeyPartnership"].ToString();
                    txtBusinessDevelopment.Text = tbl.Rows[0]["AMCIBusinessDev"].ToString();
                    cmbStartFiscalMonth.SelectedValue = tbl.Rows[0]["StartFiscalMonthID"].ToString();
                    cmbEndFiscalMonth.SelectedValue = tbl.Rows[0]["EndFiscalMonthID"].ToString();
                    cmbBuyingMethod.SelectedValue = tbl.Rows[0]["BuyingMethodID"].ToString();
                    txtProductLineActivity.Text = tbl.Rows[0]["ProductLineActivity"].ToString();
                    txtPastAMCIProgramsOfNote.Text = tbl.Rows[0]["PastAMCIProgramsOfNote"].ToString();

                    txtBrandNameClient.Text = tbl.Rows[0]["Brand_Name"].ToString();
                    txtInitative.Text = tbl.Rows[0]["AMCIBusinessDev"].ToString();
                    txtBrandValues.Text = tbl.Rows[0]["Brand_CoreValues"].ToString();
                    txtBrandObjectives.Text = tbl.Rows[0]["Brand_Objectives"].ToString();
                    txtBrandctivity.Text = tbl.Rows[0]["ProductLineActivity"].ToString();


                    cmbDepartmentOwner.SelectedValue = tbl.Rows[0]["DepartmentOwnerID"].ToString();
                    cmbPriority.SelectedValue = tbl.Rows[0]["PriorityID"].ToString();
                    txtAMCIOpportunity.Text = tbl.Rows[0]["AMCIOpportunity"].ToString();
                    txtSituationLandscape.Text = tbl.Rows[0]["SituationLandscape"].ToString();
                    txtClientObjectives.Text = tbl.Rows[0]["ClientObjectives"].ToString();
                    txtTheAsk.Text = tbl.Rows[0]["TheAsk"].ToString();
                    txtTargetAudience.Text = tbl.Rows[0]["TargetAudience"].ToString();
                    txtCompetitors.Text = tbl.Rows[0]["Competitors"].ToString();
                    txtSuccessMeasures.Text = tbl.Rows[0]["SuccessMeasures"].ToString();
                    txtKnowledgeKeyPoints.Text = tbl.Rows[0]["KnowledgeKeyPoints"].ToString();
                    txtActionsToGainBusiness.Text = tbl.Rows[0]["ActionsToGainBusiness"].ToString();
                    txtEffectiveDate.Text = tbl.Rows[0]["DueDate"].ToString();



                    lblBrandName1.Text = txtBrand.Text;
                    lblBrandName2.Text = txtBrand.Text;
                    lblBrandName3.Text = txtBrand.Text;
                    //lblBrandName4.Text = txtBrand.Text;
                    FillStakeholderGrid();
                    GetPurchaseInfluencers();
                    GetKeyStackHolder();
                    FetchBrandScoreByBrandID();
                }
            }

        }
        protected void gvListing_PageIndexChanging(object sender, EventArgs e)
        {
            //gvListing.PageIndex = e.NewPageIndex;
            FillGrid();
        }

        protected void dgStakeholderListing_PageIndexChanging(object sender, EventArgs e)
        {
            FillStakeholderGrid();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void ClearForm()
        {
           // cmbDivision.SelectedIndex = 0;
            txtBrandID.Text = "0";
            txtBrand.Text = "";
            txtOEM.Text = "";
            txtCorBrandValues.Text = "";
            txtBrandLevelObjective.Text = "";
            txtKeyPartnership.Text = "";
            txtBusinessDevelopment.Text = "";
            cmbStartFiscalMonth.SelectedIndex = 0;
            cmbEndFiscalMonth.SelectedIndex = 0;
            cmbBuyingMethod.SelectedIndex = 0;
            txtKeyStakeholder.Text = "";
            txtPurchaseInfluencers.Text = "";
            lblBrandOperation.Text = "Add New Brand";
            lblBrandOperation.Font.Bold = true;
            tbMain.ActiveTabIndex = 1;
            cmbLiveRelationship.SelectedValue = "0";
            cmbLiveBudget.SelectedValue = "0";
            cmbInsideRelationship.SelectedValue = "0";
            cmbInsideBudget.SelectedValue = "0";
            cmbTestingRelationship.SelectedValue = "0";
            cmbTestingBudget.SelectedValue = "0";
            lblLiveScore.Text = "";
            lblInsideScore.Text = "";
            lblTestingScore.Text = "";
            lblTotalBrandScore.Text = "";
            lblBrandName1.Text = "";
            lblBrandName2.Text = "";
            lblBrandName3.Text = "";
            txtProductLineActivity.Text = "";
            txtPastAMCIProgramsOfNote.Text="";
            dgStakeholderListing.DataSource = null;
            dgStakeholderListing.DataBind();
            resetStakeholder();
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            txtBrandID.Text = "0";
            hdnBrandID.Value = "0";
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "AMCI_Get_BrandByBrandName", "Brand", new object[] { txtBrandName.Text });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Brand"].Rows.Count > 0)
                {
                    gvListing.DataSource = oStructResult.dstResult.Tables["Brand"];
                    gvListing.DataBind();
                }
                else
                {
                    gvListing.DataSource = null;
                    gvListing.DataBind();
                }
            }
        }

       

       

        protected void StakeGrid_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

        }
        protected void StakeGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

          /*  hdnID.Value = e.Item.Cells[1].Text;
            //hdnTableName.Value

            oStructResult = oClsWrapperClass.Update("live", "usp_Del_LookUpValuesByID", new object[] { hdnTableName.Value, e.Item.Cells[1].Text });

            if (oStructResult.intCode == 1)
            {
                FillGrid();
            }
           */ 
        }

        private void FillStakeholderGrid()
        {
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_AllBrandStakeHoldersByBrandID", "Brand_StakeHolders", new object[] { txtBrandID.Text });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Brand_StakeHolders"].Rows.Count > 0)
                {
                    dgStakeholderListing.DataSource = oStructResult.dstResult.Tables["Brand_StakeHolders"];
                    dgStakeholderListing.DataBind();
                }
                else
                {
                    dgStakeholderListing.DataSource = null;
                    dgStakeholderListing.DataBind();
                }
            }
        }


        protected void dgStakeholderListing_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbllblPurchaseInfluencer = (Label)e.Row.FindControl("lblPurchaseInfluencer");
                Label lbllblPurchase = (Label)e.Row.FindControl("lblPurchase");
                {
                    if (lbllblPurchaseInfluencer.Text == "1")
                    {
                        lbllblPurchase.Text = "Yes";
                    }
                    else
                    {
                        lbllblPurchase.Text = "No";
                    }
                }
            }
        }

        protected void gvListing_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListing.PageIndex = e.NewPageIndex;
            FillGrid();
            //gvListing.DataBind();
        }


    }
}
