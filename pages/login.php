<?php
session_start();
include_once('../database/db_conn.php');
// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the username and password from the form data
    $username = $_POST['username'];
    $password = $_POST['password'];
    // Prepare a SQL statement to retrieve the user's data
    $stmt = $conn->prepare("SELECT id, password FROM users WHERE BINARY username = ?");
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();
    // Check if the user exists in the users table
    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();
        $stored_password = $row['password'];
        // Verify the password using password_verify
        if (password_verify($password, $stored_password)) {
            $_SESSION["loggedIn"] = true;
            $_SESSION["username"] = $username;
            header('Location: ../');
            exit;
        } else {
            $password_error = 'Forkert adgangskode';
        }
    } else {
        // User does not exist in the users table, so display an error message
        $username_error = 'Forkert brugernavn eller adgangskode';
    }
    // Close the database connection
    $stmt->close();
    $conn->close();
}
include_once('../includes/header.php');
?>

<body class="bg-blue-500">
    <div class="max-w-md w-full mx-auto mt-20">
        <div class="p-8 rounded-lg bg-blue-500">
            <h1 class="text-2xl font-semibold mb-6 text-white/90">Apollo Crew login</h1>
            <form method="post">
                <div class="mb-4">
                    <label class="block text-white/90 font-bold mb-2" for="username">Username</label>
                    <input class="<?php echo isset($username_error) ? 'borderred-500' : 'border-gray-400' ?> appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                        id="username" name="username" type="text" placeholder="Username" value="<?php echo isset($_POST['username']) ? $_POST['username'] : '' ?>">
                    <?php if (isset($username_error)) : ?>
                        <p class="text-red-500 text-xs italic"><?php echo $username_error ?></p>
                    <?php endif; ?>
                </div>
                <div class="mb-6 relative">
                    <label class="block text-white/90 font-bold mb-2 flex-justify-between items-center" for="password">
                        <span>Password</span>
                        <span class="text-white/70 text-sm pr-3 toggle-password cursor-pointer">
                            <i class="far fa-eye-slash"></i>
                        </span>
                    </label>
                    <input class="appearance-none border <?php echo isset($password_error) ? 'border-red-500' : 'border-gray-400' ?> rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadowoutline" id="password" name="password" type="password" placeholder="Password"
                        value="<?php echo isset($_POST['password']) ? $_POST['password'] : '' ?>">
                    <?php if (isset($password_error)) : ?>
                        <p class="text-red-500 text-xs italic"><?php echo $password_error ?></p>
                    <?php endif; ?>
                </div>
                <div class="flex items-center justify-between">
                    <button class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">Login</button>
                    <a href="signup.php" class="text-white/80 text-sm">Sign Up</a>
                </div>
            </form>
        </div>
    </div>
    <script>
        const togglePassword = document.querySelector('.toggle-password');
        const passwordInput = document.querySelector('#password');
        togglePassword.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ?
                'text' : 'password';
            passwordInput.setAttribute('type', type);
            if (type === 'password') {
                togglePassword.innerHTML = '<i class="far fa-eye-slash"></i>';
            } else {
                togglePassword.innerHTML = '<i class="far fa-eye"></i>';
            }
        });
    </script>
</body