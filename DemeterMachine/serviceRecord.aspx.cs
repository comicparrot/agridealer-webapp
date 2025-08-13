using Org.BouncyCastle.Asn1.Cmp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class serviceRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView1.DataBind();

        }

        protected void dsServiceRecordInfo_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Service Record updated successfully!');", true);
                FormView1.DataBind();
                GridView1.DataBind();
                

            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void dsServiceRecordInfo_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlStatus = FormView1.FindControl("ddlStatus") as DropDownList;
            TextBox completionDate = FormView1.FindControl("completionDateTextBox") as TextBox;
            string status = ddlStatus.SelectedValue;

            if (status == "closed" && completionDate.Text == "" )
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "UpdateFailure", "alert('Completion date can\\'t be empty if status is closed!');", true);
                e.Cancel = true;
            }

        }

        protected void dsServiceRecordInfo_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            DropDownList ddlStatus = FormView1.FindControl("ddlStatus") as DropDownList;
            TextBox completionDate = FormView1.FindControl("completionDateTextBox") as TextBox;
            string status = ddlStatus.SelectedValue;

            if (status == "closed" && completionDate.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "UpdateFailure", "alert('Completion date can\\'t be empty if status is closed!');", true);
                e.Cancel = true;
            }
        }
    }
}