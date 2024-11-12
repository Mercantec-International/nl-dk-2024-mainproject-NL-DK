<?php
include('php/functions.php');

headerHTML("Home");
?>

<!-- Hero Section -->
<div class="hero text-center flex-column justify-content-center align-items-center">
    <h1 class="display-4">Welcome to Project Apollo</h1>
    <p class="lead">Advancing Rocketry and Space Exploration with Rocket League</p>
    <a href="project.php" class="btn btn-primary btn-lg mt-3">Learn More About Our Project</a>
</div>

<!-- Content Sections -->
<div class="container my-5">
    <!-- About Section -->
    <section class="text-center my-5">
        <h2>About Us</h2>
        <p>Meet the team behind Rocket League’s pioneering Project Apollo. Our mission is to push the boundaries of space technology through innovation and collaboration.</p>
        <a href="aboutus.php" class="btn btn-outline-primary mt-2">Meet Our Team</a>
    </section>

    <!-- Project Overview Section -->
    <section class="text-center my-5">
        <h2>About Project Apollo</h2>
        <p>Project Apollo is focused on the design and testing of a mini rocket prototype, measuring critical flight data such as speed, altitude, and humidity. Our goal is to achieve remarkable accuracy and efficiency for future space missions.</p>
        <a href="project.php" class="btn btn-outline-primary mt-2">Explore Our Project</a>
    </section>

    <!-- Data Section -->
    <section class="text-center my-5">
        <h2>Prototype Data</h2>
        <p>Explore real-time and recorded data from our mini rocket prototype, including metrics like speed, altitude, and environmental conditions.</p>
        <a href="data.php" class="btn btn-outline-primary mt-2">View Data</a>
    </section>

    <!-- Cross-Country Comparison Section -->
    <section class="text-center my-5">
        <h2>Cross-Country Comparison</h2>
        <p>Compare our rocket's performance across different terrains and atmospheric conditions. Learn how it adapts to a variety of environments.</p>
        <a href="comparison.php" class="btn btn-outline-primary mt-2">See Comparisons</a>
    </section>
</div>

<?php
footerHTML();
?>