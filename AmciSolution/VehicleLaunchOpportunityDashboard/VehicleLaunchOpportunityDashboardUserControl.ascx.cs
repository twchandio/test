using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using ITSec.DataAccessLayer.DataAccess;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.IO;
using System.ComponentModel;
using System.Drawing;
using System.Web;
using System.Globalization;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Drawing;

namespace AmciSolution.VehicleLaunchOpportunityDashboard
{
    public partial class VehicleLaunchOpportunityDashboardUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        structResult oStructResult1 = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillInitialValues();
                TopBrandsKeyLaunches();
                DivisionVehicleLaunchOpportunityQuarterLive();

                DivisionVehicleLaunchOpportunityQuarterLive();
                DivisionVehicleLaunchOpportunityQuarterInside();
                DivisionVehicleLaunchOpportunityQuarterTesting();


            }
        }

        private void FillInitialValues()
        {
            try
            {
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbRegion, "Title", "ID", "lkpt_Region", "Usp_get_Region", lblMessage, "Record Not Found");
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbFiscalYear, "Title", "ID", "lkpt_FiscalYear", "Usp_get_FiscalYear", lblMessage, "Record Not Found");
                cmbFiscalYear.SelectedIndex = 2;

            }
            catch (Exception ex)
            {

            }
        }
        private void DivisionVehicleLaunchOpportunityQuarterLive()
        {

            oStructResult1 = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_DivisionVehicleLaunchOpportunityQuarterLive", "tbl", new object[] { cmbFiscalYear.SelectedValue, cmbRegion.SelectedValue });
            if (oStructResult.intCode == 1)
            {

                int Count0 = oStructResult1.dstResult.Tables[0].Rows.Count;
                int Count1 = oStructResult1.dstResult.Tables[1].Rows.Count;
                int Count2 = oStructResult1.dstResult.Tables[2].Rows.Count;
                int Count3 = oStructResult1.dstResult.Tables[3].Rows.Count;
                int max = 0;
                if (Count0 > Count1)
                {
                    max = Count0;
                }
                else
                {
                    max = Count1;
                }
                if (Count2 > max)
                {
                    max = Count2;
                }
                if (Count3 > max)
                {
                    max = Count3;
                }

                if (Count0 > 0 || Count1 > 0 || Count2 > 0 || Count3 > 0)
                {
                    lbYearlLive.Visible = true;
                    TDLive.Visible = true;
                    lbYearlLive.Text = oStructResult1.dstResult.Tables[4].Rows[0]["Title"].ToString();
                }
                else
                {
                    TDLive.Visible = false;
                    lbYearlLive.Text = "";
                    lbYearlLive.Visible = false;
                }

                for (int i = 0; i < max - Count0; i++)
                {


                    DataRow dRow = oStructResult1.dstResult.Tables[0].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult1.dstResult.Tables[0].Rows.Add(dRow);
                }

                for (int i = 0; i < max - Count1; i++)
                {

                    DataRow dRow = oStructResult1.dstResult.Tables[1].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult1.dstResult.Tables[1].Rows.Add(dRow);
                }



                for (int i = 0; i < max - Count2; i++)
                {

                    DataRow dRow = oStructResult1.dstResult.Tables[2].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult1.dstResult.Tables[2].Rows.Add(dRow);
                }
                for (int i = 0; i < max - Count3; i++)
                {

                    DataRow dRow = oStructResult1.dstResult.Tables[3].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult1.dstResult.Tables[3].Rows.Add(dRow);
                }




                gvDivisionVehicleLaunchOpportunityQuarterLive1.DataSource = oStructResult1.dstResult.Tables[0];
                gvDivisionVehicleLaunchOpportunityQuarterLive1.DataBind();

                gvDivisionVehicleLaunchOpportunityQuarterLive2.DataSource = oStructResult1.dstResult.Tables[1];
                gvDivisionVehicleLaunchOpportunityQuarterLive2.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterLive3.DataSource = oStructResult1.dstResult.Tables[2];
                gvDivisionVehicleLaunchOpportunityQuarterLive3.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterLive4.DataSource = oStructResult1.dstResult.Tables[3];
                gvDivisionVehicleLaunchOpportunityQuarterLive4.DataBind();
            }


        }

        private void DivisionVehicleLaunchOpportunityQuarterInside()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_DivisionVehicleLaunchOpportunityQuarterInside", "tbl", new object[] { cmbFiscalYear.SelectedValue, cmbRegion.SelectedValue });
            if (oStructResult.intCode == 1)
            {

                int Count0 = oStructResult.dstResult.Tables[0].Rows.Count;
                int Count1 = oStructResult.dstResult.Tables[1].Rows.Count;
                int Count2 = oStructResult.dstResult.Tables[2].Rows.Count;
                int Count3 = oStructResult.dstResult.Tables[3].Rows.Count;
                int max = 0;
                if (Count0 > Count1)
                {
                    max = Count0;
                }
                else
                {
                    max = Count1;
                }
                if (Count2 > max)
                {
                    max = Count2;
                }
                if (Count3 > max)
                {
                    max = Count3;
                }

                if (Count0 > 0 || Count1 > 0 || Count2 > 0 || Count3 > 0)
                {
                    lblYearInside.Visible = true;
                    TD1.Visible = true;
                    lblYearInside.Text = oStructResult.dstResult.Tables[4].Rows[0]["Title"].ToString();
                }
                else
                {
                    TD1.Visible = false;
                    lblYearInside.Text = "";
                    lblYearInside.Visible = false;
                }

                for (int i = 0; i < max - Count0; i++)
                {


                    DataRow dRow = oStructResult.dstResult.Tables[0].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[0].Rows.Add(dRow);
                }

                for (int i = 0; i < max - Count1; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[1].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[1].Rows.Add(dRow);
                }



                for (int i = 0; i < max - Count2; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[2].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[2].Rows.Add(dRow);
                }
                for (int i = 0; i < max - Count3; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[3].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[3].Rows.Add(dRow);
                }




                gvDivisionVehicleLaunchOpportunityQuarterInside1.DataSource = oStructResult.dstResult.Tables[0];
                gvDivisionVehicleLaunchOpportunityQuarterInside1.DataBind();

                gvDivisionVehicleLaunchOpportunityQuarterInside2.DataSource = oStructResult.dstResult.Tables[1];
                gvDivisionVehicleLaunchOpportunityQuarterInside2.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterInside3.DataSource = oStructResult.dstResult.Tables[2];
                gvDivisionVehicleLaunchOpportunityQuarterInside3.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterInside4.DataSource = oStructResult.dstResult.Tables[3];
                gvDivisionVehicleLaunchOpportunityQuarterInside4.DataBind();
            }


        }

        private void DivisionVehicleLaunchOpportunityQuarterTesting()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_DivisionVehicleLaunchOpportunityQuarterTesting", "tbl", new object[] { cmbFiscalYear.SelectedValue, cmbRegion.SelectedValue });
            if (oStructResult.intCode == 1)
            {

                int Count0 = oStructResult.dstResult.Tables[0].Rows.Count;
                int Count1 = oStructResult.dstResult.Tables[1].Rows.Count;
                int Count2 = oStructResult.dstResult.Tables[2].Rows.Count;
                int Count3 = oStructResult.dstResult.Tables[3].Rows.Count;
                int max = 0;
                if (Count0 > Count1)
                {
                    max = Count0;
                }
                else
                {
                    max = Count1;
                }
                if (Count2 > max)
                {
                    max = Count2;
                }
                if (Count3 > max)
                {
                    max = Count3;
                }

                if (Count0 > 0 || Count1 > 0 || Count2 > 0 || Count3 > 0)
                {
                    lblYearTesting.Visible = true;
                    TD2.Visible = true;
                    lblYearTesting.Text = oStructResult.dstResult.Tables[4].Rows[0]["Title"].ToString();
                }
                else
                {
                    TD2.Visible = false;
                    lblYearTesting.Text = "";
                    lblYearTesting.Visible = false;
                }

                for (int i = 0; i < max - Count0; i++)
                {


                    DataRow dRow = oStructResult.dstResult.Tables[0].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[0].Rows.Add(dRow);
                }

                for (int i = 0; i < max - Count1; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[1].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[1].Rows.Add(dRow);
                }



                for (int i = 0; i < max - Count2; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[2].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[2].Rows.Add(dRow);
                }
                for (int i = 0; i < max - Count3; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[3].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[3].Rows.Add(dRow);
                }




                gvDivisionVehicleLaunchOpportunityQuarterTesting1.DataSource = oStructResult.dstResult.Tables[0];
                gvDivisionVehicleLaunchOpportunityQuarterTesting1.DataBind();

                gvDivisionVehicleLaunchOpportunityQuarterTesting2.DataSource = oStructResult.dstResult.Tables[1];
                gvDivisionVehicleLaunchOpportunityQuarterTesting2.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterTesting3.DataSource = oStructResult.dstResult.Tables[2];
                gvDivisionVehicleLaunchOpportunityQuarterTesting3.DataBind();
                gvDivisionVehicleLaunchOpportunityQuarterTesting4.DataSource = oStructResult.dstResult.Tables[3];
                gvDivisionVehicleLaunchOpportunityQuarterTesting4.DataBind();
            }


        }

        private void TopBrandsKeyLaunches()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetOverallVehicleLaunchOpportunitybyQuarter", "tbl", new object[] { cmbFiscalYear.SelectedValue, cmbRegion.SelectedValue });

            if (oStructResult.intCode == 1)
            {

                int Count0 = oStructResult.dstResult.Tables[0].Rows.Count;
                int Count1 = oStructResult.dstResult.Tables[1].Rows.Count;
                int Count2 = oStructResult.dstResult.Tables[2].Rows.Count;
                int Count3 = oStructResult.dstResult.Tables[3].Rows.Count;
                int max = 0;
                if (Count0 > Count1)
                {
                    max = Count0;
                }
                else
                {
                    max = Count1;
                }
                if (Count2 > max)
                {
                    max = Count2;
                }
                if (Count3 > max)
                {
                    max = Count3;
                }

                if (Count0 > 0 || Count1 > 0 || Count2 > 0 || Count3 > 0)
                {
                    lblYear.Visible = true;
                    TDYear.Visible = true;
                    lblYear.Text = oStructResult.dstResult.Tables[4].Rows[0]["Title"].ToString();
                }
                else
                {
                    TDYear.Visible = false;
                    lblYear.Text = "";
                    lblYear.Visible = false;
                }

                for (int i = 0; i < max - Count0; i++)
                {


                    DataRow dRow = oStructResult.dstResult.Tables[0].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[0].Rows.Add(dRow);
                }

                for (int i = 0; i < max - Count1; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[1].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[1].Rows.Add(dRow);
                }



                for (int i = 0; i < max - Count2; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[2].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[2].Rows.Add(dRow);
                }
                for (int i = 0; i < max - Count3; i++)
                {

                    DataRow dRow = oStructResult.dstResult.Tables[3].NewRow();
                    dRow[0] = "";
                    dRow[1] = DBNull.Value;
                    oStructResult.dstResult.Tables[3].Rows.Add(dRow);
                }




                gvVehicleLaunchOpportunityQuarter1.DataSource = oStructResult.dstResult.Tables[0];
                gvVehicleLaunchOpportunityQuarter1.DataBind();

                gvVehicleLaunchOpportunityQuarter2.DataSource = oStructResult.dstResult.Tables[1];
                gvVehicleLaunchOpportunityQuarter2.DataBind();
                gvVehicleLaunchOpportunityQuarter3.DataSource = oStructResult.dstResult.Tables[2];
                gvVehicleLaunchOpportunityQuarter3.DataBind();
                gvVehicleLaunchOpportunityQuarter4.DataSource = oStructResult.dstResult.Tables[3];
                gvVehicleLaunchOpportunityQuarter4.DataBind();
            }


        }


        protected void gvVehicleLaunchOpportunityQuarter1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                int i = e.Row.RowIndex + 1;
                lblSerialNo.Text = i.ToString();


            }
        }
        protected void gvDivisionVehicleLaunchOpportunityQuarterInside1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                int i = e.Row.RowIndex + 1;
                lblSerialNo.Text = i.ToString();


            }
        }
        protected void gvDivisionVehicleLaunchOpportunityQuarterTesting1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                int i = e.Row.RowIndex + 1;
                lblSerialNo.Text = i.ToString();


            }
        }
        protected void gvDivisionVehicleLaunchOpportunityQuarterLive1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                int i = e.Row.RowIndex + 1;
                lblSerialNo.Text = i.ToString();


            }
        }

        protected void cmbYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            TopBrandsKeyLaunches();
            DivisionVehicleLaunchOpportunityQuarterLive();
            DivisionVehicleLaunchOpportunityQuarterInside();
            DivisionVehicleLaunchOpportunityQuarterTesting();
        }
        protected void cmbRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            TopBrandsKeyLaunches();
            DivisionVehicleLaunchOpportunityQuarterLive();
            DivisionVehicleLaunchOpportunityQuarterInside();
            DivisionVehicleLaunchOpportunityQuarterTesting();
        }

    }
}
