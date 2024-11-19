<?php
header('Content-Type: application/json');

// Database connection (update these details with your actual credentials)
$host = 'localhost';
$db = 'arduino_dashboard';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch data from each table
    $wifiStatus = $pdo->query("SELECT status FROM wifi_status ORDER BY timestamp DESC LIMIT 1")->fetchColumn();
    $rcCarStatus = $pdo->query("SELECT status FROM rc_car_status ORDER BY timestamp DESC LIMIT 1")->fetchColumn();
    $distance = $pdo->query("SELECT distance_cm FROM ultrasonic_distance ORDER BY timestamp DESC LIMIT 1")->fetchColumn();
    $rpm = $pdo->query("SELECT rpm_value FROM rpm_sensor ORDER BY timestamp DESC LIMIT 1")->fetchColumn();
    $cameraFeedUrl = $pdo->query("SELECT feed_url FROM camera_feed ORDER BY timestamp DESC LIMIT 1")->fetchColumn();

    // Fetch temperature and humidity data
    $envData = $pdo->query("SELECT temperature, humidity FROM environment_data ORDER BY timestamp DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);
    $temperature = $envData['temperature'];
    $humidity = $envData['humidity'];

    // Prepare data to send to frontend
    $data = [
        "wifiStatus" => $wifiStatus,
        "rcCarStatus" => $rcCarStatus,
        "distance" => $distance,
        "rpm" => $rpm,
        "cameraFeedUrl" => $cameraFeedUrl,
        "temperature" => $temperature,
        "humidity" => $humidity
    ];

    echo json_encode($data);

} catch (PDOException $e) {
    echo json_encode(["error" => "Database connection failed: " . $e->getMessage()]);
}
?>
