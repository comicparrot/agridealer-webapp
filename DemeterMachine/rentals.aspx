<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rentals.aspx.cs" Inherits="DemeterMachine.rentals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<section class="hero-section">
		<img src="images/Rental_hero.jpg" class="hero" alt="DEMETER MAINTENANCE Rental Equipment">
	</section>

	<main>
		<div class="banner">
			<h1 id="bigger">EQUIPMENT RENTAL <span style="color: #8B181B;">CENTER</span></h1>
		</div>

		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<img src="images/Rental_tractors.png" class="img-fluid" alt="rental_equipment_agriculture">
		            <asp:Button ID="btnRental" OnClick="btnRental_Click" CssClass="btn tractor-rental" runat="server" Text="Tractor Rental" />

<%--					<button class="btn" style="margin-top: -50px;">Tractor Rental</button>--%>
				</div>
			</div>
		</div>

		<section class="sales">
		  <h2 class="px-3">Renting equipment from Demeter Machine offers farmers the flexibility to scale their operations based on seasonal demand. Instead of making a significant upfront investment in purchasing machinery that may only be needed during specific times of the year, our rental options allow farmers to access the right equipment when they need it, optimizing resource utilization and cost-effectiveness.</h2>
		</section>

	<div class="overlay" style="display:none"></div>
		<div class="search-section">
		  <div class="container-fluid container-xl">
			<div class="row main-content ml-md-0">
			  <div class="sidebar col-md-3 px-0">
				<h1 class="border border-1 border-gray custom-border filter-header d-flex  p-3 mb-0 align-items-center">

					<asp:LinkButton ID="resetFilter"  OnClick="resetFilter_Click" CssClass="ml-auto text-uppercase custom-curser" runat="server">Reset Filters</asp:LinkButton>
<%--				  <span class="ml-auto text-uppercase">Reset Filters</span>--%>
				</h1>
				<div class="sidebar__inner ">
				  <div class="filter-body">
					<div>
					  <h2 class="border-bottom filter-title">FILTER</h2>

					  <h2 class="font-xbold body-font border-bottom filter-title">BRAND</h2>
					  <div class="mb-3 filter-options" id="cusine-options">
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="JohnDeere" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"  />

<%--						  <input type="checkbox" class="custom-control-input" id="JohnDeere" checked>--%>
						  <label class="custom-control-label" for="JohnDeere">John Deere</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="CaseIH" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="CaseIH">--%>
						  <label class="custom-control-label" for="CaseIH">Case IH</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="NewHolland" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="NewHolland">--%>
						  <label class="custom-control-label" for="NewHolland">New Holland</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Kubota" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Kubota">--%>
						  <label class="custom-control-label" for="Kubota">Kubota</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Mahindra" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label" for="Mahindra">Mahindra</label>
						</div>
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Gerronghoff" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label" for="Mahindra">Gerringhoff</label>
						</div>
			            <div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="Drago" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label" for="Mahindra">Drago</label>
						</div>

						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="GreatPlains" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

<%--						  <input type="checkbox" class="custom-control-input" id="Mahindra">--%>
						  <label class="custom-control-label" for="GreatPlains">GreatPlains</label>
						</div>
					  </div>


					  </div>



					  </div>

				            
				              <h2 class="border-bottom filter-title">Category</h2>
				              <div class="mb-3 filter-options" id="services-options">
				            	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				            		<asp:CheckBox ID="Tractors" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				            
<%--			            		  <input type="checkbox" class="custom-control-input" id="Tractors" checked>--%>
				            	  <label class="custom-control-label" for="Tractors">Tractors</label>
				            	</div>
				            	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				            		<asp:CheckBox ID="Combines" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				            
<%--			            		  <input type="checkbox" class="custom-control-input" id="Combines">--%>
				            	  <label class="custom-control-label" for="Combines">Combines</label>
				            	</div>
				            
				            	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				            		<asp:CheckBox ID="Planters" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				            
<%--			            		  <input type="checkbox" class="custom-control-input" id="Planters">--%>
				            	  <label class="custom-control-label" for="Planters">Planters</label>
				            	</div>
				            	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				            		<asp:CheckBox ID="Sprayers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				            
<%--			            		  <input type="checkbox" class="custom-control-input" id="Sprayers">--%>
				            	  <label class="custom-control-label" for="Sprayers">Sprayers</label>
				            	</div>
				            	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				            		<asp:CheckBox ID="Headers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				            
<%--			            		  <input type="checkbox" class="custom-control-input" id="Balers">--%>
				            	  <label class="custom-control-label" for="Balers">Headers</label>
				            	</div>
				              </div>
					  </div>
						


					</div>

                        <div class="content col-md-9">
                            <div class="d-flex justify-content-between border-bottom align-items-center">
                                <h2 class="title">Products</h2>
                            </div>
                            
                            <div class="row" style="max-height:950px; overflow-y:auto;">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsRentals"  OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 mb-3"> 
                                            <div class="thumbnail h-100 mx-auto border border-gray"> 
												<a class="text-decoration-none thumbnail d-flex flex-column" style="position: relative; flex: 1 1 auto;" href='<%# GetProductDetailUrl(Eval("serial_number"), Eval("type")) %>'>
												<div>
										          <asp:Image ID="Image1"  runat="server" CssClass="img-fluid" />

												</div>
                                                <div class="caption mh-100" style="position: relative; bottom: 5px; ">
<%--                                                    <h3 class="text-center"><%# Eval("serial_number") %></h3>--%>
                                                    <p class="product-desc text-dark"><b>Model: </b> <%# Eval("model") %></p>
													<p class="product-desc text-dark"><b>Year: </b><%# Eval("model_year") %></p>
													<p class="product-desc text-dark"><b>Price: </b><%# Eval("price", "{0:c}") %></p>	                                                       
													<p class="product-desc text-dark"><b>Condition: </b><%# Eval("equipment_condition") %></p>
                                                    <p class="product-desc text-dark"><b>Serial Number: </b><%# Eval("serial_number") %></p>  
                           			
                                                </div>
												</a>
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
            ID="dsRentals" 
            ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
            SelectCommand="SELECT serial_number, model, model_year, equipment_condition, type, price, brand FROM productSearch WHERE equipment_condition = 'Used' ;">


         <SelectParameters>

        </SelectParameters>

        </asp:SqlDataSource>



</asp:Content>
