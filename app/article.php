<?php include('includes/database.inc.php') ?>
<html lang="en">
    <head>
        <title>Welcome to "All Secure" - A very secure blog!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>
        <div class="container">

        <?php include('includes/menu.inc.php') ?>

        <?php

            $sql = "SELECT id, title, excerpt, article, thumbnail FROM articles WHERE id = ?;";
            $stmt = $db_conn->prepare($sql);
            $stmt->bind_param("i", $article);

            // set parameters and execute
            $input = $_GET["id"];
            $article = intval($input);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
            ?>
                <!-- <div style="height: 150px;">
                    <img src="/assets/thumbnails/<?= $row['thumbnail'] ?>" alt="<?= $row['title'] ?>" />
                </div> -->

                <div class="jumbotron">
                    <div style="float: left; margin-right: 50px;">
                        <img src="/assets/thumbnails/<?= $row['thumbnail'] ?>" alt="<?= $row['title'] ?>" height="150" />
                    </div>
                    <h1 class="display-4"><?= $row['title'] ?></h1>
                    <p class="lead"><?= $row['excerpt'] ?></p>                    
                </div>
                <article>
                    <?= $row['article'] ?>            
                </article>
            <?php
                    }
                }
        ?>

        </div>
    </body>
</html>