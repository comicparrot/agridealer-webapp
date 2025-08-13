<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DemeterMachine._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


	<script>
        document.addEventListener('DOMContentLoaded', function () {


            document.getElementById('btnEmail').addEventListener('click', function () {
                var emailInput = document.getElementById('email');
                var emailError = document.getElementById('emailError');
                var email = emailInput.value.trim();

                // Check if the email is empty
                if (email === '') {
                    emailError.style.display = 'block'; // Show the error message
                } else {
                    // Check if the email is valid (you can add more sophisticated validation if needed)
                    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!emailPattern.test(email)) {
                        emailError.style.display = 'block'; // Show the error message
                    } else {
                        emailError.style.display = 'none'; // Hide the error message
                        // Proceed with your subscription logic
                        alert("Thank you for subscribing to our mailing list. Your email address is: " + email);
                        $('#emailModal').modal('hide');
                        location.reload();
                    }
                }
            });
        });

    </script>

</asp:Content>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<section class="hero-section">
		<img src="images/Front_page_Hero.jpg" class="hero index" alt="New Case Tractor" style="top: 0;">
		<div class="hero-inner">
            <h1>CASE<br><span style="color: #8B181B;">115U</span></h1>
			<h2 class="text-center">CONFIGURE YOURS TODAY</h2>	
		</div>
		<div class="diagonal-text px-3 w-auto text-nowrap">
				<h2 style="margin-right: 75px; font-size: 3vw;">ALL NEW 2024</h2>
		</div>		
	</section>
	<main>
		<div class="banner">
			<h1 id="bigger">MASTER YOUR FIELD <span style="color: #8B181B;">TODAY</span></h1>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3 mx-auto">
					<a href="product.aspx">
    					<img src="images/browseinventory.jpg" alt="browseinventory" class="img-fluid">
					</a>					
					<h2>BROWSE INVENTORY</h2>
					<p class="text-center">Explore our new and used inventory for unbeatable deals on high-quality
					machinery, ensuring you stay ahead in the field while optimizing
					your budget.</p>
				</div>

				<div class="col-md-3 mx-auto">
					<a href="services.aspx">
    					<img src="images/Services.jpg" alt="Service maintenance" class="img-fluid">
					</a>					
					<h2>SERVICES</h2>
					<p class="text-center">Our maintence crew is full trained to service all equipment because you
					need to keep your farm running</p>
				</div>

				<div class="col-md-3 mx-auto">
					<a href="rentals.aspx">
    					<img src="images/rentals.jpg" alt="Equipment rentals available" class="img-fluid">
					</a>					
					<h2>RENTALS</h2>
					<p class="text-center">Need equipment now but don’t want to buy? Check out our rental
					options!</p>
				</div>
			</div>
		</div>


		
		<div class="signup-banner">
        	<h1>Sign Up!</h1>
        	<h3>JOIN OUR MAILING LIST FOR EXCLUSIVE PROMOTIONS AND DEMETER MACHINE NEWS</h3>
			<div class="container mt-5"> 
				<button type="button" class="btn btn-primary" style="margin-top: 5px; border: none;" data-toggle="modal" data-target="#emailModal">Sign Up</button>

				<div class="modal" id="emailModal">
				  <div class="modal-dialog">
					<div class="modal-content">

					  <!-- Modal Header -->
					  <div class="modal-header">
						<h4 class="modal-title">Enter Your Email</h4>
<%--						<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
					  </div>

					  <!-- Modal Body -->
                      <div class="modal-body">
						  
							<div class="form-group">
<%--                              <label style="margin-right:300px;"  for="email">Email address:</label>--%>
                              <input type="email" class="form-control" id="email" placeholder="Enter your email">
							  <span id="emailError" class="text-danger" style="display: none;">Please enter a valid email address.</span>
                            </div>
						  
                      </div>
						
					  <!-- Modal Footer -->
					  <div class="modal-footer">

				        <button type="button" id="btnEmail" class="btn" style="margin-top: 10px; border: none;">Subscribe</button>
						<button type="button" class="btn" style="margin-top: 10px; border: none;"  data-dismiss="modal">Close</button>
					  </div>

					</div>
						
				  </div>
				</div>
			</div>
        	
    	</div>
		
	
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<img src="images/contactsales.jpg" alt="Contact Sales" class="img-fluid">
					<h2 class="cta fs-1">CONTACT <br> OUR <br> <span style="color: #8B181B;">SALES</span></h2>
				</div>

				<div class="col-md-3">
					<img src="images/meetstaff.png" alt="Meet our staff" class="img-fluid">
					<h2 class="cta fs-2">MEET <br> OUR <br> <span style="color: #8B181B;">STAFF</span></h2>
				</div>

				<div class="col-md-3">
					<img src="images/finance.png" alt="Special Financing Available" class="img-fluid">
					<h2 class="cta fs-3">SPECIAL <br> FINANCING <br> <span style="color: #8B181B;">AVAILABLE</span></h2>
				</div>

				<div class="col-md-3">
					<img src="images/newlocation.jpg" alt="See our new location" class="img-fluid">
					<h2 class="cta fs-4">VISIT OUR <br> NEW <br> <span style="color: #8B181B;">LOCATION</span></h2>
				</div>
			</div>
		</div>
			
		<section class="partner">
			<h2 class="px-3">MANUFACTURING PARTNERS</h2>
			<div class="container">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-sm-2 mb-3">
							<img src="images/masseyfergusonlogo.png" alt="Massey-Ferguson" class="img-fluid">
						</div>
						<div class="col-sm-2 mb-3">
							<img src="images/newhollandlogo.png" alt="New Holland" class="img-fluid">
						</div>
						<div class="col-sm-2 mb-3">
							<img src="images/caseihlogo.jpg" alt="Case International" class="img-fluid">
						</div>
						<div class="col-sm-2 mb-3">
							<img src="images/kubotalogo.jpg" alt="Kubota" class="img-fluid">
						</div>
						<div class="col-sm-2 mb-3">
							<img src="images/Johndeerelogo.png" alt="John Deere" class="img-fluid">
						</div>
					</div>
				</div>
			</div>
		</section>
		
	</main>

</asp:Content>
