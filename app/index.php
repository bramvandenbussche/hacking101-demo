<?php include('includes/database.inc.php') ?>
<html lang="en">
    <head>
        <title>Welcome to "All Secure" - A very secure blog!</title>
        <?php include('includes/head.inc.php') ?>
    </head>

    <body>
        <div class="container">

            <div class="jumbotron">
                <h1>All Secure!</h1>
                <p>A very secure blog</p>
                <p><a class="btn btn-primary btn-lg" href="https://www.infinitaslearning.com/" traget="_blank" role="button">Learn more</a></p>
            </div>
            <center>
                <h1>All Secure</h1>
                
            </center>

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
                            <img src="/assets/thumbnails/<?= $row['thumbnail'] ?>" class="card-img-top" alt="<?= $row['title'] ?>">
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
    </body>
</html>