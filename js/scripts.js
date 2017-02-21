// Scripts

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

//Duplicate Function
document.getElementById('duplicateButton').onclick = duplicate;


var i = 0;
var original = document.getElementById('collegeDuplicate');

function duplicate() {
    var clone = original.cloneNode(true); // "deep" clone
    clone.id = "collegeDuplicate" + ++i; // there can only be one element with an ID
    original.parentNode.appendChild(clone);
    return false; //prevent form submission
}