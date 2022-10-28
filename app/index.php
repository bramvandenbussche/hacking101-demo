<?php include('includes/database.inc.php') ?>
<html lang="en">
    <head>
        <title>Welcome to "All Secure" - A very secure blog!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>

        <center>
            <h1>All Secure</h1>
            <small>A very secure blog</small>
        </center>

        <section>
            <?php
                // Get articles and print them
                $sql = "SELECT id, title, thumbnail FROM articles WHERE id > 0";
                
                $result = $db_conn->query($sql);
                
                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
            ?>
                <article>
                    <h1><?= $row['title'] ?></h1>
                    <img src="/assets/thumbnails/<?= $row['thumbnail'] ?>" alt="" width="200" />
                </article>
            <?php
                    }
                }
            ?>
        </section>
    </body>
</html>