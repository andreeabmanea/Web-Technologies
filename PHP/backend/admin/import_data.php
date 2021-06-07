<?php
include("../server/connection.php");
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
                              window.location = \"index.php\"
                          </script>";
            }else{
                echo "<script type=\"text/javascript\">
                              alert(\"CSV File has been successfully Imported.\");
                              window.location = \"index.php\"
                          </script>";
            }
        }
        fclose($file);
    }
}

if (isset($_POST['import-orders'])) {

    $fileNameOrders = $_FILES["file"]["tmp_name"];


    if ($_FILES['file']['size'] > 0) {

        $fileOrders = fopen($fileNameOrders, "r");

        while (($importData = fgetcsv($fileOrders, 100000000, ",")) !== FALSE) {

            $name = "";
            if (isset($importData[1])) {
                $name = mysqli_real_escape_string($mysql, $importData[1]);
            }
            $phone_number = "";
            if (isset($importData[2])) {
                $phone_number = mysqli_real_escape_string($mysql, $importData[2]);
            }
            $address = "";
            if (isset($importData[3])) {
                $address = mysqli_real_escape_string($mysql, $importData[3]);
            }
            $weight = "";
            if (isset($importData[4])) {
                $weight = mysqli_real_escape_string($mysql, $importData[4]);
            }
            $content = "";
            if (isset($importData[5])) {
                $content = mysqli_real_escape_string($mysql, $importData[5]);
            }
            $type = "";
            if (isset($importData[6])) {
                $type = mysqli_real_escape_string($mysql, $importData[6]);
            }
            $payment = "";
            if (isset($importData[7])) {
                $payment = mysqli_real_escape_string($mysql, $importData[7]);
            }
            $amount = "";
            if (isset($importData[8])) {
                $amount = mysqli_real_escape_string($mysql, $importData[8]);
            }
            $area = "";
            if (isset($importData[9])) {
                $area = mysqli_real_escape_string($mysql, $importData[9]);
            }
            $status = "";
            if (isset($importData[10])) {
                $status = mysqli_real_escape_string($mysql, $importData[10]);
            }
            $date = "";
            if (isset($importData[11])) {
                $date = mysqli_real_escape_string($mysql, $importData[11]);
            }
            $hour = "";
            if (isset($importData[12])) {
                $hour = mysqli_real_escape_string($mysql, $importData[12]);
            }
            $awb = "";
            if (isset($importData[13])) {
                $awb = mysqli_real_escape_string($mysql, $importData[13]);
            }
            $id_client = "";
            if (isset($importData[14])) {
                $id_client = mysqli_real_escape_string($mysql, $importData[14]);
            }
            $queryOrders = "INSERT INTO `orders` (`name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
          //  $queryOrders = "INSERT INTO `orders` (`id`, `name`, `phone_number`, `address`, `weight`, `content`, `standard/express`, `cash/account_reimbursement`, `amount`, `area`, `status`, `delivery_date`, `delivery_hour`, `AWB`, `id_client`) VALUES (NULL, '.$name.','.$phone_number.','.$address.','.$weight.','".$content."','".$type."','".$payment."','".$amount."','".$date."',".$hour."','".$awb."','".$id_client."')";

            if ($stmt = $mysql->prepare($queryOrders)) {
                $stmt->bind_param('ssssssssssssss', $name, $phone_number, $address, $weight, $content, $type, $payment, $amount, $area, $status, $date, $hour, $awb, $id_client);
                $stmt->execute();
                echo "<script type=\"text/javascript\">
                              alert(\"CSV File has been successfully Imported.\");
                              window.location = \"index.php\"
                          </script>";
            }
        }
        fclose($fileOrders);
}
}
