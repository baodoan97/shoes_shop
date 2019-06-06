// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require jquery-ui/widgets/autocomplete
//= require owl.carousel.min
//= require cocoon
//= require activestorage
//= require bootstrap
//= require turbolinks
//= require ckeditor/init
//= require_tree .
//= require_imagezoom
//= require_jquery.flexslider
//= require_simpleCart.min
//= require Chart.bundle
//= require chartkick
//= require_tables
//= require_stats
//= require_forms
//= require_editors
//= require_custom
//= require_calendar
//= require_jquery.dataTables.min
//= require_dataTables.bootstrap
//= require_dataTables.jqueryui.min
//= require highcharts

$( document ).on('turbolinks:load', function() {
   
 

  $('#example').DataTable( {
    language: {
      searchPlaceholder: "Nhap thong tin can tim",
      search: "",
    },
      "footerCallback": function ( row, data, start, end, display ) {
          var api = this.api(), data;


          // Remove the formatting to get integer data for summation
          var intVal = function ( i ) {
              return typeof i === 'string' ?
                  i.replace(/[\$,]/g, '')*1 :
                  typeof i === 'number' ?
                      i : 0;
          };

          // Total over all pages
          total = api
              .column( 2 )
              .data()
              .reduce( function (a, b) {
                  return intVal(a) + intVal(b);
              }, 0 );

          // Total over this page
          pageTotal = api
              .column( 2, { page: 'current'} )
              .data()
              .reduce( function (a, b) {
                  return intVal(a) + intVal(b);
              }, 0 );

          // Update footer
          $( api.column( 2 ).footer() ).html(
              'Price in page: '+pageTotal +' VND'+' ( Tổng cộng: '+ total +' VND )'
          );
      }
      
  } );

  $("#sendusermessage").button().click(function(){
     
});
  // $( "#a" ).click(function() {
  // $('#file-input').trigger('click'); 
  // });

  // $('#file-input').change(function () {
  //   alert("x");
  //   // var fileToUpload = $('#file-input').prop('files')[0];
  //   //  $('#a').attr('src',fileToUpload.name);
  //   //   console.log(fileToUpload);
  //    if (this.files && this.files[0]) {
  //          if( checkTypeimg(this.files[0].type) == false){
  //           var input = $('#file-input');
  //            alert("only image type jpeg,png");
  //            input.replaceWith(input.val('').clone(true));
  //           document.getElementById("a").src = "";
  //                 return;
  //           }
  //           var reader = new FileReader();
  //           reader.onload = function (e) {
  //               $('#a').attr('src', e.target.result);
  //           }
  //           reader.readAsDataURL(this.files[0]);
  //       }
  //   });

    $('.fa-exchange').hover(function(){
          $(this).fadeOut( 100 );
            $(this).fadeIn( 500 );
    });




   

});
