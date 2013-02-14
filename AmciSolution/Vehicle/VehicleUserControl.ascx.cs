using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using ITSec.DataAccessLayer.DataAccess;
using System.Data;

namespace AmciSolution.Vehicle
{
    public partial class VehicleUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSave.Attributes.Add("OnClick", "return ValidateForm();");
                FillInitialValues();
                // FetchAllValuesByID(1);
                FillGrid();
            }
        }

        private void FillGrid()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "uspSearchVehicle", "tblVehicle", new object[] { txtBrandName.Text });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tblVehicle"].Rows.Count > 0)
                {
                    gvListing.DataSource = oStructResult.dstResult.Tables["tblVehicle"];
                    gvListing.DataBind();
                }
                else
                {
                    gvListing.DataSource = null;
                    gvListing.DataBind();
                }
            }
        }

        private void FillInitialValues()
        {
            try
            {
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbRegion, "Title", "ID", "lkpt_Region", "Usp_get_Region", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbCalenderYear, "Title", "ID", "lkpt_FiscalYear", "Usp_get_FiscalYear", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbActivity, "Title", "ID", "lkpt_Activity", "Usp_get_Activity", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbCalendarMonth, "Title", "ID", "lkpt_Month", "Usp_get_Month", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbBrand, "Brand_Name", "BrandID", "Brand", "Usp_get_Brand", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbQuarter, "Title", "ID", "lkpt_Quarter", "Usp_get_Quarter", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbRating, "Title", "ID", "lkpt_Quarter", "Usp_get_Rating", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInRadioButtonList("live", rdbGlobal, "Title", "ID", "lkpt_YesNo", "Usp_get_YesNo", lblMessage, "Record NotFound", 1);
                oClsWrapperClass.FetchValuesInRadioButtonList("live", rdbSourceInfo, "Title", "ID", "lkpt_YesNo", "Usp_get_YesNo", lblMessage, "Record NotFound", 1);
                lblBrandOperation.Text = "Add New Vehicle";
                lblBrandOperation.Font.Bold = true;

                //cmbDivision.Items.Insert(0, "Select...");

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (hdnVehicleID.Value == "")
            {
                Save();
            }
            else
            {
                UpdatePanel();
            }
        }

        private void UpdatePanel()
        {
            object[] param = new object[] 
            {
                hdnVehicleID.Value,
                cmbRegion.SelectedValue,
                null,
                cmbBrand.SelectedValue,
                null,
                txtWardSegmentation.Text,
                cmbCalenderYear.SelectedValue,
                cmbQuarter.SelectedValue,
                cmbCalendarMonth.SelectedValue,
                cmbActivity.SelectedValue,
                cmbRating.SelectedValue,
                txtTimmingFactor.Text,
                rdbGlobal.SelectedValue,
                rdbSourceInfo.SelectedValue,
                txtConfidentialInfo.Text,
                txtRelevantNotes.Text,
                txtProductInformation.Text,
                txtModel.Text,
                null
                
            };
            oStructResult = oClsWrapperClass.Add("live", "usp_Add_Vehicle", param);

            if (oStructResult.intCode == 1)
            {
                FillGrid();
                tbMain.ActiveTabIndex = 0;
                Clear();
                hdnVehicleID.Value = "";
                lblBrandOperation.Text = "Add Vehicle";
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

        protected void gvListing_PageIndexChanging(object Sender, GridViewPageEventArgs e)
        {
            gvListing.PageIndex = e.NewPageIndex;
            FillGrid();
        }

        private void Clear()
        {
            
            cmbRegion.SelectedIndex = 0;
            cmbBrand.SelectedIndex = 0;
            txtWardSegmentation.Text = "";
            cmbCalenderYear.SelectedIndex = 0;
            cmbQuarter.SelectedIndex = 0;
            cmbCalendarMonth.SelectedIndex = 0;
            cmbActivity.SelectedIndex = 0;
            cmbRating.SelectedIndex = 0;
            txtTimmingFactor.Text = "";
            rdbGlobal.SelectedIndex = 0;
            rdbSourceInfo.SelectedIndex = 0;
            txtConfidentialInfo.Text = "";
            txtRelevantNotes.Text = "";
            txtProductInformation.Text = "";
            txtModel.Text = "";
             
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {

            hdnVehicleID.Value = "";
            cmbRegion.SelectedIndex = 0;
            cmbBrand.SelectedIndex = 0;
            txtWardSegmentation.Text = "";
            cmbCalenderYear.SelectedIndex = 0;
            cmbQuarter.SelectedIndex = 0;
            cmbCalendarMonth.SelectedIndex = 0;
            cmbActivity.SelectedIndex = 0;
            cmbRating.SelectedIndex = 0;
            txtTimmingFactor.Text = "";
            rdbGlobal.SelectedIndex = 0;
            rdbSourceInfo.SelectedIndex = 0;
            txtConfidentialInfo.Text = "";
            txtRelevantNotes.Text = "";
            txtProductInformation.Text = "";
            txtModel.Text = "";
            tbMain.ActiveTabIndex = 1;
            lblBrandOperation.Text = "Add Vehicle";
            lblBrandName.Text = "";
            lblModel.Text = "";
            lblLiveOpportunityScore.Text = "";
            lblInsideOpportunityScore.Text = "";
            lblTestingOpportunityScore.Text = "";
            lblTotalVehicleOpportunityScore.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "uspSearchVehicle", "tblVehicle", new object[] { txtBrandName.Text });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tblVehicle"].Rows.Count > 0)
                {
                    gvListing.DataSource = oStructResult.dstResult.Tables["tblVehicle"];
                    gvListing.DataBind();
                }
                else
                {
                    gvListing.DataSource = null;
                    gvListing.DataBind();
                }
            }
        }




        protected void btnDelete_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.DeleteByID("live", "usp_DeleteVehicle", new object[] { gvListing.DataKeys[gvRow.RowIndex].Value.ToString() });
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

        private void FillVehicleLaunchOpportunity()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_get_Vehicle_Launch_Opportunity", "tblVehicleLaunchOpportunity", new object[] { hdnBrandID.Value });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tblVehicleLaunchOpportunity"].Rows.Count > 0)
                { 
                    DataTable tblVehicleLaunchOpportunity = oStructResult.dstResult.Tables["tblVehicleLaunchOpportunity"];
                    lblBrandName.Text = tblVehicleLaunchOpportunity.Rows[0]["Brand_Name"].ToString();
                    lblModel.Text = tblVehicleLaunchOpportunity.Rows[0]["Model"].ToString();
                    lblLiveOpportunityScore.Text = tblVehicleLaunchOpportunity.Rows[0]["LiveOpportunityScore"].ToString();
                    lblInsideOpportunityScore.Text = tblVehicleLaunchOpportunity.Rows[0]["InsideOpportunityScore"].ToString();
                    lblTestingOpportunityScore.Text = tblVehicleLaunchOpportunity.Rows[0]["TestingOpportunityScore"].ToString();
                    lblTotalVehicleOpportunityScore.Text = tblVehicleLaunchOpportunity.Rows[0]["TotalVehicleOpportunityScore"].ToString();
                }
            }
            
        }




        protected void btnEdit_Click(object sender, EventArgs e)
        {
            GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "AMCI_Get_VehicleByVehicle", "Vehcile", new object[] { gvListing.DataKeys[gvRow.RowIndex].Value.ToString() });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["Vehcile"].Rows.Count > 0)
                {
                    lblBrandOperation.Text = "Edit Vehicle";
                    //lblBrandOperation.Font.Bold = true;
                    DataTable tbl = oStructResult.dstResult.Tables["Vehcile"];
                    tbMain.ActiveTabIndex = 1;
                    hdnBrandID.Value = tbl.Rows[0]["BrandID"].ToString();
                    hdnVehicleID.Value = tbl.Rows[0]["VLTHeaderID"].ToString();
                    cmbRegion.SelectedValue = tbl.Rows[0]["RegionID"].ToString();
                    cmbBrand.SelectedValue = tbl.Rows[0]["BrandID"].ToString();
                    txtWardSegmentation.Text = tbl.Rows[0]["WardSegmentation"].ToString();
                    cmbCalenderYear.SelectedValue = tbl.Rows[0]["calenderYear"].ToString();
                    cmbQuarter.SelectedValue = tbl.Rows[0]["CalendarQuarter"].ToString();
                    cmbCalendarMonth.SelectedValue = tbl.Rows[0]["CalendarMonth"].ToString();
                    cmbActivity.SelectedValue = tbl.Rows[0]["ActivityID"].ToString();
                    txtTimmingFactor.Text = tbl.Rows[0]["TimingFactor"].ToString();
                    cmbRating.SelectedValue = tbl.Rows[0]["SignificanceRating"].ToString();
                    txtConfidentialInfo.Text = tbl.Rows[0]["Confidential"].ToString();
                    txtRelevantNotes.Text = tbl.Rows[0]["RelevantNotes"].ToString();
                    txtProductInformation.Text = tbl.Rows[0]["ProductInformationSteps"].ToString();
                    txtModel.Text = tbl.Rows[0]["Model"].ToString();
                    rdbGlobal.SelectedValue = tbl.Rows[0]["Global"].ToString();
                    rdbSourceInfo.SelectedValue = tbl.Rows[0]["SourceInfo"].ToString();
                    FillVehicleLaunchOpportunity();
                    //txtBrandID.Text = tbl.Rows[0]["BrandID"].ToString();
                    //cmbDivision.SelectedValue = tbl.Rows[0]["AMCI_DivisionID"].ToString();
                    //txtBrand.Text = tbl.Rows[0]["Brand_Name"].ToString();
                    //txtOEM.Text = tbl.Rows[0]["OEM"].ToString();
                    //txtCorBrandValues.Text = tbl.Rows[0]["Brand_CoreValues"].ToString();
                    //txtBrandLevelObjectives.Text = tbl.Rows[0]["Brand_Objectives"].ToString();
                    //txtKeyPartnership.Text = tbl.Rows[0]["KeyPartnership"].ToString();
                    //txtBusinessDevelopment.Text = tbl.Rows[0]["AMCIBusinessDev"].ToString();
                    //cmbFiscalYear.SelectedValue = tbl.Rows[0]["FiscalyearID"].ToString();
                    //cmbBuyingMethod.SelectedValue = tbl.Rows[0]["BuyingMethodID"].ToString();
                }
            }
        }

        protected void btnAddnew_Click(object sender, EventArgs e)
        {
            
            hdnVehicleID.Value = "";
            cmbRegion.SelectedIndex = 0;
            cmbBrand.SelectedIndex = 0;
            txtWardSegmentation.Text = "";
            cmbCalenderYear.SelectedIndex = 0;
            cmbQuarter.SelectedIndex = 0;
            cmbCalendarMonth.SelectedIndex = 0;
            cmbActivity.SelectedIndex = 0;
            cmbRating.SelectedIndex = 0;
            txtTimmingFactor.Text = "";
            rdbGlobal.SelectedIndex = 0;
            rdbSourceInfo.SelectedIndex = 0;
            txtConfidentialInfo.Text = "";
            txtRelevantNotes.Text = "";
            txtProductInformation.Text = "";
            txtModel.Text = "";
            tbMain.ActiveTabIndex = 1;
            lblBrandOperation.Text = "Add Vehicle";
            lblBrandName.Text = "";
            lblModel.Text = "";
            lblLiveOpportunityScore.Text = "";
            lblInsideOpportunityScore.Text = "";
            lblTestingOpportunityScore.Text = "";
            lblTotalVehicleOpportunityScore.Text = "";

        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {

            hdnVehicleID.Value = "";
            cmbRegion.SelectedIndex = 0;
            cmbBrand.SelectedIndex = 0;
            txtWardSegmentation.Text = "";
            cmbCalenderYear.SelectedIndex = 0;
            cmbQuarter.SelectedIndex = 0;
            cmbCalendarMonth.SelectedIndex = 0;
            cmbActivity.SelectedIndex = 0;
            cmbRating.SelectedIndex = 0;
            txtTimmingFactor.Text = "";
            rdbGlobal.SelectedIndex = 0;
            rdbSourceInfo.SelectedIndex = 0;
            txtConfidentialInfo.Text = "";
            txtRelevantNotes.Text = "";
            txtProductInformation.Text = "";
            txtModel.Text = "";
        }


        private void Save()
        {
            object[] param = new object[] 
            {
                hdnVehicleID.Value,
                cmbRegion.SelectedValue,
                null,
                cmbBrand.SelectedValue,
                null,
                txtWardSegmentation.Text,
                cmbCalenderYear.SelectedValue,
                cmbQuarter.SelectedValue,
                cmbCalendarMonth.SelectedValue,
                cmbActivity.SelectedValue,
                cmbRating.SelectedValue,
                txtTimmingFactor.Text,
                rdbGlobal.SelectedValue,
                rdbSourceInfo.SelectedValue,
                txtConfidentialInfo.Text,
                txtRelevantNotes.Text,
                txtProductInformation.Text,
                txtModel.Text,
                null
                
            };
            oStructResult = oClsWrapperClass.Add("live", "usp_Add_Vehicle", param);

            if (oStructResult.intCode == 1)
            {
                FillGrid();
                tbMain.ActiveTabIndex = 0;
                Clear();
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
    }
}
