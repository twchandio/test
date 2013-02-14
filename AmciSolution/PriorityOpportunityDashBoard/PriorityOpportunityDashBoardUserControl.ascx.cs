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

namespace AmciSolution.PriorityOpportunityDashBoard
{
    public partial class PriorityOpportunityDashBoardUserControl : UserControl
    {
        clsWrapperClass oClsWrapperClass = new clsWrapperClass();
        structResult oStructResult = new structResult();
        protected void Page_Load(object sender, EventArgs e)
        {
            FillPriorityOpportunity();
        }
        private void FillPriorityOpportunity()
        {
            oStructResult = oClsWrapperClass.GetAllRecords("live", "usp_GetPriorityOpportunitySegmentation", "tblPriorityOpportunity");
            if (oStructResult.intCode == 1)
            {
                gvPriorityOpportunity.DataSource = oStructResult.dstResult.Tables["tblPriorityOpportunity"];
                gvPriorityOpportunity.DataBind();
            }
        }


        protected void gvPriorityOpportunity_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblNo = (Label)e.Row.FindControl("lblSno");
                int i = e.Row.RowIndex + 1;
                lblNo.Text = i.ToString();

                Label lblLiveBudget = (Label)e.Row.FindControl("lblLiveBudget");
                Label lblLiveRelationship = (Label)e.Row.FindControl("lblLiveRelationship");
                Label lblInsideBudget = (Label)e.Row.FindControl("lblInsideBudget");
                Label lblInsideRelationship = (Label)e.Row.FindControl("lblInsideRelationship");
                Label lblTestingBudget = (Label)e.Row.FindControl("lblTestingBudget");
                Label lblTestingRelationship = (Label)e.Row.FindControl("lblTestingRelationship");



                Label lblGroupBudget = (Label)e.Row.FindControl("lblGroupBudget");
                Label lblGroupRelationship = (Label)e.Row.FindControl("lblGroupRelationship");




                System.Web.UI.WebControls.Image LIVETopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVETopPriority");
                System.Web.UI.WebControls.Image LIVEHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVEHighOppartunity");
                System.Web.UI.WebControls.Image LIVEMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVEMonitor");
                System.Web.UI.WebControls.Image LIVELowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVELowPriority");


                System.Web.UI.WebControls.Image INSIDETopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDETopPriority");
                System.Web.UI.WebControls.Image INSIDEHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDEHighOppartunity");
                System.Web.UI.WebControls.Image INSIDEMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDEMonitor");
                System.Web.UI.WebControls.Image INSIDELowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDELowPriority");


                System.Web.UI.WebControls.Image TESTINGTopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGTopPriority");
                System.Web.UI.WebControls.Image TESTINGHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGHighOppartunity");
                System.Web.UI.WebControls.Image TESTINGMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGMonitor");
                System.Web.UI.WebControls.Image TESTINGLowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGLowPriority");



                System.Web.UI.WebControls.Image GroupTopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("GroupTopPriority");
                System.Web.UI.WebControls.Image GroupHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("GroupHighOppartunity");
                System.Web.UI.WebControls.Image GroupMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("GroupMonitor");
                System.Web.UI.WebControls.Image GroupLowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("GroupLowPriority");







                if ((Convert.ToInt32(lblGroupBudget.Text)) >= 12 && (Convert.ToInt32(lblGroupRelationship.Text)) >= 12)
                {
                    GroupTopPriority.Visible = true;
                    GroupHighOppartunity.Visible = false;
                    GroupMonitor.Visible = false;
                    GroupLowPriority.Visible = false;
                }
                else if ((Convert.ToInt32(lblGroupBudget.Text)) - (Convert.ToInt32(lblGroupRelationship.Text)) >= 6)
                {
                    GroupTopPriority.Visible = false;
                    GroupHighOppartunity.Visible = true;
                    GroupMonitor.Visible = false;
                    GroupLowPriority.Visible = false;

                }
                else if ((Convert.ToInt32(lblGroupBudget.Text) <= 6) && (Convert.ToInt32(lblGroupRelationship.Text) <= 6))
                {
                    GroupTopPriority.Visible = false;
                    GroupHighOppartunity.Visible = false;
                    GroupMonitor.Visible = false;
                    GroupLowPriority.Visible = true;
                }


                else if (
                    ((Convert.ToInt32(lblGroupBudget.Text) - Convert.ToInt32(lblGroupRelationship.Text)) <= -6)
                    &&
                    (
                      (Convert.ToInt32(lblGroupBudget.Text) > 6) && (Convert.ToInt32(lblGroupBudget.Text) < 12)

                    &&
                    (Convert.ToInt32(lblGroupRelationship.Text) > 6) && (Convert.ToInt32(lblGroupRelationship.Text) < 12)
                     &&
                    ((Convert.ToInt32(lblGroupBudget.Text) - Convert.ToInt32(lblGroupRelationship.Text)) < 6)
                    )


          )
                {
                    GroupTopPriority.Visible = false;
                    GroupHighOppartunity.Visible = false;
                    GroupMonitor.Visible = true;
                    GroupLowPriority.Visible = false;
                }





                if (Convert.ToInt32(lblLiveBudget.Text) >= 4 && Convert.ToInt32(lblLiveRelationship.Text) >= 4)
                {
                    LIVETopPriority.Visible = true;
                    LIVEHighOppartunity.Visible = false;
                    LIVEMonitor.Visible = false;
                    LIVELowPriority.Visible = false;
                }
                else if (Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text) >= 2)
                {
                    LIVETopPriority.Visible = false;
                    LIVEHighOppartunity.Visible = true;
                    LIVEMonitor.Visible = false;
                    LIVELowPriority.Visible = false;

                }
                else if (Convert.ToInt32(lblLiveBudget.Text) <= 2 && Convert.ToInt32(lblLiveRelationship.Text) <= 2)
                {
                    LIVETopPriority.Visible = false;
                    LIVEHighOppartunity.Visible = false;
                    LIVEMonitor.Visible = false;
                    LIVELowPriority.Visible = true;
                }


                else if ((Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text) <= -2)
                    || ((Convert.ToInt32(lblLiveBudget.Text) == 3) && (Convert.ToInt32(lblLiveRelationship.Text) == 3))
                    || ((Convert.ToInt32(lblLiveBudget.Text) == 3) || (Convert.ToInt32(lblLiveRelationship.Text) == 3))
                    && ((Math.Abs(Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text)) == 1)))
                {
                    LIVETopPriority.Visible = false;
                    LIVEHighOppartunity.Visible = false;
                    LIVEMonitor.Visible = true;
                    LIVELowPriority.Visible = false;
                }



                if (Convert.ToInt32(lblInsideBudget.Text) >= 4 && Convert.ToInt32(lblInsideRelationship.Text) >= 4)
                {
                    INSIDETopPriority.Visible = true;
                    INSIDEHighOppartunity.Visible = false;
                    INSIDELowPriority.Visible = false;
                    INSIDEMonitor.Visible = false;
                }
                else if (Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text) >= 2)
                {
                    INSIDETopPriority.Visible = false;
                    INSIDEHighOppartunity.Visible = true;
                    INSIDELowPriority.Visible = false;
                    INSIDEMonitor.Visible = false;


                }
                else if (Convert.ToInt32(lblInsideBudget.Text) <= 2 && Convert.ToInt32(lblInsideRelationship.Text) <= 2)
                {
                    INSIDETopPriority.Visible = false;
                    INSIDEHighOppartunity.Visible = false;
                    INSIDELowPriority.Visible = true;
                    INSIDEMonitor.Visible = false;
                }

                else if ((Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text) <= -2)
              || ((Convert.ToInt32(lblInsideBudget.Text) == 3) && (Convert.ToInt32(lblInsideRelationship.Text) == 3))
              || ((Convert.ToInt32(lblInsideBudget.Text) == 3) || (Convert.ToInt32(lblInsideRelationship.Text) == 3))
              && ((Math.Abs(Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text)) == 1)))
                {
                    INSIDETopPriority.Visible = false;
                    INSIDEHighOppartunity.Visible = false;
                    INSIDELowPriority.Visible = false;
                    INSIDEMonitor.Visible = true;
                }









                if (Convert.ToInt32(lblTestingBudget.Text) >= 4 && Convert.ToInt32(lblTestingRelationship.Text) >= 4)
                {
                    TESTINGTopPriority.Visible = true;
                    TESTINGHighOppartunity.Visible = false;
                    TESTINGLowPriority.Visible = false;
                    TESTINGMonitor.Visible = false;
                }
                else if (Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text) >= 2)
                {
                    TESTINGTopPriority.Visible = false;
                    TESTINGHighOppartunity.Visible = true;
                    TESTINGLowPriority.Visible = false;
                    TESTINGMonitor.Visible = false;
                }
                else if (Convert.ToInt32(lblTestingBudget.Text) <= 2 && Convert.ToInt32(lblTestingRelationship.Text) <= 2)
                {
                    TESTINGTopPriority.Visible = false;
                    TESTINGHighOppartunity.Visible = false;
                    TESTINGLowPriority.Visible = true;
                    TESTINGMonitor.Visible = false;
                }

                else if ((Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text) <= -2)
               || ((Convert.ToInt32(lblTestingBudget.Text) == 3) && (Convert.ToInt32(lblTestingRelationship.Text) == 3))
               || ((Convert.ToInt32(lblTestingBudget.Text) == 3) || (Convert.ToInt32(lblTestingRelationship.Text) == 3))
               && ((Math.Abs(Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text)) == 1)))
                {
                    TESTINGTopPriority.Visible = false;
                    TESTINGHighOppartunity.Visible = false;
                    TESTINGLowPriority.Visible = false;
                    TESTINGMonitor.Visible = true;
                }


            }






        }

        //protected void gvPriorityOpportunityGroup_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        Label lblNo = (Label)e.Row.FindControl("lblSno");
        //        int i = e.Row.RowIndex + 1;
        //        lblNo.Text = i.ToString();

        //        Label lblLiveBudget = (Label)e.Row.FindControl("lblLiveBudget");
        //        Label lblLiveRelationship = (Label)e.Row.FindControl("lblLiveRelationship");
        //        Label lblInsideBudget = (Label)e.Row.FindControl("lblInsideBudget");
        //        Label lblInsideRelationship = (Label)e.Row.FindControl("lblInsideRelationship");
        //        Label lblTestingBudget = (Label)e.Row.FindControl("lblTestingBudget");
        //        Label lblTestingRelationship = (Label)e.Row.FindControl("lblTestingRelationship");


        //        System.Web.UI.WebControls.Image LIVETopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVETopPriority");
        //        System.Web.UI.WebControls.Image LIVEHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVEHighOppartunity");
        //        System.Web.UI.WebControls.Image LIVEMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVEMonitor");
        //        System.Web.UI.WebControls.Image LIVELowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("LIVELowPriority");


        //        System.Web.UI.WebControls.Image INSIDETopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDETopPriority");
        //        System.Web.UI.WebControls.Image INSIDEHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDEHighOppartunity");
        //        System.Web.UI.WebControls.Image INSIDEMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDEMonitor");
        //        System.Web.UI.WebControls.Image INSIDELowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("INSIDELowPriority");


        //        System.Web.UI.WebControls.Image TESTINGTopPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGTopPriority");
        //        System.Web.UI.WebControls.Image TESTINGHighOppartunity = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGHighOppartunity");
        //        System.Web.UI.WebControls.Image TESTINGMonitor = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGMonitor");
        //        System.Web.UI.WebControls.Image TESTINGLowPriority = (System.Web.UI.WebControls.Image)e.Row.FindControl("TESTINGLowPriority");




        //        if (Convert.ToInt32(lblLiveBudget.Text) >= 4 && Convert.ToInt32(lblLiveRelationship.Text) >= 4)
        //        {
        //            LIVETopPriority.Visible = true;
        //            LIVEHighOppartunity.Visible = false;
        //            LIVEMonitor.Visible = false;
        //            LIVELowPriority.Visible = false;
        //        }
        //        else if (Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text) >= 2)
        //        {
        //            LIVETopPriority.Visible = false;
        //            LIVEHighOppartunity.Visible = true;
        //            LIVEMonitor.Visible = false;
        //            LIVELowPriority.Visible = false;

        //        }
        //        else if (Convert.ToInt32(lblLiveBudget.Text) <= 2 && Convert.ToInt32(lblLiveRelationship.Text) <= 2)
        //        {
        //            LIVETopPriority.Visible = false;
        //            LIVEHighOppartunity.Visible = false;
        //            LIVEMonitor.Visible = false;
        //            LIVELowPriority.Visible = true;
        //        }


        //        else if ((Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text) <= -2) 
        //            || ((Convert.ToInt32(lblLiveBudget.Text)==3) && (Convert.ToInt32(lblLiveRelationship.Text)==3))
        //            || ((Convert.ToInt32(lblLiveBudget.Text)==3) || (Convert.ToInt32(lblLiveRelationship.Text)==3))
        //            &&  ((Math.Abs(Convert.ToInt32(lblLiveBudget.Text) - Convert.ToInt32(lblLiveRelationship.Text))==1)))
        //        {
        //            LIVETopPriority.Visible = false;
        //            LIVEHighOppartunity.Visible = false;
        //            LIVEMonitor.Visible = true;
        //            LIVELowPriority.Visible = false;
        //        }



        //        if (Convert.ToInt32(lblInsideBudget.Text) >= 4 && Convert.ToInt32(lblInsideRelationship.Text) >= 4)
        //        {
        //            INSIDETopPriority.Visible = true;
        //            INSIDEHighOppartunity.Visible = false;
        //            INSIDELowPriority.Visible = false;
        //            INSIDEMonitor.Visible = false;
        //        }
        //        else if (Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text) >= 2)
        //        {
        //            INSIDETopPriority.Visible = false;
        //            INSIDEHighOppartunity.Visible = true;
        //            INSIDELowPriority.Visible = false;
        //            INSIDEMonitor.Visible = false;


        //        }
        //        else if (Convert.ToInt32(lblInsideBudget.Text) <= 2 && Convert.ToInt32(lblInsideRelationship.Text) <= 2)
        //        {
        //            INSIDETopPriority.Visible = false;
        //            INSIDEHighOppartunity.Visible = false;
        //            INSIDELowPriority.Visible = true;
        //            INSIDEMonitor.Visible = false;
        //        }

        //              else if ((Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text) <= -2) 
        //            || ((Convert.ToInt32(lblInsideBudget.Text)==3) && (Convert.ToInt32(lblInsideRelationship.Text)==3))
        //            || ((Convert.ToInt32(lblInsideBudget.Text)==3) || (Convert.ToInt32(lblInsideRelationship.Text)==3))
        //            &&  ((Math.Abs(Convert.ToInt32(lblInsideBudget.Text) - Convert.ToInt32(lblInsideRelationship.Text))==1)))

        //        {
        //            INSIDETopPriority.Visible = false;
        //            INSIDEHighOppartunity.Visible = false;
        //            INSIDELowPriority.Visible = false;
        //            INSIDEMonitor.Visible = true;
        //        }









        //        if (Convert.ToInt32(lblTestingBudget.Text) >= 4 && Convert.ToInt32(lblTestingRelationship.Text) >= 4)
        //        {
        //            TESTINGTopPriority.Visible = true;
        //            TESTINGHighOppartunity.Visible = false;
        //            TESTINGLowPriority.Visible = false;
        //            TESTINGMonitor.Visible = false;
        //        }
        //        else if (Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text) >= 2)
        //        {
        //            TESTINGTopPriority.Visible = false;
        //            TESTINGHighOppartunity.Visible = true;
        //            TESTINGLowPriority.Visible = false;
        //            TESTINGMonitor.Visible = false;
        //        }
        //        else if (Convert.ToInt32(lblTestingBudget.Text) <= 2 && Convert.ToInt32(lblTestingRelationship.Text) <= 2)
        //        {
        //            TESTINGTopPriority.Visible = false;
        //            TESTINGHighOppartunity.Visible = false;
        //            TESTINGLowPriority.Visible = true;
        //            TESTINGMonitor.Visible = false;
        //        }

        //             else if ((Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text) <= -2) 
        //            || ((Convert.ToInt32(lblTestingBudget.Text)==3) && (Convert.ToInt32(lblTestingRelationship.Text)==3))
        //            || ((Convert.ToInt32(lblTestingBudget.Text)==3) || (Convert.ToInt32(lblTestingRelationship.Text)==3))
        //            &&  ((Math.Abs(Convert.ToInt32(lblTestingBudget.Text) - Convert.ToInt32(lblTestingRelationship.Text))==1)))



        //        {
        //            TESTINGTopPriority.Visible = false;
        //            TESTINGHighOppartunity.Visible = false;
        //            TESTINGLowPriority.Visible = false;
        //            TESTINGMonitor.Visible = true;
        //        }


        //    }






        //}

    }
}
