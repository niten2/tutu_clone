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
  $(function () {
    $('.datetimepicker1').datetimepicker();
  });
});

// $(document).ready(function() {
//         $('.down').hide()
//         $( ".sort_wagon" ).click(function() {
//           $('.up').fadeToggle( "slow", "linear" );
//           $('.down').fadeToggle( "slow", "linear" );
//         });
//   });
