<html>
    <head>
        <script src="https://cdn.firebase.com/js/client/2.2.1/firebase.js"></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>
        <link rel="stylesheet" type="text/css" href="css/chatstylesheet.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.css">
        <link rel ="stylesheet" type ="text/css" href="css/bootstrap.min.css">
    </head>
    <body>

        <!-- CHAT MARKUP -->

        <H1>Welcome FreshFoodz</h1>
        <div class="chat chat-container">
            <header>Supplier Chat (https://vsms.firebaseio.com/)</header>
            
            <div class='chat-toolbar'>
                Sending to: <h3>Christina</h3>
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
            var nameField = $('#nameInput');
            var messageList = $('#messages');

            // LISTEN FOR KEYPRESS EVENT


            messageField.keypress(function(e) {
                if (e.keyCode == 13) {
                    //FIELD VALUES
                    var username = nameField.val();
                    var message = messageField.val();

                    //SAVE DATA TO FIREBASE AND EMPTY FIELD
                    messagesRef.push({sender: "FreshFoodz", receiver: "Christina", text: message});
                    messageField.val('');

                    //Type"Clear" to remove the message
                    if (message == "clear") {
                        messagesRef.remove();
                    }
                }
            });

            // Add a callback that is triggered for each chat message.
            messagesRef.limitToLast(10).on('child_added', function(snapshot) {
                //GET DATA
                var data = snapshot.val();
                var sender = data.sender || "anonymous";
                var receiver = data.receiver;
                var message = data.text;

                //CREATE ELEMENTS MESSAGE & SANITIZE TEXT
                var messageElement = $("<li>");
                var senderElement = $("<strong class='chat-name'></strong>");
                var receiverElement = $("<i class='chat-name'></i>");
                senderElement.text(sender);

                messageElement.text(message).prepend(senderElement);

                //ADD MESSAGE only if sender and receiver are relevant
                if (sender === "FreshFoodz" && receiver === "Christina" || sender === "Christina" && receiver === "FreshFoodz") {
                    messageList.append(messageElement)
                }

                //SCROLL TO BOTTOM OF MESSAGE LIST
                messageList[0].scrollTop = messageList[0].scrollHeight;
            });
        </script>
    </body>
</html>