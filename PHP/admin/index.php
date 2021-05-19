<?php
$title = 'Admin Account';
include("../includes/header_for_accounts.php");
include("../Database/server.php");

?>

    <!-- Hello message -->
    <div class="middle-box">
=======

?><div class="middle-box">
>>>>>>> Stashed changes
    <div class="starter">
        <div class="text-box">
            <p id="title">Hello, <?php echo $_SESSION['username']; ?>!</p>
            <p id="title">Glad to have you back. Here you can manage your company's relevant information and see the orders' flow.</p>
        </div>
    </div>
    <div class="starter">
        <p id="title">Manage accounts</p>

        <div class="text-buttons">
            <a class="button" onclick="getOperators()">Operators</a>
            <a class="button" onclick="getCouriers()">Couriers</a>
            <a class="button" onclick="getClients()">Clients</a>
        </div>

        <table id="operators-list" class="accounts-list" style="display: none"><!-- Operators table --></table>
        <table id="couriers-list" class="accounts-list"><!-- Couriers table --></table>
        <table id="clients-list" class="accounts-list"><!-- Clients table --></table>
    </div>
</div>

<div id="pop-up" class="modal details-pop" style="display: none;">
    <div id="details" class="modal-content">
        <!-- For displaying details about account -->
    </div>
</div>

    <!-- Statistics -->
<div class="middle-box">
    <div class="starter">
        <p id="title">Area Statistics</p>
        <div class="text-box">
            <canvas id="week-statistics">See Statistics</canvas>
        </div>
    </div>
    <div class ="starter">
        <p id="title">Monthly Statistics</p>
        <div class="text-box">
            <p>Select an area:
                <select name="area" id="area" class="selector">
                    <option value="Pacurari">Pacurari</option>
                    <option value="Bucium">Bucium</option>
                    <option value="Dacia">Dacia</option>
                    <option value="Nicolina">Nicolina</option>
                    <option value="Tudor-Vladimirescu">Tudor-Vladimirescu</option>
                    <option value="Bularga">Bularga</option>
                    <option value="Tatarasi">Tatarasi</option>
                    <option value="CUG">CUG</option>
                </select>
            </p>
            <canvas id="month-statistics"></canvas>
        </div>
    </div>
</div>

    <!-- Import and Export options -->
<div class="middle-box">
    <div class="starter">
        <p id="title">Import/Export Users</p>
        <div class="text-box">
            <form action="../Database/import_data.php" method="POST" enctype="multipart/form-data">
                <input type="file" name="file" required="">
                <input type="submit" name="import-users" class="button" value="Upload">
            </form>
            <form action="../Database/export_data.php" method="POST">
                <input type="submit" class="button" name="export-users" value="Export">
            </form>
        </div>
        <br>
        <p id="title">Import/Export Orders</p>
        <div class="text-box">
            <form action="../Database/import_data.php" method="POST" enctype="multipart/form-data">
                <input type="file" name="file" required="">
                <input type="submit" name="import-orders" class="button" value="Upload">
            </form>
            <form action="../Database/export_data.php" method="POST">
                <input type="submit" class="button" name="export-orders" value="Export">
            </form>
        </div>
    </div>
</div>

<script src = "https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    var week = document.getElementById('week-statistics').getContext('2d');
    getOrdersByArea().then(res=>{
        var weeklyStatistics = new Chart(week, {
                type: 'bar',
                data: {
                    labels: res["area"],
                    datasets: [{
                        label: '# of Orders',
                        data: res["number"],
                        backgroundColor: '#3c887e',
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

    })

    var month = document.getElementById('month-statistics').getContext('2d');
    var monthlyStatistics = new Chart(month, {
        type: 'bar',
        data: {
            labels: ['January','February','March','April','May','June', 'July', 'August','September','October','November','December'],
            datasets: [{
                label: '# of Orders',
                data: [1800, 1567, 1987, 1200, 1546, 1928, 1234, 1657, 1345, 1765, 1453, 1506],
                backgroundColor: '#3c887e',
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // we want operators list
    function getOperators() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('operators-list').style.display = 'block';
                document.getElementById('clients-list').style.display = 'none';
                document.getElementById('couriers-list').style.display = 'none';
                document.getElementById('operators-list').innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "../Database/find_accounts.php?role=operator", true);
        xhttp.send();
    }

    // we want couriers list
    function getCouriers() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('operators-list').style.display = 'none';
                document.getElementById('clients-list').style.display = 'none';
                document.getElementById('couriers-list').style.display = 'block';
                document.getElementById('couriers-list').innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "../Database/find_accounts.php?role=courier", true);
        xhttp.send();
    }

    // we want clients list
    function getClients() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('operators-list').style.display = 'none';
                document.getElementById('clients-list').style.display = 'block';
                document.getElementById('couriers-list').style.display = 'none';
                document.getElementById('clients-list').innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "../Database/find_accounts.php?role=client", true);
        xhttp.send();
    }

    // removing account
    function removeAccount(id) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {

            }
        };
        xhttp.open("POST", "../Database/remove_account.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('id=' + id);
    }

    // get details about account
    function detailsAccount(id) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('pop-up').style.display = 'block';
                document.getElementById('details').innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "../Database/details_account.php?id=" + id, true);
        xhttp.send();
    }

    // for done button
    function closeDetailsWindow() {
        document.getElementById('pop-up').style.display = 'none';
    }

    async function getOrdersByArea() {
        try {
            let res = await fetch("../Database/get_orders.php");
            console.log(res.body);
            let resBody = await res.json();
            return resBody;
            console.log(resBody);

        }catch (err){
            console.log(err);
        }
    }
</script>
<?php
require_once '../includes/footer.php';
?>