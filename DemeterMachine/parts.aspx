<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="parts.aspx.cs" Inherits="DemeterMachine.parts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<section>
        <h1>Parts Information</h1>
    <div class="container" style="max-width:450px">
        <div class="row">
            <div class="form-group">
                <h6>Choose an part to view it's informmation</h6>
                <asp:DropDownList ID="ddlParts" CssClass="form-control" DataSourceID="dsParts" 
                    OnSelectedIndexChanged="ddlParts_SelectedIndexChanged" 
                    DataTextField="part_number" 
                    DataValueField="part_number"
                    runat="server" AutoPostBack="true"></asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="dsParts"
                          ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                          SelectCommand="SELECT * FROM [parts]">
                      </asp:SqlDataSource> 
            </div> 
        </div>
    </div>


    <div class="body-content">
        <div class="row">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="dsPartsInfo" Width="70%" DataKeyNames="part_number" HorizontalAlign="Center">
                <EditItemTemplate>
                    <div class="row">
                        <div class="col-lg-6 col-md-8 col-sm-12 col-xs-12 mx-auto">
                            <div>
                             <div class="form-group">
                                 <asp:Label ID="Label01" runat="server" Text="Part Number:" CssClass="signupLabel"></asp:Label>
                                 <asp:Textbox Text='<%# Eval("part_number") %>' runat="server" ID="part_numberLabel1" CssClass="form-control" ReadOnly="true" />
                             </div>
                           
                             <div class="form-group">
                                 <asp:Label ID="Label02" runat="server" Text="Compatible Equipment:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("compatible_equipment") %>' runat="server" ID="compatibleEquipmentTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator02" runat="server" ErrorMessage="Required Field" ControlToValidate="compatibleEquipmentTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                             </div>
                           
                             <div class="form-group">
                                 <asp:Label ID="Label03" runat="server" Text="Part Description:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("part_description") %>' Rows="3" runat="server" ID="partDescriptionTextBox" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator03" runat="server" ErrorMessage="Required Field" ControlToValidate="partDescriptionTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>                            
                             </div>
                           
                             <div class="form-group">
                                 <asp:Label ID="Label04" runat="server" Text="Weight:" CssClass="signupLabel"></asp:Label>
                                 <asp:TextBox Text='<%# Bind("weight") %>' runat="server" ID="weightTextBox" CssClass="form-control"/>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Weight accepts numbers only" ControlToValidate="weightTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
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
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                             </div>
                           
                             <div class="form-group">
                                 <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                                 <asp:DropDownList ID="DropDownList1" DataTextField="companyname" CssClass="form-control" Text='<%# Bind("supplierID") %>' DataSourceID="dsSuppliers" DataValueField="supplierid" runat="server"></asp:DropDownList>
                               <asp:SqlDataSource runat="server" ID="dsSuppliers"
                                   ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                   SelectCommand="SELECT * FROM [suppliers]">
                               </asp:SqlDataSource>
                             </div>
                           
                            
                             <div class="d-flex justify-content-center">
                                <asp:Button runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn" />
                                <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn" />
                             
                             </div>  
                          </div> 
                       </div>
                  </div>



                </EditItemTemplate>
                <%-- 
                <InsertItemTemplate>
                    <div class="form-group">
                        <asp:Label ID="Label01" runat="server" Text="Serial Number:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("serial_number") %>' runat="server" ID="serial_numberLabel1" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group">
                        <asp:Image ID="Image2" runat="server" OnDataBinding="Image1_DataBinding" />
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator06" runat="server" ErrorMessage="Required Field" ControlToValidate="equipment_typeTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Inventory accepts whole numbers only" ControlToValidate="inventoryTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" CssClass="form-control"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts  numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label010" runat="server" Text="Image File:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Eval("image_file") %>' runat="server" ID="image_fileTextBox" CssClass="form-control"/>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label011" runat="server" Text="Image:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("image") %>' runat="server" ID="imageTextBox" CssClass="form-control"/>
                    </div>

                    <div class="form-group">
                        <asp:Image ID="Image1" runat="server" />
                    </div>


                    <div class="form-group">
                        <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                        <asp:TextBox Text='<%# Bind("supplierID") %>' runat="server" ID="supplierIDTextBox" CssClass="form-control"/>

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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Boom width size accepts whole numbers only" ControlToValidate="boom_widthTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>

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


                    <asp:Button runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn" />
                </InsertItemTemplate> --%>

                <ItemTemplate>

                    <div class="row"> 

                          <div class="col-lg-5 imageCenter">
                               <asp:Image ID="Image1" runat="server" OnDataBinding="Image1_DataBinding"/>
                           </div>

                            <div class="col-lg-5 col-md-12  col-sm-12 col-xs-12 mx-auto">
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label01" runat="server" Text="Part Number:" CssClass="signupLabel"></asp:Label>
                                         <asp:Textbox Text='<%# Eval("part_number") %>' runat="server" ID="part_numberLabel1" CssClass="form-control" ReadOnly="true" />
                                     </div> 
                                   
                                
                                     <div class="form-group">
                                         <asp:Label ID="Label02" runat="server" Text="Compatible Equipment:" CssClass="signupLabel"></asp:Label>
                                         <asp:TextBox Text='<%# Bind("compatible_equipment") %>' runat="server" ID="compatibleEquipmentTextBox" ReadOnly="true" CssClass="form-control"/>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator02" runat="server" ErrorMessage="Required Field" ControlToValidate="compatibleEquipmentTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                     </div>
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label03" runat="server" Text="Part Description:" CssClass="signupLabel"></asp:Label>
                                         <asp:TextBox Text='<%# Bind("part_description") %>' runat="server" ID="partDescriptionTextBox" ReadOnly="true" CssClass="form-control"/>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator03" runat="server" ErrorMessage="Required Field" ControlToValidate="partDescriptionTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>                            
                                     </div>
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label04" runat="server" Text="Weight:" CssClass="signupLabel"></asp:Label>
                                         <asp:TextBox Text='<%# Bind("weight") %>' runat="server" ID="weightTextBox" ReadOnly="true" CssClass="form-control"/>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Weight accepts numbers only" ControlToValidate="weightTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                                     </div>
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label08" runat="server" Text="Inventory:" CssClass="signupLabel"></asp:Label>
                                         <asp:TextBox Text='<%# Bind("inventory") %>' runat="server" ID="inventoryTextBox" ReadOnly="true" CssClass="form-control"/>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator06" runat="server" ErrorMessage="Required Field" ControlToValidate="inventoryTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Inventory accepts whole numbers only" ControlToValidate="inventoryTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                                     </div>
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                         <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox" ReadOnly="true" CssClass="form-control"/>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                                     </div>
                                   
                                     <div class="form-group">
                                         <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                                         <asp:DropDownList ID="DropDownList1" DataTextField="companyname" CssClass="form-control" Text='<%# Bind("supplierID") %>' DataSourceID="dsSuppliers" Enabled="false" DataValueField="supplierid" runat="server"></asp:DropDownList>
                                       <asp:SqlDataSource runat="server" ID="dsSuppliers"
                                           ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                                           SelectCommand="SELECT * FROM [suppliers]">
                                       </asp:SqlDataSource>
                                     </div>
                                   
                           </div>

                                     <%--   <asp:Button runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False"  CssClass="btn" />--%>
                        </div>
                    <div class="d-flex justify-content-center">
                       <asp:Button runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn" />
                    </div>


                </ItemTemplate>
            </asp:FormView>




            <asp:SqlDataSource runat="server" ID="dsPartsInfo" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
                DeleteCommand="DELETE FROM [parts] WHERE [part_number] = @part_number" 
                InsertCommand="INSERT INTO [parts] ([part_number], [compatible_equipment], [part_description], [weight], [image_file], [inventory], [price], [image], [supplierID]) VALUES (@part_number, 
                @compatible_equipment, @part_description, @weight, @image_file, @inventory, @price, @image, @supplierID)" 
                SelectCommand="SELECT * FROM [parts] WHERE ([part_number] = @part_number)" 
                UpdateCommand="UPDATE [parts] SET [compatible_equipment] = @compatible_equipment, [part_description] = @part_description, [weight] = @weight, [image_file] = @image_file, [inventory] = @inventory, 
                [price] = @price, [image] = @image, [supplierID] = @supplierID WHERE [part_number] = @part_number"
                OnSelecting="dsPartsInfo_Selecting" 
                OnUpdated="dsPartsInfo_Updated">
                <DeleteParameters>
                    <asp:Parameter Name="part_number" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="part_number" Type="String"></asp:Parameter>
                    <asp:Parameter Name="compatible_equipment" Type="String"></asp:Parameter>
                    <asp:Parameter Name="part_description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="weight" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image_file" Type="String"></asp:Parameter>
                    <asp:Parameter Name="inventory" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="supplierID" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlParts" PropertyName="SelectedValue" Name="part_number" Type="String"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="compatible_equipment" Type="String"></asp:Parameter>
                    <asp:Parameter Name="part_description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="weight" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image_file" Type="String"></asp:Parameter>
                    <asp:Parameter Name="inventory" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="image" Type="Object"></asp:Parameter>
                    <asp:Parameter Name="supplierID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="part_number" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
    </div>
</section>


</asp:Content>
