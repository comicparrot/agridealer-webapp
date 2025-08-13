using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class suppliers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsSuppliers_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Success", "alert('Supplier updated successfully!');", true);

            }
        }

        protected void dsSuppliers_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            //validating the inputs before updating the database

            Boolean isValid = true;
            String errorMessage = "";

            //reges strings
            string isState = @"\b(AL|AK|AZ|AR|CA|CO|CT|DE|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY)\b";
            string isLetter = "^[a-zA-Z ]*$";
            string isPhone = @"^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$|^$";
            string isZipCode = @"^(?:\d{5}(?:-\d{4})?)?$";
            string isEmail = @"^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})?$";


            String companyName = "";
            String contactName = "";
            String address1 = "";
            String cityName = "";
            String stateName = "";
            String zipCode = "";
            String email = "";
            String phone = "";
            String userRole = "";


            //validating the inouts for empty inuts
            if (e.Command.Parameters["@companyname"].Value != null)
            {
                companyName = e.Command.Parameters["@companyname"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Company name is a required field\\n";
            }

            if (e.Command.Parameters["@contactname"].Value != null)
            {
                contactName = e.Command.Parameters["@contactname"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Contact Name is a required field\\n";
            }


            if (e.Command.Parameters["@address1"].Value != null)
            {
                address1 = e.Command.Parameters["@address1"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Address1 is a required field\\n";
            }

            if (e.Command.Parameters["@city"].Value != null)
            {
                cityName = e.Command.Parameters["@city"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "City is a required field\\n";
            }

            if (e.Command.Parameters["@state"].Value != null)
            {
                stateName = e.Command.Parameters["@state"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "State is a required field\\n";
            }

            if (e.Command.Parameters["@zip"].Value != null)
            {
                zipCode = e.Command.Parameters["@zip"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Zip Code is a required field\\n";
            }

            if (e.Command.Parameters["@email"].Value != null)
            {
                email = e.Command.Parameters["@email"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Email is a required field\\n";
            }

            if (e.Command.Parameters["@phone"].Value != null)
            {
                phone = e.Command.Parameters["@phone"].Value.ToString();
            }
            else
            {
                isValid = false;
                errorMessage += "Phone is a required field\\n";
            }

            //validating for invalid inputs
            if (!Regex.IsMatch(cityName, isLetter))
            {
                isValid = false;
                errorMessage += "City field error. Field contains incompatible characters\\n";
            }

            if (!Regex.IsMatch(contactName, isLetter))
            {
                isValid = false;
                errorMessage += "Contact name field error. Field contains incompatible characters. Contact name accepts letter only\\n";
            }

            if (!Regex.IsMatch(stateName, isState))
            {
                isValid = false;
                errorMessage += "State field error. Field is either blank or contains incompatible characters. Capitalized and abbreviated state names only\\n";
            }

            if (!Regex.IsMatch(zipCode, isZipCode))
            {
                isValid = false;
                errorMessage += "Zip Code field error. Field is either blank or contains incompatible characters\\n";

            }

            if (!Regex.IsMatch(email, isEmail))
            {
                isValid = false;
                errorMessage += "Email field error. Field is either blank or contains incompatible characters\\n";

            }

            if (!Regex.IsMatch(phone, isPhone))
            {
                isValid = false;
                errorMessage += "Phone field error. Field is either blank or contains incompatible characters\\n";

            }

            //confirmation message after successful insertion into the database
            if (isValid == false)
            {
                e.Cancel = true;
                // Customer inserted successfully, show an alert
                ScriptManager.RegisterStartupScript(this, GetType(), "Update Error", $"alert('{errorMessage}');", true);

            }


        }
    }
}