using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Configuration;
using System.Configuration;



namespace DemeterMachine
{
    public partial class equipment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve and bind BLOB data to Image control
            }
        }

        private void BindImageDataToImageControl()
        {
            //TextBox txtserialNumber = FormView1.FindControl("serial_numberLabel1") as TextBox;
            Image Image1 = FormView1.FindControl("Image1") as Image;
            string serialNumber = ddlProducts.SelectedValue;

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                string query = "SELECT image FROM equipment WHERE serial_number = @SerialNumber";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@SerialNumber", serialNumber);

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

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //refreshes from the database the form view based on the selected item
            FormView1.DataSourceID = "dsEquipmentInfo";
            FormView1.DataBind();
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

            TextBox txtserialNumber = FormView1.FindControl("serial_numberLabel1") as TextBox;
            string serialNumber = txtserialNumber.Text;

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                // Replace connectionString with your actual connection string for SQL Server
                string query = "SELECT COUNT(*) FROM equipment WHERE BINARY serial_number = @SerialNumber";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@SerialNumber", serialNumber);

                        int count = Convert.ToInt32(command.ExecuteScalar());

                        if (count > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Insert Failure", "alert('Serial number already exists!');", true);

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception properly, you can log it or display a user-friendly message
               // lblMessage.Text = "Unable to connect to the database! Please check the connection criteria. " + ex.Message;
            }

        }

        protected void Image1_DataBinding(object sender, EventArgs e)
        {
            BindImageDataToImageControl();

        }

        protected void dsEquipmentInfo_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Equipment updated successfully!');", true);
                FormView1.DataBind();

            }
        }
    }
}