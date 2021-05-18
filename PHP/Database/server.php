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
    $phone_number = "";
    $first_name = "";
    $last_name = "";
    $password_1 = "";
    $password_2 = "";
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

    if (isset($_POST['signup'])) {
        // take the inputs
        $username = mysqli_real_escape_string($mysql, $_POST['username']);
        $email = mysqli_real_escape_string($mysql, $_POST['email']);
        $phone_number = mysqli_real_escape_string($mysql, $_POST['phone-number']);
        $first_name = mysqli_real_escape_string($mysql, $_POST['first-name']);
        $last_name = mysqli_real_escape_string($mysql, $_POST['last-name']);
        $password_1 = mysqli_real_escape_string($mysql, $_POST['psw']);
        $password_2 = mysqli_real_escape_string($mysql, $_POST['psw-repeat']);

        // TODO: if passwords are not the same
//        if ($password_1 != $password_2) {
//            array_push($errors, "The two passwords do not match");
//        }

        // TODO: check if the mail already exists
//        if ($stmt = $mysql->prepare("SELECT * FROM users WHERE username = ? OR email = ?")) {
//            $stmt->bind_param('ss', $username, $email);
//            $stmt->execute();
//            if ($stmt->num_rows != 0) {
//                array_push($errors, "Username or email already exists");
//            }
//        }

        // if there are no errors, insert the new user
        if (count($errors) == 0) {
            if ($stmt = $mysql->prepare("INSERT INTO users (`id`, `username`, `last_name`, `first_name`, `email`, `password`, `role`, `phone_number`, `cnp`) 
                    VALUES (NULL, ?, ?, ?, ?, ?, 'client', ?, NULL)")) {
                $stmt->bind_param('ssssss', $username, $last_name, $first_name, $email, $password_1, $phone_number);
                $stmt->execute();
            }
            header('location: ../public/index.php');
        }
        $stmt->close();
    }

