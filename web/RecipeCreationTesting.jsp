<%-- 
    Document   : SupplierCatalogue
    Created on : 12 Oct, 2015, 11:47:15 PM
    Author     : Joel
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entity.Ingredient"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Dish"%>
<%@page import="Entity.Menu"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Supplier"%>
<%@page import="DAO.SupplierDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String send = "FreshFruitz";
%>


<html>


    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <script src="https://cdn.rawgit.com/remy/bind/928c52ce335d6fd2c824b536a97efa460554b9e0/dist/bind.min.js"></script>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src = "bootstrap/js/bootstrap.js"></script>

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>



    </head>

    <body>

        <div id="menu">
        </div>

        <div class="jumbotron">
            <div class="container">

                <%
                    SupplierDAO sDAO = new SupplierDAO();
                    List<Supplier> supList2 = sDAO.retrieveAll();
                   // Supplier toDisplay = sDAO.getSupplier("FreshFruitz", supList2);
                %>
                <h1>Create Dish</h1>

                <h2>Dish Name:</h2>
                <form name="RecipeCreation" method="get" action="MenuDish.jsp" data-parsley-validate >

                    <input class="inputs" type="text" name="dishName" placeholder="Name of Dish">
                    <!-- This is where the ingredients print-->
                    <h3>Ingredients:</h3>
                    <ul id="ingredients"></ul>
                    <a data-toggle="modal" class="btn btn-success" data-target="#myModal" >ADD Ingredient +</a><br>

                    <p class="toRight">
                        <input class="btn btn-primary btn-lg" type="submit" value="Save" onclick="validateRow(this.form);" />
                        <a href="MenuDish.jsp" class="btn btn-primary btn-lg">Back</a>
                    </p>
                </form>

                <%
                    try {

                %>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button  type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Suppliers</h4>
                            </div>

                            <div class="modal-body">
                                <%for (Supplier s : supList2) {%>

                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" class="collapsed" href="#<%=s.getSupName().replaceAll("\\s", "")%>">
                                                    <%=s.getSupName()%></a>
                                            </h4>
                                        </div>
                                        <div id="<%=s.getSupName().replaceAll("\\s", "")%>" class="panel-collapse collapse">

                                            <div class="panel-body">
                                                <ul>
                                                    <%
                                                        ArrayList<String> ingredientList = (ArrayList<String>) s.getItems();
                                                        Iterator iter = ingredientList.iterator();
                                                        int counter = 0;
                                                        while (iter.hasNext()) {
                                                            counter++;
                                                            String ingredient = (String) iter.next();
                                                    %>


                                                    <!--
                               MODAL IS CALLED HERE!!!"
                                                    -->
                                                    <li><button type= "button" id="<%=s.getSupName()%>_<%=ingredient%> "  data-toggle="modal" data-target="#linkPrompt"><%=ingredient%></button>
                                                    </li>

                                                    <%
                                                        }
                                                    %>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!--<a data-dismiss="modal" data-toggle="modal" href="#lost">Click</a>-->



                                <%}%>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>

                </div>
                <%

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //Linked to modal

                %>








                <div id="linkPrompt" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-sm">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Link Prompt</h4>
                            </div>
                            <div class="modal-body">
                                <p class="insert"></p>



                                <p><form id="frm1" action="#">
                                    <input type="hidden" id="hiddenField">
                                    </p>
                                    </div>
                                    <div class="modal-footer">
                                        <form class="form-horizontal">
                                            <fieldset>                
                                                <!-- Button (Double) -->
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="send"></label>
                                                    <div class="col-md-8">
                                                        <input type="button"  name="--" class="btn btn-success" data-dismiss="modal" id="loadbasic" value="Add ingredient" onClick="myFunc(this.id);">
                                                        </form>
                                                        <button id="cancel" name="cancel" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>








            <pre style="visibility:hidden;" id="output"></pre>




            <pre style="clear:both; visibility:hidden;" id="last"></pre>









            <script>$('#linkPrompt').on('show.bs.modal', function (e) {
                    var $supplierIngredient = e.relatedTarget.id;
                    var array = $supplierIngredient.split('_');
                    // document.getElementById("quantity") = array[0];
                    document.getElementById("hiddenField").value = $supplierIngredient;
                    $(this).find('.insert').html("Add <b><font color=red>" + array[1] + "</b></font> to Dish?");
                });



            </script>


            <script>var data = Bind({
                    me: {
                        ingredients: []
                    }
                }, {
                    me: {
                        callback: function () {
                            // get the stack, but drop the "Error" and this particular line
                            var stack = (new Error()).stack.split('\n').slice(2);
                            // now search until we're outside of the bind.js library
                            stack = stack.filter(function (line) {
                                return line.indexOf('bind.min.js') === -1 &&
                                        line.indexOf('(native)') === -1;
                            }).shift();

                            var show = false;

                            if (typeof __filename !== 'undefined') {
                                // we be node
                                if (stack.indexOf(__filename) === -1) {
                                    show = true;
                                }
                            } else {
                                show = true;
                            }

                            if (show) {
                                document.querySelector('#last').innerHTML = (stack || '').trim();
                            }

                            document.querySelector('#output').innerHTML = escape(JSON.stringify(this.__export(), '', 2));
                        }
                    },
                    'me.list': {
                        dom: '#list',
                        transform: function (v) {
                            return '<li>' + this.safe(v);
                        }
                    },
                    'me.name': '.name',
                    'me.ingredients': {
                        dom: '#ingredients',
                        transform: function (ingredient) {
                            return '<li>' + this.safe(ingredient.name);
                        }
                    },
                    'me.ingredients.0.name': {
                        dom: '#first-ingredient'
                    }
                });

                document.querySelector('#change').onclick = function () {
                    data.me.ingredients.push({name: "apple"});
                };

                console.clear();


// helper to dump the object in a <pre>
                function escape(s) {
                    return (s || '').replace(/[<>]/g, function (m) {
                        return {
                            '<': '&lt;',
                            '>': '&gt;',
                        }[m]
                    })
                }</script>
            <script>
                function myFunc(id) {
                    var item = document.getElementById('hiddenField').value;
                    data.me.ingredients.push({name: item});
                }

            </script>    
    </body>
</html>
