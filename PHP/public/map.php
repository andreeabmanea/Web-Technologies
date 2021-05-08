<?php
$title = 'Map';
require_once '../includes/header.php';
?>
<p id="title">Where we deliver?</p>
<div class="middle-box">
    <div class="starter">
        <div class="mapouter">
            <div class="gmap_canvas">
                <iframe width="800" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=Iasi&t=&z=11&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
                </iframe>
                <a href="https://123movies-to.org">123movies</a>
                <br>
                <style>.mapouter{position:relative;text-align:right;height:500px;width:800px;}</style>
                <a href="https://www.embedgooglemap.net">maps for websites</a>
                <style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:800px;}</style>
            </div>
        </div>
    </div>
</div>
<?php
require_once '../includes/footer.php';
?>
</body>