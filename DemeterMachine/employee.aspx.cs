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
    public partial class employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlemployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView1.DataSourceID = "dsEmployeeInfo";
            FormView1.DataBind();
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList ddlEmploymentStatus = FormView1.FindControl("ddlEmploymentStatus") as DropDownList;
            TextBox txtTerminationDate = FormView1.FindControl("terminationDateTextBox") as TextBox;
            if(ddlEmploymentStatus.SelectedItem.ToString() == "Terminated" && string.IsNullOrEmpty(txtTerminationDate.Text))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Image1_DataBinding(object sender, EventArgs e)
        {
            BindImageDataToImageControl();

        }

        private void BindImageDataToImageControl()
        {
            // TextBox txtserialNumber = FormView1.FindControl("serial_numberLabel1") as TextBox;
            Image Image1 = FormView1.FindControl("Image1") as Image;
            string employeeID = ddlemployee.SelectedValue;      /*txtserialNumber.Text;*/

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                string query = "SELECT image FROM employee WHERE employeeID = @EmployeeID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@EmployeeID", employeeID);

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

        protected void dsEmployeeInfo_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Employee updated successfully!');", true);
                FormView1.DataBind();

            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList ddlEmploymentStatus = FormView1.FindControl("ddlEmploymentStatus") as DropDownList;
            TextBox txtTerminationDate = FormView1.FindControl("terminationDateTextBox") as TextBox;
            if (ddlEmploymentStatus.SelectedItem.ToString() != "Terminated" && !string.IsNullOrEmpty(txtTerminationDate.Text))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}