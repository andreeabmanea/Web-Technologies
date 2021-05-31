<?php
include("connection.php");
global $mysql;
session_start();

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
                    alert("Sorry, wrong username or password!");
                    setTimeout("location.href = '../public/index.php';");
                </script>
                <?php
            }
            $stmt->close();
        }
    }
}
