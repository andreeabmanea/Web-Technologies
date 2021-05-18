<?php
include("server.php");
global $mysql;
if (isset($_POST['import-users'])) {

    $fileName = $_FILES["file"]["tmp_name"];

    if ($_FILES['file']['size'] > 0) {

        $file = fopen($fileName, "r");

        while (($importDataUser = fgetcsv($file, 1000000, ",")) !== FALSE) {

            $username = "";
            if (isset($importDataUser[0])) {
                $username = mysqli_real_escape_string($mysql, $importDataUser[0]);
            }
            $last_name = "";
            if (isset($importDataUser[1])) {
                $last_name = mysqli_real_escape_string($mysql, $importDataUser[1]);
            }
            $first_name = "";
            if (isset($importDataUser[2])) {
                $first_name = mysqli_real_escape_string($mysql, $importDataUser[2]);
            }
            $email = "";
            if (isset($importDataUser[3])) {
                $email = mysqli_real_escape_string($mysql, $importDataUser[3]);
            }
            $password = "";
            if (isset($importDataUser[4])) {
                $password = mysqli_real_escape_string($mysql, $importDataUser[4]);
            }
            $role = "";
            if (isset($importDataUser[5])) {
                $password = mysqli_real_escape_string($mysql, $importDataUser[5]);
            }
            $phone_number = "";
            if (isset($importDataUser[6])) {
                $password = mysqli_real_escape_string($mysql, $importDataUser[6]);
            }
            $cnp = "";
            if (isset($importDataUser[7])) {
                $cnp = mysqli_real_escape_string($mysql, $importDataUser[7]);
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

if (isset($_POST['import-orders'])) {

    $fileName = $_FILES["file"]["tmp_name"];


    if ($_FILES['file']['size'] > 0) {

        $file = fopen($fileName, "r");

        while (($importData = fgetcsv($file, 100000000, ",")) !== FALSE) {

            $name = "";
            if (isset($importData[0])) {
                $name = mysqli_real_escape_string($mysql, $importData[0]);
            }
            $phone_number = "";
            if (isset($importData[1])) {
                $phone_number = mysqli_real_escape_string($mysql, $importData[1]);
            }
            $address = "";
            if (isset($importData[2])) {
                $address = mysqli_real_escape_string($mysql, $importData[2]);
            }
            $weight = "";
            if (isset($importData[3])) {
                $weight = mysqli_real_escape_string($mysql, $importData[3]);
            }
            $content = "";
            if (isset($importData[4])) {
                $content = mysqli_real_escape_string($mysql, $importData[4]);
            }
            $type = "";
            if (isset($importData[5])) {
                $type = mysqli_real_escape_string($mysql, $importData[5]);
            }
            $payment = "";
            if (isset($importData[6])) {
                $payment = mysqli_real_escape_string($mysql, $importData[6]);
            }
            $amount = "";
            if (isset($importData[7])) {
                $amount = mysqli_real_escape_string($mysql, $importData[7]);
            }
            $area = "";
            if (isset($importData[8])) {
                $area = mysqli_real_escape_string($mysql, $importData[8]);
            }
            $status = "";
            if (isset($importData[9])) {
                $status = mysqli_real_escape_string($mysql, $importData[9]);
            }
            $date = "";
            if (isset($importData[10])) {
                $date = mysqli_real_escape_string($mysql, $importData[10]);
            }
            $hour = "";
            if (isset($importData[11])) {
                $hour = mysqli_real_escape_string($mysql, $importData[11]);
            }
            $awb = "";
            if (isset($importData[12])) {
                $awb = mysqli_real_escape_string($mysql, $importData[12]);
            }
            $id_client = "";
            if (isset($importData[13])) {
                $id_client = mysqli_real_escape_string($mysql, $importData[13]);
            }

            $query = "INSERT INTO `orders` VALUES ('', ".$name."','".$phone_number."','".$address."','".$weight."','".$content."','".$type."','".$payment."','".$amount."','".$date."',".$hour."','".$awb."','".$id_client."')";

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
