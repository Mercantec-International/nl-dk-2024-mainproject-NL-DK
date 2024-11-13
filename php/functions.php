<?php

function headerHTML($title = "Default")
{
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title><?php echo $title; ?> | Project Apollo</title>

        <!-- Bootstrap and styling -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/css.css">

        <!-- Icon -->
        <link rel="apple-touch-icon" sizes="180x180" href="media/images/Logo_project_apollo.png">
        <link rel="icon" type="image/png" sizes="32x32" href="media/images/Logo_project_apollo.png">
        <link rel="icon" type="image/png" sizes="16x16" href="media/images/Logo_project_apollo.png">

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body>
        <nav class="bg-gray-700">
            <div class="container mx-auto flex items-center justify-between px-4 py-3">
                <a href="index.php" class="flex items-center text-white space-x-2">
                    <img src="media/images/Logo_project_apollo.png" alt="Logo" class="h-8">
                    <span class="text-xl font-semibold">Project Apollo</span>
                </a>
                <!-- Mobile Menu Button -->
                <button class="sm:hidden text-gray-400 hover:text-white focus:outline-none" type="button" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
                <!-- Navbar Links -->
                <div class="hidden sm:flex sm:items-center" id="navbarNav">
                    <ul class="flex space-x-4">
                        <li>
                            <a href="aboutus.php" class="px-3 py-2 rounded <?php echo basename($_SERVER['PHP_SELF']) == 'aboutus.php' ? 'bg-indigo-600 text-white' : 'text-gray-300 hover:text-white'; ?>">About Us</a>
                        </li>
                        <li>
                            <a href="project.php" class="px-3 py-2 rounded <?php echo basename($_SERVER['PHP_SELF']) == 'project.php' ? 'bg-indigo-600 text-white' : 'text-gray-300 hover:text-white'; ?>">Project</a>
                        </li>
                        <li>
                            <a href="data.php" class="px-3 py-2 rounded <?php echo basename($_SERVER['PHP_SELF']) == 'data.php' ? 'bg-indigo-600 text-white' : 'text-gray-300 hover:text-white'; ?>">Data</a>
                        </li>
                        <li>
                            <a href="comparison.php" class="px-3 py-2 rounded <?php echo basename($_SERVER['PHP_SELF']) == 'comparison.php' ? 'bg-indigo-600 text-white' : 'text-gray-300 hover:text-white'; ?>">Comparison</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    <?php
}

function footerHTML()
{
    ?>
        <footer>
            <p>&copy; <?php echo date("Y"); ?> Rocket League - Project Apollo. All rights reserved.</p>
            <a href="#" class="back-to-top">Back to Top</a>
        </footer>
    </body>

    </html>
<?php
}

?>