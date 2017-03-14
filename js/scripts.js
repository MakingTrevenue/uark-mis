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

//Checkbox Show On Clicked
$(document).ready(function() {
    $('input[type="checkbox"]').click(function(){
        var inputValue = $(this).attr("value");
        $("." + inputValue).toggle();
    });
})

//jQuery Masked Input
$(document).ready(function() {
    $("#primaryPhone").inputmask("(999) 999-9999", { showMaskOnHover: false });
    $("#secondaryPhone").inputmask("(999) 999-9999", { showMaskOnHover: false });
    $("#socialSecurityNumber").inputmask("999-99-9999", { showMaskOnHover: false });
});