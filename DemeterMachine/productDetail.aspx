<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productDetail.aspx.cs" Inherits="DemeterMachine.productDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section>
    <h1>Detailed Equipment Information</h1>
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
                Width="70%">
                <ItemTemplate>
                    <div class="row" >
                        <div class="col-lg-5 imageCenter">
                                <asp:Image ID="Image1" runat="server" OnDataBinding="Image1_DataBinding" />
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

               </ItemTemplate>
            </asp:FormView>


            <asp:SqlDataSource runat="server" ID="dsEquipmentInfo" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>   "

                SelectCommand="SELECT * FROM [equipment] WHERE ([serial_number] = @serial_number)">


                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProducts" PropertyName="SelectedValue" Name="serial_number" Type="String"></asp:ControlParameter>
                </SelectParameters>

            </asp:SqlDataSource>
        </div>
    </div>
</section>

</asp:Content>
