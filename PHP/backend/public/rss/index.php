<?php
include("../../server/connection.php");
global $mysql;
$query = "SELECT * FROM rss ORDER BY date_time DESC";
if ($stmt = $mysql->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
    $info = $result->fetch_assoc();

    header("Content-Type: application/xml;charset=iso-8859-1");
    $url = "http://localhost/Web-Technologies/public/rss/";
    echo "<?xml version='1.0' encoding='UTF-8' ?>" . PHP_EOL;
    echo "<rss version='2.0'>";
    echo "<channel>" . PHP_EOL;
    echo "<title>News</title>" . PHP_EOL;
    echo "<link>".$url."index.php"."</link>" . PHP_EOL;
    echo "<description>JMV Courier newsletter</description>" . PHP_EOL;
    echo "<language>en-us</language>" . PHP_EOL;

    foreach ($result as $row) {
        $image_size_array = get_headers($url."images/".$row['image'], 1);
        $image_size = $image_size_array["Content-Length"];
        $date = date("D, d M Y H:i:s T", strtotime($row['date_time']));
        echo "<item xmlns:dc='ns:1'>" . PHP_EOL;
        echo "<title>".$row['title']."</title>" . PHP_EOL;
        echo "<pubDate>".$date."</pubDate>" . PHP_EOL;
        echo "<guid>".md5($row['id'])."</guid>" . PHP_EOL;
        echo "<dc:creator>".$row['author']."</dc:creator>" . PHP_EOL;
        echo "<description>".$row['description']."</description>" . PHP_EOL;
        echo "<enclosure url='images/".$row['image']."' length='".$image_size."' />" . PHP_EOL;
        echo "</item>";
    }
    echo "</channel>" . PHP_EOL;
    echo "</rss>" . PHP_EOL;
}