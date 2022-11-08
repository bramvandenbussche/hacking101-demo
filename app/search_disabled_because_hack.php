<?php require ("includes/database.inc.php"); ?>
<html>
    <head>
        <title>Search Galore!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>
        <div class="container">

            <?php include('includes/menu.inc.php') ?>

            <h1>The most advanced search thing in the world!</h1>

            <form method="get">
            <?php
            $theValue = "Search Me!";
            if (isset($_GET['search'])) {
                $theValue = $_GET['search'];
            }
            ?>

                <input type="text" name="search" value="<?= $theValue; ?>" />
                <input type="submit" value="Find it!">
            </form>

            <?php
            if (isset($_GET['search'])) {

                $keyword = $_GET['search'];
                $query = "SELECT id, title, excerpt FROM articles WHERE id > 0 AND article LIKE '%$keyword%'";
                $results = $db_conn->query($query);

                echo '<p>[DEBUG] Executing query: <pre><code>' . $query . '</code></pre></p>';

                if ($results == false) {
                    echo '<div class="alert alert-danger"><h4 class="alert-heading">[DEBUG] Database did a booboo!</h4>' . mysqli_error($db_conn) . '</div>';
                } else {

                    echo '<h2>Search results</h2>';
                    echo '<table class="table table-striped"><th>Title</th><th>Excerpt</th>';
                    while ($row = $results->fetch_assoc()) {

                        echo "<tr><td width='25%'><a href='/article.php?id=" . $row['id'] . "'>" . $row['title'] . "</a></td><td>" . $row['excerpt'] . "</td></tr>";

                    }
                    echo '</table>';
                }
            }
            ?>
        </div>
    </body>
</html>