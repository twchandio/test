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

namespace AmciSolution.DashBoard
{
    public partial class DashBoardUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();

        structResult oStructResult1 = new structResult();
        clsWrapperClass oClsWrapperClass1 = new clsWrapperClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillInitialValues();
                FillLive();
            }
            chBrandScoreOpportunityChart.Palette = ChartColorPalette.None;
            chBrandScoreOpportunityChart.PaletteCustomColors = new Color[] { Color.FromArgb(105, 117, 143) };
            FillBrandOpportunityScoreDistributionChart();
            //gvOpportunityScoreDivision.DataSource=OverAllBrandScore();
            //gvOpportunityScoreDivision.DataBind();


            gvOpportunityScoreDivision.DataSource = OverAllBrandScore();
            gvOpportunityScoreDivision.DataBind();
        }

        private void FillInitialValues()
        {
            oClsWrapperClass.FetchValuesInCombo("LIVE", cmbFiscalYear, "Title", "ID", "lkpt_FiscalYear", "Usp_get_FiscalYear", lblMessage, "Record Not Found");
            cmbFiscalYear.SelectedIndex = 2;
        }

        private void FillBrandOpportunityScoreDistributionChart()
        {

            chBrandScoreOpportunityChart.Series["Default"]["PointWidth"] = "0.2";
            chBrandScoreOpportunityChart.Series["Default"].IsValueShownAsLabel = true;
            chBrandScoreOpportunityChart.Series["Default"]["BarLabelStyle"] = "Center";
            chBrandScoreOpportunityChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            chBrandScoreOpportunityChart.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            oStructResult = oClsWrapperClass.GetAllRecords("live", "usp_GetChartDataGroupLevelBrandScoreDashboard", "tbl");
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["tbl"].Rows.Count > 0)
                {
                    chBrandScoreOpportunityChart.DataSource = oStructResult.dstResult.Tables["tbl"];
                    chBrandScoreOpportunityChart.Series["Default"].ChartType = SeriesChartType.Column;
                    chBrandScoreOpportunityChart.Series["Default"].XValueMember = "BrandName";
                    chBrandScoreOpportunityChart.Series["Default"].YValueMembers = "Score";
                    chBrandScoreOpportunityChart.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                    chBrandScoreOpportunityChart.DataBind();
                    chBrandScoreOpportunityChart.ChartAreas[0].AxisX.Interval = 1;
                }
            }
        }
        private ICollection OverAllBrandScore()
        {
            oStructResult1 = oClsWrapperClass1.GetAllRecords("live", "usp_AMCI_GetBrandOpportunityScoreByDivision", "tbl");
            if (oStructResult1.intCode == 1)
            {

                if (oStructResult1.dstResult.Tables[0].Rows.Count > 0)
                {

                }
            }
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("BrandName", typeof(string)));
            dt.Columns.Add(new DataColumn("Value", typeof(string)));

            dt.Columns.Add(new DataColumn("BrandName2", typeof(string)));
            dt.Columns.Add(new DataColumn("Value2", typeof(string)));

            dt.Columns.Add(new DataColumn("BrandName3", typeof(string)));
            dt.Columns.Add(new DataColumn("Value3", typeof(string)));




            //dt.Columns.Add(new DataColumn("Qualified_Ingredient_by", typeof(string)));

            int Count0 = oStructResult1.dstResult.Tables[0].Rows.Count;
            int Count1 = oStructResult1.dstResult.Tables[1].Rows.Count;
            int Count2 = oStructResult1.dstResult.Tables[2].Rows.Count;

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



            //int Count3 = oStructResult.dstResult.Tables[3].Rows.Count;

            for (int i = 0; i < max; i++)
            {
                dr = dt.NewRow();
                dr["BrandName"] = oStructResult1.dstResult.Tables[0].Rows[i][0].ToString();
                dr["Value"] = oStructResult1.dstResult.Tables[0].Rows[i][1].ToString();

                dr["BrandName2"] = string.Empty;
                dr["Value2"] = string.Empty;
                dr["BrandName3"] = string.Empty;
                dr["Value3"] = string.Empty;
                dt.Rows.Add(dr);
            }

            int count = dt.Rows.Count;

            for (int i = 0; i < oStructResult1.dstResult.Tables[1].Rows.Count; i++)
            {
                //dr = dt.NewRow();
                dt.Rows[i]["BrandName2"] = oStructResult1.dstResult.Tables[1].Rows[i][0].ToString();
                dt.Rows[i]["Value2"] = oStructResult1.dstResult.Tables[1].Rows[i][1].ToString();

            }

            for (int i = 0; i < oStructResult1.dstResult.Tables[2].Rows.Count; i++)
            {
                //dr = dt.NewRow();
                dt.Rows[i]["BrandName3"] = oStructResult1.dstResult.Tables[2].Rows[i][0].ToString();
                dt.Rows[i]["Value3"] = oStructResult1.dstResult.Tables[2].Rows[i][1].ToString();

            }


            dt.AcceptChanges();
            DataView dv = new DataView(dt);
            return dv;
        }
        protected void gvOpportunityScoreDivision_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblNo = (Label)e.Row.FindControl("lblSno");
                int i = e.Row.RowIndex + 1;
                lblNo.Text = i.ToString();
            }

        }

        protected void gvQ1_RowDataBound(object sender, GridViewRowEventArgs e)
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
            FillLive();
        }

        private void FillLive()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetrandOpportunityScoreByDivisionQuarterLive", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvQ1.DataSource = oStructResult.dstResult.Tables[0];
                gvQ1.DataBind();

                gvQ2.DataSource = oStructResult.dstResult.Tables[1];
                gvQ2.DataBind();
                gvQ3.DataSource = oStructResult.dstResult.Tables[2];
                gvQ3.DataBind();
                gvQ4.DataSource = oStructResult.dstResult.Tables[3];
                gvQ4.DataBind();
            }


        }

        private void FillInside()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetrandOpportunityScoreByDivisionQuarterInside", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvQ1.DataSource = oStructResult.dstResult.Tables[0];
                gvQ1.DataBind();

                gvQ2.DataSource = oStructResult.dstResult.Tables[1];
                gvQ2.DataBind();
                gvQ3.DataSource = oStructResult.dstResult.Tables[2];
                gvQ3.DataBind();
                gvQ4.DataSource = oStructResult.dstResult.Tables[3];
                gvQ4.DataBind();
            }


        }

        private void FillTesting()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("live", "usp_GetrandOpportunityScoreByDivisionQuarterTesting", "tbl", new object[] { cmbFiscalYear.SelectedValue });
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




                gvQ1.DataSource = oStructResult.dstResult.Tables[0];
                gvQ1.DataBind();

                gvQ2.DataSource = oStructResult.dstResult.Tables[1];
                gvQ2.DataBind();
                gvQ3.DataSource = oStructResult.dstResult.Tables[2];
                gvQ3.DataBind();
                gvQ4.DataSource = oStructResult.dstResult.Tables[3];
                gvQ4.DataBind();
            }


        }

        protected void btnLive_Clik(object sender, EventArgs e)
        {
            FillLive();
            btnLive.BackColor = System.Drawing.Color.Green;
            btnInside.BackColor = System.Drawing.Color.Red;
            btnTest.BackColor = System.Drawing.Color.Red;

        }
        protected void btnInside_Click(object sender, EventArgs e)
        {
            FillInside();
            btnLive.BackColor = System.Drawing.Color.Red;
            btnInside.BackColor = System.Drawing.Color.Green;
            btnTest.BackColor = System.Drawing.Color.Red;
        }
        protected void btnTest_Click(object sender, EventArgs e)
        {
            FillTesting();
            btnLive.BackColor = System.Drawing.Color.Red;
            btnInside.BackColor = System.Drawing.Color.Red;
            btnTest.BackColor = System.Drawing.Color.Green;
        }

    }
}
