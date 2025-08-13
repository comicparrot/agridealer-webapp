<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="DemeterMachine.customers" %>
<%@ MasterType VirtualPath="~/Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



<section class="customerDatabase">
    <div class="body-content">
        <h1>Customer Center</h1>

       <div class="text-center">
<%--           <asp:Label ID="lblSearch" runat="server" Text="Search Customer:"></asp:Label>--%>
<%--           &nbsp;--%>
           <asp:TextBox ID="txtSearch" runat="server" Width="300px" CssClass="form-control" Placeholder="Type in Customer User Name to Search"></asp:TextBox>
           <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn"  CausesValidation="false"/>
       </div>


        <div class="gridViewOverFlow">
            <asp:GridView
                ID="GridView1"
                runat="server"
                DataSourceID="dsCustomers"
                HorizontalAlign="Center"
                AutoGenerateColumns="False"
                DataKeyNames="customerID"
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
                     <asp:BoundField DataField="customerID" HeaderText="Customer ID" ReadOnly="True" SortExpression="customerID"></asp:BoundField>
                    <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="True" SortExpression="username"></asp:BoundField>
                     <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password"></asp:BoundField>
                     <asp:BoundField DataField="firstname" HeaderText="First Name" SortExpression="firstname"></asp:BoundField>
                     <asp:BoundField DataField="lastname" HeaderText="Last Name" SortExpression="lastname"></asp:BoundField>
                     <asp:BoundField DataField="address1" HeaderText="Address1" SortExpression="address1"></asp:BoundField>
                     <asp:BoundField DataField="address2" HeaderText="Address2" SortExpression="address2"></asp:BoundField>
                     <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"></asp:BoundField>
                     <asp:BoundField DataField="state" HeaderText="State" SortExpression="state"></asp:BoundField>
                     <asp:BoundField DataField="zip" HeaderText="Zip" SortExpression="zip"></asp:BoundField>
                     <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone"></asp:BoundField>
                     <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                     <asp:BoundField DataField="userrole" HeaderText="User Role" SortExpression="userrole"></asp:BoundField>
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

    <asp:SqlDataSource
        runat="server"
        ID="dsCustomers"
        ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
        SelectCommand="SELECT * FROM [customers] WHERE ([username] LIKE '%' + @Customer + '%')"
        DeleteCommand="DELETE FROM [customers] WHERE [customerID] = @customerID" 
        InsertCommand="INSERT INTO [customers] ([username], [password], [firstname], [lastname], [address1], [address2], [city], [state], [zip], [email], [phone], [userrole]) 
        VALUES (@username, @password, @firstname, @lastname, @address1, @address2, @city, @state, @zip, @email, @phone, @userrole)"
        UpdateCommand="UPDATE [customers] SET  [firstname] = @firstname, [lastname] = @lastname, [address1] = @address1, [address2] = @address2,
        [city] = @city, [state] = @state, [zip] = @zip, [email] = @email, [phone] = @phone, [userrole] = LOWER(@userrole) WHERE [customerID] = @customerID" 
        OnUpdating="dsCustomers_Updating"
        OnUpdated="dsCustomers_Updated"
        OnDeleting="dsCustomers_Deleting">


        <DeleteParameters>
            <asp:Parameter Name="customerID" Type="Int32"></asp:Parameter>
        </DeleteParameters>

        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" DefaultValue="%" Name="Customer" Type="String"></asp:ControlParameter>
        </SelectParameters>

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


</asp:Content>
