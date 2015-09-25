﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GolfLeague
{
    public partial class Player : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtLeagueID.Text = Convert.ToString(Request.QueryString["L_ID"]);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
            {
                (e.Row.Cells[6].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                SqlDataSource1.Insert();
                ClearAddControls();
            }
        }

        private void ClearAddControls()
        {
            this.txtFirstName.Text = "";
            this.txtLastName.Text = "";
            this.txtHandicap.Text = "";
            this.txtEmail.Text = "";
            this.txtPhone.Text = "";
        }

        protected void Clear(object sender, EventArgs e)
        {
            ClearAddControls();
        }

        protected void ValidateFirstName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //GolfLeague.Data.DivisionInterface d = new Data.DivisionInterface();
            //args.IsValid = !d.DoesNameExist(this.txtLeagueID.Text, this.txtFirst.Text);

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