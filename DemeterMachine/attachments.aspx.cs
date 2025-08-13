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
    public partial class attachments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlAttachments_SelectedIndexChanged(object sender, EventArgs e)
        {
            //refreshes from the database the form view based on the selected item
            FormView1.DataSourceID = "dsAttachmentInfo";
            FormView1.DataBind();
        }

        protected void Image1_DataBinding(object sender, EventArgs e)
        {
            BindImageDataToImageControl();

        }
        private void BindImageDataToImageControl()
        {
           // TextBox txtserialNumber = FormView1.FindControl("serial_numberLabel1") as TextBox;
            Image Image1 = FormView1.FindControl("Image1") as Image;
            string serialNumber = ddlAttachments.SelectedValue;      /*txtserialNumber.Text;*/

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                string query = "SELECT image FROM attachments WHERE serial_number = @SerialNumber";

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

        protected void dsAttachmentInfo_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Attachment updated successfully!');", true);
                FormView1.DataBind();

            }
        }
    }
}