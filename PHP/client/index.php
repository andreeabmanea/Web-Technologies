<?php
$title = 'Client Account';
require_once "../includes/header_for_accounts.php";
include "../Database/server.php";

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

    <div class="starter" id="infos" style="display: none">
        <div id="info-parcel">

        </div>
        <div id="problems" style="display: none">
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
                </tr>
                <tr>
                    <th>Issues with the package?</th>
                    <th>
                        <a class="button" onclick="document.getElementById('report-delivery').style.display='block'">Report</a>
                    </th>
                </tr>
            </table>
        </div>
    </div>
</div>

<div id="cancel-delivery" class="modal">
    <div class="modal-content">
        <p id="title">Are you sure you want to cancel the package?</p>
        <nav class="container">
            <a class="button" style="margin-left:40%" onclick="document.getElementById('cancel-delivery').style.display='none', reportParcel()" class="close" title="Close">Yes!</a>
            <a class="button" onclick="document.getElementById('cancel-delivery').style.display='none'" class="close" title="Close">No!</a>
        </nav>
    </div>
</div>

<div id="report-delivery" class="modal">
    <div class="modal-content">
        <span onclick="document.getElementById('report-delivery').style.display='none'" class="close" title="Close">&times;</span>
        <form class="report-form" id="damage">
            <p id="mini-title">Is the package damaged?</p>
            <input type="radio" name="damage" id="damage1" value="Yes" required checked>Yes<br>
            <input type="radio" name="damage" id="damage2" value="No">No<br>
        </form>
        <form class="report-form" id="something">
            <p id="mini-title">Did you get something other than what you ordered?</p>
            <input type="radio" name="something" id="something1" value="Yes" required>Yes<br>
            <input type="radio" name="something" id="something2" value="No" checked>No<br>
        </form>
        <form class="report-form" id="comments">
            <p id="mini-title">Any another comments?</p>
            <input type="text" id="comment" name="comment" placeholder="Your comment" style="text-align: left"><br>
            <a class="button" onclick="document.getElementById('report-delivery').style.display='none', submitReportParcel()" class="close" title="Close">Submit</a>
        </form>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>

<script>
    // for displaying information about the parcel
    function displayParcelInfo() {
        // if the AWB is matching with one from our data base
        const awb = document.getElementById('fawb').value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('infos').style.display='block';
                document.getElementById('info-parcel').style.display='block';
                document.getElementById('info-parcel').innerHTML = this.responseText;
            }
        };

        xhttp.open("GET", "../Database/find_my_awb.php?fawb=" + awb, true);
        xhttp.send();
    }

    function displayReport() {
        document.getElementById('problems').style.display = 'block';
    }

    // for changing hours
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

    // cancel parcel which will be a report too
    function reportParcel() {
        var xhttp = new XMLHttpRequest();
        const awb = document.getElementById('fawb').value;
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {

            }
        };
        xhttp.open("POST", "../Database/cancel_parcel.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb=' + awb);
    }

    // report parcel with the information from the radios and comment
    function submitReportParcel() {
        var xhttp = new XMLHttpRequest();

        const awb = document.getElementById('fawb').value;
        const comment = document.getElementById('comment').value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {

            }
        };

        var damage;
        if (document.getElementById('damage1').checked)
            damage = "yes";
        else
            damage = "no";

        var something;
        if (document.getElementById('something1').checked)
            something = "yes";
        else
            something = "no";

        // var damage = $('input[name=damage]:checked', '#damage').value;
        // var something = $('input[name=something]:checked', '#something').value;
        // var damage = "maybe";
        // var something = "maybe";
        //
        // var ele = document.getElementsByTagName('damage');
        // document.write(ele[1]);
        // for(var i = 0; i < ele.length; i++) {
        //     var damage = "in";
        //     if(ele[i].type == "radio") {
        //
        //         if(ele[i].checked)
        //             var damage = ele[i].value;
        //     }
        // }
        // ele = document.getElementsByTagName('something');
        // for(i = 0; i < ele.length; i++) {
        //     var something = "in";
        //     if(ele[i].type == "radio") {
        //
        //         if(ele[i].checked)
        //             var something = ele[i].value;
        //     }
        // }

        xhttp.open("POST", "../Database/report_parcel.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('fawb=' + awb + '&damage=' + damage + '&something=' + something + '&comment=' + comment);
    }
</script>