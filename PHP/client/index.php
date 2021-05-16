<?php
$title = 'Client Account';
require_once "../includes/header_for_accounts.php";
include "../Database/find_my_awb.php";
include "../Database/send_hour.php";

if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['username']);
    header("location: ../public/index.php");
}
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">Hello <?php echo $_SESSION['username'];?>! Enter your AWB:</p>
        <form class="awb-form">
            <input type="text" placeholder="AWB" id="fawb" name="fawb"><br>
            <div id="submit-button">
                <a class="button" onclick="displayParcelInfo()">Submit</a>
            </div>
        </form>
    </div>

    <div class="starter" id="info-parcel">

    </div>

    <div class="starter" id="problems">
        <p id = "title">Reports and preferred hours:</p>
        <table>
            <tr>
                <th>Want to change delivery hour?</th>
                <td>
                    <select name="shour" class="selector" onchange="reportHour(this.value)">
                        <option value="9:00-11:00">09:00-11:00</option>
                        <option value="11:00-13:00">11:00-13:00</option>
                        <option value="13:00-15:00">13:00-15:00</option>
                        <option value="15:00-17:00">15:00-17:00</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Don't want it anymore?</th>
                <th>
                    <a class="button" onclick="document.getElementById('cancel-delivery').style.display='block'">Cancel</a>
                </th>
            <tr>
                <th>Issues with the package?</th>
                <th>
                    <a class="button" onclick="document.getElementById('report-delivery').style.display='block'">Report</a>
                </th>
            </tr>
        </table>
    </div>
</div>

<div id="cancel-delivery" class="modal">
    <div class="modal-content">
        <p id="title">Are you sure you want to cancel the package?</p>
        <nav class="container">
            <a class="button" style="margin-left:40%" onclick="document.getElementById('cancel-delivery').style.display='none'" class="close" title="Close">Yes!</a>
            <a class="button" onclick="document.getElementById('cancel-delivery').style.display='none'" class="close" title="Close">No!</a>
        </nav>
    </div>
</div>

<div id="report-delivery" class="modal">
    <div class="modal-content">
        <span onclick="document.getElementById('report-delivery').style.display='none'" class="close" title="Close">&times;</span>
        <form class="report-form">
            <p id="mini-title">Is the package damaged?</p>
            <input type="radio" name="damage">Yes<br>
            <input type="radio" name="damage">No<br>
        </form>
        <form class="report-form">
            <p id="mini-title">Did you get something other than what you ordered?</p>
            <input type="radio" name="damage">Yes<br>
            <input type="radio" name="damage">No<br>
        </form>
        <form class="report-form">
            <p id="mini-title">Any another comments?</p>
            <input type="text" name="comments" style="text-align: left"><br>
            <input type="submit" value="Submit" class="button">
        </form>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>

<script>
    function displayParcelInfo() {
        // if the AWB is matching with one from our data base
        const awb = document.getElementById('fawb').value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('info-parcel').style.display='block';
                document.getElementById('info-parcel').innerHTML = this.responseText;
                document.getElementById('problems').style.display='block';
            }
        };

        xhttp.open("GET", "../Database/find_my_awb.php?fawb=" + awb, true);
        xhttp.send();
    }

    function reportHour(str) {
        var xhttp = new XMLHttpRequest();
        const awb = document.getElementById('fawb').value;
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {

            }
        };
        xhttp.open("POST", "../Database/send_hour.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb=' + awb + '&new-hour=' + str);
    }
</script>