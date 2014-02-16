
$(function(){
    $('.portfolio').contenthover({
      overlay_background:'#FF9F33'
    });
});

$( document ).ready(function() {
  var $toolview = $('#toolview');

  $toolview.isotope({
    // options
    // itemSelector : '.portfolio',
    // layoutMode : 'fitRows'
  });

  $('#filters a').click(function(){
    var selector = $(this).attr('data-filter');
    $toolview.isotope({ filter: selector });
    return false;
  });

});

