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

// Application Form Validation
$(document).ready(function() {
	$("#applicationform").validate({
		rules: {
			firstName: {
				required: true,
				minlength: 2
			},

			lastName: {
				required: true,
				minlength: 2
			},

			primaryEmail: {
				required: true,
				email: true
			},

		messages: {
			firstName: {
				required: "Please enter your first name.",
				minlength: "Name must be longer than two characters."
			},

			lastName: {
				required: "Please enter your last name.",
				minlength: "Last name must be longer than two characters."
			},

			primaryEmail: {
				required: "Please enter your email address.",
				email: "Email must be in format of email@domain.com."
			}
		}

	});
});