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
$("#applicationform").validate({ 
    focusInvalid: false,
    invalidHandler: function(form, validator) {
        if (!validator.numberOfInvalids())
            return;

        $('html, body').animate({
          scrollTop: $(validator.errorList[0].element).offset().top
         }, 1000);
 
    },     
    rules: {

        // Personal & Contact Information
        firstName: {
            required: true,
            rangelength: [2, 30]
        },

        middleName: {
            required: false,
            rangelength: [2, 30]
        },

        lastName: {
            required: true,
            rangelength: [2, 30]
        },

        preferredName: {
            required: false,
            rangelength: [2, 90]
        },

        primaryEmail: {
            required: true,
            email: true,
            maxlength: 100
        },

        secondaryEmail: {
            required: false,
            email: true,
            maxlength: 100
        },

        primaryPhone: {
            required: true,
            rangelength: [10, 15]
        },

        secondaryPhone: {
            required: false,
            rangelength: [10, 15]
        },

        // Address Information
        streetAddress: {
            required: true
        },

        streetAddress2: {
            required: false
        },

        city: {
            required: true
        },

        state: {
            required: true,
            rangelength: [2, 2]
        },

        zipCode: {
            required: true,
            rangelength: [5, 5]
        },

        country: {
            required: true,
            rangelength: [2, 2]
        },

        streetAddressM: {
            required: true
        },

        streetAddress2M: {
            required: false
        },

        cityM: {
            required: true
        },

        stateM: {
            required: true,
            rangelength: [2, 2]
        },

        zipCodeM: {
            required: true,
            rangelength: [5, 5]
        },

        countryM: {
            required: true,
            rangelength: [2, 2]
        },

        socialSecurityNumber: {
            required: true
        },

        dateOfBirth: {
            required: true
        },

        undergradGPA: {
            required: true,
            number: true,
            min: 0,
            max: 4
        },

        juniorseniorGPA: {
            required: true,
            number: true,
            min: 0,
            max: 4
        },

        collegeName: {
            required: true
        },

        dateStarted: {
            required: true
        },

        dateEnded: {
            required: true
        },

        collegeGPA: {
            required: true,
            number: true,
            min: 0,
            max: 4
        },

        hoursEarned: {
            required: true,
            number: true,
            min: 0,
            max: 240
        },

        hoursEnrolled: {
            required: true,
            number: true,
            min: 0,
            max: 30
        },

        degree: {
            required: true
        },

        major: {
            required: true
        },

        gmatQScore: {
            required: false,
            number: true,
            min: 6,
            max: 51
        },

        gmatVScore: {
            required: false,
            number: true,
            min: 6,
            max: 51
        },

        gmatTScore: {
            required: false,
            number: true,
            min: 200,
            max: 800
        },

        greQScore: {
            required: false,
            number: true,
            min: 130,
            max: 170
        },

        greVScore: {
            required: false,
            number: true,
            min: 130,
            max: 170
        },

        greTScore: {
            required: false,
            number: true,
            min: 260,
            max: 340
        },

        toeflOnlineScore: {
            required: false,
            number: true,
            min: 0,
            max: 120
        },

        toeflPaperScore: {
            required: false,
            number: true,
            min: 310,
            max: 677
        },

        tseScore: {
            required: false,
            number: true,
            min: 20,
            max: 60
        },

    },

    messages: {
        firstName: {
            required: "Please enter your first name."
        },

        lastName: {
            required: "Please enter your last name."
        },

        primaryEmail: {
            required: "Please enter an email address."
        },

        primaryPhone: {
            required: "Please enter a phone number."
        },

        streetAddress: {
            required: "Please enter a street address."
        },

        city: {
            required: "Please enter a city."
        },

        state: {
            required: "Please enter a state code.",
            rangelength: "Please enter the two-character state code."
        },

        zipCode: {
            required: "Please enter a ZIP code.",
            rangelength: "Please enter a five-digit ZIP code."
        },

        country: {
            required: "Please enter a country code.",
            rangelength: "Please enter the two-character country code."
        },

        streetAddressM: {
            required: "Please enter a street address."
        },

        cityM: {
            required: "Please enter a city."
        },

        stateM: {
            required: "Please enter a state code.",
            rangelength: "Please enter the two-character state code."
        },

        zipCodeM: {
            required: "Please enter a ZIP code.",
            rangelength: "Please enter a five-digit ZIP code."
        },

        countryM: {
            required: "Please enter a country code.",
            rangelength: "Please enter the two-character country code."
        },

        socialSecurityNumber: {
            required: "Please enter your social security number."
        },

        dateOfBirth: {
            required: "Please enter your date of birth."
        },

        undergradGPA: {
            required: "Please enter your undergraduate GPA.",
            number: "Please enter a number.",
            min: "Please enter a value greater than or equal to 0.00.",
            max: "Please enter a value less than or equal to 4.00."
        },

        juniorseniorGPA: {
            required: "Please enter your junior/senior GPA.",
            number: "Please enter a number.",
            min: "Please enter a value greater than or equal to 0.00.",
            max: "Please enter a value less than or equal to 4.00."
        },

        collegeName: {
            required: "Please enter a college name."
        },

        dateStarted: {
            required: "Please enter the date started at this college."
        },

        dateEnded: {
            required: "Please enter the date ended at this college."
        },

        collegeGPA: {
            required: "Please enter your GPA at this college.",
            number: "Please enter a number.",
            min: "Please enter a value greater than or equal to 0.00.",
            max: "Please enter a value less than or equal to 4.00."
        },

        hoursEarned: {
            required: "Please enter the number of hours earned at this college.",
            number: "Please enter a number.",
            min: "Please enter a value greater than or equal to 0 hours.",
            max: "Please enter a value less than or equal to 240 hours."
        },

        hoursEnrolled: {
            required: "Please enter the number of hours currently enrolled at this college.",
            number: "Please enter a number.",
            min: "Please enter a value greater than or equal to 0 hours.",
            max: "Please enter a value less than or equal to 30 hours."
        },

        degree: {
            required: "Please enter the degree(s) earned from this college."
        },

        major: {
            required: "Please enter the major(s) selected at this college."
        },
    }

});