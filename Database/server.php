<?php
    $mysql = mysqli_connect(
        'localhost',
        'root',
        '',
        'jmv_pass'
    );
    if (mysqli_connect_errno()) {
        die('Connection failed');
    }

    session_start();
    $username = "";
    $email = "";
    $_SESSION['success'] = "";
    $errors = array();

    if (isset($_POST['login'])) {
        $username = mysqli_real_escape_string($mysql, $_POST['username']);
        $password = mysqli_real_escape_string($mysql, $_POST['password']);

        if (empty($username)) {
            array_push($errors, "Please enter your username");
        }
        if (empty($password)) {
            array_push($errors, "Please enter your password");
        }

        if (count($errors) == 0) {
            if ($stmt = $mysql->prepare("SELECT role FROM `users` WHERE username=? and password=?")) {
                $stmt->bind_param('ss', $username, $password);
                $stmt->execute();
                $stmt->store_result();
                if ($stmt->num_rows == 1) {
                    $_SESSION['username'] = $username;
                    $_SESSION['success'] = "You have logged in";
                    $stmt->bind_result($role);
                    $stmt->fetch();
                    switch ($role) {
                        case 'admin':
                            header('Location: ../admin/index.php');
                            exit();
                        case 'courier':
                            header('Location: ../courier/index.php');
                            exit();
                        case 'client':
                            header('Location: ../client/index.php');
                            exit();
                        case 'operator':
                            header('Location: ../operator/index.php');
                            exit();
                        default:
                            echo 'Wrong';

                    }
                }
                $stmt->close();
            }
        }
    }

function display_courier_schedule($username)
{
    global $mysql;
    $query = "select name, address, phone_number from orders where area in (select area from areas join users on id_courier = id where username = ?) and delivery_date = CURRENT_DATE();";
    if ($stmt = $mysql->prepare($query)) {
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $stmt->bind_result($name, $address, $number);
    }
    echo '<table id="courier-schedule">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Contact Number</th>
                <th>Delivery Number</th>
                <th>Anything to pay?</th>
            </tr>';
    while ($stmt->fetch()) {
        echo '<tr>';
        echo '<td>' . $name . '</td>';
        echo '<td>' . $address .'</td>';
        echo '<td>' . $number .'</td>';
        echo '<td>' . 'TBA' . '</td>';
        echo '<td>' . 'TBA' . '</td>';
        //TODO: awb and payment from db
        echo '</tr>';
    }

}

