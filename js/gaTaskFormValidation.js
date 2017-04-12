//jQuery Validation Override
$.validator.setDefaults({
    highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
        if(element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
});

//Form Validation
$("#gaTaskForm").validate({ 
    focusInvalid: false,
    invalidHandler: function(form, validator) {
        if (!validator.numberOfInvalids())
            return;

        $('html, body').animate({
          scrollTop: $(validator.errorList[0].element).offset().top
         }, 1000);
 
    },

    rules: {

        timeEstimate: {
            required: true
        },

        dueDate: {
            required: true
        },

        instructions: {
            required: true
        },

    },

    messages: {
       timeEstimate: {
            required: "Please estimate (in hours) how long the task will take to complete."
        },

        dueDate: {
            required: "Please enter a due date for the task."
        },

        instructions: {
            required: "Please provide instructions for the task."
        },
    }

});