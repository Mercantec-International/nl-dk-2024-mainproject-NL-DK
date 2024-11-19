<?php
include('php/functions.php');
headerHTML("Data");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Static Table</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">
    <div class="flex-grow flex items-center justify-center">
        <div class="container mx-auto">
            <div class="bg-white shadow-md rounded">
                <table class="min-w-full table-auto border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-800 text-white">
                            <th class="border px-4 py-2">Measurement</th>
                            <th class="border px-4 py-2">Value</th>
                            <th class="border px-4 py-2">Unit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover:bg-gray-100">
                            <td class="border px-4 py-2 text-center">Speed</td>
                            <td class="border px-4 py-2 text-center" contenteditable="true" data-original="1200">1200</td>
                            <td class="border px-4 py-2 text-center">km/h</td>
                            
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="border px-4 py-2 text-center">Altitude</td>
                            <td class="border px-4 py-2 text-center" contenteditable="true" data-original="15,000">15,000</td>
                            <td class="border px-4 py-2 text-center">m</td>
                          
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="border px-4 py-2 text-center">Humidity</td>
                            <td class="border px-4 py-2 text-center" contenteditable="true" data-original="15">15</td>
                            <td class="border px-4 py-2 text-center">%</td>
                           
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="flex-grow flex items-center justify-center">
        <div class="container mx-auto p-4 w-75 h-75">
            <div class="bg-white shadow-lg rounded-lg p-6">
                <h2 class="text-2xl font-semibold text-gray-700 mb-4">Toy Rocket Flight - Speed, Altitude, and Humidity</h2>
                <canvas id="rocketChart" class="w-full h-96"></canvas>
            </div>
        </div>
    </div>

    <script>
        // Data for the graph
        const data = {
            labels: ['0s', '1s', '2s', '3s', '4s', '5s', '6s', '7s'], // Time in seconds
            datasets: [
                {
                    label: 'Altitude (m)',
                    data: [0, 15, 35, 50, 40, 25, 10, 0], // Altitude profile
                    borderColor: '#4F46E5', // Indigo-600
                    backgroundColor: 'rgba(79, 70, 229, 0.1)', // Semi-transparent Indigo
                    tension: 0.4,
                    yAxisID: 'y',
                },
                {
                    label: 'Speed (m/s)',
                    data: [0, 20, 25, 0, -10, -20, -15, 0], // Speed profile
                    borderColor: '#F59E0B', // Amber-500
                    backgroundColor: 'rgba(245, 158, 11, 0.1)', // Semi-transparent Amber
                    tension: 0.4,
                    yAxisID: 'y',
                },
                {
                    label: 'Humidity (%)',
                    data: [60, 59, 57, 55, 56, 58, 59, 60], // Humidity changes
                    borderColor: '#10B981', // Green-500
                    backgroundColor: 'rgba(16, 185, 129, 0.1)', // Semi-transparent Green
                    tension: 0.4,
                    yAxisID: 'y2',
                },
            ],
        };

        // Configuration for the chart
        const config = {
            type: 'line',
            data: data,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        mode: 'index',
                        intersect: false,
                    },
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Time (seconds)',
                        },
                    },
                    y: {
                        type: 'linear',
                        position: 'left',
                        title: {
                            display: true,
                            text: 'Altitude / Speed',
                        },
                    },
                    y2: {
                        type: 'linear',
                        position: 'right',
                        title: {
                            display: true,
                            text: 'Humidity (%)',
                        },
                        grid: {
                            drawOnChartArea: false, // Avoid grid overlap with y-axis
                        },
                    },
                },
            },
        };

        // Render the chart
        new Chart(document.getElementById('rocketChart'), config);

        // Add this before the existing chart script
        document.addEventListener('DOMContentLoaded', function() {
            const editableCells = document.querySelectorAll('[contenteditable="true"]');
            
            editableCells.forEach(cell => {
                // Store original value
                cell.addEventListener('focus', function() {
                    cell.dataset.before = cell.innerHTML;
                });

                // Handle changes
                cell.addEventListener('blur', function() {
                    if (cell.dataset.before !== cell.innerHTML) {
                        // Get the measurement type from the first cell in the row
                        const measurement = cell.parentElement.firstElementChild.textContent;
                        const newValue = cell.innerHTML;
                        
                        // Send update to server
                        fetch('update_data.php', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({
                                measurement: measurement,
                                value: newValue
                            })
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                // Update was successful
                                cell.classList.add('bg-green-100');
                                setTimeout(() => cell.classList.remove('bg-green-100'), 1000);
                            } else {
                                // Revert changes if update failed
                                cell.innerHTML = cell.dataset.before;
                                cell.classList.add('bg-red-100');
                                setTimeout(() => cell.classList.remove('bg-red-100'), 1000);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            cell.innerHTML = cell.dataset.before;
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>



<?php
footerHTML();
?>
