<?php require ("includes/database.inc.php"); ?>
<html>
    <head>
        <title>Search Galore!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>
        <div class="container">

            <?php include('includes/menu.inc.php') ?>

            <h3>The most advanced search thing in the world!</h3>

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
                echo '<table><th>Title</th><th>Article</th>';
                $results = DbSearch($db_conn, $theValue);
                while($row = $results->fetch_assoc()) {

                    echo "<tr><td>".$row['title']."</td><td>".$row['article']."</td></tr>";

                }
                echo '</table>';
            }
            ?>
        </div>
    </body>
</html>