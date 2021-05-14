<?php
include ("../Database/server.php");
global $mysql;
if (isset($_POST['export-users'])) {
    $query  = "SELECT * FROM users";
    $result = mysqli_query($mysql, $query);
    if (mysqli_num_rows($result) > 0) {
        $output  = "";
        $output .= "<table>
		             <th>
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
			    </th>";
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


if (isset($_POST['export-orders'])) {
    $query  = "SELECT * FROM orders";
    $result = mysqli_query($mysql, $query);
    if (mysqli_num_rows($result) > 0) {
        $output  = "";
        $output .= "<table>
		             <th>
			       <tr>
			         <th>Name</th>
			         <th>Phone Number</th>
				     <th>Address</th>
			         <th>Weight</th>
			         <th>Content</th>
			         <th>Type</th>
			         <th>Payment</th>   
			         <th>Amount</th>
			         <th>Area</th>
			         <th>Status</th>
			         <th>Delivery Date</th>
			         <th>Delivery Hour</th>
			         <th>AWB</th>
			         <th>ID Client</th>     
			       </tr>
			    </th>";

        while ($info = mysqli_fetch_assoc($result)) {
            $output .=	"<tr>
			    <td>".$info['name']."</td>
			    <td>".$info['phone_number']."</td>
			    <td>".$info['address']."</td>
			    <td>".$info['weight']."</td>
			    <td>".$info['content']."</td>
			    <td>".$info['standard/express']."</td>
			    <td>".$info['cash/account_reimbursement']."</td>
			    <td>".$info['amount']."</td>
			    <td>".$info['area']."</td>
			    <td>".$info['status']."</td>
			    <td>".$info['delivery_date']."</td>
			    <td>".$info['delivery_hour']."</td>
			    <td>".$info['AWB']."</td>
			    <td>".$info['id_client']."</td>
			</tr>";
        }
        $output .="</table>";
        header('Content-Type: application/xls');
        header('Content-Disposition: attachment; filename=orders.xls');

        echo $output;
    }else{
        echo "No record found";
    }
}
