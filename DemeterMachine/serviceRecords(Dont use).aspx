<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="serviceRecords(Dont use).aspx.cs" Inherits="DemeterMachine.serviceRecords" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section class="serviceRecordDataBase">
    <div class="body-content">
        <h1>ServiceRecords</h1>

        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 mx-auto gridViewOverFlow">
                <asp:GridView ID="GridView1"
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
                CssClass="autosize-gridview"     >


                    
                <Columns>
                     <asp:CommandField ShowDeleteButton="false" ShowEditButton="false" ShowSelectButton="True">
                         <ControlStyle CssClass="m-2 "></ControlStyle>
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
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                     <PagerSettings Mode="NumericFirstLast" />
                     <PagerStyle HorizontalAlign="Left" />
                     


                </asp:GridView>



            </div>

            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 mx-auto">
                <asp:FormView 
                    ID="FormView1"
                    runat="server"
                    DataSourceID="dsServiceRecordInfo" 
                     Width="90%"
                    OnModeChanging="FormView1_ModeChanging">

                    <EditItemTemplate>

                               <div class="form-group">
                                   <asp:Label ID="Label01" runat="server" Text="ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:Textbox Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" CssClass="form-control" ReadOnly="true" />
                               </div>
                               
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
                                   <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox TextMode="MultiLine" Text='<%# Bind("customer_states") %>' runat="server" ID="customerStatesTextBox" Rows="6" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="customerStatesTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                        
                         
                               <div class="form-group">
                                   <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>
                         


                    <div class="d-flex justify-content-center">
                        <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                        <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />
                    </div>
              
                </EditItemTemplate>                    


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
                         


                    <div class="d-flex justify-content-center">

                             <asp:Button runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn" />

                            <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn" />
                            <asp:Button runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False"  CssClass="btn" />
                    </div>

                    </ItemTemplate>

                    <InsertItemTemplate>

                               <div class="form-group">
                                   <asp:Label ID="Label01" runat="server" Text="ID:" CssClass="signupLabel"></asp:Label>
                                   <asp:Textbox Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" CssClass="form-control" ReadOnly="true" />
                               </div>
                               
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
                                   <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox TextMode="MultiLine" Text='<%# Bind("customer_states") %>' runat="server" ID="customerStatesTextBox" Rows="6" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="customerStatesTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                               </div>
                        
                         
                               <div class="form-group">
                                   <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                   <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                               </div>


                           <asp:Button runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn" />
                           <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn" />
                    </InsertItemTemplate>

                </asp:FormView>
            </div>
        </div>
    </div>
</section>

    <asp:SqlDataSource
        ID="dsServiceRecords"
        runat="server" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
        SelectCommand="SELECT * FROM [service_records]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsServiceRecordInfo" runat="server"
        ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
        DeleteCommand="DELETE FROM [service_records] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [service_records] ([customerID], [service_status], [service_date], [completion_date], [customer_states], [price]) 
        VALUES (@customerID, @service_status, @service_date, @completion_date, @customer_states, @price)" 
        SelectCommand="SELECT * FROM [service_records] WHERE ([ID] = @ID)" 
        UpdateCommand="UPDATE [service_records] SET [customerID] = @customerID, [service_status] = @service_status, [service_date] = @service_date, [completion_date] = @completion_date, 
        [customer_states] = @customer_states, [price] = @price WHERE [ID] = @ID">

        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="service_status" Type="String"></asp:Parameter>
            <asp:Parameter DbType="DateTime2" Name="service_date"></asp:Parameter>
            <asp:Parameter DbType="DateTime2" Name="completion_date"></asp:Parameter>
            <asp:Parameter Name="customer_states" Type="String"></asp:Parameter>
            <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
        </InsertParameters
            >
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="ID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="service_status" Type="String"></asp:Parameter>
            <asp:Parameter DbType="DateTime2" Name="service_date"></asp:Parameter>
            <asp:Parameter DbType="DateTime2" Name="completion_date"></asp:Parameter>
            <asp:Parameter Name="customer_states" Type="String"></asp:Parameter>
            <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>

    </asp:SqlDataSource>



</asp:Content>
