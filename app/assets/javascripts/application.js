// require turbolinks

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-toggle-buttons
//= require bootstrap-multiselect
//= require_tree .


$(document).ready(function() {
        $('.multiselect-all').multiselect();

    });



$(document).ready(function() {
        $('.down').hide()
        $( ".sort_wagon" ).click(function() {
          $('.up').fadeToggle( "slow", "linear" );
          $('.down').fadeToggle( "slow", "linear" );
        });
  });




    // function() {
    //     $('.sort_wagon').on("click", function () {
    //       $('.up').hide();
    //       $('.down').hide();
    //     })

    // }

        // $('.sort_wagon').on("click", function () {

          // $('.up').hide();
          // $('.down').hide();

        //   $('.up').fadeToggle( "hide", "show" );
        //   $('.down').fadeToggle( "hide", "show" );
        // })



