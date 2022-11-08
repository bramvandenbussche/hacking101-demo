<?php include('includes/database.inc.php') ?>
<html lang="en">
    <head>
        <title>Welcome to "All Secure" - A very secure blog!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>
        <!-- TODO: We need to add a link to login.php somewhere -->
        <div class="container">

        <?php include('includes/menu.inc.php') ?>

            <div class="jumbotron">
                <h1>All Secure!</h1>
                <p>A very secure blog</p>
                <p><a class="btn btn-primary btn-lg" href="https://www.infinitaslearning.com/" traget="_blank" role="button">Learn more</a></p>
            </div>

            <div class="row">
                <h2>Recent articles</h2>
            </div>

            <div class="row">                
                <?php
                    // Get articles and print them
                    $sql = "SELECT id, title, excerpt, thumbnail FROM articles WHERE id > 0";
                    
                    $result = $db_conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                        // output data of each row
                        while($row = $result->fetch_assoc()) {
                ?>
                    <div class="col-sm-4">
                        <div class="card" style="width: 18rem;">
                            <a href="/article.php?id=<?= $row['id'] ?>">
                                <img src="/assets/thumbnails/<?= $row['thumbnail'] ?>" class="card-img-top" alt="<?= $row['title'] ?>">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><?= $row['title'] ?></h5>
                                <p class="card-text"><?= $row['excerpt'] ?></p>
                                <a href="/article.php?id=<?= $row['id'] ?>">Read more</a>
                            </div>
                        </div>
                    </div>
                <?php
                        }
                    }
                ?>
            </div>
        </div>

        <?php include('includes/footer.inc.php') ?>
    </body>
</html>