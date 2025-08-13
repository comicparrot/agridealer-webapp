using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class SiteMaster : MasterPage
    {

        string userRole = Users.UserRole;

        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    // User is logged in
                    string username = Session["Username"].ToString();
                    lblWelcome.Text = "Welcome: " + username;
                    settingsLink.Visible = true;
                    // Show logout button
                    btnLogout.Visible = true;
                    btnLogin.Visible = false;
                    hlOrderHistory.Visible = true;

                    if (userRole == "admin")
                    {
                        databaseButton.Visible = true;
                    }
                    if (userRole == "sales")
                    {
                        databaseButton.Visible = true;
                        suppliers.Visible = false;
                        employees.Visible = false;
                    }
                    if (userRole == "accounting")
                    {
                        databaseButton.Visible = true;
                        suppliers.Visible = false;
                        employees.Visible = false;
                    }
                    if (userRole == "service")
                    {
                        databaseButton.Visible = true;
                        attachments.Visible = false;
                        equipment.Visible = false;
                        suppliers.Visible = false;
                        employees.Visible = false;
                    }


                }
                else
                {
                    // User is not logged in
                    btnLogin.Visible = true;
                }







            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

            int CartItemNumber = CartItemList.GetCart().Count;
            if (CartItemNumber  < 1)
            {
                spanCount.Visible = false;
            }
            else
            {
                spanCount.Visible = true;
                spanCount.InnerText = CartItemNumber.ToString();

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon(); 
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }

        protected void lblSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("settings.aspx");

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        protected void tractorLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/product.aspx?TractorChecked=true");

        }

        protected void combinesLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/product.aspx?CombineChecked=true");
        }

        protected void plantersLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/product.aspx?PlantersChecked=true");

        }

        protected void sprayers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/product.aspx?SprayerChecked=true");

        }

        protected void rentalsLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/rentals.aspx");

        }
    }
}