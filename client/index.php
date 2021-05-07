<?php
$title = 'Client Account';
require_once "../includes/header_for_accounts.php";
?>
<div class="middle-box">
    <div class="starter">
        <p id="title">Enter your AWB:</p>
        <form class="awb-form">
            <input type="text" placeholder="AWB" id="fawb" name="fawb"><br>
            <div id="submit-button">
                <input type="submit" value="Submit" class="button">
            </div>
        </form>
    </div>
    <div class="starter">
        <p id="title">Status:</p>
        <div id="myProgress">
            <p class="procces-text">Your package is getting ready..</p>
            <div id="myBar1"></div>
        </div>
        <div id="myProgress">
            <p class="procces-text">Your package is ready!</p>
            <div id="myBar2"></div>
        </div>
        <div id="myProgress">
            <p class="procces-text">Your package is on your way!</p>
            <div id="myBar3"></div>
        </div>
        <div id="myProgress">
            <p class="procces-text">Your package arrived!</p>
            <div id="myBar4"></div>
        </div>
        <table>
            <caption id="title">Detailes about your package:</caption>
            <tr>
                <th>Delivery</th>
                <th>Date</th>
                <th>Hours</th>
            </tr>
            <tr>
                <td>Edit delivery hour</td>
                <td>19/08/2019</td>
                <td>
                    <select name="shour" id="shour" class="selector">
                        <option value="9:00-11:00">09:00-11:00</option>
                        <option value="11:00-13:00">11:00-13:00</option>
                        <option value="13:00-15:00">13:00-15:00</option>
                        <option value="15:00-17:00">15:00-17:00</option>
                    </select>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <th>Phone number of courier</th>
                <th>0232 231 629</th>
            </tr>
        </table>

        <table>
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
