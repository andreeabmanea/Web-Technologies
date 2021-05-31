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
        $remember_me = mysqli_real_escape_string($mysql, $_POST['remember_me']);

        if (empty($username)) {
            array_push($errors, "Please enter your username");
        }
        if (empty($password)) {
            array_push($errors, "Please enter your password");
        }

        if (count($errors) == 0) {
            $md5 = md5($password);
            if ($stmt = $mysql->prepare("SELECT role FROM `users` WHERE username=? and password=?")) {
                $stmt->bind_param('ss', $username, $md5);
                $stmt->execute();
                $stmt->store_result();
                if ($stmt->num_rows == 1) {
                    if($remember_me == true)
                    {
                        $hour = time() + 3600 * 24 * 30;
                        setcookie('username', $username, $hour);
                        setcookie('password', $password, $hour);
                    }
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
                } else {
                    ?>
                    <script type = "text/Javascript">
                        alert("Sorry , wrong username or password");
                        setTimeout("location.href = '../public/index.php';");
                    </script>
                    <?php
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

        $results_1 = array("The two passwords do not match");
        $results_2 = array("Username or email already exists");
        $results_3 = array("The two passwords do not match", "Username or email already exists");

        // TODO: if passwords are not the same
        if ($password_1 != $password_2) {
            array_push($errors, "The two passwords do not match");
        }

        // TODO: check if the mail and username already exists
        if ($stmt = $mysql->prepare("SELECT * FROM users WHERE username = ? OR email = ?")) {
            $stmt->bind_param('ss', $username, $email);
            $stmt->execute();
            $stmt->fetch();
            if ($stmt->num_rows != 0) {
                array_push($errors, "Username or email already exists");
            }
            $stmt->close();
        }

        // if there are no errors, insert the new user
        if (count($errors) == 0) {
            if ($stmt = $mysql->prepare("INSERT INTO users (`id`, `username`, `last_name`, `first_name`, `email`, `password`, `role`, `phone_number`, `cnp`) 
                    VALUES (NULL, ?, ?, ?, ?, ?, 'client', ?, NULL)")) {
                $stmt->bind_param('ssssss', $username, $last_name, $first_name, $email, md5($password_1), $phone_number);
                $stmt->execute();
            }
            $_SESSION['username'] = $username;
            $_SESSION['success'] = "You are now logged in";
            header('location: ../client/index.php');
            $stmt->close();
        }
        // passwords are not the same
        if (count(array_diff($errors, $results_1)) == 0) {
            ?>
            <script type = "text/Javascript">
                alert("Sorry, passwords are not the same!");
                setTimeout("location.href = '../public/index.php';");
            </script>
            <?php
        } else
        // username or email already exists
        if (count(array_diff($errors, $results_2)) == 0) {
            ?>
            <script type = "text/Javascript">
                alert("Sorry, username or email already in use!");
                setTimeout("location.href = '../public/index.php';");
            </script>
            <?php
        } else
        // username, email or password incorrect
        if (count(array_diff($errors, $results_3)) == 0) {
            ?>
            <script type = "text/Javascript">
                alert("Sorry, passwords are not the same or email/username already in use!");
                setTimeout("location.href = '../public/index.php';");
            </script>
            <?php
        }
    }

