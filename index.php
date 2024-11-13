<?php
include('php/functions.php');

headerHTML("Home");
?>
<!-- Hero Section -->
<div class="hero flex flex-col items-center justify-center text-center bg-gray-800 text-white py-20">
    <h1 class="text-4xl font-bold">Welcome to Project Apollo</h1>
    <p class="text-xl mt-4">Advancing Rocketry and Space Exploration with Rocket League</p>
    <a href="project.php" class="mt-6 bg-indigo-600 text-white px-6 py-3 rounded-lg hover:bg-indigo-700">Learn More About Our Project</a>
</div>

<!-- Content Sections -->
<div class="container mx-auto my-16 px-4">
    <!-- About Section -->
    <section class="text-center my-16">
        <h2 class="text-3xl font-semibold">About Us</h2>
        <p class="mt-4 text-black">Meet the team behind Rocket League’s pioneering Project Apollo. Our mission is to push the boundaries of space technology through innovation and collaboration.</p>
        <a href="aboutus.php" class="inline-block mt-4 border border-indigo-600 text-indigo-600 px-4 py-2 rounded-lg hover:bg-indigo-600 hover:text-white">Meet Our Team</a>
    </section>

    <!-- Project Overview Section -->
    <section class="text-center my-16">
        <h2 class="text-3xl font-semibold">About Project Apollo</h2>
        <p class="mt-4 text-black">Project Apollo is focused on the design and testing of a mini rocket prototype, measuring critical flight data such as speed, altitude, and humidity. Our goal is to achieve remarkable accuracy and efficiency for future space missions.</p>
        <a href="project.php" class="inline-block mt-4 border border-indigo-600 text-indigo-600 px-4 py-2 rounded-lg hover:bg-indigo-600 hover:text-white">Explore Our Project</a>
    </section>

    <!-- Data Section -->
    <section class="text-center my-16">
        <h2 class="text-3xl font-semibold">Prototype Data</h2>
        <p class="mt-4 text-black">Explore real-time and recorded data from our mini rocket prototype, including metrics like speed, altitude, and environmental conditions.</p>
        <a href="data.php" class="inline-block mt-4 border border-indigo-600 text-indigo-600 px-4 py-2 rounded-lg hover:bg-indigo-600 hover:text-white">View Data</a>
    </section>

    <!-- Cross-Country Comparison Section -->
    <section class="text-center my-16">
        <h2 class="text-3xl font-semibold">Cross-Country Comparison</h2>
        <p class="mt-4 text-black">Compare our rocket's performance across different terrains and atmospheric conditions. Learn how it adapts to a variety of environments.</p>
        <a href="comparison.php" class="inline-block mt-4 border border-indigo-600 text-indigo-600 px-4 py-2 rounded-lg hover:bg-indigo-600 hover:text-white">See Comparisons</a>
    </section>
</div>


<?php
footerHTML();
?>