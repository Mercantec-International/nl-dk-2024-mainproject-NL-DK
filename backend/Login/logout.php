<?php
session_start();
header("Cache-Control: no-cache, must-revalidate");

// Unset all of the session variables
$_SESSION = array();

// Destroy the session.
session_destroy();

// Redirect to the login page
header("Location: ../../");
exit;
