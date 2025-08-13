using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void contactUsBtn_Click(object sender, EventArgs e)
        {
            contactUsBtn.OnClientClick = "makePhoneCall(); return false;";


        }
    }
}