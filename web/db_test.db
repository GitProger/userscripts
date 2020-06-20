<?php
    $ok = (
    	isset($_COOKIE["user"]) &&
        isset($_COOKIE["passwd"]) &&
        isset($_COOKIE["db"])
    );

    if (!$ok) {
        if (
            isset($_GET["user"]) &&
            isset($_GET["passwd"]) &&
            isset($_GET["db"])
        ) {
            $t = time() + 3600 * 24; // day
            setcookie("user"  , $_GET["user"  ], $t);
            setcookie("passwd", $_GET["passwd"], $t);
            setcookie("db"    , $_GET["db"    ], $t);
            $ok = true;
        }
    }
?>
<html>
    <head>
        <title> Test MySQL </title>
    </head>
    <body>
        <?php if ($ok): ?>
            <form>
                <textarea name="q" cols=50 rows=10
                    placeholder="MySQL query..."></textarea>
                <br>
                <input type="submit">
            </form>
            <?php if (isset($_GET["q"])): ?>
                <hr> Your query: <br>
                <pre>
<?php echo htmlentities($_GET["q"]); ?> 
                </pre>        
                <hr> Query result: <br>
                <pre>
<?php
                        $db = mysqli_connect("localhost", 
                            $_COOKIE["user"],
                            $_COOKIE["passwd"],
                            $_COOKIE["db"]
                        );
                        $res = mysqli_query($db, $_GET["q"]);
                        if ($res)
                            var_dump(mysqli_fetch_all($res, MYSQLI_ASSOC));
                    ?>
                </pre>
            <?php endif; ?>
        <?php else: ?>
            <form>
                <input name="user"   placeholder="Username..."> <br>
                <input name="passwd" placeholder="Password..."> <br>
                <input name="db"     placeholder="Database name..."> <br>
                <input type="submit">
            </form>        
        <?php endif; ?>
    </body>
</html>
