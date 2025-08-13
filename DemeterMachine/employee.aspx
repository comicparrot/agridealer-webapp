<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="DemeterMachine.employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section>
    <h1>Employee Information</h1>
    <div class="container" style="max-width:450px">
        <div class="row">
            <div class="form-group">
                <h6>Choose an employee to view their informmation</h6>
                <asp:DropDownList ID="ddlemployee" CssClass="form-control" DataSourceID="dsEmployee" 
                    OnSelectedIndexChanged="ddlemployee_SelectedIndexChanged" 
                    DataTextField="fullName" 
                    DataValueField="employeeID"
                    runat="server" AutoPostBack="true"></asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="dsEmployee"
                          ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                          SelectCommand="SELECT CONCAT(firstname, ' ', lastname) AS fullName, employeeID FROM [employee]">
                      </asp:SqlDataSource> 
            </div> 
        </div>
    </div>

    <div class="body-content">
        <div class="row"> 
            <asp:FormView ID="FormView1" runat="server" DataSourceID="dsEmployeeInfo" Width="70%" HorizontalAlign="Center" DataKeyNames="employeeID">
                <EditItemTemplate>
                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12 col-xs-12 mx-auto" style="max-height:500px; overflow-y: auto;">
                               <div class="form-group">
                                   <asp:Label ID="Label01" runat="server" Text="Employee ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:Textbox Text='<%# Eval("employeeID") %>' runat="server" ID="employeeIDLabel1" CssClass="form-control" ReadOnly="true" />
                               </div>
                               
                               <div class="form-group">
                                   <asp:Label ID="Label02" runat="server" Text="User Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="usernameTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator02" runat="server" ErrorMessage="Required Field" ControlToValidate="usernameTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label11" runat="server" Text="Password:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required Field" ControlToValidate="passwordTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Password must be 8 characters and contain at least 1 uppercase letter and 1 special character" ControlToValidate="passwordTextBox" CssClass="text-danger error-text" ValidationExpression="^(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label15" runat="server" Text="Password Re-Entry:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordReentry" CssClass="form-control" />
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="passwordReentry"  Display="Dynamic"></asp:RequiredFieldValidator>
                                   <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger error-text" ErrorMessage="Passwords must match" ControlToValidate="passwordReentry" ControlToCompare="passwordTextBox"  Display="Dynamic"></asp:CompareValidator>
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label03" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("firstname") %>' runat="server" ID="firstnameTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator03" runat="server" ErrorMessage="Required Field" ControlToValidate="firstnameTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>    
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server" ErrorMessage="First name field can only contain letters" ControlToValidate="firstnameTextBox" CssClass="text-danger error-text" ValidationExpression="^[a-zA-Z]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                   
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label10" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("lastname") %>' runat="server" ID="lastnameTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="lastnameTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>    
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="First name field can only contain letters" ControlToValidate="lastnameTextBox" CssClass="text-danger error-text" ValidationExpression="^[a-zA-Z]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                                   
                               </div>

                              <div class="form-group">
                                  <asp:Label ID="Label16" runat="server" Text="Address1:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("address1") %>' runat="server" ID="address1TextBox" CssClass="form-control"  />
                                  <asp:RequiredFieldValidator runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="address1TextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label17" runat="server" Text="Address2:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("address2") %>' runat="server" ID="address2TextBox" CssClass="form-control" />
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label18" runat="server" Text="City:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("city") %>' runat="server" ID="cityTextBox" CssClass="form-control" />
                                  <asp:RequiredFieldValidator runat="server" CssClass="text-danger error-text" ErrorMessage="Required Field" ControlToValidate="cityTextBox" Display="Dynamic" ></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="City field can only contain letters" ControlToValidate="cityTextBox" CssClass="text-danger error-text" ValidationExpression="^[a-zA-Z]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label19" runat="server" Text="State:" CssClass="signupLabel"></asp:Label>
                                  <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="dsStates" DataTextField="statename" DataValueField="statecode"
                                       Text='<%# Bind("state") %>' CssClass="form-control"></asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" runat="server" ControlToValidate="ddlStates" CssClass="text-danger error-text" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label20" runat="server" Text="Zip Code:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("zip") %>' runat="server" ID="zipTextBox" placeholder="5 digit zip code" CssClass="form-control"/>   
                                  <asp:RequiredFieldValidator ID="rfvZip"  runat="server" ErrorMessage="Zip code is required" CssClass="text-danger error-text"
                                           ControlToValidate="zipTextBox" Display="Dynamic">Required Field</asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" CssClass="text-danger error-text" ControlToValidate="zipTextBox" runat="server" ErrorMessage="Invalid Zipcode"  ValidationExpression="^\d{5}(-\d{4})?$" ></asp:RegularExpressionValidator>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label21" runat="server" Text="Email:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" CssClass="form-control"/>
                                  <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Email is required" CssClass="text-danger error-text"
                                      ControlToValidate="emailTextBox" Display="Dynamic">Required Field</asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator9" Display="Dynamic"  CssClass="text-danger error-text" runat="server" ErrorMessage="Invalid email address" ControlToValidate="emailTextBox" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                      ></asp:RegularExpressionValidator>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label22" runat="server" Text="Phone Number:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("phone") %>' runat="server" ID="phoneTextBox" CssClass="form-control" 
                                      placeholder="555-555-5555" />
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator11"  Display="Dynamic" ControlToValidate="phoneTextBox" ValidationExpression="^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$" 
                                      CssClass="text-danger error-text" runat="server" ErrorMessage="Invalid phone number"></asp:RegularExpressionValidator>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required Field" Display="Dynamic" CssClass="text-danger error-text" ControlToValidate="phoneTextBox"></asp:RequiredFieldValidator>
                              </div>

                               <div class="form-group">
                                   <asp:Label ID="Label04" runat="server" Text="Hourly Rate:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("hourlyrate") %>' runat="server" ID="hourlyRateTextBox" CssClass="form-control"/>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Hourly rate accepts numbers only" ControlToValidate="hourlyRateTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label23" runat="server" Text="Employment Status:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlEmploymentStatus" runat="server" Text='<%# Bind("employmentstatus") %>' CssClass="form-control" >
                                       <asp:ListItem Text="Full-Time"></asp:ListItem>
                                       <asp:ListItem Text="Part-Time"></asp:ListItem>
                                       <asp:ListItem Text="Terminated"></asp:ListItem>
                                   </asp:DropDownList>      
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlEmploymentStatus"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:CustomValidator ID="CustomValidator2" runat="server" OnServerValidate="CustomValidator2_ServerValidate" ErrorMessage="Employment Status must be set to Teminated if Termination Date is populated" CssClass="text-danger error-text"></asp:CustomValidator>
 
                               </div>
                                                 
                               <div class="form-group">
                                   <asp:Label ID="Label07" runat="server" Text="Hire Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("hiredate") %>' runat="server" ID="hireDateTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="hireDateTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$|^00/00/0000$|^$" ErrorMessage="Hire date required format (mm/dd/yyyy)" ControlToValidate="hireDateTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label24" runat="server" Text="Termination Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("terminationdate") %>' runat="server" ID="terminationDateTextBox" CssClass="form-control"/>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$|^00/00/0000$|^$" ErrorMessage="Hire date required format (mm/dd/yyyy)" ControlToValidate="terminationDateTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                                   <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate" ErrorMessage="Termination date is required if Employment Status is Terminated" CssClass="text-danger error-text"></asp:CustomValidator>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label25" runat="server" Text="User Role:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlUserRole" runat="server" DataSourceID="dsUserRole" DataTextField="userrole" DataValueField="userrole"
                                        Text='<%# Bind("userrole") %>' CssClass="form-control"></asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator13" Display="Dynamic" runat="server" ControlToValidate="ddlUserRole" CssClass="text-danger error-text" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                               </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                        <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />
                    </div>
               


                </EditItemTemplate>

                <ItemTemplate>


                    <div class="row"> 

                          <div class="col-lg-5 imageCenter">
                               <asp:Image ID="Image1" runat="server" CssClass="img-fluid" OnDataBinding="Image1_DataBinding"/>
                           </div>

                            <div class="col-lg-5 col-md-12  col-sm-12 col-xs-12 mx-auto" style="max-height:500px; overflow-y: auto;">

                               <div class="form-group">
                                   <asp:Label ID="Label02" runat="server" Text="User Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("username") %>' runat="server" ID="usernameTextBox" CssClass="form-control" ReadOnly="true"/>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label11" runat="server" Text="Password:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordTextBox" CssClass="form-control" ReadOnly="true"/>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label15" runat="server" Text="Password Re-Entry:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("password") %>' runat="server" ID="passwordReentry" CssClass="form-control" ReadOnly="true" />
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label03" runat="server" Text="First Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("firstname") %>' runat="server" ID="firstnameTextBox" CssClass="form-control" ReadOnly="true"/>
                                   
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label10" runat="server" Text="Last Name:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("lastname") %>' runat="server" ID="TextBox1" CssClass="form-control" ReadOnly="true"/>                                   
                               </div>

                              <div class="form-group">
                                  <asp:Label ID="Label16" runat="server" Text="Address1:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("address1") %>' runat="server" ID="address1TextBox" CssClass="form-control" ReadOnly="true"  />
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label17" runat="server" Text="Address2:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("address2") %>' runat="server" ID="address2TextBox" CssClass="form-control" ReadOnly="true" />
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label18" runat="server" Text="City:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("city") %>' runat="server" ID="cityTextBox" CssClass="form-control" ReadOnly="true" />
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label19" runat="server" Text="State:" CssClass="signupLabel"></asp:Label>
                                  <asp:DropDownList ID="ddlStates" runat="server" DataSourceID="dsStates" DataTextField="statename" DataValueField="statecode"
                                       Text='<%# Bind("state") %>' CssClass="form-control" Enabled="true"></asp:DropDownList>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label20" runat="server" Text="Zip Code:" CssClass="signupLabel"  ></asp:Label>
                                  <asp:TextBox Text='<%# Bind("zip") %>' runat="server" ID="zipTextBox" placeholder="5 digit zip code" CssClass="form-control" ReadOnly="true"/>   
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label21" runat="server" Text="Email:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" CssClass="form-control" ReadOnly="true"/>
                              </div>
                         
                              <div class="form-group">
                                  <asp:Label ID="Label22" runat="server" Text="Phone Number:" CssClass="signupLabel"></asp:Label>
                                  <asp:TextBox Text='<%# Bind("phone") %>' runat="server" ID="phoneTextBox" CssClass="form-control" 
                                      placeholder="555-555-5555" ReadOnly="true" />
                              </div>

                               <div class="form-group">
                                   <asp:Label ID="Label04" runat="server" Text="Hourly Rate:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("hourlyrate") %>' runat="server" ID="hourlyRateTextBox" CssClass="form-control" ReadOnly="true"/>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label23" runat="server" Text="Employment Status:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlEmploymentStatus" runat="server" Text='<%# Bind("employmentstatus") %>' CssClass="form-control" Enabled="false" >
                                       <asp:ListItem Text="Full-Time" Value="Full-Time"></asp:ListItem>
                                       <asp:ListItem Text="Part-Time" Value="Part-Time"></asp:ListItem>
                                       <asp:ListItem Text="Terminated" Value="Terminated"></asp:ListItem>
                                   </asp:DropDownList>      
                               </div>
                                                 
                               <div class="form-group">
                                   <asp:Label ID="Label07" runat="server" Text="Hire Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("hiredate") %>' runat="server" ID="hireDateTextBox" CssClass="form-control" ReadOnly="true"/>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label24" runat="server" Text="Termination Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("terminationdate") %>' runat="server" ID="terminationDateTextBox" CssClass="form-control" ReadOnly="true"/>
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label25" runat="server" Text="User Role:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlUserRole" runat="server" DataSourceID="dsUserRole" DataTextField="userrole" DataValueField="userrole" Enabled="false"
                                        Text='<%# Bind("userrole") %>' CssClass="form-control"></asp:DropDownList>
                               </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                            <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn" />
                          <%--   <asp:Button runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False"  CssClass="btn" />--%>
                    </div>
                </ItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource runat="server" ID="dsEmployeeInfo"
                ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                DeleteCommand="DELETE FROM [employee] WHERE [employeeID] = @employeeID"
                InsertCommand="INSERT INTO [employee] ([username], [password], [firstname], [lastname], [address1], [address2], [city], [state], [zip], 
                [phone], [email], [hourlyrate], [employmentstatus], [hiredate], [terminationdate], [userrole], [image]) VALUES (@username, @password, @firstname,
                @lastname, @address1, @address2, @city, @state, @zip, @phone, @email, @hourlyrate, @employmentstatus, @hiredate, @terminationdate, @userrole, @image)"
                SelectCommand="SELECT * FROM [employee] WHERE ([employeeID] = @employeeID)"
                UpdateCommand="UPDATE [employee] SET [username] = @username, [password] = @password, [firstname] = @firstname, [lastname] = @lastname, 
                [address1] = @address1, [address2] = @address2, [city] = @city, [state] = @state, [zip] = @zip, [phone] = @phone, [email] = @email, [hourlyrate] = @hourlyrate,
                [employmentstatus] = @employmentstatus, [hiredate] = @hiredate, [terminationdate] = @terminationdate, [userrole] = @userrole
                WHERE [employeeID] = @employeeID"
                OnUpdated="dsEmployeeInfo_Updated">

                <DeleteParameters>
                    <asp:Parameter Name="employeeID" Type="Int32"></asp:Parameter>
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
                    <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="hourlyrate" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="employmentstatus" Type="String"></asp:Parameter>
                    <asp:Parameter Name="hiredate" Type="String"></asp:Parameter>
                    <asp:Parameter Name="terminationdate" Type="String"></asp:Parameter>
                    <asp:Parameter Name="userrole" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                </InsertParameters>

                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlemployee" PropertyName="SelectedValue" Name="employeeID" Type="Int32"></asp:ControlParameter>
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
                    <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                    <asp:Parameter Name="email" Type="String"></asp:Parameter>
                    <asp:Parameter Name="hourlyrate" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="employmentstatus" Type="String"></asp:Parameter>
                    <asp:Parameter Name="hiredate" Type="String"></asp:Parameter>
                    <asp:Parameter Name="terminationdate" Type="String"></asp:Parameter>
                    <asp:Parameter Name="userrole" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="employeeID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</section>

            <asp:SqlDataSource ID="dsStates" runat="server" 
                ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
                SelectCommand="SELECT * FROM [states]"></asp:SqlDataSource>

                <asp:SqlDataSource ID="dsUserRole" runat="server" 
                ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
                SelectCommand="SELECT * FROM [userrole]"></asp:SqlDataSource>

</asp:Content>
