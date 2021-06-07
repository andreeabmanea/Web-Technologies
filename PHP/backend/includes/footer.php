<footer>
    <div class="container">
        <a class="column" style="width: 30%">Call us: 0232 231 629</a>
        <a class="column"
            <button onclick="DisplayContactForm()" style="width: 40%;">CONTACT</button>
        </a>
        <a class="column" style="width: 30%">Email: jmv@courieriasi.ro</a>
    </div>
    <div id="contact-form" class="modal">
        <div class="modal-content" style="background-color: rgba(235, 228, 216, 1);border-color:  #3c887e;border-style: solid;border-radius: 10px;padding: 4%;margin-bottom: 4%; width: 40%; position: center">
            <form class="contact-form-fill">
                <input type="text" placeholder="NAME" id="name" name="name"><br>
                <input type="text" placeholder="EMAIL" id="email" name="email"><br>
                <input type="text" placeholder="SUBJECT" id="subject" name="subject"><br>
                <input type="text" placeholder="WHAT CAN WE HELP YOU WITH?" id="problem" name="problem" style="height: 200px;"><br>
            </form>
            <a class="button" onclick="SubmitProblem(); document.getElementById('contact-form').style.display='none'" style="width: 140px">SUBMIT</a>
        </div>
    </div>
</footer>
<script>
    function DisplayContactForm(){
        document.getElementById('contact-form').style.display='block';
    }
    function SubmitProblem(){
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const subject = document.getElementById('subject').value;
        const problem = document.getElementById('problem').value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log('succes-contact-form-sent')
            }
        };
        xhttp.open("POST", "../mailer/contactFormMail.php", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send('name=' + name + '&email=' + email + '&subject=' + subject + '&problem=' + problem);
    }
</script>