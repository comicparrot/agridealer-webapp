using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Text.RegularExpressions;
using Microsoft.SqlServer.Management.Smo;
using System.Configuration;


namespace DemeterMachine
{
    public partial class partStore : System.Web.UI.Page
    {
        private Product selectedProduct;
        Validation validation = new Validation();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Image1_DataBinding(object sender, EventArgs e)
        {
            //BindImageDataToImageControl();

        }

        private void BindImageDataToImageControl()
        {
            // TextBox txtserialNumber = FormView1.FindControl("serial_numberLabel1") as TextBox;
            Image Image1 = Repeater1.FindControl("Image1") as Image;
            //string serialNumber = ddlAttachments.SelectedValue;      /*txtserialNumber.Text;*/
            string part_number = "250019";
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                string query = "SELECT image FROM parts WHERE part_number = @PartNumber ";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@PartNumber", part_number);

                        // Retrieve the BLOB data
                        byte[] blobData = (byte[])command.ExecuteScalar();

                        // If data is retrieved, convert it to base64 and set it as ImageUrl
                        if (blobData != null)
                        {
                            string base64String = Convert.ToBase64String(blobData);
                            Image1.ImageUrl = "data:image/jpeg;base64," + base64String; // Adjust MIME type if necessary

                        }
                        else
                        {
                            // Clear the ImageUrl if no data found
                            Image1.ImageUrl = "";
                            // Image2.ImageUrl = "";

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception properly
                // Display error message or log the exception
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image Image1 = (Image)e.Item.FindControl("Image1");
                string part_number = DataBinder.Eval(e.Item.DataItem, "part_number").ToString();
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;
                    //string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;
                    string query = "SELECT image FROM parts WHERE part_number = @PartNumber ";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@PartNumber", part_number);
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Button btnAdd = (Button)sender;
            RepeaterItem item = (RepeaterItem)btnAdd.NamingContainer;
            string pattern = @"^(?:[0-9]+)?"; // Allows null, empty string, or a whole number
            string patternMaxValue = @"^(100000|[1-9][0-9]{0,4})?$"; // Allows null, empty string, or a number less than or equal to 100,000

            TextBox txtOrderQuantity = (TextBox)item.FindControl("txtOrderQuantity");
            string orderQuantity = txtOrderQuantity.Text.Trim();
            int quantity = 0;

            if (!Regex.IsMatch(orderQuantity, pattern))
            {
                // Quantity is not a valid whole number
                ScriptManager.RegisterStartupScript(this, GetType(), "InsertFailure", "alert('Quantity must be a whole number');", true);
                return;
            }

            if (!Regex.IsMatch(orderQuantity, patternMaxValue))
            {
                // Quantity exceeds 100,000
                ScriptManager.RegisterStartupScript(this, GetType(), "InsertFailure", "alert('Quantity must be less than or equal to 100,000 units');", true);
                return;
            }

            // If we reached here, the quantity is valid
            if (!string.IsNullOrEmpty(orderQuantity))
            {
                quantity = Convert.ToInt32(orderQuantity);
            }
            else
            {
                quantity = 1; // Default quantity to 1 if not provided
            }

            if (quantity > 0)
            {
                string productID = btnAdd.CommandArgument;

                selectedProduct = GetSelectedProduct(productID);
                if (selectedProduct != null)
                {
                    CartItemList cart = CartItemList.GetCart();
                    CartItem cartItem = cart[selectedProduct.ProductID];

                    if (cartItem == null)
                    {
                        cart.AddItem(selectedProduct, quantity);
                    }
                    else
                    {
                        cartItem.AddQuantity(quantity);
                    }

                    Response.Redirect("Cart.aspx");
                }
            }
        }


        private Product GetSelectedProduct(string partNumber)
        {
            // Initialize a variable to hold the selected product
            Product selectedProduct = null;

            string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;


            // Check if the productID is a valid non-empty string
            if (!string.IsNullOrEmpty(partNumber))
            {
                // Create a SqlConnection (replace with your connection string)
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define a SQL query to retrieve the product
                    string query = "SELECT * FROM [parts] WHERE [part_number] = @PartNumber";

                    // Create a SqlCommand
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add a parameter for the productID
                        command.Parameters.AddWithValue("@PartNumber", partNumber);

                        try
                        {
                            // Open the database connection
                            connection.Open();

                            // Execute the query and retrieve the product
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {


                                selectedProduct = new Product
                                {
                                    ProductID = reader["part_number"].ToString(),
                                    //Name = reader["Name"].ToString(),
                                    LongDescription = reader["part_description"].ToString(),
                                    UnitPrice = (decimal)reader["price"],
                                    ImageFile = reader["image"].ToString()

                                };
                            }
                            reader.Close();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("Error: " + ex.Message);
                        }
                    }
                }
            }

            return selectedProduct; // Return the retrieved product or null if not found
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void resetFilter_Click(object sender, EventArgs e)
        {

        }

        protected void FilterProducts(object sender, EventArgs e)
        {
            ApplyFilter();

        }

        private void ApplyFilter()
        {
            // Build the WHERE clause based on user input
            List<string> conditions = new List<string>();
            List<string> type = new List<string>();
            List<string> brand = new List<string>();

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

            if (conditions.Count > 0)
            {
                joinedContition = " AND equipment_condition IN ('" + string.Join("','", conditions) + "') ";
            }

            if (brand.Count > 0)
            {
                joinedBrand = " AND brand IN ('" + string.Join("','", brand) + "') ";

            }

            if (type.Count > 0)
            {
                joinedType = " AND type IN ('" + string.Join("','", type) + "') ";
            }

            // Set the SelectCommand of the SqlDataSource with the dynamic WHERE clause
            dsParts.SelectCommand = @"SELECT * 
                                 FROM parts 
                                 WHERE (1 = 1 " /*+ whereClause*/ + joinedType + joinedBrand + ");";

            // Rebind the data to the Repeater
            Repeater1.DataBind();

            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>

                                window.scrollTo(0, 500);
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

        protected void resetFilter_Click1(object sender, EventArgs e)
        {
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
            txtSearchTextBox.Text = "";

            Repeater1.DataBind();


            // Registering a startup script to scroll the page down
            string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 500);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            string inputValue = args.Value;
            if (validation.IsIllegal(inputValue))
            {
                args.IsValid = false;
                txtSearchTextBox.Text = "";
                Repeater1.DataBind();
                string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 500);
                              </script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);

            }
            else if (!validation.IsIllegal(inputValue))
            {
                args.IsValid = true;
                Repeater1.DataBind();
                string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 500);
                              </script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
            }
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            string partNumber = txtSearchTextBox.Text;


            // Modify the SelectCommand to use parameterized queries
            dsParts.SelectCommand = $"SELECT * FROM [parts] WHERE (part_number LIKE '%' + @SearchTerm + '%')";
            dsParts.SelectParameters.Clear();
            dsParts.SelectParameters.Add("SearchTerm", DbType.String, "%" + partNumber + "%");
            dsParts.DataBind();
            Repeater1.DataBind();
            string script = @"<script type='text/javascript'>
                                window.scrollTo(0, 250);
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "scrollScript", script, false);
        }
    }
}