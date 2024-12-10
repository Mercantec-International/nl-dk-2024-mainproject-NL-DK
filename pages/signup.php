<?php
session_start();
include_once('../database/db_conn.php');

// Function to validate and sanitize input
function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to hash password
function hashPassword($password)
{
    return password_hash($password, PASSWORD_DEFAULT);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = test_input($_POST["username"]);
    $password = test_input($_POST["password"]);

    // Check if the username already exists
    $check_stmt = $conn->prepare("SELECT id FROM users WHERE username = ?");
    $check_stmt->bind_param("s", $username);
    $check_stmt->execute();
    $check_stmt->store_result();

    if ($check_stmt->num_rows > 0) {
        $_SESSION['error_message'] = "Brugernavn eksisterer allerede. Vælg venligst et andet.";
    } else {
        // Hash the password
        $hashedPassword = hashPassword($password);

        // Insert user data into the database
        $insert_stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
        $insert_stmt->bind_param("ss", $username, $hashedPassword);

        if ($insert_stmt->execute()) {
            $_SESSION['success_message'] = "Bruger oprettet succesfuldt!";
            $_SESSION["loggedIn"] = true;
            $_SESSION["username"] = $username;
            header("Location: ../");
        } else {
            $_SESSION['error_message'] = "Fejl: " . $insert_stmt->error;
        }

        $insert_stmt->close();
    }

    $check_stmt->close();
}

$conn->close();

include_once('../includes/header.php');
?>

<body class="bg-blue-500">

    <div class="max-w-md w-full mx-auto p-8 bg-white rounded-lg shadow-md mt-10">
        <h1 class="text-2xl font-semibold mb-6 text-center text-gray-800">Sign Up</h1>

        <?php
        // Display success or error messages
        if (isset($_SESSION['success_message'])) {
            echo '<p class="text-green-500 text-center mb-4">' . $_SESSION['success_message'] . '</p>';
            unset($_SESSION['success_message']);
        } elseif (isset($_SESSION['error_message'])) {
            echo '<p class="text-red-500 text-center mb-4">' . $_SESSION['error_message'] . '</p>';
            unset($_SESSION['error_message']);
        }
        ?>

        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-600">Username</label>
                <input type="text" id="username" name="username" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div>
                <label for="password" class="block text-sm font-medium text-gray-600">Password</label>
                <input type="password" id="password" name="password" class="mt-1 p-2 w-full border rounded-md">
            </div>
            <div>
                <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-md hover:bg-blue-600 focus:outline-none focus:shadow-outline-blue">
                    Sign Up
                </button>
            </div>
        </form>
    </div>

</body>