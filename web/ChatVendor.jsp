<%@include file="protect.jsp"%>
<%@page import="Manager.OrderDAO"%>
<html>
    <head>
        <script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js"></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
        <link rel="stylesheet" type="text/css" href="css/chatstylesheet.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.min.css">
    </head>
    <body>
        <%
            String supplierName = request.getParameter("hiddenvalue");
            System.out.println(supplierName);
            String vendorName = OrderDAO.getVendorNameById("1");
         %>
        <!-- CHAT MARKUP -->
        <div class="chat chat-container">
            <header>Vendor Chat (https://vsms.firebaseio.com/)</header>

            <div class='chat-toolbar'>
                Sending to: <%=supplierName%>
            </div>

            <ul id='messages' class="chat-messages"></ul>

            <footer>
                <input type='text' id='messageInput'  placeholder='Type a message...'>
            </footer>
        </div>

        <!-- CHAT JAVACRIPT -->
        <script>
            // CREATE A REFERENCE TO FIREBASE
            var messagesRef = new Firebase('https://vsms.firebaseio.com/');

            // REGISTER DOM ELEMENTS
            var messageField = $('#messageInput');
            var messageList = $('#messages');
            
            // LISTEN FOR KEYPRESS EVENT 
            messageField.keypress(function(e) {
                if (e.keyCode == 13) {
                    //FIELD VALUES
                    var receiver = "<%=supplierName%>";
                    var sender = "<%=vendorName%>"
                    var message = messageField.val();

                    //SAVE DATA TO FIREBASE AND EMPTY FIELD
                    messagesRef.push({sender: "<%=vendorName%>", receiver: receiver, text: message});
                    messageField.val('');

                    //Type"Clear" to remove the message
                    if (message == "clear") {
                        messagesRef.remove();
                    }
                }
            });

            // Add a callback that is triggered for each chat message created.
            messagesRef.limitToLast(10).on('child_added', function(snapshot) {
                //GET DATA
                var data = snapshot.val();
                var sender = data.sender || "anonymous";
                var receiver = data.receiver;
                var message = data.text;
                var key = data.key;
                var ordercondition = data.ordercondition;
                var orderid = data.orderid;
                //CREATE ELEMENTS MESSAGE & SANITIZE TEXT
                //var messageElement = $("<li>");
                //messageElement.text(message).prepend(senderElement);      
                //var receiverElement = $("<i class='chat-name'></i>");

                var senderElement = $("<strong class='chat-name'></strong>");
                senderElement.text(sender);
                //ADD MESSAGE only if sender and receiver are relevant
                if (sender === "<%=supplierName%>" && receiver === "<%=vendorName%>" || sender === "<%=vendorName%>" && receiver === "<%=supplierName%>") {
                    messageList.append(senderElement)
                    messageList.append(message)                    
                    messageList.append("<li>")
                    if(key!=null){
                        messageList.append("Order key: " + key)
                    }
                    messageList.append("<li>")
                }

                //SCROLL TO BOTTOM OF MESSAGE LIST
                messageList[0].scrollTop = messageList[0].scrollHeight;
            });
        </script>
    </body>
</html>