<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="suppliers.aspx.cs" Inherits="DemeterMachine.suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section class="supplierDatabase">
    <div class="body-content">
        <h1>Supplier Center</h1>

       <div class="text-center">
<%--           <asp:Label ID="lblSearch" runat="server" Text="Search Supplier:"></asp:Label>
           &nbsp;--%>
           <asp:TextBox ID="txtSearch" runat="server" Width="300px" CssClass="form-control" Placeholder="Type in Company Name to Search"></asp:TextBox>
           <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn"  CausesValidation="false"/>
       </div>

        <div class="gridViewOverFlow">
            <asp:GridView ID="GridView1"
                runat="server"
                DataSourceID="dsSuppliers"
                HorizontalAlign="Center"
                AutoGenerateColumns="False"
                DataKeyNames="supplierid"
                AllowPaging="True"
                AllowSorting="True"
                ForeColor="#333333"
                CellPadding="4"
                GridLines="None"
                Width="2500px">

                <Columns>
                     <asp:CommandField ShowDeleteButton="false" ShowEditButton="True" ShowSelectButton="True">
                         <ControlStyle CssClass="m-2 "></ControlStyle>
                     </asp:CommandField>
                     <asp:BoundField DataField="supplierid" HeaderText="Supplier ID" ReadOnly="True" SortExpression="supplierid"></asp:BoundField>
                    <asp:BoundField DataField="companyname" HeaderText="Company Name" SortExpression="companyname"></asp:BoundField>
                     <asp:BoundField DataField="contactname" HeaderText="Contact Name" SortExpression="contactname"></asp:BoundField>
                     <asp:BoundField DataField="address1" HeaderText="Address1" SortExpression="address1"></asp:BoundField>
                     <asp:BoundField DataField="address2" HeaderText="Address2" SortExpression="address2"></asp:BoundField>
                     <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"></asp:BoundField>
                     <asp:BoundField DataField="state" HeaderText="State" SortExpression="state"></asp:BoundField>
                     <asp:BoundField DataField="zip" HeaderText="Zip" SortExpression="zip"></asp:BoundField>
                     <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone"></asp:BoundField>
                     <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                 </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#8B181B" ForeColor="White" HorizontalAlign="Left" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />





            </asp:GridView>


        </div>

    </div>
</section>
    <asp:SqlDataSource ID="dsSuppliers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
        DeleteCommand="DELETE FROM [suppliers] WHERE [supplierid] = @supplierid" 
        InsertCommand="INSERT INTO [suppliers] ([companyname], [contactname], [address1], [address2], [city], [state], [zip], [email], [phone])
        VALUES (@companyname, @contactname, @address1, @address2, @city, @state, @zip, @email, @phone)" 
        SelectCommand="SELECT * FROM [suppliers] WHERE ([companyname] LIKE '%' + @Supplier + '%')"
        UpdateCommand="UPDATE [suppliers] SET [companyname] = @companyname, [contactname] = @contactname, [address1] = @address1, [address2] = @address2, [city] = @city,
        [state] = @state, [zip] = @zip, [email] = @email, [phone] = @phone WHERE [supplierid] = @supplierid" 
        OnUpdating="dsSuppliers_Updating"
        OnUpdated="dsSuppliers_Updated">

        <DeleteParameters>
            <asp:Parameter Name="supplierid" Type="Int32"></asp:Parameter>
        </DeleteParameters>

        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" DefaultValue="%" Name="Supplier" Type="String"></asp:ControlParameter>
        </SelectParameters>

        <InsertParameters>
            <asp:Parameter Name="companyname" Type="String"></asp:Parameter>
            <asp:Parameter Name="contactname" Type="String"></asp:Parameter>
            <asp:Parameter Name="address1" Type="String"></asp:Parameter>
            <asp:Parameter Name="address2" Type="String"></asp:Parameter>
            <asp:Parameter Name="city" Type="String"></asp:Parameter>
            <asp:Parameter Name="state" Type="String"></asp:Parameter>
            <asp:Parameter Name="zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
            <asp:Parameter Name="phone" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="companyname" Type="String"></asp:Parameter>
            <asp:Parameter Name="contactname" Type="String"></asp:Parameter>
            <asp:Parameter Name="address1" Type="String"></asp:Parameter>
            <asp:Parameter Name="address2" Type="String"></asp:Parameter>
            <asp:Parameter Name="city" Type="String"></asp:Parameter>
            <asp:Parameter Name="state" Type="String"></asp:Parameter>
            <asp:Parameter Name="zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
            <asp:Parameter Name="phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="supplierid" Type="Int32"></asp:Parameter>
        </UpdateParameters>

    </asp:SqlDataSource>






</asp:Content>
