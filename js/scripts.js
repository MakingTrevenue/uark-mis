//Table Sorter
$(document).ready(function(){ 
    $("#applicantTable").tablesorter(); 
});

//Filter Table
function filterTable() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("filterInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("applicantTable");
    tr = table.getElementsByTagName("tr");
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
        } else {
            tr[i].style.display = "none";
        }
        } 
    }
}

// Navbar Active Tabs
var url = window.location;
$('ul.nav a[href="'+ url +'"]').parent().addClass('active');
$('ul.nav a').filter(function() {
    return this.href == url;
}).parent().addClass('active');

// Show/Hide Applicants Search Bar
var url = window.location.href;
var searchbar = document.getElementById('navbarSearch');
if( url == "https://www.uark.us/applicants.php" ) {
  searchbar.style.display = "inline";
}

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
$(document).ready(function(){
    $('input[type="checkbox"]').click(function(){
        var inputValue = $(this).attr("value");
        $("." + inputValue).toggle();
    });
})

//jQuery Masked Input
$(document).ready(function(){
    $("#primaryPhone").inputmask("(999) 999-9999", { showMaskOnHover: false });
    $("#secondaryPhone").inputmask("(999) 999-9999", { showMaskOnHover: false });
    $("#socialSecurityNumber").inputmask("999-99-9999", { showMaskOnHover: false });
});