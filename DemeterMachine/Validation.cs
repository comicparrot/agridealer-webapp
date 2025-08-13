using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace DemeterMachine
{


    internal class Validation
    {

        //collection of methods for input validations


        //phone validation
        public bool PhoneValid(string text)
        {
            string pattern = @"^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$|^$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        public bool IPAddressValid(string text)
        {
            string pattern = @"\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        public bool DateValid(string text)
        {
            string pattern = @"^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$|^00/00/0000$|^$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        public bool ExpirationDate(string text)
        {
            string pattern = @"^(0[1-9]|1[0-2])\/\d{2}$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        public bool CreditCard(string text)
        {
            string pattern = @"^(?:\b(?:\d[ -]*?){13,16}\b|)$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        //email validation
        public bool EmailValid(string text)
        {
            string pattern = @"^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})?$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }


        //password validation
        public bool PasswordValid(string text)
        {
            string pattern = @"^(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        //validates if there are numbers only
        public bool IsNumber(string text)
        {
            string pattern = @"^(?:[1-9]\d*|0|$)?$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        public bool IsIllegal(string text)
        {
            string pattern = @"/['\"";\(\)-]/";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        //validates a decimal number
        public bool IsDecimal(string text)
        {
            string pattern = @"^(?:[1-9]\d*|0)?(?:\.\d+)?$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }


        //validates if there are letters only
        public bool IsLetter(string text)
        {
            string pattern = "^[a-zA-Z ]*$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);

        }

        //validates for empty textboxes
        public bool IsEmptyTextBoxes(Control container, TextBox textBoxToExclude = null)
        {

            foreach (Control control in container.Controls)
            {
                // Check if the control is a TextBox
                if (control is TextBox textBox && textBox != textBoxToExclude)
                {
                    // Check if the TextBox is empty
                    if (string.IsNullOrWhiteSpace(textBox.Text))
                    {
                        return true; // At least one TextBox is empty
                    }
                }
            }
            return false;
        }

        //validates for empty comboboxes
        public bool IsEmptyComboBoxes(Control container)
        {

            foreach (Control control in container.Controls)
            {
                // Check if the control is a TextBox
                if (control is ComboBox combobox)
                {
                    // Check if the TextBox is empty
                    if (string.IsNullOrWhiteSpace(combobox.Text))
                    {
                        return true; // At least one TextBox is empty
                    }
                }
            }
            return false;
        }

        //clears the forms textboxes
        public bool ClearOutTextBoxes(Control container)
        {

            foreach (Control control in container.Controls)
            {
                // Check if the control is a TextBox
                if (control is TextBox textBox)
                {
                    // Check if the TextBox is empty
                    textBox.Clear();
                }

                if (control is ComboBox comboBox)
                {
                    comboBox.SelectedItem = null;
                }
            }
            return false;
        }

        //sets the max length of the textboxes
        public void setMaxLengthTextbox(Control container)
        {

            foreach (Control control in container.Controls)
            {
                // Check if the control is a TextBox
                if (control is TextBox textBox)
                {
                    // Check if the TextBox is empty
                    textBox.MaxLength = 20;
                }
            }
        }

        //validates if a whole number
        public bool IsWholeNumber(string text)
        {
            string pattern = "^[0-9]*$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);
        }

        //validates for a zip code
        public bool IsZipCode(string text)
        {
            string pattern = @"^(?:\d{5}(?:-\d{4})?)?$";
            Regex regex = new Regex(pattern);
            return regex.IsMatch(text);
        }
    }
}

