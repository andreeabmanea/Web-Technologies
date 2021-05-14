<?php
include("server.php");
global $mysql;
if (isset($_POST['import'])) {

    $fileName = $_FILES["file"]["tmp_name"];

    if ($_FILES['file']['size'] > 0) {

        $file = fopen($fileName, "r");

        while (($importData = fgetcsv($file, 10000, ",")) !== FALSE) {

            $username = "";
            if (isset($importData[0])) {
                $username = mysqli_real_escape_string($mysql, $importData[0]);
            }
            $last_name = "";
            if (isset($importData[1])) {
                $last_name = mysqli_real_escape_string($mysql, $importData[1]);
            }
            $first_name = "";
            if (isset($importData[2])) {
                $first_name = mysqli_real_escape_string($mysql, $importData[2]);
            }
            $email = "";
            if (isset($importData[3])) {
                $email = mysqli_real_escape_string($mysql, $importData[3]);
            }
            $password = "";
            if (isset($importData[4])) {
                $password = mysqli_real_escape_string($mysql, $importData[4]);
            }
            $role = "";
            if (isset($importData[5])) {
                $password = mysqli_real_escape_string($mysql, $importData[5]);
            }
            $phone_number = "";
            if (isset($importData[6])) {
                $password = mysqli_real_escape_string($mysql, $importData[6]);
            }
            $cnp = "";
            if (isset($importData[7])) {
                $cnp = mysqli_real_escape_string($mysql, $importData[7]);
            }

            $query = "INSERT INTO users (username, last_name, first_name, email, password, role, phone_number, cnp) 
                VALUES('".$username."','".$last_name."','".$first_name."','".$email."','".$password."','".$role."','".$phone_number."','".$cnp."')";

            $result = mysqli_query($mysql, $query);

            if (!isset($result)) {
                echo "<script type=\"text/javascript\">
                              alert(\"Invalid File:Please Upload CSV File.\");
                              window.location = \"../admin/index.php\"
                          </script>";
            }else{
                echo "<script type=\"text/javascript\">
                              alert(\"CSV File has been successfully Imported.\");
                              window.location = \"../admin/index.php\"
                          </script>";
            }
        }
        fclose($file);
    }
}
