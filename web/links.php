<?php
define('DB_HOST'    , 'localhost');
define('DB_USER'    , 'alex'     );
define('DB_PASSWORD', 'local'    );
define('DB_NAME'    , 'common'   );

$db = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
mysqli_query($db, "
    CREATE TABLE IF NOT EXISTS `links` (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        link text NOT NULL,
        title text,
        description text,
        created DATETIME NOT NULL,
        PRIMARY KEY (id)
    );");

function getTable($db) {
    return mysqli_fetch_all(mysqli_query($db, "SELECT * FROM `links`"), MYSQLI_ASSOC);
}

function isUrl($url) {
    return filter_var($url, FILTER_VALIDATE_URL);
}

function getTitle($link) {
    $html = file_get_contents($link, false);
    preg_match_all("/<title>\s*(.*)\s*<\/title>/i", $html, $matches);
    return $matches[1][0];
} 

function delLinkById($db, $id) {
    mysqli_query($db, "DELETE FROM `links` WHERE id=$id");    
}

function addLink($db, $link, $description) {
    if (!isUrl($link)) return;
    $date = date("Y-m-d H:i:s");
    $title = getTitle($link);
    $link = mysqli_real_escape_string($db, $link);
    $title = mysqli_real_escape_string($db, $title);
    $description = mysqli_real_escape_string($db, $description);
    mysqli_query($db, "INSERT INTO `links` (link, created, title, description) 
        VALUES ('$link', '$date', '$title', '$description');");
}

if (isset($_POST['del'])) {
    delLinkById($db, intval($_POST['del']));
    header("Location: " . $_SERVER['PHP_SELF']);
    die;
}

if (isset($_POST['link']) && isset($_POST['description'])) {
    addLink($db, $_POST['link'], $_POST['description']);
    header("Location: " . $_SERVER['PHP_SELF']);
    die;
}
?>
<html lang="ru,en">
<head>
    <title> Запоминатель ссылок </title>
    <link rel="shortcut icon" href="links.php.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf8"> 
    <style type="text/css">
        table, td, th {
            border-collapse: collapse;
            border: 1px solid black;                
        }
        table {
            width: 80%;
            margin: 100px auto 10px;
            table-layout: fixed;
        }
        td, th {
            padding: 5px;
        }

        .br {
            word-break: break-all;
        }
    </style>
</head>
<body>
    <center>
        <form method="POST">
            <input type="text" name="link" placeholder="Ссылка"> <br>
            <input type="text" name="description" placeholder="Описание"><br>
            <input type="submit"><br>
        </form>
    </center>
    <form method="POST">
        <table border="1">
<?php 
$tab = getTable($db);
foreach ($tab as $index => $info) {
    $id = $info['id'];
    $date = $info['created'];
    $link = htmlentities($info['link']);
    $title = htmlentities($info['title']);
    $descr = htmlentities($info['description']);
?>
            <tr>
                <td><?=$date?></td>
                <td class="br"><a href="<?=$link?>"><?=$link?></td>
                <td><?=$title?></td>
                <td><?=$descr?></td>
                <td><button name="del" value="<?=$id?>">del</button></td>
            </tr>
<?php 
}
?>
        </table>
    </form>
</body>
</html>