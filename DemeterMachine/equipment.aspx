<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="equipment.aspx.cs" Inherits="DemeterMachine.equipment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<section>
    <h1>Equipment Information</h1>
    <div class="container" style="max-width:450px">
        <div class="row">
            <div class="form-group">
                <h6>Choose an equipment item to view it's information</h6>
                      <asp:DropDownList ID="ddlProducts"
                          CssClass="form-control"
                           OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged"
                          runat="server" DataSourceID="dsEquipment" DataTextField="model" DataValueField="serial_number" AutoPostBack="true">
                      </asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="dsEquipment"
                          ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                          SelectCommand="SELECT * FROM [equipment]">
                      </asp:SqlDataSource>        
            </div>
        </div>
    </div>

    <div class="body-content">
        <div class="row d-flex justify-content-center align-items-center">
            <asp:FormView ID="FormView1"
                runat="server"
                DataSourceID="dsEquipmentInfo"
                DataKeyNames="serial_number"
                Width="70%" 
                OnItemInserting="FormView1_ItemInserting" >
                <EditItemTemplate>

                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12 col-xs-12 mx-auto" style="max-height:500px; overflow-y: auto;">

                             <div class="form-group">
                                 <asp:Label ID="Label01" runat="server" Text="Serial Number:" CssClass="signupLabel"></asp:Label>
                                 <asp:Textbox Text='<%# Eval("serial_number") %>' runat="server" ID="serial_numberLabel1" CssClass="form-control" ReadOnly="true" />
                             </div>
                             
                             <div class="form-group">
                                 <asp:Label ID="Label02" runat="server" Text="Model:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("model") %>' runat="server" ID="modelTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator02" runat="server" ErrorMessage="Required Field" ControlToValidate="modelTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label03" runat="server" Text="Model Year:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("model_year") %>' runat="server" ID="model_yearTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator03" runat="server" ErrorMessage="Required Field" ControlToValidate="model_yearTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator09" runat="server" ValidationExpression="^\d{4}$" ErrorMessage="Model Year accepts 4 digit whole numbers only" ControlToValidate="model_yearTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                         
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label04" runat="server" Text="Engine Type:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("engine_type") %>' runat="server" ID="engine_typeTextBox" CssClass="form-control"/>
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label05" runat="server" Text="Engine HP:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("engine_hp") %>' runat="server" ID="engine_hpTextBox" CssClass="form-control"/>
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label06" runat="server" Text="Equipment Conition:" CssClass="signupLabel"></asp:Label>
                                 <asp:DropDownList ID="ddlCondition" runat="server" Text='<%# Bind("equipment_condition") %>' CssClass="form-control" >
                                     <asp:ListItem Text="New" Value="New"></asp:ListItem>
                                     <asp:ListItem Text="Used" Value="Used"></asp:ListItem>
                                 </asp:DropDownList>      
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator04" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlCondition"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("equipment_type") %>' runat="server" ID="equipment_typeTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="equipment_typeTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label08" runat="server" Text="Inventory:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("inventory") %>' runat="server" ID="inventoryTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator06" runat="server" ErrorMessage="Required Field" ControlToValidate="inventoryTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Inventory accepts whole numbers only" ControlToValidate="inventoryTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts  numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                                 <asp:DropDownList ID="DropDownList1" DataTextField="companyname" CssClass="form-control" Text='<%# Bind("supplierID") %>' DataSourceID="dsSuppliers" DataValueField="supplierid" runat="server"></asp:DropDownList>
                               <asp:SqlDataSource runat="server" ID="dsSuppliers"
                                   ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                   SelectCommand="SELECT * FROM [suppliers]">
                               </asp:SqlDataSource>
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label013" runat="server" Text="Grain Tank Size:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("grain_tank_size") %>' runat="server" ID="grain_tank_sizeTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator03" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Grain tank size accepts whole numbers only" ControlToValidate="grain_tank_sizeTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label014" runat="server" Text="Fuel Capacity:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("fuel_capacity") %>' runat="server" ID="fuel_capacityTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Fuel capacity size accepts whole numbers only" ControlToValidate="fuel_capacityTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label15" runat="server" Text="Boom Width:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("boom_width") %>' runat="server" ID="boom_widthTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="^[0-9]\d*$" ErrorMessage="Boom width size accepts whole numbers only" ControlToValidate="boom_widthTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label16" runat="server" Text="Operatiing Hours:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("operating_hours") %>' runat="server" ID="operating_hoursTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Operating hours accepts whole numbers only" ControlToValidate="operating_hoursTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required Field" ControlToValidate="operating_hoursTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                        
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label17" runat="server" Text="Notes:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("Notes") %>' runat="server" ID="NotesTextBox" Rows="6" CssClass="form-control"/>
                        
                             </div>
                                
                             <div class="form-group">
                                 <asp:Label ID="Label18" runat="server" Text="Weigth:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("weight") %>' runat="server" ID="weightTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Weight accepts numbers only" ControlToValidate="weightTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                             </div>
                        
                             <div class="form-group">
                                 <asp:Label ID="Label19" runat="server" Text="Transmission Type:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("transmission_type") %>' runat="server" ID="transmission_typeTextBox" CssClass="form-control"/>
                             </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center">
                        <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                        <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />  
                    </div>
                </EditItemTemplate>

                <ItemTemplate>
                    <div class="row" >
                        <div class="col-lg-5 imageCenter">
                                <asp:Image ID="Image1" runat="server"  OnDataBinding="Image1_DataBinding" />
                        </div>

                        <div class="col-lg-5 col-md-12  col-sm-12 col-xs-12 mx-auto" style="max-height:500px; overflow-y: auto;" >
                            <div class="form-group">
                                <asp:Label ID="Label01" runat="server" Text="Serial Number:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Eval("serial_number") %>' runat="server" ID="serial_numberLabel1" ReadOnly="true"  CssClass="form-control"/>
                            </div>
                            
                            <div class="form-group">
                                <asp:Label ID="Label02" runat="server" Text="Model:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("model") %>' runat="server" ID="modelTextBox" ReadOnly="true"  CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label03" runat="server" Text="Model Year:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("model_year") %>' runat="server" ID="model_yearTextBox" ReadOnly="true" CssClass="form-control" />
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label04" runat="server" Text="Engine Type:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("engine_type") %>' runat="server" ID="engine_typeTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label05" runat="server" Text="Engine HP:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("engine_hp") %>' runat="server" ID="engine_hpTextBox"  ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label06" runat="server" Text="Equipment Conition:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("equipment_condition") %>' runat="server" ID="equipment_conditionTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("equipment_type") %>' runat="server" ID="equipment_typeTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label08" runat="server" Text="Inventory:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("inventory") %>' runat="server" ID="inventoryTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("supplierID") %>' runat="server" ID="supplierIDTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label013" runat="server" Text="Grain Tank Size:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("grain_tank_size") %>' runat="server" ID="grain_tank_sizeTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label014" runat="server" Text="Fuel Capacity:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("fuel_capacity") %>' runat="server" ID="fuel_capacityTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="Boom Width:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("boom_width") %>' runat="server" ID="boom_widthTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="Operating Hours:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("operating_hours") %>' runat="server" ID="operating_hoursTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="Notes:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("Notes") %>' runat="server" ID="NotesTextBox"  Rows="6" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                               
                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Weigth:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("weight") %>' runat="server" ID="weightTextBox" ReadOnly="true" CssClass="form-control"/>
                        
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="Label19" runat="server" Text="Transmission Type:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("transmission_type") %>' runat="server" ID="transmission_typeTextBox" ReadOnly="true" CssClass="form-control"/>
                            </div>
                        </div>


                    </div>

                    <div class="d-flex justify-content-center align-items-center">
                           <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn" />
                         <%--   <asp:Button runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False"  CssClass="btn" />--%>
                    </div>
                </ItemTemplate>
            </asp:FormView>


            <asp:SqlDataSource runat="server" ID="dsEquipmentInfo" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>   "
                DeleteCommand="DELETE FROM [equipment] WHERE [serial_number] = @serial_number"
                InsertCommand="INSERT INTO [equipment] ([serial_number], [model], [model_year], [engine_type],
                [engine_hp], [equipment_condition], [equipment_type], [inventory], [price], [image_file], [image],
                [supplierID], [grain_tank_size], [fuel_capacity], [boom_width], [operating_hours], [Notes], [weight],
                [transmission_type]) VALUES (@serial_number, @model, @model_year, @engine_type, @engine_hp, @equipment_condition,
                @equipment_type, @inventory, @price, @image_file, @image, @supplierID, @grain_tank_size, @fuel_capacity, @boom_width,
                @operating_hours, @Notes, @weight, @transmission_type)"
                SelectCommand="SELECT * FROM [equipment] WHERE ([serial_number] = @serial_number)"
                UpdateCommand="UPDATE [equipment] SET [model] = @model, [model_year] = @model_year, [engine_type] = @engine_type,
                [engine_hp] = @engine_hp, [equipment_condition] = @equipment_condition, [equipment_type] = @equipment_type, 
                [inventory] = @inventory, [price] = @price, [image_file] = @image_file, [supplierID] = @supplierID, [grain_tank_size] = @grain_tank_size,
                [fuel_capacity] = @fuel_capacity, [boom_width] = @boom_width, [operating_hours] = @operating_hours, [Notes] = @Notes, [weight] = @weight, 
                [transmission_type] = @transmission_type WHERE [serial_number] = @serial_number"
                OnUpdated="dsEquipmentInfo_Updated">

                <DeleteParameters>
                    <asp:Parameter Name="serial_number" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="serial_number" Type="String"></asp:Parameter>
                    <asp:Parameter Name="model" Type="String"></asp:Parameter>
                    <asp:Parameter Name="model_year" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="engine_type" Type="String"></asp:Parameter>
                    <asp:Parameter Name="engine_hp" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="equipment_condition" Type="String"></asp:Parameter>
                    <asp:Parameter Name="equipment_type" Type="String"></asp:Parameter>
                    <asp:Parameter Name="inventory" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image_file" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="supplierID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="grain_tank_size" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="fuel_capacity" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="boom_width" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="operating_hours" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Notes" Type="String"></asp:Parameter>
                    <asp:Parameter Name="weight" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="transmission_type" Type="String"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProducts" PropertyName="SelectedValue" Name="serial_number" Type="String"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters >
                    <asp:Parameter Name="model" Type="String"></asp:Parameter>
                    <asp:Parameter Name="model_year" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="engine_type" Type="String"></asp:Parameter>
                    <asp:Parameter Name="engine_hp" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="equipment_condition" Type="String"></asp:Parameter>
                    <asp:Parameter Name="equipment_type" Type="String"></asp:Parameter>
                    <asp:Parameter Name="inventory" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image_file" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="supplierID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="grain_tank_size" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="fuel_capacity" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="boom_width" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="operating_hours" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Notes" Type="String"></asp:Parameter>
                    <asp:Parameter Name="weight" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="transmission_type" Type="String"></asp:Parameter>
                    <asp:Parameter Name="serial_number" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</section>
</asp:Content>
