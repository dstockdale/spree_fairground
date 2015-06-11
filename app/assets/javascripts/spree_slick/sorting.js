var formmodified = 0;

$(function() {
  
  $( "#carousel-thumbs").sortable();
  
  var mapping = Array();
  
  $("#carousel-thumbs").on( "sortupdate", function(event) {
    
    Spree.Carousel.state.unfinished = true;
    
    $('#update-sorting:hidden').fadeIn().removeClass('hidden');
    
    mapping = $("#carousel-thumbs li").map(function(v){
      return $(this).data('slideId');
    }).get();

    for (k = 0, len = mapping.length; k < len; k++) {
      var $el = $('#spree_owl_' + mapping[k]);
      $el.data('newOrder',k).attr('data-new-order',k);
    }

  });

  $('#update-sorting').on( "click", function(event, el) {
    $.ajax({
      url : Spree.Carousel.element().data('sortingUrl'),
      data : JSON.stringify({ sorting: mapping }),
      type : 'PATCH',
      contentType : 'application/json',
      success: function(data){
        reorderCarousel();
        $('#update-sorting').fadeOut();
      },
      error: function(a,b) {
        alert("Something went wrong dagnabitt!!");
      }
    });     
  });

});

var reorderCarousel = function(){
  Spree.Carousel.stop();
  var reordered = Spree.Carousel.items().detach().sort(function(a,b) {
    return $(a).data('newOrder') - $(b).data('newOrder');  
  });
  Spree.Carousel.element().append(reordered);
  Spree.Carousel.start();
  Spree.Carousel.state.unfinished = false;
};

window.onbeforeunload = confirmExit;
function confirmExit() {
  if (Spree.Carousel.state.unfinished == 1) {
    return "You have unsaved changes. Sure you want to leave this page?";
  }
}