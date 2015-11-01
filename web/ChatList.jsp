
<html>
    <head>
        <script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js"></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
        <link rel="stylesheet" type="text/css" href="css/chatstylesheet.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.min.css">
    </head>
    <style>
        #chat{
            margin-top: 100px;
        }
        
        .list-group-item:active{
              background-color: blue; 
        }
        
    </style>
    
    <body>
        <%@include file="menu.jsp"%>

        <form action="ChatVendor.jsp" method="GET" id="chat">
            <input type="hidden" value="FreshFoodz" name="hiddenvalue" id="hiddenvalue"></input>
            <ul class="list-group">
                <li class="list-group-item"><h1>Contact Lists</h1></li>
                <li class="list-group-item" name="FreshFoodz" onclick="submitFunction('FreshFoodz')" ><h3>FreshFoodz</h3></li>
                <li class="list-group-item" name="Only A Matter of Thyme" onclick="submitFunction('Only A Matter of Thyme')"><h3>Only A Matter of Thyme Chat</h3></li>                
            </ul>
        </form>
        <script>
            function submitFunction(supplierName) {
                document.getElementById("hiddenvalue").setAttribute("value", supplierName);
                document.getElementById("chat").submit();
            }
        </script>
    </body>

</html> 