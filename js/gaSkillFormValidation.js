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
$("#gaSkillForm").validate({ 
    focusInvalid: false,
    invalidHandler: function(form, validator) {
        if (!validator.numberOfInvalids())
            return;

        $('html, body').animate({
          scrollTop: $(validator.errorList[0].element).offset().top
         }, 1000);
 
    },

    rules: {

        research: {
            required: true
        },

        wordProcessing: {
            required: true
        },

        dataAnalysis: {
            required: true
        },

        programming: {
            required: true
        },

        databaseSkills: {
            required: true
        },

        sap: {
            required: true
        },

        statisticalPackages: {
            required: false,
            rangelength: [1, 255]
        },

        programmingLanguages: {
            required: false,
            rangelength: [1, 255]
        },

        writing: {
            required: true
        },

        editing: {
            required: true
        },

        english: {
            required: true
        },

        grading: {
            required: true
        },

        otherSkills: {
            required: false
        },

    },

    messages: {
       reason: {
            required: "Please describe how a GA will be helpful to you."
        },

        research: {
            required: "Required."
        },

        wordProcessing: {
            required: "Required."
        },

        dataAnalysis: {
            required: "Required."
        },

        programming: {
            required: "Required."
        },

        databaseSkills: {
            required: "Required."
        },

        writing: {
            required: "Required."
        },

        editing: {
            required: "Required."
        },

        english: {
            required: "Required."
        },

        grading: {
            required: "Required."
        },
    }

});