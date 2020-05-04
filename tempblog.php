<!DOCTYPE HTML>
<html>
    <head>
        <title> Chat </title>
    </head>
    <body>
        <?php
            $b = file_get_contents("blg.txt");
            $q = $_GET["q"];
            if (isset($q))
                $b .= $q . "<hr>";
            file_put_contents("blg.txt", $b);
            echo $b;

            if (isset($_GET["admin"])) {
                echo "<form>";
                echo     "<textarea name=q></textarea> <br>";
                echo     "<input type=submit>";
                echo "</form>";
            }
        ?>
    </body>
</html>
