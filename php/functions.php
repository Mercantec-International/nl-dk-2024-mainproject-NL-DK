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
        <link rel="stylesheet" href="css/style.css">

        <!-- Icon -->
        <link rel="apple-touch-icon" sizes="180x180" href="media/images/Logo_project_apollo.png">
        <link rel="icon" type="image/png" sizes="32x32" href="media/images/Logo_project_apollo.png">
        <link rel="icon" type="image/png" sizes="16x16" href="media/images/Logo_project_apollo.png">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center nav-link" href="index.php">
                    <img src="media/images/Logo_project_apollo.png" alt="Logo">
                    Project Apollo
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'aboutus.php' ? 'active' : ''; ?>" href="aboutus.php">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'project.php' ? 'active' : ''; ?>" href="project.php">Project</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'data.php' ? 'active' : ''; ?>" href="data.php">Data</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'comparison.php' ? 'active' : ''; ?>" href="comparison.php">Comparison</a>
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
    </body>
    </html>
    <?php
}

?>