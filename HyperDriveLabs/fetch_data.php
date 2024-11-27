<?php
header('Content-Type: application/json');

// API Base URL
$apiBase = 'https://hyperdrivelabs.onrender.com/api/';

// Database connection (update with your actual credentials)
$dbHost = 'localhost';
$dbName = 'arduino_dashboard';
$dbUser = 'postgres';
$dbPass = 'meow';

try {
    $pdo = new PDO("pgsql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(["error" => "Database connection failed: " . $e->getMessage()]);
    exit;
}

// Function to make API calls
function callApi($endpoint) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $endpoint);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json'
    ]);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        return ['error' => curl_error($ch)];
    }

    curl_close($ch);

    // Decode the JSON response
    return json_decode($response, true);
}

// Fetch data from the API
$cars = callApi($apiBase . 'Cars');

// If the API fails or returns no data, use cached data from PostgreSQL
if (!$cars || isset($cars['error']) || empty($cars)) {
    $stmt = $pdo->query("SELECT * FROM cars ORDER BY created_at DESC");
    $cachedCars = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $cars = array_map(function ($car) {
        return [
            'id' => $car['car_id'],
            'createdAt' => $car['created_at'],
            'lastEmergency' => $car['last_emergency']
        ];
    }, $cachedCars);
} else {
    // Save the API data to the PostgreSQL database
    $stmt = $pdo->prepare("INSERT INTO cars (car_id, created_at, last_emergency) VALUES (:id, :createdAt, :lastEmergency)
                           ON CONFLICT (car_id) DO UPDATE 
                           SET created_at = EXCLUDED.created_at, last_emergency = EXCLUDED.last_emergency");
    foreach ($cars as $car) {
        $stmt->execute([
            ':id' => $car['id'],
            ':createdAt' => $car['createdAt'],
            ':lastEmergency' => $car['lastEmergency']
        ]);
    }
}

// Prepare the data for the frontend
$data = [
    'cars' => $cars
];

// Return JSON response
echo json_encode($data);
?>
