/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $.get("menu.jsp", function (data) {
        $("#menu").html(data);
    });
}); 

function addRowToTable()
{
  var tbl = document.getElementById('tblSample');
  var lastRow = tbl.rows.length;
  // if there's no header row in the table, then iteration = lastRow + 1
  var iteration = lastRow -1;
  var row = tbl.insertRow(lastRow);
  
  // left cell
  var cell1 = row.insertCell(0);
  var textNode = document.createTextNode(iteration);
  cell1.appendChild(textNode);
  
  // right cell
  var cell2 = row.insertCell(1);
  var ingredient = document.createElement('input');
  ingredient.type = 'text';
  ingredient.name = 'ingredient' + iteration;
  ingredient.id = 'ingredient' + iteration;
  ingredient.size = 40;
  ingredient.placeholder = "ingredient";
  
  
  //ingredient.onkeypress = keyPressTest;
  cell2.appendChild(ingredient);
   
  var cell3 = row.insertCell(2);
  var quantity = document.createElement('input');
  quantity.type = 'text';
  quantity.name = 'quantity' + iteration;
  quantity.id = 'quantity' + iteration;
  quantity.size = 10;
  quantity.placeholder = "amount";
  
  cell3.appendChild(quantity) ; 
    
  // select cell
    var cell4 = row.insertCell(3);
  var units = document.createElement('input');
  units.type = 'text';
  units.name = 'units' + iteration;
  units.id = 'units' + iteration;
  units.size = 10;
  units.placeholder = "unit";
  cell4.appendChild(units) ; 
  
 


}


//might remove
function keyPressTest(e, obj)
{
  var validateChkb = document.getElementById('chkValidateOnKeyPress');
  if (validateChkb.checked) {
    var displayObj = document.getElementById('spanOutput');
    var key;
    if(window.event) {
      key = window.event.keyCode; 
    }
    else if(e.which) {
      key = e.which;
    }
    var objId;
    if (obj != null) {
      objId = obj.id;
    } else {
      objId = this.id;
    }
    displayObj.innerHTML = objId + ' : ' + String.fromCharCode(key);
  }
}
function removeRowFromTable()
{
  var tbl = document.getElementById('tblSample');
  var lastRow = tbl.rows.length;
  if (lastRow > 3) tbl.deleteRow(lastRow - 1);
}
