// JavaScript Document
"use strict";

//document.addEventListener('DOMContentLoaded', function () {
//    document.getElementById('btnEmail').addEventListener('click', subscribe);
//});



//document.addEventListener('DOMContentLoaded', function () {


//    document.getElementById('btnEmail').addEventListener('click', function () {
//        var emailInput = document.getElementById('email');
//        var emailError = document.getElementById('emailError');
//        var email = emailInput.value.trim();

//        // Check if the email is empty
//        if (email === '') {
//            emailError.style.display = 'block'; // Show the error message
//        } else {
//            // Check if the email is valid (you can add more sophisticated validation if needed)
//            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//            if (!emailPattern.test(email)) {
//                emailError.style.display = 'block'; // Show the error message
//            } else {
//                emailError.style.display = 'none'; // Hide the error message
//                // Proceed with your subscription logic
//                alert("Thank you for subscribing to our mailing list. Your email address is: " + email);
//                $('#emailModal').modal('hide');
//                location.reload();
//            }
//        }
//    });
//});

document.querySelectorAll('.plus-button').forEach(button => {
    button.addEventListener('click', function () {
        const input = this.parentNode.querySelector('.quantity-input');
        input.stepUp();
    });
});

document.querySelectorAll('.minus-button').forEach(button => {
    button.addEventListener('click', function () {
        const input = this.parentNode.querySelector('.quantity-input');
        input.stepDown();
    });
});

function showModal() {
    var modal = document.getElementById('appointment');
    modal.style.display = 'block';
}

function hideModal() {
    var modal = document.getElementById('appointment');
    modal.style.display = 'none';
}


