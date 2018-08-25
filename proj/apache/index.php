<?php

$servername = "db";
$username = getenv("MYSQL_USER");
$password = getenv("MYSQL_PASSWORD");
$dbname = getenv("MYSQL_DATABASE");
$rand_id = rand(1, 10);

$conn = new mysqli("$servername", "$username", "$password", "$dbname");
$conn->set_charset("utf8");
$result = mysqli_query($conn, "SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id WHERE table1.id=$rand_id;");

$fetch = mysqli_fetch_row($result);
echo $fetch[1], " ", $fetch[3], " - tell ", gethostname();

?>

