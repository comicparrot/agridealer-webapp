<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="DemeterMachine.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<section>
    <h1>User Settings</h1>
    <div class="body-content">
        <asp:FormView ID="FormView1" runat="server"  DataSourceID="dsSettings" DataKeyNames="customerID" HorizontalAlign="Center" CssClass="col-lg-5 col-md-8 col-sm-10 col-10">
            <EditItemTemplate >
                <div style="max-height:500px; overflow-y: auto;">
                      <div class="d-flex justify-content-center align-items-center">
                           <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                           <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />
                    
                     </div>

                     <div class="form-group">
                         <asp:Label ID="Label15" runat="server" Text="Customer ID:" CssClass="signupLabel"></asp:Label>
                         <asp:Textbox Text='<%# Eval("customerID") %>' runat="server" ID="TextBox1" CssClass="form-control" ClientIDMode="Static"  ReadOnly="true" Enabled="false"/>
                     </div>
                    
                     <div class="form-group">
                         <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="UsernameLabel" CssClass="form-control" ClientIDMode="Static" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field" ControlToValidate="UsernameLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                    
                     </div>
                    
                     <div class="form-group">
                         <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="PasswordLabel" CssClass="form-control" ClientIDMode="Static" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required field" ControlToValidate="PasswordLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                     </div>
                    
                      <div class="form-group">
                          <asp:Label ID="Label17" runat="server" Text="Password Re-Entry:" CssClass="signupLabel"></asp:Label>
                          <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordReentry" CssClass="form-control" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="passwordReentry"  Display="Dynamic"></asp:RequiredFieldValidator>
                          <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger error-text" ErrorMessage="Passwords must match" ControlToValidate="passwordReentry" ControlToCompare="PasswordLabel"  Display="Dynamic"></asp:CompareValidator>
                      </div>
                    
                     <div class="form-group">
                         <asp:Label ID="Label3" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("firstname") %>' runat="server" ID="FirstNameLabel" CssClass="form-control" ClientIDMode="Static" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required field" ControlToValidate="FirstNameLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="First Name is text only" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="FirstNameLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                     </div>
                    
                     <div class="form-group">
                         <asp:Label ID="Label4" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("lastname") %>' runat="server" ID="LastNameLabel" CssClass="form-control" ClientIDMode="Static" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required field" ControlToValidate="LastNameLabel" CssClass="text-danger error-text" Display="Dynamic" ></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Last NAme is text only" ValidationExpression="^[a-zA-Z ]*$" ControlToValidate="LastNameLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                    
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
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Zip code field accepts 5 digit numbers only " ValidationExpression="^(?:\d{5}(?:-\d{4})?)?$" ControlToValidate="ZipCodeLabel" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
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
                    
                     <div class="form-group">
                         <asp:Label ID="Label14" runat="server" Text="UserRole:" CssClass="signupLabel"></asp:Label>
                         <asp:TextBox Text='<%# Bind("userrole") %>' runat="server" ID="UserRoleTextBox" Cssclass="form-control" ClientIDMode="Static" ReadOnly="true" Enabled="false"/>
                     </div>
                    

                </div>




            </EditItemTemplate>
            <ItemTemplate>
                <div style="max-height:500px; overflow-y: auto;">

                   <div class="d-flex justify-content-center align-items-center">
                        <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CssClass="btn" CausesValidation="False" />
                       <%--<asp:Button runat="server" Text="New" CommandName="New" ID="NewButton" ClientIDMode="Static" CausesValidation="False" CssClass="btn" OnClick="NewButton_Click" />--%>
                
                   </div>

                    <div class="form-group">
                       <asp:Label ID="Label15" runat="server" Text="Customer ID:" CssClass="signupLabel"></asp:Label>
                       <asp:TextBox Text='<%# Eval("customerID") %>' runat="server" ID="TextBox1" CssClass="form-control" ClientIDMode="Static"  ReadOnly="true"/>
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("username") %>' runat="server" ID="UsernameLabelItem" CssClass="form-control" ClientIDMode="Static" ReadOnly="true"/>
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label2" runat="server" Text="Password:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("password") %>' runat="server" ID="PasswordLabelItem" CssClass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label3" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("firstname") %>' runat="server" ID="FirstNameLabelItem" CssClass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label4" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("lastname") %>' runat="server" ID="LastNameLabelItem" CssClass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label5" runat="server" Text="Address1:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("address1") %>' runat="server" ID="Address1LabelItem"  CssClass="form-control" ClientIDMode="Static" ReadOnly="true"/>
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label7" runat="server" Text="Address2:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("address2") %>' runat="server" ID="Address2LabelItem"  CssClass="form-control" ClientIDMode="Static" ReadOnly="true"/>
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label6" runat="server" Text="City:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("city") %>' runat="server" ID="CityLabelItem" Cssclass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label8" runat="server" Text="State:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("state") %>' runat="server" ID="StateLabelItem" CssClass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label9" runat="server" Text="Zip Code:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("zip") %>' runat="server" ID="ZipCodeLabelItem" CssClass="form-control"  ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label10" runat="server" Text="Email:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("email") %>' runat="server" ID="EmailLabelItem" Cssclass="form-control" ClientIDMode="Static" ReadOnly="true" />
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label11" runat="server" Text="Phone:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("phone") %>' runat="server" ID="PhoneLabelItem" CssClass="form-control"  ClientIDMode="Static" ReadOnly="true"/>
                   </div>
                
                   <div class="form-group">
                       <asp:Label ID="Label12" runat="server" Text="UserRole:" CssClass="signupLabel"></asp:Label>
                       <asp:Textbox Text='<%# Bind("userrole") %>' runat="server" ID="Label13" CssClass="form-control"  ClientIDMode="Static" ReadOnly="true"/>
                   </div>
                
                </div>




            </ItemTemplate>

        </asp:FormView>

        <asp:SqlDataSource runat="server" ID="dsSettings"
            ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
            DeleteCommand="DELETE FROM [customers] WHERE [customerID] = @customerID"
            InsertCommand="INSERT INTO [customers] ([username], [password], [firstname], [lastname], [address1], [address2], [city], [state], [zip], [email], [phone], [userrole]) 
            VALUES (@username, @password, @firstname, @lastname, @address1, @address2, @city, @state, @zip, @email, @phone, @userrole)"
            SelectCommand="SELECT * FROM [customers] WHERE ([customerID] = @customerID)"
            UpdateCommand="UPDATE [customers] SET [username] = @username, [password] = @password, [firstname] = @firstname, [lastname] = @lastname, [address1] = @address1, [address2] = @address2,
            [city] = @city, [state] = @state, [zip] = @zip, [email] = @email, [phone] = @phone, [userrole] = @userrole WHERE [customerID] = @customerID"
            OnUpdated="dsSettings_Updated">
            <DeleteParameters>
                <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
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
            <SelectParameters>
                <asp:SessionParameter SessionField="customerID" Name="customerID" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
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
                <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="dsStates" runat="server"
            ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
            SelectCommand="SELECT * FROM [states]"></asp:SqlDataSource>

    </div>



</section>


</asp:Content>
