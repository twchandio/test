using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using ITSec.DataAccessLayer.DataAccess;


namespace AmciSolution.lkptTables
{
    public partial class lkptTablesUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSave.Attributes.Add("OnClick", "return ValidateForm();");
                FillInitialValues();
            }
        }
        private void FillInitialValues()
        {
            try
            {
                oClsWrapperClass.FetchValuesInCombo("LIVE", cmbTable, "TABLE_NAME", "Table_ID", "AllTables", "Usp_get_LookUpTables", lblMessage, "Record Not Found");

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
        protected void Grid_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            hdnID.Value = e.Item.Cells[1].Text;
            txtTitle.Text = e.Item.Cells[2].Text;
            txtShortDesc.Text = e.Item.Cells[3].Text;
            txtLongDesc.Text = e.Item.Cells[4].Text;
        }

        private void FillGrid()
        {

            oStructResult = oClsWrapperClass.GetAllRecordsByID("Live", "usp_Get_LookUpValues", "LookUpTable", new object[] { cmbTable.SelectedItem.Text });
            if (oStructResult.intCode == 1)
            {
                if (oStructResult.dstResult.Tables["LookUpTable"].Rows.Count > 0)
                {
                    dgTableListing.DataSource = oStructResult.dstResult.Tables["LookUpTable"];
                    dgTableListing.DataBind();
                    dgTableListing.Columns[1].Visible = false;
                    dgTableListing.Columns[4].Visible = false;
                }
                else
                {
                    dgTableListing.DataSource = null;
                    dgTableListing.DataBind();
                }
            }


        }

        protected void Grid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            hdnID.Value = e.Item.Cells[1].Text;
            //hdnTableName.Value

            oStructResult = oClsWrapperClass.Update("live", "usp_Del_LookUpValuesByID", new object[] { hdnTableName.Value, e.Item.Cells[1].Text });

            if (oStructResult.intCode == 1)
            {
                FillGrid();
            }

        }
        
        private void AddNewRecord()
        {

            object[] ParamValues = new object[]{
                                                    hdnTableName.Value,
                                                    txtTitle.Text,
                                                    txtShortDesc.Text,
                                                    txtLongDesc.Text,
                                                    null
                                                    };
            oStructResult = oClsWrapperClass.Add("live", "usp_Add_LookUpValues", ParamValues);
            if (oStructResult.intCode == 1)
            {

            }
        }

        private void UpdateExistingRecord()
        {
            object[] ParamValues = new object[]{
                                                    hdnID.Value,
                                                    hdnTableName.Value,
                                                    txtTitle.Text,
                                                    txtShortDesc.Text,
                                                    txtLongDesc.Text
                                                };
            oStructResult = oClsWrapperClass.Add("live", "usp_Update_LookUpValuesByID", ParamValues);
            if (oStructResult.intCode == 1)
            {

            }
        }

        protected void btnFind_Click(object sender, ImageClickEventArgs e)
        {
            hdnTableName.Value = cmbTable.SelectedItem.Text;
            FillGrid();
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            if ((hdnID.Value == "0") || (hdnID.Value == ""))
            {
                AddNewRecord();
            }
            else
            {
                UpdateExistingRecord();
            }
            FillGrid();
        }

        protected void btnReset_Click(object sender, ImageClickEventArgs e)
        {
            hdnID.Value = "0";
            txtTitle.Text = "";
            txtShortDesc.Text = "";
            txtLongDesc.Text = "";
        }
    }
}
