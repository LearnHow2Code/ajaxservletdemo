<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function sleepFor( sleepDuration ){
            var now = new Date().getTime();
            while(new Date().getTime() < now + sleepDuration){ /* do nothing */ }
        }

        $(document).ready(function (){
            $("#submit").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'postservlet',
                    dataType: 'json',
                    data: $("#nameForm").serialize(),
                    success: function (data,status) {
                        // alert("Data " + data + "  and \nStatus: " + status);
                        $('#information').slideUp(500);

                        $('#information').slideDown(500);

                        sleepFor(1000);

                        $("#information").html("Your first name is: " + data.firstname +"<br>Your last name is: " + data.lastname +"<hr>");

                    }
                });
                return false;
            });
        });
    </script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="PostServlet">Hello Servlet</a>
<br/>
<br/>

<hr/>
<form id="nameForm">
    <label> Enter your first name:</label>
    <input type="text" id="fname" name="fname">
    <br>
    <br>
    <label> Enter your last name:</label>
    <input type="text" id="lname" name="lname">
    <br>
    <br>
    <input type="submit" id="submit">
</form>
<hr/>
<p id="information"></p>

<p class="small">Tutorial code LearnHow2Code https://github.com/LearnHow2Code?tab=repositories</p>

</body>
</html>