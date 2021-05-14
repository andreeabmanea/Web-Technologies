<?php
include ("../Database/server.php");
global $mysql;
if (isset($_POST['export'])) {
    $query  = "SELECT * FROM users";
    $result = mysqli_query($mysql, $query);
    if (mysqli_num_rows($result) > 0) {
        $output  = "";
        $output .= "<table>
		             <thead>
			       <tr>
			         <th>Username</th>
			         <th>Last Name</th>
				     <th>First Name</th>
			         <th>Email</th>
			         <th>Password</th>
			         <th>Role</th>
			         <th>Phone Number</th>   
			         <th>CNP</th>
			       </tr>
			    </thead>";
        while ($data = mysqli_fetch_assoc($result)) {
            $output .=	"<tr>
			    <td>".$data['username']."</td>
			    <td>".$data['last_name']."</td>
			    <td>".$data['first_name']."</td>
			    <td>".$data['email']."</td>
			    <td>".$data['password']."</td>
			    <td>".$data['role']."</td>
			    <td>".$data['phone_number']."</td>
			    <td>".$data['cnp']."</td>
			</tr>";
        }
        $output .="</table>";
        header('Content-Type: application/xls');
        header('Content-Disposition: attachment; filename=users.xls');

        echo $output;
    }else{
        echo "No record found";
    }
}
