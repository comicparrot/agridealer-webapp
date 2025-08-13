<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="attachmentDetails.aspx.cs" Inherits="DemeterMachine.attachmentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section>
    <h1>Attachment Information</h1>
    <div class="container" style="max-width:450px">
        <div class="row">
            <div class="form-group">
                <h6>Choose an attachment to view it's informmation</h6>
                <asp:DropDownList ID="ddlAttachments" CssClass="form-control" DataSourceID="dsAttachments" 
                     OnSelectedIndexChanged="ddlAttachments_SelectedIndexChanged" 
                    DataTextField="model" 
                    DataValueField="serial_number"
                    runat="server" AutoPostBack="true"></asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="dsAttachments"
                          ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
                          SelectCommand="SELECT * FROM [attachments]">
                      </asp:SqlDataSource> 
            </div> 
        </div>
    </div>

    <div class="body-content">
        <div class="row"> 
            <asp:FormView ID="FormView1" runat="server" DataSourceID="dsAttachmentInfo" Width="70%" HorizontalAlign="Center" DataKeyNames="serial_number">

                <ItemTemplate>

                    <div class="row">

                        <div class="col-lg-5 imageCenter">
                                <asp:Image ID="Image1" runat="server" OnDataBinding="Image1_DataBinding" />
                        </div>

                        <div class="col-lg-5 col-md-12  col-sm-12 col-xs-12 mx-auto" style="max-height:500px; overflow-y: auto;">

                            <div class="form-group">
                                <asp:Label ID="Label01" runat="server" Text="Serial Number:" CssClass="signupLabel"></asp:Label>
                                <asp:Textbox Text='<%# Eval("serial_number") %>' runat="server" ID="serial_numberLabel1" CssClass="form-control" ReadOnly="true" />
                            </div>
                                    
                            <div class="form-group">
                                <asp:Label ID="Label02" runat="server" Text="Model:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("model") %>' runat="server" ID="modelTextBox"  ReadOnly="true" CssClass="form-control"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator02" runat="server" ErrorMessage="Required Field" ControlToValidate="modelTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label03" runat="server" Text="Model Year:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("model_year") %>' runat="server" ID="model_yearTextBox"  ReadOnly="true" CssClass="form-control"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator03" runat="server" ErrorMessage="Required Field" ControlToValidate="model_yearTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label04" runat="server" Text="Width:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("width") %>' runat="server" ID="widthTextBox"  ReadOnly="true" CssClass="form-control"/>
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label05" runat="server" Text="Cutterbar Type:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("cutterbar_type") %>' runat="server" ID="cutterbar_typeTextBox"  ReadOnly="true" CssClass="form-control"/>
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label06" runat="server" Text="Equipment Conition:" CssClass="signupLabel"></asp:Label>
                                <asp:DropDownList ID="ddlCondition" runat="server" Text='<%# Bind("equipment_condition") %>' CssClass="form-control" Enabled="false" >
                                    <asp:ListItem Text="New" Value="New"></asp:ListItem>
                                    <asp:ListItem Text="Used" Value="Used"></asp:ListItem>
                                </asp:DropDownList>      
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator04" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlCondition"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label07" runat="server" Text="Equipment Type:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("type") %>' runat="server" ID="typeTextBox"  ReadOnly="true" CssClass="form-control"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator05" runat="server" ErrorMessage="Required Field" ControlToValidate="typeTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label08" runat="server" Text="Inventory:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("inventory") %>' runat="server" ID="inventoryTextBox"  ReadOnly="true" CssClass="form-control"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator06" runat="server" ErrorMessage="Required Field" ControlToValidate="inventoryTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Inventory accepts whole numbers only" ControlToValidate="inventoryTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label09" runat="server" Text="Price:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("price") %>' runat="server" ID="priceTextBox"  ReadOnly="true" CssClass="form-control"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator07" runat="server" ErrorMessage="Required Field" ControlToValidate="priceTextBox"  Display="Dynamic" CssClass="text-danger error-text"></asp:RequiredFieldValidator>           
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator01" runat="server" ValidationExpression="^(?:[1-9]\d*|0)?(?:\.\d+)?$" ErrorMessage="Price accepts  numbers only" ControlToValidate="priceTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label012" runat="server" Text="Supplier ID:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("supplierID") %>' runat="server" ID="supplierIDTextBox" CssClass="form-control"  ReadOnly="true"/>
                          
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label013" runat="server" Text="Number of rows:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("number_of_rows") %>' runat="server" ID="numberOfRowsTextBox" CssClass="form-control"  ReadOnly="true"/>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator03" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Number of rows accepts whole numbers only" ControlToValidate="numberOfRowsTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                          
                            </div>
                          
                            <div class="form-group">
                                <asp:Label ID="Label014" runat="server" Text="Row Spacing:" CssClass="signupLabel"></asp:Label>
                                <asp:TextBox Text='<%# Bind("row_spacing") %>' runat="server" ID="row_spacingTextBox" CssClass="form-control"  ReadOnly="true"/>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationExpression="^[1-9]\d*$" ErrorMessage="Row spacing accepts numbers only" ControlToValidate="row_spacingTextBox" CssClass="text-danger error-text" Display="Dynamic"></asp:RegularExpressionValidator>
                          
                            </div>
                        </div>
                    </div>
                </ItemTemplate>

            </asp:FormView>
            <asp:SqlDataSource runat="server" ID="dsAttachmentInfo"
                ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"

                SelectCommand="SELECT * FROM [attachments] WHERE ([serial_number] = @serial_number)">

                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlAttachments" PropertyName="SelectedValue" Name="serial_number" Type="String"></asp:ControlParameter>
                </SelectParameters>

            </asp:SqlDataSource>
        </div>
    </div>

</section>





</asp:Content>
