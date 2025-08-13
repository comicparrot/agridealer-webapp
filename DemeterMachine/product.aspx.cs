using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;



namespace DemeterMachine
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                // Check if the TractorsChecked parameter exists in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["CombineChecked"]))
                {
                    // If the parameter exists and its value is "true", check the Tractors checkbox
                    string combineChecked = Request.QueryString["CombineChecked"];
                    if (combineChecked.Equals("true", StringComparison.OrdinalIgnoreCase))
                    {
                        Combines.Checked = true;
                        ApplyFilter();
                        // Registering a startup script to scroll the page down
                        string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

                        ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
                    }
                }
            }

            if (!IsPostBack)
            {
                // Check if the TractorsChecked parameter exists in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["TractorChecked"]))
                {
                    // If the parameter exists and its value is "true", check the Tractors checkbox
                    string tractorChecked = Request.QueryString["TractorChecked"];
                    if (tractorChecked.Equals("true", StringComparison.OrdinalIgnoreCase))
                    {
                        Tractors.Checked = true;
                        ApplyFilter();
                        // Registering a startup script to scroll the page down
                        string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

                        ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
                    }
                }
            }

            if (!IsPostBack)
            {
                // Check if the TractorsChecked parameter exists in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["PlantersChecked"]))
                {
                    // If the parameter exists and its value is "true", check the Tractors checkbox
                    string combineChecked = Request.QueryString["PlantersChecked"];
                    if (combineChecked.Equals("true", StringComparison.OrdinalIgnoreCase))
                    {
                        Planters.Checked = true;
                        ApplyFilter();
                        // Registering a startup script to scroll the page down
                        string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

                        ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
                    }
                }
            }

            if (!IsPostBack)
            {
                // Check if the TractorsChecked parameter exists in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["SprayerChecked"]))
                {
                    // If the parameter exists and its value is "true", check the Tractors checkbox
                    string combineChecked = Request.QueryString["SprayerChecked"];
                    if (combineChecked.Equals("true", StringComparison.OrdinalIgnoreCase))
                    {
                        Sprayers.Checked = true;
                        ApplyFilter();
                        // Registering a startup script to scroll the page down
                        string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

                        ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
                    }
                }
            }

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image Image1 = (Image)e.Item.FindControl("Image1");
                string serialNumber = DataBinder.Eval(e.Item.DataItem, "serial_number").ToString();
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;
                    string query = "SELECT image FROM productSearch  WHERE serial_number = @SerialNumber ";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@SerialNumber", serialNumber);
                            byte[] blobData = (byte[])command.ExecuteScalar();
                            if (blobData != null)
                            {
                                string base64String = Convert.ToBase64String(blobData);
                                Image1.ImageUrl = "data:image/jpeg;base64," + base64String;
                            }
                            else
                            {
                                Image1.ImageUrl = ""; // or specify a default image path
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception properly
                }
            }
        }

        protected void FilterProducts(object sender, EventArgs e)
        {
            ApplyFilter();

        }

        protected void New_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void ResetFilter()
        {


        }

        protected void resetFilter_Click(object sender, EventArgs e)
        {

            Used.Checked = false;
            New.Checked = false;
            JohnDeere.Checked = false;
            CaseIH.Checked = false;
            NewHolland.Checked = false;
            Kubota.Checked = false;
            Mahindra.Checked = false;
            Gerronghoff.Checked = false;
            Drago.Checked = false;
            GreatPlains.Checked = false;
            Tractors.Checked = false;
            Combines.Checked = false;
            Planters.Checked = false;
            Sprayers.Checked = false;
            Headers.Checked = false;

            Repeater1.DataBind();


            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
        }

        private void ApplyFilter()
        {
            // Build the WHERE clause based on user input
            List<string> conditions = new List<string>();
            List<string> type = new List<string>();
            List<string> brand = new List<string>();

            if (Used.Checked)
            {
                //conditions.Add(" AND equipment_condition ='Used'");
                conditions.Add("Used");
            }
            if (New.Checked)
            {
                //conditions.Add(" AND equipment_condition = 'New'");
                conditions.Add("New");
            }


            if (JohnDeere.Checked)
            {
               // conditions.Add(" AND brand = 'John Deere'");
                brand.Add("John Deere");


            }

            if (CaseIH.Checked)
            {
               // conditions.Add(" AND brand = 'Case IH'");
                brand.Add("Case IH");

            }

            if (NewHolland.Checked)
            {
               // conditions.Add(" AND brand = 'New Holland'");
                brand.Add("New Holland");

            }

            if (Kubota.Checked)
            {
               // conditions.Add(" AND brand = 'Kubota'");
                brand.Add("Kubota");

            }

            if (Mahindra.Checked)
            {
               // conditions.Add(" AND brand = 'Mahindra'");
                brand.Add("Mahindra");

            }

            if (Gerronghoff.Checked)
            {
               // conditions.Add(" AND brand = 'Gerringhoff'");
                brand.Add("Gerringhoff");

            }

            if (Drago.Checked)
            {
               // conditions.Add(" AND brand = 'Drago'");
                brand.Add("Drago");

            }

            if (GreatPlains.Checked)
            {
               // conditions.Add(" AND brand = 'Great Plains'");
                brand.Add("Great Plains");
            }

            if (Tractors.Checked)
            {
                //conditions.Add(" AND type = 'tractor'");
                type.Add("tractor");
            }

            if (Combines.Checked)
            {
                //conditions.Add(" AND type = 'combine'");
                type.Add("combine");

            }

            if (Planters.Checked)
            {
                //conditions.Add(" AND type = 'planter'");
                type.Add("planter");
            }

            if (Sprayers.Checked)
            {
               // conditions.Add(" AND type = 'sprayer'");
                type.Add("sprayer");
            }

            if (Headers.Checked)
            {
                //conditions.Add(" AND type = 'header'");
                type.Add("header");
            }

            // Add more conditions for other checkboxes as needed

            string whereClause = string.Join("", conditions);
            string joinedType = "";
            string joinedBrand = "";
            string joinedContition = "";

            if(conditions.Count > 0)
            {
                joinedContition = " AND equipment_condition IN ('" + string.Join("','", conditions) + "') ";
            }

            if(brand.Count > 0)
            {
                 joinedBrand = " AND brand IN ('" + string.Join("','", brand) + "') ";

            }

            if(type.Count > 0)
            {
                joinedType = " AND type IN ('" + string.Join("','", type) + "') ";
            }

            // Set the SelectCommand of the SqlDataSource with the dynamic WHERE clause
            dsProducts.SelectCommand = @"SELECT serial_number, model, model_year, equipment_condition, type, price,brand 
                                 FROM productSearch 
                                 WHERE (1 = 1 " /*+ whereClause*/ + joinedType + joinedBrand + joinedContition + ");";

            // Rebind the data to the Repeater
            Repeater1.DataBind();

            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>

                                window.scrollTo(0, 1000);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
        }

        protected void btnUsed_Click(object sender, EventArgs e)
        {
            ResetCheckboxes(Page);

            Used.Checked = true;
            ApplyFilter();


            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ResetCheckboxes(Page);
            New.Checked = true;
            ApplyFilter();

            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 1000);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);

        }

        protected void ResetCheckboxes(Control parentControl)
        {
            foreach (Control control in parentControl.Controls)
            {
                if (control is CheckBox)
                {
                    CheckBox checkBox = (CheckBox)control;
                    checkBox.Checked = false;
                }
                else if (control.Controls.Count > 0)
                {
                    ResetCheckboxes(control); // Recursive call to handle nested controls
                }
            }
        }

        protected string GetProductDetailUrl(object serialNumber, object type)
        {
            string baseUrl = "productDetail.aspx?id=" + serialNumber.ToString();
            
            if (type.ToString().Equals("tractor", StringComparison.OrdinalIgnoreCase) || type.ToString().Equals("combine", StringComparison.OrdinalIgnoreCase) || type.ToString().Equals("sprayer", StringComparison.OrdinalIgnoreCase))
            {
                // Append query parameter for tractor
                baseUrl = "productDetail.aspx?id=" + serialNumber.ToString();
            }
            else
            {
                // Append query parameter for combine
                baseUrl = "attachmentDetails.aspx?id=" + serialNumber.ToString();
            }        
            return baseUrl;
        }

    }
}