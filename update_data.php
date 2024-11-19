<?php
header('Content-Type: application/json');

// Get the POST data
$data = json_decode(file_get_contents('php://input'), true);

// Validate the data
if (!isset($data['measurement']) || !isset($data['value'])) {
    echo json_encode(['success' => false, 'message' => 'Missing required fields']);
    exit;
}

// Here you would typically update your database
// For this example, we'll just return success
// Replace this with your actual database update logic
$success = true;

echo json_encode(['success' => $success]);
?> 