using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GolfLeague
{
    public partial class Division : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtLeagueID.Text = Convert.ToString(Request.QueryString["L_ID"]);
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

        protected void ValidateDivisionName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            GolfLeague.Data.DivisionInterface d = new Data.DivisionInterface();
            args.IsValid = !d.DoesNameExist(this.txtLeagueID.Text, this.txtDivisionName.Text);

        }

    }
}