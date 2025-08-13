<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="DemeterMachine.services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnSubmit').addEventListener('click', function () {
			var infoError = document.getElementById('infoError');
            var infoErrorPhone = document.getElementById('infoErrorPhone');

            var infoPhoneValidError = document.getElementById('inforErrorPhoneValid');

            var equipmentError = document.getElementById('equipmentError');
			var info = document.getElementById('contactInfo1').value;
            var infoPhone = document.getElementById('contactPhone').value;

            var equipmentInfo = document.getElementById('equipmentBrand').value;
			var isValid = true;

            var pattern = /^(?:(?:\+1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$|^$/;

            // Check if the contact information is empty
            if (info === '') {
                infoError.style.display = 'block';
                isValid = false;
			}
			else {
                infoError.style.display = 'none';
			}

			if (infoPhone === '') {
				infoErrorPhone.style.display = 'block';
                infoPhoneValidError.style.display = 'none';
                isValid = false;
			}
			else {

				if (!pattern.test(infoPhone)) {
                    infoError.style.display = 'none';
					infoPhoneValidError.style.display = 'block';
					isValid = false;
				}
				else {
                    infoPhoneValidError.style.display = 'none';
                    infoError.style.display = 'none';

				}


            }

            // Check if the equipment brand is empty
            if (equipmentInfo === '') {
                equipmentError.style.display = 'block';
                isValid = false;
            } else {
                equipmentError.style.display = 'none';
            }

            // If both fields are valid, proceed
            if (isValid) {
                // Proceed with your logic here
                alert("Thank you for submitting the form. We will contact you as soon as possible");
                // Hide the modal
                $('#appointment').modal('hide');
                // Reload the page
                location.reload();
            }
        });
    });
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <section class="hero-section">
		<img src="images/Service_banner.jpg" class="hero" alt="DEMETER MAINTENANCE SERVICES">
	</section>

	<main>
		<div class="descrption">
			<div class="banner">
				<h1 id="bigger">KEEP YOUR EQUIPMENT <span style="color: #8B181B;">RUNNING</span></h1>
				<h2 class="px-3" style="font-size: 3vw;">Whether it's routine maintenance, major repairs, warranty service, equipment inspections, or more, Demeter Machine's service teams are here for you!</h2>
			</div>
		</div>
		<div class="padding">
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-6 custom-height">
						<img src="images/Inhouse-maintenance.jpg" class="img-fluid" alt="Service technicians in house">
					</div>
					<div class="col-md-6 custom-height">
						<h2 class="px-3">SERVICE REQUEST</h2>
						<p>Need to schedule a maintenance or repair service? Fill out the service request form to be contacted by your local Demeter Machine service team representative.</p>
						<button type="button" class="btn btn-primary" style="border: none;" data-toggle="modal" data-target="#appointment">Schedule Appointment</button>




						<div class="modal" id="appointment">
						  <div class="modal-dialog">
							<div class="modal-content">

							  <!-- Modal Header -->
							  <div class="modal-header">
								<h4 class="modal-title">Schedule an Appointment</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							  </div>

							  <!-- Modal Body -->
							  <div class="modal-body">
								<div>
								  <div class="form-group">
									<label for="contactInfo1">Contact Information:</label>
									<input type="text" class="form-control" id="contactInfo1" placeholder="Enter your Name" >
							        <span id="infoError" class="text-danger" style="display: none;">Required!</span>

								  </div>

								  <div class="form-group">
									<label for="contactPhone">Contact Phone Number:</label>
									<input type="text" class="form-control" id="contactPhone" placeholder="Enter your Phone Number" >
							        <span id="infoErrorPhone" class="text-danger" style="display: none;">Required!</span>
							        <span id="inforErrorPhoneValid" class="text-danger" style="display: none;">Invalid Phone Number!</span>

								  </div>

								  <div class="form-group">
									<label for="equipmentBrand">Equipment Brand:</label>
									<input type="text" class="form-control" id="equipmentBrand" placeholder="Enter the brand of equipment" >
							        <span id="equipmentError" class="text-danger" style="display: none;">Required!</span>

								  </div>

								</div>
							  </div>

				              <!-- Modal Footer -->
				              <div class="modal-footer">

							    <button id="btnSubmit" type="button" class="btn btn-primary" style="margin-top: 10px; border: none;">Submit</button>
				            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				              </div>
				     

							</div>
						  </div>
						</div>
					</div>
                    <div class="col-md-6 custom-height" id="move">
                        <h2 class="px-3">ON-SITE SERVICE</h2>
                        <p>Demeter Machine prioritizes your farm equipment's peak performance. Our dedicated on-site service team ensures convenient and efficient repairs, eliminating the need to transport your machinery. Trust us to keep your agricultural equipment running smoothly, so you can focus on the success of your farming endeavors.</p>
						<asp:Button ID="contactUsBtn" runat="server" Text="Contact Us" CssClass="btn btn-primary" OnClientClick="makePhoneCall()"/>
						<a href="tel:+6052161125" class="btn btn-primary" style="text-decoration: none; visibility:hidden; border: none; background-color: #8B181B;">Contact Us</a>
                    </div>
					<div class="col-md-6 custom-height" id="please">
						<img src="images/Onsite-maintenance.jpg" class="img-fluid" alt="On site maintenance">      			
					</div>
				</div>
			</div>
		</div>
	</main>


</asp:Content>
