<?php
include('functions.php');
$conn = db_connect();

$launchNumber = intval($_GET['launchNumber']);
$response = ['success' => false];

if ($launchNumber) {
    // Fetch launchId
    $launchQuery = "SELECT id FROM launchmeasurements WHERE launchNumber = $launchNumber";
    $launchResult = $conn->query($launchQuery);

    if ($launchResult && $launchRow = $launchResult->fetch_assoc()) {
        $launchId = $launchRow['id'];

        $response['success'] = true;
        $response['tables'] = [];
        $response['graphs'] = [];

        // Fetch Data from Each Table
        $tables = ['bme280', 'gygps6mv2', 'hy521'];
        foreach ($tables as $table) {
            $dataQuery = "SELECT * FROM $table WHERE launchId = $launchId";
            $dataResult = $conn->query($dataQuery);

            $tableData = [];
            while ($row = $dataResult->fetch_assoc()) {
                $tableData[] = $row;
            }
            $response['tables'][$table] = $tableData;
        }

        // Prepare Graph Data (e.g., Temperature, Pressure)
        $graphQuery = "SELECT temperature, pressure, approxAltitude FROM bme280 WHERE launchId = $launchId";
        $graphResult = $conn->query($graphQuery);

        $temperature = [];
        $pressure = [];
        $altitude = [];
        $timestamps = [];

        while ($row = $graphResult->fetch_assoc()) {
            $temperature[] = $row['temperature'];
            $pressure[] = $row['pressure'];
            $altitude[] = $row['approxAltitude'];
            $timestamps[] = count($timestamps) + 1; // Simulating timestamps
        }

        if (!empty($temperature)) {
            $response['graphs']['Environmental Data'] = [
                'id' => 'environmentGraph',
                'labels' => $timestamps,
                'datasets' => [
                    [
                        'label' => 'Temperature (°C)',
                        'data' => $temperature,
                        'borderColor' => 'red',
                        'backgroundColor' => 'rgba(255, 0, 0, 0.2)',
                    ],
                    [
                        'label' => 'Pressure (hPa)',
                        'data' => $pressure,
                        'borderColor' => 'blue',
                        'backgroundColor' => 'rgba(0, 0, 255, 0.2)',
                    ],
                    [
                        'label' => 'Approx. Altitude (m)',
                        'data' => $altitude,
                        'borderColor' => 'green',
                        'backgroundColor' => 'rgba(0, 255, 0, 0.2)',
                    ]
                ]
            ];
        }
    }
}

echo json_encode($response);
?>
