<?php
$t = time();
$rise = "";
$set = "";
$dur = "";
if (isset($_GET["la"]) && isset($_GET["lo"])) {
    $la = floatval($_GET["la"]);
    $lo = floatval($_GET["lo"]);
    $rise = date_sunrise($t, SUNFUNCS_RET_STRING, $la, $lo);
    $set = date_sunset($t, SUNFUNCS_RET_STRING, $la, $lo);

    $x = abs(strtotime($set) - strtotime($rise));
    $dur = floor($x / 3600) . ":" . floor(($x % 3600) / 60);
}
?>
<html lang="ru">
    <head>
        <title>Восход и заход солнца сегодня</title>
        <link rel="shortcut icon" href="sun.php.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf8"> 
        <style>
            body {
                background: black;
                color: white;
                font-family: sans-serif;
            }
            table, td, th {
                border-collapse: collapse;
                border: 1px solid white;                
            }
            table {
                margin: 100px auto 10px;
            }
            td, th {
                padding: 10px;
                font-size: 20px;
                text-align: center;
            }
            button {
                font-size: 20px;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid white;
                background-color: black;
                color: white;
            }
        </style>
        <script type="text/javascript">
            var params = new URLSearchParams(window.location.search);
            if (params.get("lo") === null || params.get("la") === null) {
                navigator.geolocation.getCurrentPosition(function (data) { 
                    var la = data.coords.latitude;
                    var lo = data.coords.longitude;
                    var url = new URL(window.location);
                    url.searchParams.append("la", la);
                    url.searchParams.append("lo", lo);
                    window.location = url;
                });
            }
            
            function weatherToggle() {
                var u = new URL(window.location);
                if (u.searchParams.get("w") === null)
                    u.searchParams.append("w", "1");
                else 
                    u.searchParams.delete("w");
                window.location = u;
            }


            function date() {
                var d = new Date();
                return d.getDate() + "." + (d.getMonth() + 1);
            }

            setInterval(function () {
                if (localStorage.getItem("t") !== date()) {
                    localStorage.setItem("t", date());
                    window.location.reload();
                }
            }, 60 * 1000);
        </script>
    </head>
    <body>
        <table border>
            <tr>
                <td>Восход</td>
                <td>Заход</td>
                <td>Длительность дня</td>
            </tr>
            <tr>
                <td><?=$rise?></td>
                <td><?=$set?></td>
                <td><?=$dur?></td>
            </tr>
        </table>

        <hr>
        <center>
            <button onclick="weatherToggle()">Погода</button><br>
<?php if (isset($_GET['w'])): ?>
            <iframe width="50%" height="65%"
                src="https://wttr.in/%D0%A1%D0%B0%D0%BD%D0%BA%D1%82-%D0%9F%D0%B5%D1%82%D0%B5%D1%80%D0%B1%D1%83%D1%80%D0%B3?M">
            </iframe>
<?php endif; ?>
        </center>
    </body>
</html>