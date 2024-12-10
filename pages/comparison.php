<?php
session_start();
$page = 'Comparison';
include_once('../includes/header.php');
?>
<!-- Tables -->
<div class="wrapper p-10 max-w-4xl bg-gray-900 text-gray-300 ml-0">
    <div class="wrapper p-10 max-w-4xl bg-gray-900 text-gray-300">
        <!-- Title -->
        <h2 class="text-2xl font-bold text-center text-white mb-6">NetherLands Data</h2>

        <!-- Table NLL -->
        <div class="table w-full border-collapse shadow-md">
            <!-- Header -->
            <div class="row header grid grid-cols-4 bg-red-500 text-white font-bold">
                <div class="cell px-4 py-2 text-left">Measurements</div>
                <div class="cell px-4 py-2 text-left">Value</div>
                <div class="cell px-4 py-2 text-left">Unit</div>
                <div class="cell px-4 py-2 text-left">Location NLL</div>
            </div>

            <!-- Body -->
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Speed</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">Km/h</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Altitude</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">m</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Humidity">Humidity</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">%</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
        </div>
    </div>

    <div class="wrapper p-10 max-w-4xl bg-gray-900 text-gray-300">
        <!-- Title -->
        <h2 class="text-2xl font-bold text-center text-white mb-6">Denmark Data</h2>

        <!-- Table DKK -->
        <div class="table w-full border-collapse shadow-md">
            <!-- Header -->
            <div class="row header grid grid-cols-4 bg-red-500 text-white font-bold">
                <div class="cell px-4 py-2 text-left">Measurements</div>
                <div class="cell px-4 py-2 text-left">Value</div>
                <div class="cell px-4 py-2 text-left">Unit</div>
                <div class="cell px-4 py-2 text-left">Location DKK</div>
            </div>

            <!-- Body -->
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Speed</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">Km/h</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Altitude</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">m</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Humidity">Humidity</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">%</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
        </div>
    </div>

    <div class="wrapper p-10 max-w-4xl bg-gray-900 text-gray-300">
        <!-- Title -->
        <h2 class="text-2xl font-bold text-center text-white mb-6">Comparison Table</h2>

        <!-- Table -->
        <div class="table w-full border-collapse shadow-md">
            <!-- Header -->
            <div class="row header grid grid-cols-4 bg-red-500 text-white font-bold">
                <div class="cell px-4 py-2 text-left">Measurements</div>
                <div class="cell px-4 py-2 text-left">Value</div>
                <div class="cell px-4 py-2 text-left">Unit</div>
                <div class="cell px-4 py-2 text-left">Location Comp</div>
            </div>

            <!-- Body -->
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Speed</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">Km/h</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Name">Altitude</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">m</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
            <div class="row grid grid-cols-4 bg-gray-100 even:bg-white">
                <div class="cell text-black px-4 py-2" data-title="Humidity">Humidity</div>
                <div class="cell text-black px-4 py-2" data-title="Value"></div>
                <div class="cell text-black px-4 py-2" data-title="Unit">%</div>
                <div class="cell text-black px-4 py-2" data-title="Location"></div>
            </div>
        </div>
    </div>
</div>

<?php
include_once('../includes/footer.php');
?>