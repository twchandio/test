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

namespace AmciSolution.RegionLevelBrandOpportunityDashboard
{

    public partial class RegionLevelBrandOpportunityDashboardUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillInitialValues();
            }
            chRegionLevelBrandOpportunity.Palette = ChartColorPalette.None;
            chRegionLevelBrandOpportunity.PaletteCustomColors = new Color[] { Color.FromArgb(105, 117, 143) };
            FillBrandOpportunityScoreDistributionChartLive();
            TopBrandsKeyLaunchesLive();
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

        protected void btnLive_Click(object sender, EventArgs e)
        {
            FillBrandOpportunityScoreDistributionChartLive();
            btnLive.BackColor = System.Drawing.Color.Green;
            btnInside.BackColor = System.Drawing.Color.Red;
            btnTest.BackColor = System.Drawing.Color.Red;
            TopBrandsKeyLaunchesLive();
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;

        }

        protected void btnInside_Click(object sender, EventArgs e)
        {
            FillBrandOpportunityScoreDistributionChartInside();
            btnLive.BackColor = System.Drawing.Color.Red;
            btnInside.BackColor = System.Drawing.Color.Green;
            btnTest.BackColor = System.Drawing.Color.Red;
            TopBrandsKeyLaunchesInside();
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
        }

        protected void btnTesting_Click(object sender, EventArgs e)
        {
            FillBrandOpportunityScoreDistributionChartTesting();
            btnLive.BackColor = System.Drawing.Color.Red;
            btnInside.BackColor = System.Drawing.Color.Red;
            btnTest.BackColor = System.Drawing.Color.Green;
            TopBrandsKeyLaunchesTesting();
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
        }



        private void FillBrandOpportunityScoreDistributionChartLive()
        {
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
            chRegionLevelBrandOpportunity.Series["Default"]["PointWidth"] = "0.2";
            chRegionLevelBrandOpportunity.Series["Default"].IsValueShownAsLabel = true;
            chRegionLevelBrandOpportunity.Series["Default"]["BarLabelStyle"] = "Center";
            chRegionLevelBrandOpportunity.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_RegionLevelBrandOpportunityScoreDashboardLive", "tbl", new object[] { cmbRegion.SelectedValue, cmbFiscalYear.SelectedValue });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tbl"].Rows.Count > 0)
                {
                    chRegionLevelBrandOpportunity.DataSource = oStructResult.dstResult.Tables["tbl"];
                    chRegionLevelBrandOpportunity.Series["Default"].ChartType = SeriesChartType.Column;
                    chRegionLevelBrandOpportunity.Series["Default"].XValueMember = "BrandName";
                    chRegionLevelBrandOpportunity.Series["Default"].YValueMembers = "Score";
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                    chRegionLevelBrandOpportunity.DataBind();
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.Interval = 1;
                }
            }
        }


        private void FillBrandOpportunityScoreDistributionChartInside()
        {
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
            chRegionLevelBrandOpportunity.Series["Default"]["PointWidth"] = "0.2";
            chRegionLevelBrandOpportunity.Series["Default"].IsValueShownAsLabel = true;
            chRegionLevelBrandOpportunity.Series["Default"]["BarLabelStyle"] = "Center";
            chRegionLevelBrandOpportunity.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_RegionLevelBrandOpportunityScoreDashboardInside", "tbl", new object[] { cmbRegion.SelectedValue, cmbFiscalYear.SelectedValue });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tbl"].Rows.Count > 0)
                {
                    chRegionLevelBrandOpportunity.DataSource = oStructResult.dstResult.Tables["tbl"];
                    chRegionLevelBrandOpportunity.Series["Default"].ChartType = SeriesChartType.Column;
                    chRegionLevelBrandOpportunity.Series["Default"].XValueMember = "BrandName";
                    chRegionLevelBrandOpportunity.Series["Default"].YValueMembers = "Score";
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                    chRegionLevelBrandOpportunity.DataBind();
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.Interval = 1;
                }
            }
        }

        private void FillBrandOpportunityScoreDistributionChartTesting()
        {
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
            chRegionLevelBrandOpportunity.Series["Default"]["PointWidth"] = "0.2";
            chRegionLevelBrandOpportunity.Series["Default"].IsValueShownAsLabel = true;
            chRegionLevelBrandOpportunity.Series["Default"]["BarLabelStyle"] = "Center";
            chRegionLevelBrandOpportunity.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_Get_RegionLevelBrandOpportunityScoreDashboardTesting", "tbl", new object[] { cmbRegion.SelectedValue, cmbFiscalYear.SelectedValue });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tbl"].Rows.Count > 0)
                {
                    chRegionLevelBrandOpportunity.DataSource = oStructResult.dstResult.Tables["tbl"];
                    chRegionLevelBrandOpportunity.Series["Default"].ChartType = SeriesChartType.Column;
                    chRegionLevelBrandOpportunity.Series["Default"].XValueMember = "BrandName";
                    chRegionLevelBrandOpportunity.Series["Default"].YValueMembers = "Score";
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                    chRegionLevelBrandOpportunity.DataBind();
                    chRegionLevelBrandOpportunity.ChartAreas[0].AxisX.Interval = 1;
                }
            }
        }

        protected void gvTopBrandsKeyLaunches1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSerialNo = (Label)e.Row.FindControl("lblSerialNo");
                int i = e.Row.RowIndex + 1;
                lblSerialNo.Text = i.ToString();


            }
        }

        protected void cmbRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
            if (btnLive.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartLive();
            }
            else if (btnInside.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartInside();
            }
            else if (btnTest.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartTesting();
            }


        }

        protected void cmbYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRegion.Text = cmbRegion.SelectedItem.Text;
            lblYearChart.Text = cmbFiscalYear.SelectedItem.Text;
            if (btnLive.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartLive();
                TopBrandsKeyLaunchesLive();
            }
            else if (btnInside.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartInside();
                TopBrandsKeyLaunchesInside();
            }
            else if (btnTest.BackColor == System.Drawing.Color.Green)
            {
                FillBrandOpportunityScoreDistributionChartTesting();
                TopBrandsKeyLaunchesTesting();
            }

        }



        private void TopBrandsKeyLaunchesLive()
        {
            lblGridYear.Text = cmbFiscalYear.SelectedItem.Text;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetBrandsTopKeyLaunchesLive", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvTopBrandsKeyLaunches1.DataSource = oStructResult.dstResult.Tables[0];
                gvTopBrandsKeyLaunches1.DataBind();

                gvTopBrandsKeyLaunches2.DataSource = oStructResult.dstResult.Tables[1];
                gvTopBrandsKeyLaunches2.DataBind();
                gvTopBrandsKeyLaunches3.DataSource = oStructResult.dstResult.Tables[2];
                gvTopBrandsKeyLaunches3.DataBind();
                gvTopBrandsKeyLaunches4.DataSource = oStructResult.dstResult.Tables[3];
                gvTopBrandsKeyLaunches4.DataBind();
            }


        }


        private void TopBrandsKeyLaunchesInside()
        {
            lblGridYear.Text = cmbFiscalYear.SelectedItem.Text;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetBrandsTopKeyLaunchesInside", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvTopBrandsKeyLaunches1.DataSource = oStructResult.dstResult.Tables[0];
                gvTopBrandsKeyLaunches1.DataBind();

                gvTopBrandsKeyLaunches2.DataSource = oStructResult.dstResult.Tables[1];
                gvTopBrandsKeyLaunches2.DataBind();
                gvTopBrandsKeyLaunches3.DataSource = oStructResult.dstResult.Tables[2];
                gvTopBrandsKeyLaunches3.DataBind();
                gvTopBrandsKeyLaunches4.DataSource = oStructResult.dstResult.Tables[3];
                gvTopBrandsKeyLaunches4.DataBind();
            }


        }

        private void TopBrandsKeyLaunchesTesting()
        {
            lblGridYear.Text = cmbFiscalYear.SelectedItem.Text;
            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetBrandsTopKeyLaunchesTesting", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvTopBrandsKeyLaunches1.DataSource = oStructResult.dstResult.Tables[0];
                gvTopBrandsKeyLaunches1.DataBind();

                gvTopBrandsKeyLaunches2.DataSource = oStructResult.dstResult.Tables[1];
                gvTopBrandsKeyLaunches2.DataBind();
                gvTopBrandsKeyLaunches3.DataSource = oStructResult.dstResult.Tables[2];
                gvTopBrandsKeyLaunches3.DataBind();
                gvTopBrandsKeyLaunches4.DataSource = oStructResult.dstResult.Tables[3];
                gvTopBrandsKeyLaunches4.DataBind();
            }


        }


    }
}
