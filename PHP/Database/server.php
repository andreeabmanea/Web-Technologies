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
            $query = "select name, address, phone_number, awb, amount from orders where area in (select area from areas join users on id_courier = id where username = ?) and status!='arrived' and delivery_date = CURRENT_DATE();";
            if ($stmt = $mysql->prepare($query)) {
                $stmt->bind_param('s', $username);
                $stmt->execute();
                $stmt->bind_result($name, $address, $number, $awb, $amount);
            }
            echo
            '<tr>
                <th style = "padding:10px">Name</th>
                <th style = "padding:10px">Address</th>
                <th style = "padding:10px">Contact Number</th>
                <th style = "padding:10px">Delivery Number</th>
                <th style = "padding:10px">Anything to pay?</th>
            </tr>';
            while ($stmt->fetch()) {
                echo '<tr>';
                echo '<td style = "padding:10px">' . $name . '</td>';
                echo '<td style = "padding:10px">' . $address . '</td>';
                echo '<td style = "padding:10px">' . $number . '</td>';
                echo '<td style = "padding:10px">' . $awb . '</td>';
                if ($amount != null)
                    echo '<td style = "padding:10px">' . $amount . '</td>';
                else echo '<td style = "padding:10px">' . "NO" . '</td>';
                echo '</tr>';
            }

        }

    function display_order(){
        echo '<div id="bar2">
            <div id="myProgress">
                <p class="process-text">Your package is ready!</p>
                <div id="myBar2"></div>
            </div>
        </div>';
    }

