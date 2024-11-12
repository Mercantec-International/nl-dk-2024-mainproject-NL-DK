<?php
include('php/functions.php');
headerHTML("Data");
?>

<div class="container my-5">
    <h2 class="text-center">Rocket Prototype Data</h2>
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>Measurement</th>
                <th>Value</th>
                <th>Unit</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Speed</td>
                <td>1200</td>
                <td>km/h</td>
            </tr>
            <tr>
                <td>Altitude</td>
                <td>15,000</td>
                <td>m</td>
            </tr>
            <tr>
                <td>Humidity</td>
                <td>15</td>
                <td>%</td>
            </tr>
        </tbody>
    </table>
</div>
<?php
footerHTML();
?>
