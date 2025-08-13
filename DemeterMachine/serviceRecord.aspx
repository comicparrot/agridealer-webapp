<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="serviceRecord.aspx.cs" Inherits="DemeterMachine.serviceRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">




<section class="serviceRecordDataBase">
    <div class="body-content">
        <h1>Service Records</h1>

        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 mx-auto ">
                <div class="gridViewOverFlow">
                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    HorizontalAlign="center"
                    DataSourceID="dsServiceRecords"
                    AutoGenerateColumns="false"
                    DataKeyNames="ID"
                    AllowPaging="true"
                    AllowSorting="true"
                    AutoPostBack="true"
                    ForeColor="#333333"
                    CellPadding="4"
                    GridLines="None"
                    SelectedIndex="0"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    PageSize="5" Width="1200px">

                <Columns>
                     <asp:CommandField ShowDeleteButton="false" ShowEditButton="false" ShowSelectButton="True">
                         <ControlStyle CssClass="m-2"></ControlStyle>
                     </asp:CommandField>
                     <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"></asp:BoundField>
                    <asp:BoundField DataField="customerID" HeaderText="Customer ID" SortExpression="customerID"></asp:BoundField>
                     <asp:BoundField DataField="service_status" HeaderText="Service Status" SortExpression="service_status"></asp:BoundField>
                     <asp:BoundField DataField="service_date" HeaderText="Service Date" SortExpression="service_date"></asp:BoundField>
                     <asp:BoundField DataField="completion_date" HeaderText="Completion Date" SortExpression="completion_date"></asp:BoundField>
                     <asp:BoundField DataField="customer_states" HeaderText="Customer States" SortExpression="customer_states"></asp:BoundField>
                     <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price"></asp:BoundField>

                 </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#8B181B" ForeColor="White" HorizontalAlign="Left" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="20px" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                     <PagerSettings Mode="NumericFirstLast" />
                     <PagerStyle HorizontalAlign="Left" />


                </asp:GridView>
                </div>

            </div>

            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 mx-auto">
                <asp:FormView
                    ID="FormView1"
                    runat="server"
                    DataSourceID="dsServiceRecordInfo"
                    DataKeyNames="ID" 
                     Width="90%">
                    <EditItemTemplate>

                                <div class="form-group">
                                   <asp:Label ID="Label01" runat="server" Text="ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:Textbox Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" CssClass="form-control" ReadOnly="true" />
                               </div>
                               
                               <div class="form-group">
                                   <asp:Label ID="Label012" runat="server" Text="Customr ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="DropDownList1" DataTextField="customerID" ClientIDMode="Static" CssClass="form-control" Text='<%# Bind("customerID") %>' DataSourceID="dsCustomers" DataValueField="customerID" runat="server"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="dsCustomers"
                                     ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                     SelectCommand="SELECT * FROM [customers]">
                                 </asp:SqlDataSource>
                         
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label06" runat="server" Text="Service Status:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlStatus" runat="server" Text='<%# Bind("service_status") %>' CssClass="form-control" >
                                       <asp:ListItem Text="Open" Value="open"></asp:ListItem>
                                       <asp:ListItem Text="Closed" Value="closed"></asp:ListItem>
                                   </asp:DropDownList>      
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator04" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlStatus"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label04" runat="server" Text="Service Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("service_date") %>' runat="server" ID="serviceDateTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="serviceDateTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$|^00/00/0000$|^$" ErrorMessage="Invalid format! Service date accepts this format(dd/mm/yyyy)" ControlToValidate="serviceDateTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>

                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label5" runat="server" Text="Completion Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("completion_date") %>' runat="server" ID="completionDateTextBox" CssClass="form-control" ClientIDMode="Static"/> 
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ValidationExpression="^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$|^00/00/0000$|^$" ErrorMessage="Invalid format! Completion date accepts this format(dd/mm/yyyy)" ControlToValidate="completionDateTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>

                                </div>


                         
                               <div class="form-group">
                                   <asp:Label ID="Label07" runat="server" Text="Customer States:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox TextMode="MultiLine" Text='<%# Bind("customer_states") %>' runat="server" ID="customerStatesTextBox" Rows="6" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="customerStatesTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                        
                         
                               <div class="form-group">
                                   <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>

                        <div class="d-flex justify-content-center align-items-center">
                             <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                            <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />

                        </div>
 
                    </EditItemTemplate>
                    <InsertItemTemplate>
                              
                               <div class="form-group">
                                   <asp:Label ID="Label012" runat="server" Text="Customr ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="DropDownList1" DataTextField="customerID" CssClass="form-control" Text='<%# Bind("customerID") %>' DataSourceID="dsCustomers" DataValueField="customerID" runat="server"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="dsCustomers"
                                     ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                     SelectCommand="SELECT * FROM [customers]">
                                 </asp:SqlDataSource>
                         
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label06" runat="server" Text="Service Status:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlStatus" runat="server" Text='<%# Bind("service_status") %>' CssClass="form-control" >
                                       <asp:ListItem Text="Open" Value="open"></asp:ListItem>
                                       <asp:ListItem Text="Closed" Value="closed"></asp:ListItem>
                                   </asp:DropDownList>      
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator04" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlStatus"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label04" runat="server" Text="Service Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("service_date") %>' runat="server" ID="serviceDateTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="serviceDateTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>    
 
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label5" runat="server" Text="Completion Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("completion_date") %>' runat="server" ID="completionDateTextBox" CssClass="form-control"/> 
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label07" runat="server" Text="Customer States:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox TextMode="MultiLine" Text='<%# Bind("customer_states") %>' runat="server" ID="customerStatesTextBox" Rows="6" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="customerStatesTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                        
                         
                               <div class="form-group">
                                   <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>

                           <div class="d-flex justify-content-center align-items-center">
                                 <asp:Button runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn"/>
                                 <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn" />

                           </div>

                    </InsertItemTemplate>
                    <ItemTemplate>
                        
                               <div class="form-group">
                                   <asp:Label ID="Label01" runat="server" Text="ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:Textbox Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" CssClass="form-control" ReadOnly="true" />
                               </div>
                               
                               <div class="form-group">
                                   <asp:Label ID="Label012" runat="server" Text="Customr ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="DropDownList1" DataTextField="customerID" CssClass="form-control" Text='<%# Bind("customerID") %>' Enabled="false" DataSourceID="dsCustomers" DataValueField="customerID" runat="server"></asp:DropDownList>
                                 <asp:SqlDataSource runat="server" ID="dsCustomers"
                                     ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                     SelectCommand="SELECT * FROM [customers]">
                                 </asp:SqlDataSource>
                         
                               </div>

                               <div class="form-group">
                                   <asp:Label ID="Label06" runat="server" Text="Service Status:" CssClass="signupLabel"></asp:Label>
                                   <asp:DropDownList ID="ddlStatus" runat="server" Text='<%# Bind("service_status") %>' Enabled="false" CssClass="form-control" >
                                       <asp:ListItem Text="Open" Value="open"></asp:ListItem>
                                       <asp:ListItem Text="Closed" Value="closed"></asp:ListItem>
                                   </asp:DropDownList>      
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator04" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlStatus"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label04" runat="server" Text="Service Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("service_date") %>' runat="server" ID="serviceDateTextBox" CssClass="form-control" ReadOnly="true"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="serviceDateTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>    
 
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label5" runat="server" Text="Completion Date:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("completion_date") %>' runat="server" ID="completionDateTextBox" CssClass="form-control" ReadOnly="true"/> 
                               </div>
                         
                               <div class="form-group">
                                   <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox TextMode="MultiLine" Text='<%# Bind("customer_states") %>' runat="server" ID="customerStatesTextBox" Rows="6" CssClass="form-control" ReadOnly="true"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="customerStatesTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                        
                         
                               <div class="form-group">
                                   <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control" ReadOnly="true"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>


                        <div class="d-flex justify-content-center align-items-center">
                             <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn"/> 
                             <asp:Button runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" CssClass="btn" />
                             <asp:Button runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" CssClass="btn" />
                        </div>
                    </ItemTemplate>


                </asp:FormView>
                <asp:SqlDataSource
                    runat="server"
                    ID="dsServiceRecordInfo"
                    ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                    DeleteCommand="DELETE FROM [service_records] WHERE [ID] = @ID"
                    InsertCommand="INSERT INTO [service_records] ([customerID], [service_status], [service_date], [completion_date], [customer_states], [price]) VALUES (@customerID, @service_status, @service_date, @completion_date, @customer_states, @price)"
                    SelectCommand="SELECT * FROM [service_records] WHERE ([ID] = @ID)"
                    UpdateCommand="UPDATE [service_records] SET [customerID] = @customerID, [service_status] = @service_status, [service_date] = @service_date, [completion_date] = @completion_date, [customer_states] = @customer_states, [price] = @price WHERE [ID] = @ID"
                    OnUpdated="dsServiceRecordInfo_Updated" OnUpdating="dsServiceRecordInfo_Updating" OnInserting="dsServiceRecordInfo_Inserting">

                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="service_status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="service_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="completion_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="customer_states" Type="String"></asp:Parameter>
                        <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="ID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="service_status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="service_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="completion_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="customer_states" Type="String"></asp:Parameter>
                        <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>


            </div>

        </div>
    </div>
</section>

    <asp:SqlDataSource
        ID="dsServiceRecords"
        runat="server" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
        SelectCommand="SELECT * FROM [service_records]">
    </asp:SqlDataSource>






</asp:Content>
