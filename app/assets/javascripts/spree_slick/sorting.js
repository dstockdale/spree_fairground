var formmodified = 0;
$(function() {
  $( "#carousel-thumbs").sortable(

  );
  var mapping = Array();
  $("#carousel-thumbs").on( "sortupdate", function( event, ui ) {
    $('#update-sorting:hidden').fadeIn().removeClass('hidden');
    mapping = $("#carousel-thumbs li").map(function(v){
      return $(this).data('slideId');
    });
    formmodified = 1;
  });

});

window.onbeforeunload = confirmExit;
function confirmExit() {
  if (formmodified == 1) {
    return "New information not saved. Do you wish to leave the page?";
  }
}