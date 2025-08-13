using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsSettings_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Settings updated successfully!');", true);
                FormView1.DataBind();

            }
        }
    }
}