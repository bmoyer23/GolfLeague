using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GolfLeague.UC
{
    public partial class DivisionUC : System.Web.UI.UserControl
    {
        public string ValidationGroup
        {
            get
            {
                return this.btnAdd.ValidationGroup;
            }
            set
            {
                btnAdd.ValidationGroup = value;
                this.txtDivisionName.ValidationGroup = value;
                this.RequireDivisionName.ValidationGroup = value;
                this.ValidateDivisionName.ValidationGroup = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtLeagueID.Text = Convert.ToString(Request.QueryString["L_ID"]);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
            {
                (e.Row.Cells[2].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            if (Page.IsValid == true) SqlDataSource1.Insert();
        }

        protected void ValidateDivisionName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GolfLeague.Data.DivisionInterface d = new Data.DivisionInterface();
            args.IsValid = !d.DoesNameExist(this.txtLeagueID.Text, this.txtDivisionName.Text);

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = 0;
            try { index = Convert.ToInt32(e.CommandArgument); }
            catch (Exception ex) { }

            GridViewRow selectedRow = this.GridView1.Rows[index];
            TableCell cellDivisionID = selectedRow.Cells[1];
            string divisionID = Convert.ToString(GridView1.DataKeys[selectedRow.RowIndex].Value);


            if (e.CommandName.ToLower() == "select")
            {
                Response.Redirect("Team.aspx?D_ID=" + divisionID);
            }
        }

    }
}