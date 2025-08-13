<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="DemeterMachine.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section class="h-100" <%--style="background-color: #D4D4D4;--%>">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10">

        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0 text-black signupLabel">Shopping Cart</h3>

        </div>

           <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand" OnItemDataBound="rptCart_ItemDataBound">
               <ItemTemplate>
                   <div class="card rounded-3 mb-4 shadow">
                       <div class="card-body p-4">
                           <div class="row align-items-center">
                               <div class="col-12 col-md-3">
                                   <asp:Image ID="Image1" runat="server" CssClass="img-fluid rounded-3" OnDataBinding="Image1_DataBinding" />
                               </div>
                               <div class="col-6 col-md-3">
<%--                                   <p class="lead fw-normal mb-2"><%# Eval("Product.ProductID") %></p>--%>
                                   <p><span class="text-muted">Part Number: </span>
                                       <div class="mb-3">
                                           <asp:Label ID="Label3" runat="server" CssClass="m-2" Text='<%# Eval("Product.ProductID") %>'></asp:Label>
                                       </div>
                                   </p>
                                   <p><span class="text-muted">Each: </span>
                                       <div>
                                           <asp:Label ID="lblUnitPrice" runat="server" CssClass="m-2" Text='<%# Eval("Product.UnitPrice", "{0:C}") %>'></asp:Label>
                                       </div>
                                   </p>
                               </div>
                               <div class="col-6 col-md-3 d-flex justify-content-center justify-content-md-start">
                                   <asp:LinkButton ID="btnIncreaseQuantity" runat="server" CausesValidation="true" CommandName="IncreaseQuantity" CssClass="btn btn-link px-2" OnClick="btnIncreaseQuantity_Click">
                                       <i class="fas fa-plus"></i>
                                   </asp:LinkButton>
                                   <asp:TextBox ID="txtQuantity" MaxLength="15" runat="server" AutoPostBack="true" Text='<%# Eval("Quantity") %>' CssClass="form-control form-control-sm" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
                                   <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity" Type="Integer" MinimumValue="1" Display="Dynamic" CssClass="text-danger custom-error mt-3" MaximumValue="999999" ErrorMessage="Quantity must be between 1 and 999999" />
                                   <asp:LinkButton ID="btnDecreaseQuantity" runat="server" CommandName="DecreaseQuantity" CausesValidation="true" CssClass="btn btn-link px-2" OnClick="btnDecreaseQuantity_Click">
                                       <i class="fas fa-minus"></i>
                                   </asp:LinkButton>
                               </div>
                               <div class="col-6 col-md-2 d-flex justify-content-center justify-content-md-end">
                                  <asp:Label ID="Label2" runat="server" CssClass="cartTotalLabel"  Text="Total:"></asp:Label>
                                   <asp:Label ID="lblItemTotal" runat="server" Text="$0.00"></asp:Label>
                               </div>
                               <div class="col-6 col-md-1 text-end">
                                   <asp:LinkButton ID="btnRemoveItem" runat="server" CausesValidation="false" CommandName="RemoveItem" CommandArgument='<%# Container.ItemIndex %>'>
                                       <i class="fas fa-trash fa-lg"></i>
                                   </asp:LinkButton>
                               </div>
                           </div>
                       </div>
                   </div>
               </ItemTemplate>
           </asp:Repeater>


         <div class="card">    
             <asp:Label ID="lblMessage" runat="server" CssClass="text-danger text-center mt-3 lh-base" Visible="true"></asp:Label>

             <div class="card-body d-flex flex-wrap justify-content-center align-items-center">
                 <asp:Button ID="Button2" runat="server" Text="Checkout" CssClass="btn btn-warning w-25 btn-text" OnClick="btnCheckout_Click" />
                 <asp:Button ID="Button1" runat="server" Text="Continue Shopping" CssClass="btn btn-warning w-25 btn-text" OnClick="btnContinue_Click" />
                 <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CausesValidation="false" CssClass="btn btn-warning w-25 btn-text" OnClick="btnEmpty_Click" />
                 <div class="w-100"></div> <!-- Break to next line -->
                 <div class="col-md-12 text-center m-3  d-flex flex-wrap justify-content-center align-items-center">
                     <asp:Label ID="Label1" runat="server" Text="Total: " CssClass="totalText"></asp:Label>
                     <asp:Label ID="lblGrandTotal" Text="$0.00" CssClass="m-4" runat="server"></asp:Label>
                 </div>
             </div>
         </div>
         


      </div>
    </div>
  </div>
</section>

      

</asp:Content>

      
     


