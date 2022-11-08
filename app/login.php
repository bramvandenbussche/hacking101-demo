<?php require ("includes/database.inc.php");

if (isset($_POST['username'])) {
    $myQuery = "SELECT * FROM users WHERE username=? AND password=?;";
    $hashyPasswordy= md5($_POST['password']);
    $nothashyUsername = $_POST['username'];

    $qry = $db_conn->prepare($myQuery);
    $qry->bind_param("ss", $nothashyUsername, $hashyPasswordy);
    $qry->execute();
    $result = $qry->get_result();

    if ($result->num_rows > 0) {
        // output data of each row
        $user = $result->fetch_assoc();
        setcookie("user_id", $user['id']);
        setcookie("user_description", $user['description']);
        setcookie("user_username", $user['username']);
        setcookie("user_password", $user['password']);
        setcookie("user_isAdmin", $user['isAdmin']);

    } else {
        echo '<h1>WRONG LOGIN!!!! You HAX0R!</h1>';
    }
}
?>
<html>
<head>
    <title>Login</title>
    <?php include('includes/head.inc.php') ?>
</head>

<body>
    <div class="container">

        <?php include('includes/menu.inc.php') ?>


    <?php if (!isset($_COOKIE["user_id"])) { // user not logged in ?>
        <h3>Get in!</h3>
        <form method="post">
            <table>
                <tr><td>Username: </td><td><input type="text" name="username" value="<?= $_POST['username']; ?>" /></td></tr>
                <tr><td>Password: </td><td><input type="password" name="password" value="<?= $_POST['password']; ?>" /></td></tr>
            </table>
            <input type="submit" value="Log In!">
        </form>
    <?php } else { // User logged in ?>

        <h3>Welcome <?=$_COOKIE["user_description"] ?></h3>
        <?php if ($_COOKIE["user_isAdmin"] == "1") { // check if user is admin ?>
            <div class="alert alert-success">
                <h4 class="alert-heading">You made it to admin! Hooray!</h4>
                <p>You can gloat about it with using this token:</p>
                <p><strong>H101{<?php
                    $date = date(DATE_ATOM);
                    $token = base64_encode("$date|".md5($date));
                    echo $token;
                    ?>}</strong></p>

                <p>
                    You can send your token to <a href="https://infinitas-chat.slack.com/archives/C049X61U4S1" target="_blank">#ilpt-jamboree-hacking-101</a> to get eternal bragging rights.
                </p>
                <p>
                    <img src="/assets/img/eternal-glory.jpg" class="img-fluid" />
                </p>
            </div>
        <?php } else { // regular user ?>
            <!-- Welcome esteemed guest, Please do not tamper with cookies to get to admin! -->
            <p>You are not admin, so there is not that much too see here.</p>
            <p>Did you know that the cookie monster made its first appearance in 1966? We all love Cookies!</p>
            <p>
                <img src="/assets/img/cookiemonster.jfif" class="img-fluid" />
            </p>
        <?php } ?>
    <?php } ?>
    </div>

    <?php include('includes/footer.inc.php') ?>
</body>
</html>