<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="partStore.aspx.cs" Inherits="DemeterMachine.partStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<div class="container-fluid mt-0 px-0">

	<section class="hero-section">
		<img src="images/parts.jpg" class="hero" alt="Machine Parts">
	</section>

	<main>
		<div class="banner">
			<h1 id="bigger">PARTS <span style="color: #8B181B;">CENTER</span></h1>
		</div>
		
		<section class="sales">
		  <h2 class="px-3" style="color:black;">Demeter Machine's Parts Department offers top-quality components for your farm equipment. From genuine parts for new and used machinery to reliable replacements and upgrades, our experienced team ensures durability and enhanced performance. Trust us for dependable solutions, supporting the efficiency and productivity of your agricultural operations.</h2>
        </section>

	<div class="overlay" style="display:none"></div>
		<div class="search-section">
		  <div class="container-fluid container-xl">
			<div class="row main-content ml-md-0">
			  <div class="sidebar col-md-3 px-0">
				<h1 class="border-bottom filter-header d-flex  p-3 mb-0 align-items-center">

					<asp:LinkButton ID="resetFilter"  OnClick="resetFilter_Click1" CssClass="ml-auto text-uppercase custom-curser" runat="server">Reset Filters</asp:LinkButton>
<%--				  <span class="ml-auto text-uppercase">Reset Filters</span>--%>
				</h1>
				<div class="sidebar__inner ">
				  <div class="filter-body">
					<div>

					  <h2 class="border-bottom filter-title">FILTER</h2>
					  <div class="mb-30 filter-options">
						<div class="custom-control custom-checkbox mb-3">
							<asp:TextBox ID="txtSearchTextBox" runat="server"  Width="300px" Placeholder="Part Number" CssClass="form-control w-100"></asp:TextBox>
							<asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate"
								ControlToValidate="txtSearchTextBox" ErrorMessage="Illegal characters were used" CssClass="text-danger error-text" Display="Dynamic"></asp:CustomValidator>
                         
							<div>
							<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn mx-auto"  CausesValidation="true" OnClick="btnSearch_Click1"/>

							</div>

						</div>

					  </div>


					  <h2 class="font-xbold body-font border-bottom filter-title">BRAND</h2>
					  <div class="mb-3 filter-options" id="cusine-options">
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start mx-auto">
							<asp:CheckBox ID="JohnDeere" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="JohnDeere" checked>--%>
						  <label class="custom-control-label">John Deere</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="CaseIH" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="CaseIH">--%>
						  <label class="custom-control-label">Case IH</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="NewHolland" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="NewHolland">--%>
						  <label class="custom-control-label" >New Holland</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Kubota" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Kubota">--%>
						  <label class="custom-control-label">Kubota</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Mahindra" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label">Mahindra</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Gerronghoff" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label">Gerringhoff</label>
						</div>
			            <div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Drago" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label">Drago</label>
						</div>

						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="GreatPlains" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label">GreatPlains</label>
						</div>
					  </div>


					  </div>
					  <h2 class="border-bottom filter-title">Category</h2>
					  <div class="mb-3 filter-options" id="services-options">
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Tractors" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Tractors" checked>--%>
						  <label class="custom-control-label">Tractors</label>
						</div>
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Combines" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Combines">--%>
						  <label class="custom-control-label">Combines</label>
						</div>

						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Planters" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Planters">--%>
						  <label class="custom-control-label">Planters</label>
						</div>
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Sprayers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Sprayers">--%>
						  <label class="custom-control-label">Sprayers</label>
						</div>
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Headers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Balers">--%>
						  <label class="custom-control-label">Headers</label>
						</div>
					  </div>


					  </div>
					  </div>
						


					</div>

                        <div class="content col-md-9">
                            <div class="d-flex justify-content-between border-bottom align-items-center">
                                <h2 class="title">Products</h2>
                            </div>
                            
                            <div class="row justify-content-around " style="max-height:950px; overflow-y:auto; ">
                              <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="dsParts" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                  <ItemTemplate>
                                      <div class="cols col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                          <div class="thumbnail h-100 d-flex flex-column">
                                              <div>
                                                  <asp:Image ID="Image1" runat="server" CssClass="img-fluid" />
                                              </div>
                                              <div class="caption custom-align">
												  <div>
                                                  <h3><%# Eval("part_number") %></h3>

												  </div>
                                                  <p>
                                                      <b><%# Eval("price", "{0:c}") %></b>
                                                      <br /><br /><%# Eval("part_description") %>
                                                      <br /><br /> Compatible Equipment: <%# Eval("compatible_equipment") %>
                                                  </p>
                                                  <asp:TextBox ID="txtOrderQuantity" runat="server" CssClass="form-control" Placeholder="Order Quantity"  ></asp:TextBox>
                                                  <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CausesValidation="false" CssClass="btn mx-auto w-75 px-3" CommandArgument='<%# Eval("part_number") %>' OnClick="btnAdd_Click" />
                                              </div>
                                          </div>
                                      </div>
                                  </ItemTemplate>
                              </asp:Repeater>
                            </div>
                        </div>
					  </div>
				</div>
			  </div>
	</main>



 			
		  


	        <asp:SqlDataSource
            runat="server" 
            ID="dsParts" 
            ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
            SelectCommand="SELECT * FROM parts;">


         <SelectParameters>

        </SelectParameters>

        </asp:SqlDataSource>



















</div>




</asp:Content>
