<?php
include('php/functions.php');
headerHTML("About Us");
?>

<div class="container my-5">
    <h2 class="text-center mb-4">Meet Our Team</h2>
    <div class="row">
        <!-- Sample Team Member Card -->
        <div class="col-md-4">
            <div class="card text-center">
                <img src="media/images/team-member1.jpg" class="card-img-top" alt="Member Photo">
                <div class="card-body">
                    <h5 class="card-title">Jane Doe</h5>
                    <p class="card-text">Lead Engineer</p>
                    <p class="card-text">Jane is the lead engineer responsible for the rocket's design and prototype testing.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
footerHTML();
?>
