<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="locations.aspx.cs" Inherits="DemeterMachine.locations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<section class="hero-section">
		<img src="images/Locations.jpg" class="hero" alt="DEMETER MAINTENANCE Locations">
	</section>
	<main>
		<div class="banner">
			<h1 id="bigger">OUR <span style="color: #8B181B;">LOCATIONS</span></h1>
			
		</div>
		
			<div class="padding">				
				<div class="container mt-5">
					<h2 class="text-center mb-4 attention" style="font-size: 5em; font-weight: 550; color: black;">South Dakota Locations</h2>
					<div class="row">
						<div class="col-md-6">
							<img src="images/location_1.jpg" class="img-fluid" alt="Watertown_location_one">
						</div>
						<div class="col-md-6 location">
							<h2>Watertown by Walmart</h2>
							<ul>
								<li>Street: 111 Industrial Avenue</li>
								<li>City: Watertown</li>
								<li>State: South Dakota</li>
								<li>Phone: (555) 555-5515</li>
							</ul>
						</div>
						<div class="col-md-6 location">
							<h2>Watertown near the Airport</h2>
							<ul>
								<li>Street: 481 South Main Street</li>
								<li>City: Watertown</li>
								<li>State: South Dakota</li>
								<li>Phone: (555) 565-3585</li>
							</ul>
						</div>
						<div class="col-md-6">
							<img src="images/newlocation.jpg" class="img-fluid" alt="Watertown_Location_Two">      			
						</div>
					</div>
				</div>
			</div>
		

	</main>




</asp:Content>
