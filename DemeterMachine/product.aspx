<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DemeterMachine.product" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<section class="hero-section">
		<img src="images/Products_hero.jpg" class="hero" alt="DEMETER MACHINE new and used products">
	</section>

	<main>
		<div class="banner">
			<h1 id="bigger">AGRICULTURAL EQUIPMENT <span style="color: #8B181B;">CENTER</span></h1>
		</div>
		
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<img src="images/New_tractor.png" class="img-fluid" alt="New Inventory 2024">
					<asp:Button ID="btnNew"  OnClick="btnNew_Click" CssClass="btn" runat="server" Text="Shop New" />
<%--					<button class="btn">Shop New</button>--%>
				</div>


				<div class="col-md-6">
					<img src="images/Used_tractor.png" class="img-fluid" alt="Show Used Inventory">
					<asp:Button ID="btnUsed" OnClick="btnUsed_Click" CssClass="btn" runat="server" Text="Shop Used" />
<%--					<button class="btn">Shop Used</button>--%>
				</div>
			</div>
		</div>
		
		<section class="sales">
		  <h2 class="px-3">If you're looking for quality new or used equipment at exceptional prices, you've come to the right place.
			  From first seed to final swath, Demeter Machine is your trusted partner through it all.
			Find machines at prices that are hard to beat.</h2>
        </section>

	<div class="overlay" style="display:none"></div>
		<div class="search-section">
		  <div class="container-fluid container-xl">
			<div class="row main-content ml-md-0">
			  <div class="sidebar col-md-3 px-0">
				<h1 class=" border custom-border filter-header d-flex  p-3 mb-0 align-items-center border-1 border-gray">

					<asp:LinkButton ID="resetFilter" OnClick="resetFilter_Click" CssClass="ml-auto text-uppercase custom-curser " runat="server">Reset Filters</asp:LinkButton>
<%--				  <span class="ml-auto text-uppercase">Reset Filters</span>--%>
				</h1>
				<div class="sidebar__inner ">
				  <div class="filter-body">
					<div>
					  <h2 class="border-bottom filter-title">FILTER</h2>
					  <div class="mb-30 filter-options">
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="New" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
<%--						  <input type="checkbox" class="custom-control-input" id="New" checked>--%>
						  <label class="custom-control-label" for="New">New</label>
						</div>
						<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
							<asp:CheckBox ID="Used" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
<%--						  <input type="checkbox" class="custom-control-input" id="Used">--%>
						  <label class="custom-control-label" for="Used">Used</label>
						</div>
					  </div>

					  <h2 class="font-xbold body-font border-bottom filter-title">BRAND</h2>
					  <div class="mb-3 filter-options" id="cusine-options">
						<div class="custom-control custom-checkbox mb-3 d-flex justify-content-start">
							<asp:CheckBox ID="JohnDeere" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>

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
				        
<%--			        		  <input type="checkbox" class="custom-control-input" id="Tractors" checked>--%>
				        	  <label class="custom-control-label" for="Tractors">Tractors</label>
				        	</div>
				        	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				        		<asp:CheckBox ID="Combines" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				        
<%--			        		  <input type="checkbox" class="custom-control-input" id="Combines">--%>
				        	  <label class="custom-control-label" for="Combines">Combines</label>
				        	</div>
				        
				        	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				        		<asp:CheckBox ID="Planters" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				        
<%--			        		  <input type="checkbox" class="custom-control-input" id="Planters">--%>
				        	  <label class="custom-control-label" for="Planters">Planters</label>
				        	</div>
				        	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				        		<asp:CheckBox ID="Sprayers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				        
<%--			        		  <input type="checkbox" class="custom-control-input" id="Sprayers">--%>
				        	  <label class="custom-control-label" for="Sprayers">Sprayers</label>
				        	</div>
				        	<div class="custom-control custom-checkbox mb-3  d-flex justify-content-start">
				        		<asp:CheckBox ID="Headers" runat="server" CssClass="custom-control-input" AutoPostBack="true" OnCheckedChanged="FilterProducts"/>
				        
<%--			        		  <input type="checkbox" class="custom-control-input" id="Balers">--%>
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
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsProducts"  OnItemDataBound="Repeater1_ItemDataBound">
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
            ID="dsProducts" 
            ConnectionString="<%$ ConnectionStrings:agridealerConnectionString5 %>" 
            SelectCommand="SELECT serial_number, model, model_year, equipment_condition, type, price, brand FROM productSearch;">


         <SelectParameters>

        </SelectParameters>

        </asp:SqlDataSource>



</asp:Content>
