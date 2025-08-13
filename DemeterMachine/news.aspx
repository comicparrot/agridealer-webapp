<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="DemeterMachine.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<section class="hero-section">
		<img src="images/news_hero.jpg" class="hero" alt="DEMETER MAINTENANCE News and Events">
	</section>
	<main>
		<div class="descrption">
			<div class="banner">
				<h1 id="bigger">NEWS AND <span style="color: #8B181B;">EVENTS</span></h1>
				<h2 class="px-3" style="font-size: 3vw;">Demeter Machine is pushing the boundries of agricultural innovation!</h2>
			</div>
		</div>
		<div class="padding">
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-6">
						<img src="images/grand_opening.png" class="img-fluid" alt="Grand Opening">
					</div>
					<div class="col-md-6">
						<h2>GRAND OPENING</h2>
						<p> Demeter Machine, Watertown's eagerly awaited farming equipment dealership, is set to dazzle the community with its grand opening extravaganza! Join us March 27th for a day of agricultural innovation and celebration as we unveil the latest in cutting-edge farming technology.</p>
					</div>
					<div class="col-md-6">
						<h2>ENGINEERING TOMORROW</h2>
						<p>We pride ourselves on fostering partnerships with engineers from diverse organizations, uniting our expertise to drive the evolution of farm machinery. Together, we navigate the challenges and seize opportunities to create the next generation of cutting-edge equipment, ensuring farmers have the tools they need to thrive in an ever-changing landscape.</p>
					</div>
					<div class="col-md-6">
						<img src="images/news_advance.jpg" class="img-fluid" alt="Engineering_cooperation">      			
					</div>
				</div>
			</div>
		</div>
	</main>



</asp:Content>
