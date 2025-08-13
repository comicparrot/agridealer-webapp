using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text;
            string password = txtPass.Text;
            string userRole;
            string email;
            string firstName;
            string lastName;
            string customerID;

            //validates the login and stores username and email in a session when successfull
            if (ValidateLogin(username, password, out userRole, out email, out firstName, out lastName, out customerID))
            {
                Users.UserRole = userRole;

                Session["UserName"] = username;
                Session["Email"] = email;
                Session["customerID"] = customerID;
                Session["firstName"] = firstName;
                Session["lastName"] = lastName;

                Response.Redirect("Default.aspx");

            }
            else
            {
                lblMessage.Text = "Invalid Login!";
            }

        }

        private bool ValidateLogin(string username, string password, out string role, out string email, out string firstName, out string lastName, out string customerID)
        {
            try
            {
                // Replace connectionString with your actual connection string for SQL Server
                string connectionString = ConfigurationManager.ConnectionStrings["agridealerConnectionString5"].ConnectionString;;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT COUNT(*) FROM customers WHERE username = @Username AND password = @Password";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);

                        int count = Convert.ToInt32(command.ExecuteScalar());

                        if (count > 0)
                        {
                            query = "SELECT userrole, firstname, lastname, customerID, email FROM customers WHERE username = @Username";
                            command.CommandText = query;

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    role = reader["userrole"].ToString();
                                    firstName = reader["firstname"].ToString();
                                    lastName = reader["lastname"].ToString();
                                    email = reader["email"].ToString();
                                    customerID = reader["customerID"].ToString();

                                    return true;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception properly, you can log it or display a user-friendly message
                lblMessage.Text = "Unable to connect to the database! Please check the connection criteria. " + ex.Message;
            }

            role = null;
            email = null;
            firstName = null;
            lastName = null;
            customerID = null;
            return false;
        }
    }
}
