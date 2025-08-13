<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="DemeterMachine.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section class="serviceRecordDataBase">
    <div class="body-content">
        <h1>Checkout</h1>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mx-auto">
                <asp:FormView
                    ID="FormView1"
                    runat="server"
                    DataSourceID="dsCheckout"
                    DataKeyNames="ID" 
                    Width="100%" 
                     DefaultMode="Insert">
                    <InsertItemTemplate>
                        <div class="row justify-content-around">
                        <div class=" col-lg-5 col-md-5 col-sm-11 col-11 custom-border bg-white shadow mb-2">
                            <div class="text-center" style="font-size:1em">
                                Shipping Info
                            </div>
                           <div class="form-group">
                               <asp:Label ID="Label15" runat="server" Text="Customer ID:" CssClass="signupLabel"></asp:Label>
                               <asp:Textbox Text='<%# Bind("customerID") %>' runat="server" ID="customerIDTextbox" CssClass="form-control" ClientIDMode="Static"  ReadOnly="true"/>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label1" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("shipped_to_fname") %>' runat="server" ID="firstNameText" CssClass="form-control" ClientIDMode="Static" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field" ControlToValidate="firstNameText" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="First name field is text only" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="firstNameText" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label2" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("shipped_to_lname") %>' runat="server" ID="lastNameTextbox" CssClass="form-control" ClientIDMode="Static" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required field" ControlToValidate="lastNameTextbox" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Last name field is text only" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="lastNameTextbox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        
                        
                           <div class="form-group">
                               <asp:Label ID="Label5" runat="server" Text="Address1:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("address1") %>' runat="server" ID="Address1Label"  CssClass="form-control" ClientIDMode="Static"/>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required field" ControlToValidate="Address1Label" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                        
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label7" runat="server" Text="Address2:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("address2") %>' runat="server" ID="Address2Label"  CssClass="form-control" ClientIDMode="Static"/>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label6" runat="server" Text="City:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("city") %>' runat="server" ID="CityLabel" Cssclass="form-control" ClientIDMode="Static" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required field" ControlToValidate="CityLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="City field is text only" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="CityLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        
                               <div class="form-group">
                                   <asp:Label ID="Label16" runat="server" Text="State:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="dsStates" DataTextField="statename" DataValueField="statecode"
                                        Text='<%# Bind("state") %>' CssClass="form-control"></asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="ddlStates" CssClass="text-danger error-text" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                               </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label9" runat="server" Text="Zip Code:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("zip") %>' runat="server" ID="ZipCodeLabel" CssClass="form-control"  ClientIDMode="Static" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required field" ControlToValidate="ZipCodeLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Zip code field is number only " ValidationExpression="^(?:\d{5}(?:-\d{4})?)?$" ControlToValidate="ZipCodeLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label10" runat="server" Text="Email:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="EmailLabel" Cssclass="form-control" ClientIDMode="Static" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required field" ControlToValidate="EmailLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Email is invalid" ValidationExpression="^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})?$" ControlToValidate="EmailLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label11" runat="server" Text="Phone:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("phone") %>' runat="server" ID="PhoneLabel" CssClass="form-control"  ClientIDMode="Static"/>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required field" ControlToValidate="PhoneLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Phone is invalid" 
                                   ValidationExpression="^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\s*$|^$" ControlToValidate="PhoneLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                        </div>
                              
                        <div class="col-lg-5 col-md-5 col-sm-11 col-11 custom-border bg-white shadow mb-2">
                            <div class="text-center style=" style="font-size:1em">
                                Payment Info
                            </div>
                           <div class="form-group">
                               <asp:Label ID="Label3" runat="server" Text="Order Total:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("ordertotal") %>' runat="server" ID="orderTotalTextBox" CssClass="form-control"  ClientIDMode="Static" ReadOnly="true"/>
                           </div>
                        
                           <div class="form-group">
                               <asp:Label ID="Label14" runat="server" Text="Credit Card Number:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("cardnumber") %>' runat="server" ID="ccNumberTextBox" Cssclass="form-control" ClientIDMode="Static"/>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required field" ControlToValidate="ccNumberTextBox" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Credit Card field is number only " ValidationExpression="\b(?:\d[ -]*?){13,16}\b" ControlToValidate="ccNumberTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                           </div>
                         
                           <div class="form-group">
                               <asp:Label ID="Label8" runat="server" Text="Expiration Date:" CssClass="signupLabel"></asp:Label>
                               <asp:TextBox Text='<%# Bind("expdate") %>' runat="server" ID="expDateTextbox" Cssclass="form-control" ClientIDMode="Static"/>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required field" ControlToValidate="expDateTextbox" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Expiration date accepted format (mm/yy)" ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" ControlToValidate="expDateTextbox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>

                           </div>


                           <div class="d-flex justify-content-center align-items-center">
                                 <asp:Button runat="server" Text="Purchase" CommandName="Insert" ID="InsertButton" OnClick="InsertButton_Click" CausesValidation="True" CssClass="btn"/>
                                 <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn" OnClick="InsertCancelButton_Click" />

                           </div>
                        </div>
                        </div>





                    </InsertItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource
                    runat="server"
                    ID="dsCheckout"
                    ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                    DeleteCommand="DELETE FROM [orders] WHERE [orderid] = @orderid"
                    InsertCommand="INSERT INTO [orders] ([customerID], [orderstatus], [orderdate], [shippeddate], [shipped_to_fname], [shipped_to_lname], [address1], [address2], [city], [state], [zip], [phone], [email], 
                    [cardnumber], [expdate], [ordertotal], [paymenttype]) VALUES (@customerID, 'open', FORMAT(GETDATE(), 'MM/dd/yyyy'), @shippeddate, @shipped_to_fname, @shipped_to_lname, @address1, @address2, @city, @state, @zip, @phone, @email,
                    @cardnumber, @expdate, @ordertotal, 'CreditCard')"
                    SelectCommand="SELECT * FROM [orders]"
                    UpdateCommand="UPDATE [orders] SET [customerID] = @customerID, [orderstatus] = @orderstatus, [orderdate] = @orderdate, [shippeddate] = @shippeddate, [shipped_to_fname] = @shipped_to_fname,
                    [shipped_to_lname] = @shipped_to_lname, [address1] = @address1, [address2] = @address2, [city] = @city, [state] = @state, [zip] = @zip, [phone] = @phone, [email] = @email, [cardnumber] = @cardnumber,
                    [expdate] = @expdate, [ordertotal] = @ordertotal, [paymenttype] = @paymenttype WHERE [orderid] = @orderid"
                     OnInserted="dsCheckout_Inserted">

                    <DeleteParameters>
                        <asp:Parameter Name="orderid" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="orderstatus" Type="String"></asp:Parameter>
                        <asp:Parameter Name="orderdate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shippeddate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shipped_to_fname" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shipped_to_lname" Type="String"></asp:Parameter>
                        <asp:Parameter Name="address1" Type="String"></asp:Parameter>
                        <asp:Parameter Name="address2" Type="String"></asp:Parameter>
                        <asp:Parameter Name="city" Type="String"></asp:Parameter>
                        <asp:Parameter Name="state" Type="String"></asp:Parameter>
                        <asp:Parameter Name="zip" Type="String"></asp:Parameter>
                        <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="cardnumber" Type="String"></asp:Parameter>
                        <asp:Parameter Name="expdate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ordertotal" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="paymenttype" Type="String"></asp:Parameter>
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="orderstatus" Type="String"></asp:Parameter>
                        <asp:Parameter Name="orderdate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shippeddate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shipped_to_fname" Type="String"></asp:Parameter>
                        <asp:Parameter Name="shipped_to_lname" Type="String"></asp:Parameter>
                        <asp:Parameter Name="address1" Type="String"></asp:Parameter>
                        <asp:Parameter Name="address2" Type="String"></asp:Parameter>
                        <asp:Parameter Name="city" Type="String"></asp:Parameter>
                        <asp:Parameter Name="state" Type="String"></asp:Parameter>
                        <asp:Parameter Name="zip" Type="String"></asp:Parameter>
                        <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="cardnumber" Type="String"></asp:Parameter>
                        <asp:Parameter Name="expdate" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ordertotal" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="paymenttype" Type="String"></asp:Parameter>
                        <asp:Parameter Name="orderid" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                  
                <asp:SqlDataSource ID="dsStates" runat="server"
                     ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                     SelectCommand="SELECT * FROM [states]">

                </asp:SqlDataSource>
                  
            </div>
        </div>
    </div>
</section>
</asp:Content>
