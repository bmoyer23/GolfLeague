using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GolfLeague
{
    public partial class League : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
            {
                (e.Row.Cells[3].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            if (IsValid == true) SqlDataSource1.Insert();
        }

        protected void ValidateLeagueName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GolfLeague.Data.LeagueInterface l = new Data.LeagueInterface();
            args.IsValid = !l.DoesNameExist(this.txtLeagueName.Text);

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = 0;
            try { index = Convert.ToInt32(e.CommandArgument); }
            catch (Exception ex) { }

            GridViewRow selectedRow = this.GridView1.Rows[index];

            // get padaID
            TableCell cellLeagueID = selectedRow.Cells[1];

            string leagueID = Convert.ToString(GridView1.DataKeys[selectedRow.RowIndex].Value);


            if (e.CommandName == "Division")
            {
                Response.Redirect("Division.aspx?L_ID=" + leagueID);
            }
        }
   
    }
}