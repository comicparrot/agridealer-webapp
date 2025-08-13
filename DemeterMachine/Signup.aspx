<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DemeterMachine.Signup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<section >
    <div class="body-content">
        <h1>Please fill out the form to signup</h1>
        <div class="row d-flex justify-content-center align-items-center">
            <asp:FormView ID="FormView2" runat="server" DataSourceID="dsCustomers" DataKeyNames="customerID" DefaultMode="Insert" CssClass="col-lg-5 col-md-8 col-sm-10">

                <InsertItemTemplate>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="usernameTextBox"  CssClass="form-control"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="usernameTextBox"  Display="Dynamic" CssClass="text-danger  error-text"></asp:RequiredFieldValidator>           
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger error-text" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Required Field"  Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Password Re-Entry:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordReentry" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="passwordReentry"  Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger error-text" ErrorMessage="Passwords must match" ControlToValidate="passwordReentry" ControlToCompare="passwordTextBox"  Display="Dynamic"></asp:CompareValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("firstname") %>' runat="server" ID="firstnameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger error-text" runat="server" ErrorMessage="Required Field!" ControlToValidate="firstnameTextBox"  Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("lastname") %>' runat="server" ID="lastnameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger error-text" runat="server" ErrorMessage="Required Field" ControlToValidate="lastnameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label12" runat="server" Text="Address1:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("address1") %>' runat="server" ID="address1TextBox" CssClass="form-control"  />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="address1TextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label11" runat="server" Text="Address2:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("address2") %>' runat="server" ID="address2TextBox" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" Text="City:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("city") %>' runat="server" ID="cityTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="cityTextBox" Display="Dynamic" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="City field can only contain letters" ControlToValidate="cityTextBox" CssClass="text-danger error-text" ValidationExpression="^[a-zA-Z]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label9" runat="server" Text="State:" CssClass="signupLabel"></asp:Label>
                        <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="dsStates" DataTextField="statename" DataValueField="statecode"
                             Text='<%# Bind("state") %>' CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ControlToValidate="ddlStates" CssClass="text-danger error-text" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Text="Zip Code:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("zip") %>' runat="server" ID="zipTextBox" placeholder="5 digit zip code" CssClass="form-control"/>   
                        <asp:RequiredFieldValidator ID="rfvZip"  runat="server" ErrorMessage="Zip code is required" CssClass="text-danger error-text"
                                 ControlToValidate="zipTextBox" Display="Dynamic">Required Field</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" CssClass="text-danger error-text" ControlToValidate="zipTextBox" runat="server" ErrorMessage="Invalid Zipcode"  ValidationExpression="^\d{5}(-\d{4})?$" ></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="Email:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" CssClass="form-control"/>
                        <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Email is required" CssClass="text-danger error-text"
                            ControlToValidate="emailTextBox" Display="Dynamic">Required Field</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic"  CssClass="text-danger error-text" runat="server" ErrorMessage="Invalid email address" ControlToValidate="emailTextBox" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                            ></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Phone Number:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("phone") %>' runat="server" ID="phoneTextBox" CssClass="form-control" 
                            placeholder="555-555-5555" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  Display="Dynamic" ControlToValidate="phoneTextBox" ValidationExpression="^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$" 
                            CssClass="text-danger error-text" runat="server" ErrorMessage="Invalid phone number"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" Display="Dynamic" CssClass="text-danger error-text" ControlToValidate="phoneTextBox"></asp:RequiredFieldValidator>
                    </div>

                    <div class="text-center">
                        <asp:Button runat="server" Text="Sign Up" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn" />
                        <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False"  CssClass="btn"/>
                    </div>

                </InsertItemTemplate>

            


              </asp:FormView>
            <asp:SqlDataSource runat="server" ID="dsCustomers" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                InsertCommand="INSERT INTO [customers] ([username], [password], [firstname], [lastname], [address1], [address2], [city], 
                [state], [zip], [email], [phone], [userrole]) VALUES (@username, @password, @firstname, @lastname, @address1, @address2,
                @city, @state, @zip, @email, @phone, 'customer')" OnInserted="dsCustomers_Inserted" >

                <InsertParameters>
                    <asp:Parameter Name="username" Type="String"></asp:Parameter>
                    <asp:Parameter Name="password" Type="String"></asp:Parameter>
                    <asp:Parameter Name="firstname" Type="String"></asp:Parameter>
                    <asp:Parameter Name="lastname" Type="String"></asp:Parameter>
                    <asp:Parameter Name="address1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="address2" Type="String"></asp:Parameter>
                    <asp:Parameter Name="city" Type="String"></asp:Parameter>
                    <asp:Parameter Name="state" Type="String"></asp:Parameter>
                    <asp:Parameter Name="zip" Type="String"></asp:Parameter>
                    <asp:Parameter Name="email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="userrole" Type="String"></asp:Parameter>
                </InsertParameters>

            </asp:SqlDataSource>

            <asp:SqlDataSource ID="dsStates" runat="server" 
                ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
                SelectCommand="SELECT * FROM [states]"></asp:SqlDataSource>


        </div>
    </div>

</section>



</asp:Content>
