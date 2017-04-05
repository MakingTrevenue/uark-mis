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
$("#gaEvaluationForm").validate({ 
    focusInvalid: false,
    invalidHandler: function(form, validator) {
        if (!validator.numberOfInvalids())
            return;

        $('html, body').animate({
          scrollTop: $(validator.errorList[0].element).offset().top
         }, 1000);
 
    },

    rules: {

        duties: {
            required: true
        },

        match: {
            required: true
        },

        quality: {
            required: true
        },

        qualityComments: {
            required: true
        },
        timeliness: {
            required: true
        },

        timelinessComments: {
            required: true
        },

        amount: {
            required: true
        },

        amountComments: {
            required: true
        },

        overall: {
            required: true
        },

        overallComments: {
            required: true
        },

        reassigned: {
            required: true
        },

        reassignedComments: {
            required: true
        },

    },

    messages: {
       duties: {
            required: "Please describe the GA duties performed."
        },

        match: {
            required: "Please describe the GA background and skills match."
        },

        qualityComments: {
            required: "Please describe the quality of work."
        },

        timelinessComments: {
            required: "Please describe the timeliness of work."
        },

        amountComments: {
            required: "Please describe the amount of work."
        },

        overallComments: {
            required: "Please describe the overall satsifaction."
        },

        reassignedComments: {
            required: "Please explain why you do or do not want to be reassigned this GA."
        },

    }

});