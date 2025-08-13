using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsCustomers_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String script = "alert('Thank You for signing up! You will receive an confirmation email!'); window.location.href = 'Login.aspx'; ";


            //posts a confirmation popup message
            ScriptManager.RegisterStartupScript(this, GetType(), "SignupConfirmation", script, true);
        }
    }
}