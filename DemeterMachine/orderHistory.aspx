<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="orderHistory.aspx.cs" Inherits="DemeterMachine.orderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
<section class="orderHistorySection">
    <div class="body-content">
     <h1 class="text-center">Order History</h1>
     <h6>Please select an order to view the order details</h6>

        <div class="gridViewOverFlow">
         <asp:GridView ID="GridView1"
             
            runat="server"
            DataSourceID="dsOrderHistory" 
            HorizontalAlign="Center"
            AutoGenerateColumns="False" 
            DataKeyNames="orderid" 
            AllowPaging="True" 
            AllowSorting="True" 
            ForeColor="#333333"
            CellPadding="4" 
            GridLines="None" 
            Width="2500px"
            PageSize="6" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />       
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="orderid" HeaderText="Order ID" ReadOnly="True" SortExpression="orderid"></asp:BoundField>
            <asp:BoundField DataField="customerID" HeaderText="Customer ID" SortExpression="customerID"></asp:BoundField>
            <asp:BoundField DataField="orderstatus" HeaderText="Order Status" SortExpression="orderstatus"></asp:BoundField>
            <asp:BoundField DataField="orderdate" HeaderText="Order Date" SortExpression="orderdate"></asp:BoundField>
            <asp:BoundField DataField="shippeddate" HeaderText="Shipped Date" SortExpression="shippeddate"></asp:BoundField>
            <asp:BoundField DataField="shipped_to_fname" HeaderText="Shipped To First Name" SortExpression="shipped_to_fname"></asp:BoundField>
            <asp:BoundField DataField="shipped_to_lname" HeaderText="Shipped To Last Name" SortExpression="shipped_to_lname"></asp:BoundField>
            <asp:BoundField DataField="address1" HeaderText="Address1" SortExpression="address1"></asp:BoundField>
            <asp:BoundField DataField="address2" HeaderText="Address2" SortExpression="address2"></asp:BoundField>
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city"></asp:BoundField>
            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state"></asp:BoundField>
            <asp:BoundField DataField="zip" HeaderText="Zip" SortExpression="zip"></asp:BoundField>
            <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone"></asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
            <asp:BoundField DataField="cardnumber" HeaderText="Card Number" SortExpression="cardnumber"></asp:BoundField>
            <asp:BoundField DataField="expdate" HeaderText="Exp. Date" SortExpression="expdate"></asp:BoundField>
            <asp:BoundField DataField="ordertotal" HeaderText="Order Total" SortExpression="ordertotal"></asp:BoundField>
            <asp:BoundField DataField="paymenttype" HeaderText="Payment Type" SortExpression="paymenttype"></asp:BoundField>
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
        <div class="gridViewOverFlow mt-2">
         <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" 
            Width="1400px" GridLines="None" CellPadding="4"
            DataSourceID="dsOrderDetails"
            AutoGenerateColumns="False" 
            AllowPaging="True"
            AllowSorting="True">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />       
            <Columns>
                <asp:BoundField DataField="orderid" HeaderText="orderid" SortExpression="orderid"></asp:BoundField>
                <asp:BoundField DataField="order_sequence" HeaderText="order_sequence" SortExpression="order_sequence"></asp:BoundField>
                <asp:BoundField DataField="attachment_serial_number" HeaderText="attachment_serial_number" SortExpression="attachment_serial_number"></asp:BoundField>
                <asp:BoundField DataField="equipment_serial_number" HeaderText="equipment_serial_number" SortExpression="equipment_serial_number"></asp:BoundField>
                <asp:BoundField DataField="part_number" HeaderText="part_number" SortExpression="part_number"></asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity"></asp:BoundField>
                <asp:BoundField DataField="unitprice" HeaderText="unitprice" SortExpression="unitprice"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#8B181B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        </div>







        <asp:SqlDataSource runat="server" ID="dsOrderDetails" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>"
            SelectCommand="SELECT * FROM [orderdetails] WHERE ([orderid] = @orderid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="orderid" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>



    </div>
</section>    

    <asp:SqlDataSource runat="server" ID="dsOrderHistory" ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
        SelectCommand="SELECT * FROM [orders] WHERE ([customerID] = @customerID)">
        <SelectParameters>
            <asp:SessionParameter SessionField="customerID" Name="customerID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
