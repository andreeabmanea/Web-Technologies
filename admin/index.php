<?php
$title = 'Admin Account';
include("../includes/header_for_accounts.php");
?><div class="middle-box">
    <div class="starter">
        <p id="title">Manage accounts:</p>
        <div class="text-buttons">
            <a class="button" onclick="
                document.getElementById('clients-list').style.display='none';
                document.getElementById('couriers-list').style.display='none';
                document.getElementById('operators-list').style.display='block'">
                Operators</a>
            <a class="button" onclick="
                document.getElementById('clients-list').style.display='none';
                document.getElementById('couriers-list').style.display='block';
                document.getElementById('operators-list').style.display='none'">
                Couriers</a>
            <a class="button" onclick="
                document.getElementById('clients-list').style.display='block';
                document.getElementById('couriers-list').style.display='none';
                document.getElementById('operators-list').style.display='none'">
                Clients</a>
        </div>

        <table id="operators-list" class="accounts-list">
            <tr id="Maria-Pelaru">
                <td>Maria Pelaru</td>
                <td><a class=button onclick="document.getElementById('Maria-Pelaru-details').style.display='block'">View Details</a></td>
                <td><a class=button onclick="document.getElementById('Maria-Pelaru').style.display='none'">Remove</a></td>
            </tr>
            <tr id="Mihai-Horia">
                <td>Mihai Horia</td>
                <td><a class=button onclick="document.getElementById('Mihai-Horia-details').style.display='block'">View Details</a></td>
                <td><a class=button onclick="document.getElementById('Mihai-Horia').style.display='none'">Remove</a></td>
            </tr>
        </table>

        <table id="couriers-list" class="accounts-list">
            <tr id="Silviu-Manolache">
                <td>Silviu Manolache</td>
                <td><a class=button onclick="document.getElementById('Silviu-Manolache-details').style.display='block'">View Details</a></td>
                <td><a class=button onclick="document.getElementById('Silviu-Manolache').style.display='none'">Remove</a></td>
            </tr>
        </table>

        <table id="clients-list" class="accounts-list">
            <tr id="Ioana-Ursachi">
                <td>Ioana Ursachi</td>
                <td><a class=button onclick="document.getElementById('Ioana-Ursachi-details').style.display='block'">View Details</a></td>
                <td><a class=button onclick="document.getElementById('Ioana-Ursachi').style.display='none'">Remove</a></td>
            </tr>
        </table>
    </div>
</div>

<div id="Maria-Pelaru-details" class="modal details-pop">
    <div class="modal-content">
        <p id="mini-title"> Name: Maria Georgiana Pelaru</p>
        <p id="mini-title"> Email: maria.pelaru@yahoo.com</p>
        <p id="mini-title"> CNP: 123456789</p>
        <p id="mini-title"> Phone number: 0765 758 746</p>
        <a class=button onclick="document.getElementById('Maria-Pelaru-details').style.display='none'">Done</a>
    </div>
</div>

<div id="Mihai-Horia-details" class="modal details-pop">
    <div class="modal-content">
        <p id="mini-title"> Name: Mihai Horia</p>
        <p id="mini-title"> Email: mihai.horia@yahoo.com</p>
        <p id="mini-title"> CNP: 678912345</p>
        <p id="mini-title"> Phone number: 0775 937 029</p>
        <a class=button onclick="document.getElementById('Mihai-Horia-details').style.display='none'">Done</a>
    </div>
</div>

<div id="Silviu-Manolache-details" class="modal details-pop">
    <div class="modal-content">
        <p id="mini-title"> Name: Silviu Constantin Manolache</p>
        <p id="mini-title"> Email: silviu.manolache@yahoo.com</p>
        <p id="mini-title"> CNP: 987654321</p>
        <p id="mini-title"> Phone number: 0776 745 847</p>
        <a class=button onclick="document.getElementById('Silviu-Manolache-details').style.display='none'">Done</a>
    </div>
</div>

<div id="Ioana-Ursachi-details" class="modal details-pop">
    <div class="modal-content">
        <p id="mini-title"> Name: Ioana Ursachi</p>
        <p id="mini-title"> Email: ioana.ursachi@yahoo.com</p>
        <p id="mini-title"> Phone number: 0765 798 937</p>
        <a class=button onclick="document.getElementById('Ioana-Ursachi-details').style.display='none'">Done</a>
    </div>
</div>

<div class="middle-box">
    <div class="starter">
        <p id="title">Weekly Statistics</p>
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
            <canvas id="week-statistics"></canvas>
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

<script src = "https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    var week = document.getElementById('week-statistics').getContext('2d');
    var weeklyStatistics = new Chart(week, {
        type: 'bar',
        data: {
            labels: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
            datasets: [{
                label: '# of Orders',
                data: [55, 30, 40, 65, 32, 60, 45],
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
</script>
<?php
require_once '../includes/footer.php';
?>