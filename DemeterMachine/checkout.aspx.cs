using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Configuration;


namespace DemeterMachine
{
    public partial class checkout : System.Web.UI.Page
    {
        private CartItemList shoppingcart;

        protected void Page_Load(object sender, EventArgs e)
        {
            shoppingcart = CartItemList.GetCart();

            if (!IsPostBack)
            {

            }

            //gets and displays the total from a session
            if (Session["Total"] != null)
            {
                decimal total = (decimal)Session["Total"];
                TextBox totalTextBox = (TextBox)FormView1.FindControl("orderTotalTextBox");

                totalTextBox.Text = total.ToString("F2");
            }

            //gets and displays the user email from a session
            if (Session["Email"] != null)
            {
                string emailString = (string)Session["Email"];
                TextBox emailTextBox = (TextBox)FormView1.FindControl("EmailLabel");

                emailTextBox.Text = emailString;
            }

            //gets and displays the username from a session
            if (Session["customerID"] != null)
            {
                string customerIDstring = (string)Session["customerID"];
                TextBox customerID = (TextBox)FormView1.FindControl("customerIDTextbox");

                customerID.Text = customerIDstring;
            }
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");

        }

        protected void dsCheckout_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int orderID = 0;
            int orderSequence = 1;

            try
            {
                // Replace connectionString with your actual connection string for SQL Server
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT MAX(orderid) AS MAXOrderID FROM orders ";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {


                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                orderID = Convert.ToInt32(reader["MAXOrderID"]);

                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception properly, you can log it or display a user-friendly message
                //lblMessage.Text = "Unable to connect to the database! Please check the connection criteria. " + ex.Message;
            }

            try
            {
                // Replace connectionString with your actual connection string for SQL Server
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    for (int i = 0; i < shoppingcart.Count; i++)
                    {

                        string query = "INSERT INTO orderdetails (orderid, order_sequence,part_number, quantity, unitprice,total) VALUES(@OrderID,@OrderSequence,@PartNumber,@Quantity,@UnitPrice,@Total)";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@OrderID", orderID);
                            command.Parameters.AddWithValue("@OrderSequence", orderSequence.ToString());
                            command.Parameters.AddWithValue("@PartNumber", shoppingcart[i].Product.ProductID);
                            command.Parameters.AddWithValue("@Quantity", shoppingcart[i].Quantity);
                            command.Parameters.AddWithValue("@UnitPrice", shoppingcart[i].Product.UnitPrice);
                            command.Parameters.AddWithValue("@Total", shoppingcart[i].Quantity * shoppingcart[i].Product.UnitPrice);

                            command.ExecuteNonQuery();
                            orderSequence++;

                        }
                    }

                }
            }
            catch (Exception ex)
            {
                // Handle exception properly, you can log it or display a user-friendly message
                //lblMessage.Text = "Unable to connect to the database! Please check the connection criteria. " + ex.Message;
            }

            String script = "alert('Thank You for your purchase! You will receive an confirmation email!'); window.location.href = 'Default.aspx'; ";

            //clears the cars items from the session
            Session.Remove("Cart");

            //posts a confirmation popup message
            ScriptManager.RegisterStartupScript(this, GetType(), "ConfirmOrderScript", script, true);

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

        }
    }
}