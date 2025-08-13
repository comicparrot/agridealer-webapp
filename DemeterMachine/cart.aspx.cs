using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;



namespace DemeterMachine
{
    public partial class cart : System.Web.UI.Page
    {
        private CartItemList shoppingcart;
        decimal unitPrice = 0;
        private decimal cartTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            shoppingcart = CartItemList.GetCart();
            if (!IsPostBack)
            {
                this.DisplayCart();

            }

            CalculateGrandTotal();
        }

        //private void DisplayCart()
        //{

        //    lstCart.Items.Clear();
        //    CartItem item;
        //    decimal total = 0;

        //    for (int i = 0; i < shoppingcart.Count; i++)
        //    {
        //        item = shoppingcart[i];
        //        lstCart.Items.Add(item.Display());
        //        total += item.Product.UnitPrice * item.Quantity;
        //    }

        //    lblTotal.Text = total.ToString("c");
        //    Session["Total"] = total;
        //}

        //private void DisplayCart()
        //{

        //    lstCart.Items.Clear();
        //    CartItem item;
        //    decimal total = 0;

        //    for (int i = 0; i < shoppingcart.Count; i++)
        //    {
        //        item = shoppingcart[i];
        //        lstCart.Items.Add(item.Display());
        //        total += item.Product.UnitPrice * item.Quantity;
        //    }

        //    lblTotal.Text = total.ToString("c");
        //    Session["Total"] = total;
        //}

        List<CartItem> products;
        private void DisplayCart()
        {
            products = new List<CartItem>();


            CartItem item;

            decimal total = 0;

            for (int i = 0; i < shoppingcart.Count; i++)
            {
                item = shoppingcart[i];
                products.Add(item);
                total += item.Product.UnitPrice * item.Quantity;
            }

            
            Session["Total"] = total;
            rptCart.DataSource = products;
            rptCart.DataBind();

            cartTotal = total;


        }

        private Label FindLabel(Control parentControl, string labelId)
        {
            foreach (Control control in parentControl.Controls)
            {
                if (control is Label && control.ID == labelId)
                {
                    return (Label)control;
                }
                else if (control.HasControls())
                {
                    Label foundLabel = FindLabel(control, labelId);
                    if (foundLabel != null)
                    {
                        return foundLabel;
                    }
                }
            }
            return null;
        }

        private void CalculateGrandTotal()
        {
            decimal grandTotal = 0;

            // Loop through the Repeater items to calculate the grand total
            foreach (RepeaterItem item in rptCart.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lblItemTotal = (Label)item.FindControl("lblItemTotal");
                    if (lblItemTotal != null)
                    {
                        decimal itemTotal;
                        if (decimal.TryParse(lblItemTotal.Text.TrimStart('$'), out itemTotal))
                        {
                            grandTotal += itemTotal;
                        }
                    }
                }
            }

            // Set the grand total to the lblItemTotal label
            Label lblGrandTotal = FindLabel(this, "lblGrandTotal");
            if (lblGrandTotal != null)
            {
                lblGrandTotal.Text = grandTotal.ToString("c");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {

        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (shoppingcart.Count > 0)
            {
                // Clear the shopping cart
                shoppingcart.Clear();

                // Rebind the Repeater to reflect the changes
                DisplayCart();

                CalculateGrandTotal();
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("partStore.aspx");

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "AccountCreation", "alert('Please create an account or log in to make a purchase!');", true);
            }
            else
            {
                if (shoppingcart.Count > 0)
                {
                    Response.Redirect("checkout.aspx");
                }
                else
                {
                    
                    lblMessage.Text = "Your cart is empty! Please add items to check out!";
                }
            }



        }



        protected void Image1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image Image1 = (Image)e.Item.FindControl("Image1");
                string part_number = ((CartItem)e.Item.DataItem).Product.ProductID;
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

                }

                // Find the TextBox control within the RepeaterItem
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                Label price = (Label)e.Item.FindControl("lblUnitPrice");

                // Get the current quantity value and increment it
                int quantity = int.Parse(txtQuantity.Text);

                // Update the TextBox control with the new quantity value
                txtQuantity.Text = quantity.ToString();

                decimal unitPrice;
                // Check if the text of the price Label can be parsed to a decimal
                if (decimal.TryParse(price.Text.TrimStart('$'), out unitPrice))
                {
                    // Calculate the total price and assign it to the Label lblItemTotal
                    Label lblItemTotal = (Label)e.Item.FindControl("lblItemTotal") as Label;
                    lblItemTotal.Text = (quantity * unitPrice).ToString("C");
                }

            }

        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "IncreaseQuantity")
            {
                // Find the TextBox control within the RepeaterItem
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                Label price = (Label)e.Item.FindControl("lblUnitPrice");

                // Get the current quantity value and increment it
                int quantity = int.Parse(txtQuantity.Text);
                quantity++;

                // Update the TextBox control with the new quantity value
                txtQuantity.Text = quantity.ToString();

                decimal unitPrice;
                Page.Validate();

                // Check if the text of the price Label can be parsed to a decimal
                if (decimal.TryParse(price.Text.TrimStart('$'), out unitPrice))
                {
                    // Calculate the total price and assign it to the Label lblItemTotal
                    Label lblItemTotal = (Label)e.Item.FindControl("lblItemTotal") as Label;
                    lblItemTotal.Text = (quantity * unitPrice).ToString("C");
                }

                // Find the index of the item whose quantity is being updated
                int itemIndex = e.Item.ItemIndex;

                // Update the quantity in the shopping cart
                shoppingcart[itemIndex].Quantity = quantity;

                // Rebind the Repeater to reflect the changes
                DisplayCart();

                CalculateGrandTotal();
            }

            if (e.CommandName == "DecreaseQuantity")
            {
                // Find the TextBox control within the RepeaterItem
                TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
                Label price = (Label)e.Item.FindControl("lblUnitPrice");

                // Get the current quantity value and decrement it
                int quantity = int.Parse(txtQuantity.Text);
                if (quantity > 1)
                {
                    quantity--; // Ensure quantity is never less than 1
                }

                // Update the TextBox control with the new quantity value
                txtQuantity.Text = quantity.ToString();

                Page.Validate();

                decimal unitPrice;
                // Check if the text of the price Label can be parsed to a decimal
                if (decimal.TryParse(price.Text.TrimStart('$'), out unitPrice))
                {
                    // Calculate the total price and assign it to the Label lblItemTotal
                    Label lblItemTotal = (Label)e.Item.FindControl("lblItemTotal") as Label;
                    lblItemTotal.Text = (quantity * unitPrice).ToString("C");
                }

                // Find the index of the item whose quantity is being updated
                int itemIndex = e.Item.ItemIndex;

                // Update the quantity in the shopping cart
                shoppingcart[itemIndex].Quantity = quantity;

                // Rebind the Repeater to reflect the changes
                DisplayCart();

                CalculateGrandTotal();
            }

            if (e.CommandName == "RemoveItem")
            {
                int itemIndex;
                if (int.TryParse(e.CommandArgument.ToString(), out itemIndex))
                {
                    // Remove the item from the shopping cart
                    shoppingcart.RemoveAt(itemIndex);

                    // Rebind the Repeater to reflect the changes
                    DisplayCart();
                }

                CalculateGrandTotal();
            }
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            // Get the TextBox control
            TextBox txtQuantity = (TextBox)sender;

            // Find the parent RepeaterItem
            RepeaterItem item = (RepeaterItem)txtQuantity.NamingContainer;

            // Find other controls within the RepeaterItem
            Label price = (Label)item.FindControl("lblUnitPrice");
            Label lblItemTotal = (Label)item.FindControl("lblItemTotal");

            Page.Validate();
            // Parse the quantity entered in the TextBox
            int quantity;
            if (int.TryParse(txtQuantity.Text, out quantity))
            {
                // Parse the unit price from the Label
                decimal unitPrice;
                if (decimal.TryParse(price.Text.TrimStart('$'), out unitPrice))
                {
                    // Calculate the total price
                    decimal totalPrice = quantity * unitPrice;

                    // Update the total price Label
                    lblItemTotal.Text = totalPrice.ToString("C");

                    // Find the index of the item whose quantity is being updated
                    int itemIndex = item.ItemIndex;

                    // Update the quantity in the shopping cart
                    shoppingcart[itemIndex].Quantity = quantity;

                    // Rebind the Repeater to reflect the changes
                    DisplayCart();

                    CalculateGrandTotal();
                }
            }
        }

        protected void btnIncreaseQuantity_Click(object sender, EventArgs e)
        {

        }

        protected void btnDecreaseQuantity_Click(object sender, EventArgs e)
        {
            LinkButton btnDecrease = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btnDecrease.NamingContainer;
            TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
            Label price = (Label)item.FindControl("lblUnitPrice");

            // Get the current quantity value and decrement it
            int quantity = int.Parse(txtQuantity.Text);
            if (quantity > 1)
            {
                quantity--; // Ensure quantity is never less than 1
                txtQuantity.Text = quantity.ToString();

                // Parse the unit price from the Label
                decimal unitPrice;
                if (decimal.TryParse(price.Text.TrimStart('$'), out unitPrice))
                {
                    // Calculate the total price and assign it to the Label lblItemTotal
                    Label lblItemTotal = (Label)item.FindControl("lblItemTotal") as Label;
                    lblItemTotal.Text = (quantity * unitPrice).ToString("C");
                }

                // Find the index of the item whose quantity is being updated
                int itemIndex = item.ItemIndex;

                // Update the quantity in the shopping cart
                shoppingcart[itemIndex].Quantity = quantity;

                // Rebind the Repeater to reflect the changes
                DisplayCart();

                CalculateGrandTotal();
            }
        }
    }
}